<?php
require_once __DIR__ . '/../../../config/configBase.php';
try {
    $pdo = new PDO(PDO_DSN_BASE . ";charset=utf8", DB_USERNAME_BASE, DB_PASSWORD_BASE, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
} catch (PDOException $e) {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 'error',
        'message' => 'خطا در اتصال به دیتابیس: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

// کوئری برای دریافت hash_id و آخرین زمان لاگین
$sql = "SELECT 
            pic,title
        FROM 
           banner_background_tb
        ORDER BY id DESC
		limit 0,1";

try {
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $output = [];
    foreach ($rows as $row) {
        $output[] = [
            'pic' => $row['pic'],
            'title' => $row['title']
        ];
    }

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 'success',
        'data' => $output
    ], JSON_UNESCAPED_UNICODE);

} catch (PDOException $e) {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 'error',
        'message' => 'خطا در اجرای کوئری: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}

?>