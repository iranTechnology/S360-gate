<?php
// از سمت سایت لوکال شرکت وصل میشیم و وضعیت آرشیو شدن مشتری را کنترل می کنیم

header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/../config/configBase.php';

// اگر فایل کلاس تاریخ شمسی جداست، اینجا require کن
// مثال:
// require_once __DIR__ . '/../library/dateTimeSetting.php';

try {
    $pdo = new PDO(PDO_DSN_BASE . ";charset=utf8", DB_USERNAME_BASE, DB_PASSWORD_BASE, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
} catch (PDOException $e) {
    echo json_encode([
        'status' => 'error',
        'message' => 'خطا در اتصال به دیتابیس'
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

// دریافت JSON ارسال شده
$input = json_decode(file_get_contents('php://input'), true);

if (!isset($input['hash_id_whmcs']) || !isset($input['StatusArchived'])) {
    echo json_encode([
        'status' => 'error',
        'message' => 'اطلاعات ارسالی ناقص است'
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

try {

    $hash_id_whmcs = $input['hash_id_whmcs'];
    $StatusArchived = intval($input['StatusArchived']);

    // اگر 2 بود غیرفعال، اگر 1 بود فعال
    $archived_value = ($StatusArchived == 2) ? date('Y-m-d H:i:s') : null;

    // گرفتن مقدار فعلی پوشه
    $stmt = $pdo->prepare("
        SELECT ThemeDir 
        FROM clients_tb 
        WHERE hash_id_whmcs = :hash
        LIMIT 1
    ");
    $stmt->execute([
        ':hash' => $hash_id_whmcs
    ]);

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$row) {
        echo json_encode([
            'status' => 'error',
            'message' => 'مشتری با این hash_id_whmcs پیدا نشد'
        ], JSON_UNESCAPED_UNICODE);
        exit;
    }

    $ThemeDir = $row['ThemeDir'];

    if ($StatusArchived == 2) {

        $date = date('Y-m-d');
        // اول اگر تاریخ قبلی داشت حذف کن که دوبار تاریخ نخورد
        $ThemeDir = preg_replace('/^\d{4}-\d{2}-\d{2}_/', '', $ThemeDir);

        // اضافه کردن تاریخ به ابتدای پوشه
        $ThemeDir = $date . '_' . $ThemeDir;

    } else if ($StatusArchived == 1) {

        // حذف تاریخ از ابتدای نام پوشه اگر وجود داشت
        $ThemeDir = preg_replace('/^\d{4}-\d{2}-\d{2}_/', '', $ThemeDir);

    }

    $stmt = $pdo->prepare("
        UPDATE clients_tb 
        SET archived_at = :archived_at,
            ThemeDir = :ThemeDir
        WHERE hash_id_whmcs = :hash
    ");

    $stmt->execute([
        ':archived_at' => $archived_value,
        ':ThemeDir' => $ThemeDir,
        ':hash' => $hash_id_whmcs
    ]);

    echo json_encode([
        'status' => 'success',
        'message' => 'وضعیت با موفقیت ویرایش شد',
        'ThemeDir' => $ThemeDir
    ], JSON_UNESCAPED_UNICODE);

} catch (PDOException $e) {

    echo json_encode([
        'status' => 'error',
        'message' => 'خطا در اجرای کوئری: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);

} catch (Exception $e) {

    echo json_encode([
        'status' => 'error',
        'message' => 'خطای عمومی: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);

}
?>
