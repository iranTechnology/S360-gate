<?php
//    error_reporting(1);
//    error_reporting(E_ALL | E_STRICT);
//    @ini_set('display_errors', 1);
//    @ini_set('display_errors', 'on');
class safarBankController extends clientAuth
{
    private $safarBankProviders;

    public function __construct() {
        parent::__construct();
        $this->safarBankProviders = $this->getSafarBankIds();
    }

    /**
     * گرفتن دیتای گزارش برای جدول (خروجی آرایه)
     */
    public function getReportData()
    {
        $endDate = date('Y-m-d');
        $startDate = date('Y-m-d');

        // فیلترهای جستجو از POST/GET
        $agencyName = $_POST['agency_name'] ?? $_GET['agency_name'] ?? '';
        $safarBankStatus = $_POST['safar_bank_status'] ?? $_GET['safar_bank_status'] ?? 'all';
        $dateFrom = $_POST['date_of'] ?? $_GET['date_of'] ?? '';
        $dateTo = $_POST['to_date'] ?? $_GET['to_date'] ?? '';
        // تبدیل تاریخ شمسی به میلادی اگه مقدار داشته باشه
        if (!empty($dateFrom)) {
            $dateFrom = $this->toGregorian($dateFrom);
        } else {
            $dateFrom = $startDate;
        }

        if (!empty($dateTo)) {
            $dateTo = $this->toGregorian($dateTo);
        } else {
            $dateTo = $endDate;
        }

        // گرفتن همه آژانس‌های فعال (سطر اول)
        $agencies = $this->getAgencies($agencyName);

        // گرفتن آمار تورها (سطر دوم)
        $stats = $this->getStats($dateFrom, $dateTo);

        $result = [];
        foreach ($agencies as $agency) {
            $agencyId = $agency['id'];
            $isSafarBank = in_array($agencyId, $this->safarBankProviders);

            // فیلتر بر اساس وضعیت سفربانک
            if ($safarBankStatus != 'all') {
                $filterValue = ($safarBankStatus == 'true');
                if ($isSafarBank != $filterValue) continue;
            }
            $tour_count = $this->activeSafarBankTour($agencyId);


            // آمار رو بگیر، اگه نبود 0 بذار
            $agencyStats = $stats[$agencyId] ?? [
                'total_visits' => 0,
                'unique_visits' => 0,
                'total_clicks' => 0,
                'unique_clicks' => 0,
                'tours_count' => 0,
                'conversion_rate' => 0
            ];

            $result[] = [
                'id' => (int)$agencyId,
                'name' => $agency['AgencyName'],
                'domain' => $agency['Domain'] ?? '-',
                'is_safar_bank' => $isSafarBank,
                'total_visits' => (int)$agencyStats['total_visits'],
                'unique_visits' => (int)$agencyStats['unique_visits'],
                'total_clicks' => (int)$agencyStats['total_clicks'],
                'unique_clicks' => (int)$agencyStats['unique_clicks'],
                'tours_count' => (int)$agencyStats['tours_count'],
                'conversion_rate' => $agencyStats['conversion_rate'],
                'total_safarBank_tour_count' => $tour_count['Active_cn'] ?? 0,
                'total_tour_count' => $tour_count['Total_cn'] ?? 0
            ];
        }

        // مرتب‌سازی: اول آژانس‌های فعال (is_safar_bank = true)، سپس بر اساس total_visits نزولی
        usort($result, function($a, $b) {
            // اولویت اول: وضعیت سفربانک (فعال اول)
            if ($a['is_safar_bank'] != $b['is_safar_bank']) {
                return $b['is_safar_bank'] - $a['is_safar_bank'];
            }

            // اولویت دوم: تعداد بازدید کل (بیشتر اول)
            if ($a['total_visits'] != $b['total_visits']) {
                return $b['total_visits'] - $a['total_visits'];
            }

            // در صورت تساوی، بر اساس نام آژانس
            return strcmp($a['name'], $b['name']);
        });

        return $result;
    }

    public function getAgency($client_id)
    {
        $ModelBase = new ModelBase();
        $sql = "SELECT MIN(id) as id, AgencyName, Domain, MainDomain, Email, Phone, Mobile, DbName
            FROM clients_tb 
            WHERE archived_at IS NULL
            AND id = '{$client_id}'
            GROUP BY DbName";

        return $ModelBase->select($sql);
    }
    /**
     * گرفتن لیست آژانس‌ها
     */
    public function getAgencies($agencyName = '')
    {
        $ModelBase = new ModelBase();
        $sql = "SELECT MIN(id) as id, AgencyName, Domain, MainDomain, Email, Phone, Mobile, DbName
            FROM clients_tb 
            WHERE archived_at IS NULL
            GROUP BY DbName";

        if (!empty($agencyName)) {
            $sql .= " HAVING AgencyName LIKE '%{$agencyName}%'";
        }

        $sql .= " ORDER BY AgencyName";

        return $ModelBase->select($sql);
    }

    /**
     * گرفتن آمار تورها
     */
    private function getStats($startDate, $endDate)
    {
        $startDate = $this->toGregorian($startDate);
        $endDate = $this->toGregorian($endDate);
        $ModelBase = new ModelBase();
        $sql = "
        SELECT 
            provider_id,
            SUM(total_visits) as total_visits,
            SUM(unique_visits) as unique_visits,
            SUM(total_clicks) as total_clicks,
            SUM(unique_clicks) as unique_clicks,
            COUNT(DISTINCT tour_id_same) as tours_count,
            ROUND(AVG(conversion_rate), 2) as avg_conversion_rate
        FROM tour_stats
        WHERE DATE(created_at) BETWEEN '{$startDate}' AND '{$endDate}'
        GROUP BY provider_id
    ";

        $results = $ModelBase->select($sql);
        $stats = [];
        foreach ($results as $row) {
            $stats[$row['provider_id']] = [
                'total_visits' => (int)$row['total_visits'],
                'unique_visits' => (int)$row['unique_visits'],
                'total_clicks' => (int)$row['total_clicks'],
                'unique_clicks' => (int)$row['unique_clicks'],
                'tours_count' => (int)$row['tours_count'],
                'conversion_rate' => (float)$row['avg_conversion_rate']
            ];
        }
        return $stats;
    }

    /**
     * گرفتن ID های سفربانک
     */
    private function getSafarBankIds()
    {
        $ModelBase = new ModelBase();
        $sql = "
            SELECT pt.providers 
            FROM clients_tb ct 
            INNER JOIN providers_tour pt ON pt.client_id = ct.id
            WHERE ct.AgencyName = 'safarBank' 
        ";
        $result = $ModelBase->load($sql);
        if (!$result || empty($result['providers'])) return [];
        return json_decode($result['providers'], true) ?: [];
    }

    public function toggleSafarBankStatus($data)
    {
        try {
            $agencyId = isset($data['agency_id']) ? (int)$data['agency_id'] : 0;
            $activate = isset($data['activate']) ? (bool)$data['activate'] : false;

            if (!$agencyId) {
                return json_encode(['success' => false, 'message' => 'شناسه آژانس معتبر نیست']);
            }

            // دریافت providers فعلی
            $currentProviders = $this->safarBankProviders;

            // بررسی وضعیت فعلی
            $isCurrentlyActive = in_array($agencyId, $currentProviders);

            // اگر می‌خواهیم فعال کنیم و قبلاً فعال است
            if ($activate && $isCurrentlyActive) {
                return json_encode(['success' => false, 'message' => 'این آژانس در حال حاضر فعال است']);
            }
            // اگر می‌خواهیم غیرفعال کنیم و قبلاً غیرفعال است
            if (!$activate && !$isCurrentlyActive) {
                return json_encode(['success' => false, 'message' => 'این آژانس در حال حاضر غیرفعال است']);
            }
            // به‌روزرسانی لیست providers
            if ($activate) {
                // اضافه کردن به لیست
                if (!in_array($agencyId, $currentProviders)) {
                    $currentProviders[] = $agencyId;
                }
            } else {
                // حذف از لیست
                $key = array_search($agencyId, $currentProviders);
                if ($key !== false) {
                    array_splice($currentProviders, $key, 1);
                }
            }

            // ذخیره در دیتابیس
            $ModelBase = new ModelBase();

            // دریافت client_id مربوط به safarBank
            $sql = "SELECT ct.id as client_id, pt.id as providers_tour_id 
                FROM clients_tb ct 
                INNER JOIN providers_tour pt ON pt.client_id = ct.id
                WHERE ct.AgencyName = 'safarBank' ";

            $result = $ModelBase->load($sql);

            if (!$result || empty($result['providers_tour_id'])) {
                return json_encode(['success' => false, 'message' => 'رکورد سفربانک یافت نشد']);
            }

            $providersTourId = $result['providers_tour_id'];
            $newProvidersJson = json_encode(array_values($currentProviders));

            // به‌روزرسانی جدول providers_tour
            $updateSql = "UPDATE providers_tour SET providers = '{$newProvidersJson}' WHERE id = {$providersTourId}";
            $updateResult = $ModelBase->updateByQuery($updateSql);

            if ($updateResult) {
                // به‌روزرسانی کش یا متغیر کلاس
                $this->safarBankProviders = $currentProviders;

                $message = $activate ? 'آژانس با موفقیت فعال شد' : 'آژانس با موفقیت غیرفعال شد';
                return json_encode(['success' => true, 'message' => $message]);
            } else {
                return json_encode(['success' => false, 'message' => 'خطا در به‌روزرسانی دیتابیس']);
            }

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => 'خطا: ' . $e->getMessage()]);
        }
    }

    /**
     * گرفتن جزئیات تورهای یک آژانس خاص
     */
    public function getAgencyTourDetails($data)
    {
        try {
            $agencyId = isset($data['agency_id']) ? (int)$data['agency_id'] : 0;
            $dateFrom = isset($data['date_of']) ? $data['date_of'] : '';
            $dateTo = isset($data['to_date']) ? $data['to_date'] : '';

            if (!$agencyId) {
                return json_encode(['success' => false, 'message' => 'شناسه آژانس معتبر نیست']);
            }

            // تنظیم تاریخ‌ها (مشابه getReportData)
            $endDate = date('Y-m-d');
            $startDate = date('Y-m-d', strtotime('-1 day'));

            if (!empty($dateFrom)) {
                $dateFrom = $this->toGregorian($dateFrom);
            } else {
                $dateFrom = $startDate;
            }

            if (!empty($dateTo)) {
                $dateTo = $this->toGregorian($dateTo);
            } else {
                $dateTo = $endDate;
            }

            // گرفتن جزئیات تورها
            $ModelBase = new ModelBase();
            $sql = "
            SELECT 
                tour_id_same,
                tour_name,
                destination_city,
                SUM(total_visits) as total_visits,
                SUM(unique_visits) as unique_visits,
                SUM(total_clicks) as total_clicks,
                SUM(unique_clicks) as unique_clicks,
                ROUND(AVG(conversion_rate), 2) as conversion_rate,
                COUNT(DISTINCT report_date) as days_count
            FROM tour_stats
            WHERE provider_id = {$agencyId}
                AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
            GROUP BY tour_id_same, tour_name, destination_city
            ORDER BY total_visits DESC
        ";

            $results = $ModelBase->select($sql);

            // محاسبه مجموع کل
            $totals = [
                'total_visits' => 0,
                'unique_visits' => 0,
                'total_clicks' => 0,
                'unique_clicks' => 0,
                'tours_count' => count($results)
            ];

            foreach ($results as &$row) {
                $totals['total_visits'] += (int)$row['total_visits'];
                $totals['unique_visits'] += (int)$row['unique_visits'];
                $totals['total_clicks'] += (int)$row['total_clicks'];
                $totals['unique_clicks'] += (int)$row['unique_clicks'];
            }

            return json_encode([
                'success' => true,
                'data' => $results,
                'totals' => $totals
            ]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => 'خطا: ' . $e->getMessage()]);
        }
    }

    private function activeSafarBankTour($client_id){
        $admin_controller = $this->getController('admin');
        $dateNow = dateTimeSetting::jdate("Ymd", time(), '', '', 'en');
        $sqlActive_cn = " SELECT COUNT(DISTINCT T.id_same) as active_count 
                    FROM reservation_tour_tb AS T 
                    WHERE T.is_del = 'no' 
                      AND T.is_show = 'yes' 
                      AND T.start_date > {$dateNow}
                  ";
        $sqlTotal_cn = " SELECT COUNT(DISTINCT T.id_same) as total_count 
                    FROM reservation_tour_tb AS T 
                    WHERE T.is_del = 'no' 
                      AND T.is_show = 'yes' 
                  ";

        $Active_cn = $admin_controller->ConectDbClient($sqlActive_cn, $client_id, "SelectAll", "", "", "");
        $Total_cn = $admin_controller->ConectDbClient($sqlTotal_cn, $client_id, "SelectAll", "", "", "");
        $safarBank_tour_count = [
            'Active_cn' => $Active_cn ? $Active_cn[0]['active_count'] : 0,
            'Total_cn' => $Total_cn ? $Total_cn[0]['total_count'] : 0,
        ];

        return $safarBank_tour_count;
    }


    /**
     * گرفتن تنظیمات قیمت‌گذاری
     */
    public function getPricingSettings()
    {
        try {
            $ModelBase = new ModelBase();
            $ModelBase->setTable('safar_bank_pricing');

            $sql = "SELECT * FROM safar_bank_pricing WHERE is_active = 1 ORDER BY 
            CASE price_type 
                WHEN 'click' THEN 1 
                WHEN 'unique_click' THEN 2 
                WHEN 'visit' THEN 3 
                WHEN 'unique_visit' THEN 4 
            END, 
            min_quantity ASC";

            $results = $ModelBase->select($sql);

            $pricing = [
                'click' => [],
                'unique_click' => [],
                'visit' => [],
                'unique_visit' => []
            ];

            foreach ($results as $row) {
                $pricing[$row['price_type']][] = [
                    'id' => (int)$row['id'],
                    'price_type' => $row['price_type'],
                    'price_per_unit' => (float)$row['price_per_unit'],
                    'min_quantity' => (int)$row['min_quantity'],
                    'max_quantity' => $row['max_quantity'] ? (int)$row['max_quantity'] : null,
                    'discount_percent' => (float)$row['discount_percent'],
                    'description' => $row['description'] ?? ''
                ];
            }

            return json_encode(['success' => true, 'data' => $pricing]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * ذخیره تنظیمات قیمت‌گذاری
     */
    public function savePricingSetting($data)
    {
        try {
            $priceType = $data['price_type'] ?? '';
            $pricePerUnit = (float)($data['price_per_unit'] ?? 0);
            $minQuantity = (int)($data['min_quantity'] ?? 1);
            $maxQuantity = !empty($data['max_quantity']) && $data['max_quantity'] != 'null' ? (int)$data['max_quantity'] : null;
            $discountPercent = (float)($data['discount_percent'] ?? 0);
            $description = $data['description'] ?? '';
            $id = (int)($data['id'] ?? 0);

            // اعتبارسنجی
            if (!$priceType || $pricePerUnit <= 0) {
                return json_encode(['success' => false, 'message' => 'مقادیر وارد شده معتبر نیست']);
            }

            // اعتبارسنجی بازه‌ها
            if ($maxQuantity !== null && $maxQuantity <= $minQuantity) {
                return json_encode(['success' => false, 'message' => 'حداکثر تعداد باید بزرگتر از حداقل تعداد باشد']);
            }

            $ModelBase = new ModelBase();

            // بروزرسانی رکورد موجود با ID
            if ($id > 0) {
                $maxQtyStr = $maxQuantity ? $maxQuantity : 'NULL';
                $sql = "UPDATE safar_bank_pricing SET 
                        price_per_unit = {$pricePerUnit},
                        min_quantity = {$minQuantity},
                        max_quantity = {$maxQtyStr},
                        discount_percent = {$discountPercent},
                        description = '" . addslashes($description) . "',
                        updated_at = NOW()
                    WHERE id = {$id} AND is_active = 1";

                $result = $ModelBase->updateByQuery($sql);
                if ($result) {
                    return json_encode(['success' => true, 'message' => 'تنظیمات با موفقیت بروزرسانی شد']);
                }
                return json_encode(['success' => false, 'message' => 'خطا در بروزرسانی']);
            }

            // بررسی رکورد تکراری قبل از درج جدید
            $checkSql = "SELECT id FROM safar_bank_pricing 
                     WHERE price_type = '{$priceType}' 
                     AND min_quantity = {$minQuantity}
                     AND is_active = 1";

            if ($maxQuantity !== null) {
                $checkSql .= " AND max_quantity = {$maxQuantity}";
            } else {
                $checkSql .= " AND max_quantity IS NULL";
            }

            $exists = $ModelBase->load($checkSql);

            if ($exists && !empty($exists['id'])) {
                // بروزرسانی رکورد موجود
                $sql = "UPDATE safar_bank_pricing SET 
                        price_per_unit = {$pricePerUnit},
                        discount_percent = {$discountPercent},
                        description = '" . addslashes($description) . "',
                        updated_at = NOW()
                    WHERE id = {$exists['id']}";
            } else {
                // درج رکورد جدید
                $maxQtyStr = $maxQuantity ? $maxQuantity : 'NULL';
                $sql = "INSERT INTO safar_bank_pricing 
                        (price_type, price_per_unit, min_quantity, max_quantity, discount_percent, description, created_at, is_active) 
                    VALUES 
                        ('{$priceType}', {$pricePerUnit}, {$minQuantity}, {$maxQtyStr}, {$discountPercent}, '" . addslashes($description) . "', NOW(), 1)";
            }

            $result = $ModelBase->updateByQuery($sql);

            if ($result) {
                return json_encode(['success' => true, 'message' => 'تنظیمات با موفقیت ذخیره شد']);
            }
            return json_encode(['success' => false, 'message' => 'خطا در ذخیره سازی']);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => 'خطا: ' . $e->getMessage()]);
        }
    }

    /**
     * حذف تنظیمات قیمت‌گذاری
     */
    public function deletePricingSetting($data)
    {
        try {
            $id = (int)($data['id'] ?? 0);
            if (!$id) {
                return json_encode(['success' => false, 'message' => 'شناسه معتبر نیست']);
            }

            $ModelBase = new ModelBase();

            // غیرفعال کردن به جای حذف فیزیکی (برای حفظ گزارش‌ها)
            $sql = "UPDATE safar_bank_pricing SET is_active = 0, updated_at = NOW() WHERE id = {$id}";
            $result = $ModelBase->updateByQuery($sql);

            if ($result) {
                return json_encode(['success' => true, 'message' => 'با موفقیت حذف شد']);
            }
            return json_encode(['success' => false, 'message' => 'خطا در حذف']);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * محاسبه قیمت بر اساس تعداد و نوع
     */
    public function calculatePrice($data)
    {
        try {
            $type = $data['type'] ?? 'click';
            $quantity = (int)($data['quantity'] ?? 0);

            if ($quantity <= 0) {
                return json_encode(['success' => false, 'message' => 'تعداد معتبر نیست']);
            }

            $ModelBase = new ModelBase();

            $sql = "SELECT * FROM safar_bank_pricing 
                WHERE price_type = '{$type}' 
                AND is_active = 1 
                AND min_quantity <= {$quantity}
                AND (max_quantity IS NULL OR max_quantity >= {$quantity})
                ORDER BY min_quantity DESC LIMIT 1";

            $result = $ModelBase->load($sql);

            if ($result) {
                $pricePerUnit = (float)$result['price_per_unit'];
                $discountPercent = (float)$result['discount_percent'];

                $basePrice = $pricePerUnit * $quantity;
                $discountAmount = $basePrice * ($discountPercent / 100);
                $finalPrice = $basePrice - $discountAmount;

                // نمایش به تومان
                $response = [
                    'success' => true,
                    'data' => [
                        'quantity' => $quantity,
                        'price_per_unit_rial' => number_format($pricePerUnit),
                        'price_per_unit_toman' => number_format($pricePerUnit / 10),
                        'base_price_rial' => number_format($basePrice),
                        'base_price_toman' => number_format($basePrice / 10),
                        'discount_percent' => $discountPercent,
                        'discount_amount_rial' => number_format($discountAmount),
                        'discount_amount_toman' => number_format($discountAmount / 10),
                        'final_price_rial' => number_format($finalPrice),
                        'final_price_toman' => number_format($finalPrice / 10),
                        'price_range' => ($result['max_quantity'] ? "{$result['min_quantity']} تا {$result['max_quantity']}" : "{$result['min_quantity']} به بالا"),
                        'price_type_name' => $this->getPriceTypeName($type)
                    ]
                ];

                return json_encode($response);
            }

            return json_encode([
                'success' => false,
                'message' => 'برای این تعداد قیمتی تعریف نشده است'
            ]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * تبدیل نام انگلیسی نوع قیمت به فارسی
     */
    private function getPriceTypeName($type)
    {
        $names = [
            'click' => 'کلیک معمولی',
            'unique_click' => 'کلیک یکتا',
            'visit' => 'بازدید معمولی',
            'unique_visit' => 'بازدید یکتا'
        ];
        return $names[$type] ?? $type;
    }


    /**
     * گرفتن موجودی و تراکنش‌های یک آژانس
     */
    public function getClientTransaction($clientId)
    {
        try {
            $ModelBase = new ModelBase();

            // محاسبه موجودی فعلی
            $balanceSql = "SELECT SUM(amount) as balance FROM safarBank_transaction WHERE client_id = {$clientId}";
            $balanceResult = $ModelBase->load($balanceSql);
            $balance = $balanceResult['balance'] ?? 0;

            // گرفتن لیست تراکنش‌ها
            $transSql = "SELECT * FROM safarBank_transaction 
                     WHERE client_id = {$clientId} 
                     ORDER BY created_at DESC 
                     LIMIT 50";
            $transactions = $ModelBase->select($transSql);

            return json_encode([
                'success' => true,
                'data' => [
                    'client_id' => $clientId,
                    'balance' => (float)$balance,
                    'transactions' => $transactions
                ]
            ]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * شارژ کیف پول (افزایش اعتبار)
     */
    public function chargeClient($data)
    {
        try {
            $clientId = (int)($data['client_id'] ?? 0);
            $amount = (float)($data['amount'] ?? 0);
            $description = $data['description'] ?? '';
            $adminId = $_SESSION['admin_id'] ?? 0;

            if (!$clientId || $amount <= 0) {
                return json_encode(['success' => false, 'message' => 'مبلغ وارد شده معتبر نیست']);
            }

            $ModelBase = new ModelBase();

            // محاسبه موجودی فعلی
            $balanceSql = "SELECT SUM(amount) as balance FROM safarBank_transaction WHERE client_id = {$clientId}";
            $balanceResult = $ModelBase->load($balanceSql);
            $currentBalance = $balanceResult['balance'] ?? 0;
            $newBalance = $currentBalance + $amount;

            // ثبت تراکنش
            $sql = "INSERT INTO safarBank_transaction 
                (client_id, amount, balance, type, description, created_by, created_at) 
                VALUES 
                ({$clientId}, {$amount}, {$newBalance}, 'charge', '" . addslashes($description) . "', {$adminId}, NOW())";

            $ModelBase->updateByQuery($sql);

            return json_encode([
                'success' => true,
                'message' => "مبلغ " . number_format($amount) . " ریال با موفقیت شارژ شد",
                'new_balance' => $newBalance
            ]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }
    /**
     * کسر از کیف پول (توسط ادمین)
     */
    public function deductClient($data)
    {
        try {
            $clientId = (int)($data['client_id'] ?? 0);
            $amount = (float)($data['amount'] ?? 0);
            $description = $data['description'] ?? '';
            $adminId = $_SESSION['admin_id'] ?? 0;

            if (!$clientId || $amount <= 0) {
                return json_encode(['success' => false, 'message' => 'مبلغ وارد شده معتبر نیست']);
            }

            $ModelBase = new ModelBase();

            // محاسبه موجودی فعلی
            $balanceSql = "SELECT SUM(amount) as balance FROM safarBank_transaction WHERE client_id = {$clientId}";
            $balanceResult = $ModelBase->load($balanceSql);
            $currentBalance = $balanceResult['balance'] ?? 0;

            if ($currentBalance < $amount) {
                return json_encode(['success' => false, 'message' => 'موجودی کافی نیست. موجودی فعلی: ' . number_format($currentBalance) . ' ریال']);
            }

            $newBalance = $currentBalance - $amount;

            // ثبت تراکنش کسر
            $sql = "INSERT INTO safarBank_transaction 
                (client_id, amount, balance, type, description, created_by, created_at) 
                VALUES 
                ({$clientId}, -{$amount}, {$newBalance}, 'consume', '" . addslashes($description) . "', {$adminId}, NOW())";

            $ModelBase->updateByQuery($sql);

            return json_encode([
                'success' => true,
                'message' => "مبلغ " . number_format($amount) . " ریال با موفقیت کسر شد. موجودی جدید: " . number_format($newBalance) . " ریال",
                'new_balance' => $newBalance
            ]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * کسر مصرف از کیف پول (بر اساس آمار)
     */
    public function deductConsumption($clientId, $dateFrom, $dateTo)
    {
        try {
            // گرفتن آمار آژانس
            $stats = $this->getStats($dateFrom, $dateTo);
            $clientStats = $stats[$clientId] ?? null;

            if (!$clientStats || ($clientStats['total_visits'] == 0 && $clientStats['total_clicks'] == 0)) {
                return json_encode(['success' => false, 'message' => 'هیچ آماری برای این بازه وجود ندارد']);
            }

            // محاسبه هزینه بر اساس قیمت‌گذاری
            $clickCost = $this->getCostForQuantity('click', $clientStats['total_clicks']);
            $uniqueClickCost = $this->getCostForQuantity('unique_click', $clientStats['unique_clicks']);
            $visitCost = $this->getCostForQuantity('visit', $clientStats['total_visits']);
            $uniqueVisitCost = $this->getCostForQuantity('unique_visit', $clientStats['unique_visits']);

            $totalCost = $clickCost + $uniqueClickCost + $visitCost + $uniqueVisitCost;

            if ($totalCost <= 0) {
                return json_encode(['success' => false, 'message' => 'هزینه‌ای محاسبه نشد']);
            }

            $ModelBase = new ModelBase();

            // محاسبه موجودی فعلی
            $balanceSql = "SELECT SUM(amount) as balance FROM safarBank_transaction WHERE client_id = {$clientId}";
            $balanceResult = $ModelBase->load($balanceSql);
            $currentBalance = $balanceResult['balance'] ?? 0;
            $newBalance = $currentBalance - $totalCost;

            // ثبت تراکنش مصرف (حتی اگر منفی بشه)
            $details = json_encode([
                'clicks' => $clientStats['total_clicks'],
                'click_cost' => $clickCost,
                'unique_clicks' => $clientStats['unique_clicks'],
                'unique_click_cost' => $uniqueClickCost,
                'visits' => $clientStats['total_visits'],
                'visit_cost' => $visitCost,
                'unique_visits' => $clientStats['unique_visits'],
                'unique_visit_cost' => $uniqueVisitCost,
                'date_from' => $dateFrom,
                'date_to' => $dateTo
            ]);

            $description = "مصرف سفربانک - بازدید: {$clientStats['total_visits']} - کلیک: {$clientStats['total_clicks']}";

            $sql = "INSERT INTO safarBank_transaction 
                (client_id, amount, balance, type, description, details, created_at) 
                VALUES 
                ({$clientId}, -{$totalCost}, {$newBalance}, 'consume', '" . addslashes($description) . "', '" . addslashes($details) . "', NOW())";

            $ModelBase->updateByQuery($sql);

            $message = "مبلغ " . number_format($totalCost) . " ریال کسر شد. موجودی جدید: " . number_format($newBalance) . " ریال";

            return json_encode([
                'success' => true,
                'message' => $message,
                'new_balance' => $newBalance,
                'details' => [
                    'total_cost' => $totalCost,
                    'click_cost' => $clickCost,
                    'visit_cost' => $visitCost
                ]
            ]);

        } catch (Exception $e) {
            return json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
    }

    /**
     * محاسبه هزینه بر اساس تعداد و نوع
     */
    private function getCostForQuantity($type, $quantity)
    {
        if ($quantity <= 0) return 0;

        $ModelBase = new ModelBase();
        $sql = "SELECT price_per_unit, discount_percent 
            FROM safar_bank_pricing 
            WHERE price_type = '{$type}' 
            AND is_active = 1 
            AND min_quantity <= {$quantity}
            AND (max_quantity IS NULL OR max_quantity >= {$quantity})
            ORDER BY min_quantity DESC LIMIT 1";

        $result = $ModelBase->load($sql);

        if ($result) {
            $price = $result['price_per_unit'] * $quantity;
            $discount = $price * ($result['discount_percent'] / 100);
            return $price - $discount;
        }

        return 0;
    }

    /**
     * بررسی و غیرفعال کردن آژانس‌های با اعتبار منفی
     */
    public function deactivateLowCreditAgencies()
    {
        try {
            $ModelBase = new ModelBase();

            // گرفتن همه آژانس‌هایی که اعتبارشان کمتر از 0 است
            $sql = "
            SELECT 
                client_id,
                SUM(amount) as balance
            FROM safarBank_transaction
            GROUP BY client_id
            HAVING SUM(amount) < 0
        ";

            $negativeBalanceAgencies = $ModelBase->select($sql);

            if (empty($negativeBalanceAgencies)) {
                return json_encode([
                    'success' => true,
                    'message' => 'هیچ آژانسی با اعتبار منفی وجود ندارد',
                    'deactivated_count' => 0
                ]);
            }

            $deactivatedCount = 0;
            $deactivatedAgencies = [];

            foreach ($negativeBalanceAgencies as $agency) {
                $agencyId = $agency['client_id'];

                // بررسی آیا در لیست سفربانک فعال است
                if (in_array($agencyId, $this->safarBankProviders)) {
                    // غیرفعال کردن این آژانس
                    $key = array_search($agencyId, $this->safarBankProviders);
                    if ($key !== false) {
                        array_splice($this->safarBankProviders, $key, 1);
                    }

                    // ذخیره در دیتابیس
                    $updateResult = $this->updateSafarBankProvidersList($this->safarBankProviders);

                    if ($updateResult) {
                        $deactivatedCount++;
                        $deactivatedAgencies[] = $agencyId;

                        // ثبت لاگ
                        $this->logCreditDeactivation($agencyId, "اعتبار منفی شد");
                    }
                }
            }

            // به‌روزرسانی متغیر کلاس
            $this->safarBankProviders = $this->safarBankProviders;

            return json_encode([
                'success' => true,
                'message' => "تعداد {$deactivatedCount} آژانس با اعتبار منفی غیرفعال شدند",
                'deactivated_count' => $deactivatedCount,
                'deactivated_agencies' => $deactivatedAgencies
            ]);

        } catch (Exception $e) {
            return json_encode([
                'success' => false,
                'message' => $e->getMessage()
            ]);
        }
    }

    /**
     * به‌روزرسانی لیست providers در دیتابیس
     */
    private function updateSafarBankProvidersList($providersList)
    {
        try {
            $ModelBase = new ModelBase();

            $sql = "SELECT pt.id as providers_tour_id 
                FROM clients_tb ct 
                INNER JOIN providers_tour pt ON pt.client_id = ct.id
                WHERE ct.AgencyName = 'safarBank' ";

            $result = $ModelBase->load($sql);

            if (!$result || empty($result['providers_tour_id'])) {
                return false;
            }

            $providersTourId = $result['providers_tour_id'];
            $newProvidersJson = json_encode(array_values($providersList));

            $updateSql = "UPDATE providers_tour SET providers = '{$newProvidersJson}' WHERE id = {$providersTourId}";

            return $ModelBase->updateByQuery($updateSql);

        } catch (Exception $e) {
            error_log("Error updating providers list: " . $e->getMessage());
            return false;
        }
    }

    /**
     * ثبت لاگ غیرفعال شدن آژانس
     */
    private function logCreditDeactivation($agencyId, $reason)
    {
        try {
            $ModelBase = new ModelBase();

            // گرفتن نام آژانس
            $agencySql = "SELECT AgencyName FROM clients_tb WHERE id = {$agencyId}";
            $agency = $ModelBase->load($agencySql);
            $agencyName = $agency['AgencyName'] ?? 'نامشخص';

            $sql = "INSERT INTO safarBank_deactivation_log 
                (client_id, client_name, reason, created_at) 
                VALUES 
                ({$agencyId}, '{$agencyName}', '{$reason}', NOW())";

            $ModelBase->updateByQuery($sql);

        } catch (Exception $e) {
            error_log("Error logging deactivation: " . $e->getMessage());
        }
    }

    /**
     * تبدیل تاریخ شمسی به میلادی
     * فرمت ورودی: 1402/02/15 یا 1402-02-15
     * خروجی: 2023-05-06
     */
    public function toGregorian($date)
    {
        if (empty($date)) {
            return date('Y-m-d');
        }

        // حذف کاراکترهای اضافی
        $date = trim($date);

        // تبدیل جداکننده / به -
        $date = str_replace('/', '-', $date);

        // استخراج سال، ماه، روز
        if (preg_match('/^(\d{4})-(\d{2})-(\d{2})$/', $date, $matches)) {
            $year = (int)$matches[1];
            $month = (int)$matches[2];
            $day = (int)$matches[3];

            // اگه سال بین 1300 تا 1500 باشه، قطعاً شمسیه
            if ($year >= 1300 && $year <= 1500) {
                // تبدیل شمسی به میلادی (با فرض وجود تابع)
                $timestamp = dateTimeSetting::jmktime(0, 0, 0, $month, $day, $year);
                return date('Y-m-d', $timestamp);
            }
        }

        // اگه تاریخ میلادی بود (۲۰۲۶)
        return $date;
    }

    public function getAgencyEventStats($providerId, $dateFrom = null, $dateTo = null)
    {
        try {
            // ======== تنظیم تاریخ‌های پیش‌فرض ========
            // اگر تاریخ ارسال نشده، یک ماه قبل را در نظر بگیر
            if (empty($dateFrom)) {
                // امروز را بگیر
                $today = date('Y-m-d');
                // ۳۰ روز قبل را محاسبه کن
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // تبدیل تاریخ شمسی به میلادی اگر نیاز باشد
            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            // اگر تاریخ‌ها معکوس بود، آنها را اصلاح کن
            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // کوئری اصلی با شرط provider_id
            $sql = "SELECT 
                    event_type,
                    COUNT(*) as total_count,
                    COUNT(DISTINCT session_id) as unique_sessions,
                    COUNT(DISTINCT ip_address) as unique_ips
                FROM safarbank_reporting
                WHERE provider_id = {$providerId}
                    AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                GROUP BY event_type";

            $results = $ModelBase->select($sql);

            // لاگ برای دیباگ (اختیاری)
            functions::insertLog('$results: ' . json_encode($results), '000shojaee');

            // آرایه نهایی با مقادیر پیش‌فرض
            $stats = [
                'impression' => 0,
                'detail_view' => 0,
                'refer_tour' => 0,
                'refer_site' => 0,
                'total_events' => 0,
                'unique_sessions' => 0,
                'unique_ips' => 0
            ];

            // نگاشت event_type به کلیدهای خروجی
            $eventMap = [
                'search_impression' => 'impression',
                'detail_view' => 'detail_view',
                'agency_tour_click' => 'refer_tour',
                'agency_website_click' => 'refer_site'
            ];

            foreach ($results as $row) {
                $eventType = $row['event_type'];
                if (isset($eventMap[$eventType])) {
                    $key = $eventMap[$eventType];
                    $stats[$key] = (int)$row['total_count'];
                    $stats['total_events'] += (int)$row['total_count'];
                }
            }

            // محاسبه مجموع یکتاها
            $uniqueSql = "SELECT 
                        COUNT(DISTINCT session_id) as total_unique_sessions,
                        COUNT(DISTINCT ip_address) as total_unique_ips
                    FROM safarbank_reporting
                    WHERE provider_id = {$providerId}
                        AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'";

            $uniqueResult = $ModelBase->load($uniqueSql);
            if ($uniqueResult) {
                $stats['unique_sessions'] = (int)($uniqueResult['total_unique_sessions'] ?? 0);
                $stats['unique_ips'] = (int)($uniqueResult['total_unique_ips'] ?? 0);
            }

            return [
                'success' => true,
                'data' => $stats,
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ]
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * آماده‌سازی داده‌ها برای نمایش در قالب
     */
    public function getAgencyReportData($agencyId, $dateFrom = null, $dateTo = null)
    {
        try {
            // ======== تنظیم تاریخ‌های پیش‌فرض ========
            // اگر تاریخ ارسال نشده، یک ماه قبل را در نظر بگیر
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // ۱. گرفتن اطلاعات آژانس
            $agency = $this->getAgency($agencyId);

            // ۲. گرفتن آمار رویدادها از جدول safarbank_reporting
            $eventStats = $this->getAgencyEventStats($agencyId, $dateFrom, $dateTo);

            // ۳. گرفتن آمار تورهای فعال
            $tourCount = $this->activeSafarBankTour($agencyId);

            // ۴. ساختار داده‌های نهایی
            $result = [
                'success' => true,
                'agency' => !empty($agency) ? $agency[0] : [],
                'stats' => $eventStats['success'] ? $eventStats['data'] : [],
                'tour_count' => [
                    'active' => $tourCount['Active_cn'] ?? 0,
                    'total' => $tourCount['Total_cn'] ?? 0
                ],
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ]
            ];

            return $result;

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    public function getAgencyDestinationStats($providerId, $dateFrom = null, $dateTo = null)
    {
        try {
            // تنظیم تاریخ‌های پیش‌فرض (یک ماه اخیر)
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // تبدیل تاریخ شمسی به میلادی اگر نیاز باشد
            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            // اصلاح تاریخ‌های معکوس
            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // کوئری اصلی برای دریافت آمار بر اساس مقصد و رویداد
            $sql = "SELECT 
                    destination_country_name as destination,
                    event_type,
                    COUNT(*) as total_count,
                    COUNT(DISTINCT session_id) as unique_sessions,
                    COUNT(DISTINCT ip_address) as unique_ips
                FROM safarbank_reporting
                WHERE provider_id = {$providerId}
                    AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                    AND destination_country_name IS NOT NULL
                    AND destination_country_name != ''
                GROUP BY destination_country_name, event_type
                ORDER BY destination_country_name ASC";

            $results = $ModelBase->select($sql);

            // ساختاردهی داده‌ها بر اساس مقصد
            $destinations = [];
            $totalStats = [
                'impression' => 0,
                'detail_view' => 0,
                'refer_tour' => 0,
                'refer_site' => 0,
                'total_events' => 0
            ];

            // نگاشت event_type به کلیدهای خروجی
            $eventMap = [
                'search_impression' => 'impression',
                'detail_view' => 'detail_view',
                'agency_tour_click' => 'refer_tour',
                'agency_website_click' => 'refer_site'
            ];

            foreach ($results as $row) {
                $destination = $row['destination'];
                $eventType = $row['event_type'];
                $count = (int)$row['total_count'];

                // اگر مقصد در آرایه نباشد، ایجاد کن
                if (!isset($destinations[$destination])) {
                    $destinations[$destination] = [
                        'destination' => $destination,
                        'impression' => 0,
                        'detail_view' => 0,
                        'refer_tour' => 0,
                        'refer_site' => 0,
                        'total_events' => 0
                    ];
                }

                // اضافه کردن به آمار مقصد
                if (isset($eventMap[$eventType])) {
                    $key = $eventMap[$eventType];
                    $destinations[$destination][$key] += $count;
                    $destinations[$destination]['total_events'] += $count;

                    // اضافه کردن به مجموع کل
                    $totalStats[$key] += $count;
                    $totalStats['total_events'] += $count;
                }
            }

            // تبدیل به آرایه برای مرتب‌سازی
            $result = array_values($destinations);

            // مرتب‌سازی بر اساس تعداد کل رویدادها (نزولی)
            usort($result, function($a, $b) {
                return $b['total_events'] - $a['total_events'];
            });

            // گرفتن اطلاعات آژانس
            $agency = $this->getAgency($providerId);
            $agencyName = !empty($agency) ? $agency[0]['AgencyName'] ?? 'آژانس' : 'آژانس';

            return [
                'success' => true,
                'data' => $result,
                'total' => $totalStats,
                'agency' => [
                    'id' => $providerId,
                    'name' => $agencyName
                ],
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ],
                'count' => count($result)
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    public function showDestinationStats()
    {
        try {
            // دریافت پارامترها
            $providerId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
            $dateFrom = isset($_GET['date_from']) ? $_GET['date_from'] : null;
            $dateTo = isset($_GET['date_to']) ? $_GET['date_to'] : null;

            if (!$providerId) {
                return [
                    'success' => false,
                    'message' => 'شناسه آژانس معتبر نیست'
                ];
            }

            // دریافت آمار
            $stats = $this->getAgencyDestinationStats($providerId, $dateFrom, $dateTo);

            return $stats;

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * گرفتن آمار تفکیکی بر اساس شهر برای یک آژانس و کشور خاص
     */
    public function getAgencyCityStats($providerId, $country, $dateFrom = null, $dateTo = null)
    {
        try {
            // تنظیم تاریخ‌های پیش‌فرض (یک ماه اخیر)
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // تبدیل تاریخ شمسی به میلادی اگر نیاز باشد
            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            // اصلاح تاریخ‌های معکوس
            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // کوئری اصلی برای دریافت آمار بر اساس شهر و رویداد
            $sql = "SELECT 
                    destination_city_name as city,
                    destination_country_name as country,
                    event_type,
                    COUNT(*) as total_count,
                    COUNT(DISTINCT session_id) as unique_sessions,
                    COUNT(DISTINCT ip_address) as unique_ips
                FROM safarbank_reporting
                WHERE provider_id = {$providerId}
                    AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                    AND destination_country_name = '{$country}'
                    AND destination_city_name IS NOT NULL
                    AND destination_city_name != ''
                GROUP BY destination_city_name, destination_country_name, event_type
                ORDER BY destination_city_name ASC";

            $results = $ModelBase->select($sql);

            // ساختاردهی داده‌ها بر اساس شهر
            $cities = [];
            $totalStats = [
                'impression' => 0,
                'detail_view' => 0,
                'refer_tour' => 0,
                'refer_site' => 0,
                'total_events' => 0
            ];

            // نگاشت event_type به کلیدهای خروجی
            $eventMap = [
                'search_impression' => 'impression',
                'detail_view' => 'detail_view',
                'agency_tour_click' => 'refer_tour',
                'agency_website_click' => 'refer_site'
            ];

            foreach ($results as $row) {
                $city = $row['city'];
                $eventType = $row['event_type'];
                $count = (int)$row['total_count'];

                // اگر شهر در آرایه نباشد، ایجاد کن
                if (!isset($cities[$city])) {
                    $cities[$city] = [
                        'city' => $city,
                        'country' => $row['country'],
                        'impression' => 0,
                        'detail_view' => 0,
                        'refer_tour' => 0,
                        'refer_site' => 0,
                        'total_events' => 0
                    ];
                }

                // اضافه کردن به آمار شهر
                if (isset($eventMap[$eventType])) {
                    $key = $eventMap[$eventType];
                    $cities[$city][$key] += $count;
                    $cities[$city]['total_events'] += $count;

                    // اضافه کردن به مجموع کل
                    $totalStats[$key] += $count;
                    $totalStats['total_events'] += $count;
                }
            }

            // تبدیل به آرایه برای مرتب‌سازی
            $result = array_values($cities);

            // مرتب‌سازی بر اساس تعداد کل رویدادها (نزولی)
            usort($result, function($a, $b) {
                return $b['total_events'] - $a['total_events'];
            });

            // گرفتن اطلاعات آژانس
            $agency = $this->getAgency($providerId);
            $agencyName = !empty($agency) ? $agency[0]['AgencyName'] ?? 'آژانس' : 'آژانس';

            return [
                'success' => true,
                'data' => $result,
                'total' => $totalStats,
                'agency' => [
                    'id' => $providerId,
                    'name' => $agencyName
                ],
                'country' => $country,
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ],
                'count' => count($result)
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * نمایش صفحه آمار تفکیکی شهرها
     */
    public function showCityStats()
    {
        try {
            // دریافت پارامترها
            $providerId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
            $country = isset($_GET['country']) ? $_GET['country'] : '';
            $dateFrom = isset($_GET['date_from']) ? $_GET['date_from'] : null;
            $dateTo = isset($_GET['date_to']) ? $_GET['date_to'] : null;

            if (!$providerId) {
                return [
                    'success' => false,
                    'message' => 'شناسه آژانس معتبر نیست'
                ];
            }

            if (empty($country)) {
                return [
                    'success' => false,
                    'message' => 'نام کشور معتبر نیست'
                ];
            }

            // دریافت آمار
            $stats = $this->getAgencyCityStats($providerId, $country, $dateFrom, $dateTo);

            return $stats;

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }


    public function getAgencyTourStats($providerId, $city, $dateFrom = null, $dateTo = null)
    {
        try {
            // تنظیم تاریخ‌های پیش‌فرض (یک ماه اخیر)
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // تبدیل تاریخ شمسی به میلادی اگر نیاز باشد
            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            // اصلاح تاریخ‌های معکوس
            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // کوئری اصلی برای دریافت آمار بر اساس تور و رویداد
            $sql = "SELECT 
                    tour_name,
                    start_date,
                    event_type,
                    COUNT(*) as total_count,
                    COUNT(DISTINCT session_id) as unique_sessions,
                    COUNT(DISTINCT ip_address) as unique_ips
                FROM safarbank_reporting
                WHERE provider_id = {$providerId}
                    AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                    AND destination_city_name = '{$city}'
                    AND tour_name IS NOT NULL
                    AND tour_name != ''
                GROUP BY tour_name, start_date, event_type
                ORDER BY tour_name ASC";

            $results = $ModelBase->select($sql);

            // ساختاردهی داده‌ها بر اساس تور
            $tours = [];
            $totalStats = [
                'impression' => 0,
                'detail_view' => 0,
                'refer_tour' => 0,
                'refer_site' => 0,
                'total_events' => 0
            ];

            // نگاشت event_type به کلیدهای خروجی
            $eventMap = [
                'search_impression' => 'impression',
                'detail_view' => 'detail_view',
                'agency_tour_click' => 'refer_tour',
                'agency_website_click' => 'refer_site'
            ];

            foreach ($results as $row) {
                $tourName = $row['tour_name'];
                $startDate = $row['start_date'];
                $eventType = $row['event_type'];
                $count = (int)$row['total_count'];

                // کلید یکتا برای هر تور
                $tourKey = $tourName . '|' . $startDate;

                // اگر تور در آرایه نباشد، ایجاد کن
                if (!isset($tours[$tourKey])) {
                    $tours[$tourKey] = [
                        'tour_name' => $tourName,
                        'start_date' => $startDate,
                        'impression' => 0,
                        'detail_view' => 0,
                        'refer_tour' => 0,
                        'refer_site' => 0,
                        'total_events' => 0
                    ];
                }

                // اضافه کردن به آمار تور
                if (isset($eventMap[$eventType])) {
                    $key = $eventMap[$eventType];
                    $tours[$tourKey][$key] += $count;
                    $tours[$tourKey]['total_events'] += $count;

                    // اضافه کردن به مجموع کل
                    $totalStats[$key] += $count;
                    $totalStats['total_events'] += $count;
                }
            }

            // تبدیل به آرایه برای مرتب‌سازی
            $result = array_values($tours);

            // مرتب‌سازی بر اساس تعداد کل رویدادها (نزولی)
            usort($result, function($a, $b) {
                return $b['total_events'] - $a['total_events'];
            });

            // گرفتن اطلاعات آژانس
            $agency = $this->getAgency($providerId);
            $agencyName = !empty($agency) ? $agency[0]['AgencyName'] ?? 'آژانس' : 'آژانس';

            return [
                'success' => true,
                'data' => $result,
                'total' => $totalStats,
                'agency' => [
                    'id' => $providerId,
                    'name' => $agencyName
                ],
                'city' => $city,
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ],
                'count' => count($result)
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * نمایش صفحه آمار تفکیکی تورها
     */
    public function showTourStats()
    {
        try {
            // دریافت پارامترها
            $providerId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
            $city = isset($_GET['city']) ? $_GET['city'] : '';
            $dateFrom = isset($_GET['date_from']) ? $_GET['date_from'] : null;
            $dateTo = isset($_GET['date_to']) ? $_GET['date_to'] : null;

            if (!$providerId) {
                return [
                    'success' => false,
                    'message' => 'شناسه آژانس معتبر نیست'
                ];
            }

            if (empty($city)) {
                return [
                    'success' => false,
                    'message' => 'نام شهر معتبر نیست'
                ];
            }

            // دریافت آمار
            $stats = $this->getAgencyTourStats($providerId, $city, $dateFrom, $dateTo);

            return $stats;

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    public function getTourDailyStats($providerId, $tourName, $city, $dateFrom = null, $dateTo = null)
    {
        try {
            // تنظیم تاریخ‌های پیش‌فرض (یک ماه اخیر)
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // تبدیل تاریخ شمسی به میلادی اگر نیاز باشد
            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            // اصلاح تاریخ‌های معکوس
            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // کوئری برای دریافت آمار روزانه تور
            $sql = "SELECT 
                    DATE(created_at) as visit_date,
                    COUNT(*) as total_count,
                    COUNT(DISTINCT session_id) as unique_sessions,
                    COUNT(DISTINCT ip_address) as unique_ips,
                    MIN(created_at) as first_visit,
                    MAX(created_at) as last_visit
                FROM safarbank_reporting
                WHERE provider_id = {$providerId}
                    AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                    AND destination_city_name = '{$city}'
                    AND tour_name = '{$tourName}'
                    AND event_type = 'search_impression'
                GROUP BY DATE(created_at)
                ORDER BY visit_date DESC";

            $results = $ModelBase->select($sql);

            // ساختاردهی داده‌ها
            $dailyStats = [];
            $totalVisits = 0;
            $totalUniqueSessions = 0;
            $totalUniqueIps = 0;

            foreach ($results as $row) {
                $dailyStats[] = [
                    'visit_date' => $row['visit_date'],
                    'total_count' => (int)$row['total_count'],
                    'unique_sessions' => (int)$row['unique_sessions'],
                    'unique_ips' => (int)$row['unique_ips'],
                    'first_visit' => $row['first_visit'],
                    'last_visit' => $row['last_visit']
                ];

                $totalVisits += (int)$row['total_count'];
                $totalUniqueSessions += (int)$row['unique_sessions'];
                $totalUniqueIps += (int)$row['unique_ips'];
            }

            // گرفتن اطلاعات آژانس
            $agency = $this->getAgency($providerId);
            $agencyName = !empty($agency) ? $agency[0]['AgencyName'] ?? 'آژانس' : 'آژانس';

            return [
                'success' => true,
                'data' => $dailyStats,
                'total' => [
                    'total_visits' => $totalVisits,
                    'unique_sessions' => $totalUniqueSessions,
                    'unique_ips' => $totalUniqueIps,
                    'days_count' => count($dailyStats)
                ],
                'agency' => [
                    'id' => $providerId,
                    'name' => $agencyName
                ],
                'tour' => [
                    'name' => $tourName,
                    'city' => $city
                ],
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ]
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * نمایش صفحه آمار روزانه تور
     */
    public function showTourDailyStats()
    {
        try {
            // دریافت پارامترها
            $providerId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
            $tourName = isset($_GET['tour_name']) ? $_GET['tour_name'] : '';
            $city = isset($_GET['city']) ? $_GET['city'] : '';
            $dateFrom = isset($_GET['date_from']) ? $_GET['date_from'] : null;
            $dateTo = isset($_GET['date_to']) ? $_GET['date_to'] : null;

            if (!$providerId) {
                return [
                    'success' => false,
                    'message' => 'شناسه آژانس معتبر نیست'
                ];
            }

            if (empty($tourName)) {
                return [
                    'success' => false,
                    'message' => 'نام تور معتبر نیست'
                ];
            }

            if (empty($city)) {
                return [
                    'success' => false,
                    'message' => 'نام شهر معتبر نیست'
                ];
            }

            // دریافت آمار
            $stats = $this->getTourDailyStats($providerId, $tourName, $city, $dateFrom, $dateTo);

            return $stats;

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }
    /**
     * گرفتن لیست تورهایی که کاربر روی آنها کلیک کرده (detail_view)
     */
    public function getDetailViewTours($providerId, $dateFrom = null, $dateTo = null)
    {
        try {
            // تنظیم تاریخ‌های پیش‌فرض (یک ماه اخیر)
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // ======== کوئری detail_view ========
            $sqlDetail = "SELECT 
                        tour_name,
                        start_date,
                        COUNT(*) as detail_count
                    FROM safarbank_reporting
                    WHERE provider_id = {$providerId}
                        AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                        AND event_type = 'detail_view'
                        AND tour_name IS NOT NULL
                        AND tour_name != ''
                    GROUP BY tour_name, start_date";

            $detailResults = $ModelBase->select($sqlDetail);

            // ======== کوئری refer_tour ========
            $sqlRefer = "SELECT 
                        tour_name,
                        start_date,
                        COUNT(*) as refer_count
                    FROM safarbank_reporting
                    WHERE provider_id = {$providerId}
                        AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                        AND event_type = 'agency_tour_click'
                        AND tour_name IS NOT NULL
                        AND tour_name != ''
                    GROUP BY tour_name, start_date";

            $referResults = $ModelBase->select($sqlRefer);

            // ======== ترکیب ========
            $tours = [];
            $totalDetail = 0;
            $totalRefer = 0;

            // اضافه کردن detail_view
            foreach ($detailResults as $row) {
                $key = $row['tour_name'] . '|' . $row['start_date'];
                $tours[$key] = [
                    'tour_name' => $row['tour_name'],
                    'start_date' => $row['start_date'],
                    'detail_count' => (int)$row['detail_count'],
                    'refer_count' => 0
                ];
                $totalDetail += (int)$row['detail_count'];
            }

            // اضافه کردن refer_tour
            foreach ($referResults as $row) {
                $key = $row['tour_name'] . '|' . $row['start_date'];
                if (isset($tours[$key])) {
                    $tours[$key]['refer_count'] = (int)$row['refer_count'];
                } else {
                    $tours[$key] = [
                        'tour_name' => $row['tour_name'],
                        'start_date' => $row['start_date'],
                        'detail_count' => 0,
                        'refer_count' => (int)$row['refer_count']
                    ];
                }
                $totalRefer += (int)$row['refer_count'];
            }

            // مرتب‌سازی بر اساس detail_count
            $tours = array_values($tours);
            usort($tours, function($a, $b) {
                return $b['detail_count'] - $a['detail_count'];
            });

            $agency = $this->getAgency($providerId);
            $agencyName = !empty($agency) ? $agency[0]['AgencyName'] ?? 'آژانس' : 'آژانس';

            return [
                'success' => true,
                'data' => $tours,
                'total' => [
                    'total_detail' => $totalDetail,
                    'total_refer' => $totalRefer,
                    'tours_count' => count($tours)
                ],
                'agency' => [
                    'id' => $providerId,
                    'name' => $agencyName
                ],
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ]
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    public function showDetailViewTours()
    {
        try {
            $providerId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
            $dateFrom = isset($_GET['date_from']) ? $_GET['date_from'] : null;
            $dateTo = isset($_GET['date_to']) ? $_GET['date_to'] : null;

            if (!$providerId) {
                return [
                    'success' => false,
                    'message' => 'شناسه آژانس معتبر نیست'
                ];
            }

            return $this->getDetailViewTours($providerId, $dateFrom, $dateTo);

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * گرفتن لیست refer site (کلیک روی سایت آژانس)
     */
    public function getReferSiteStats($providerId, $dateFrom = null, $dateTo = null)
    {
        try {
            // تنظیم تاریخ‌های پیش‌فرض (یک ماه اخیر)
            if (empty($dateFrom)) {
                $today = date('Y-m-d');
                $dateFrom = date('Y-m-d', strtotime('-30 days', strtotime($today)));
            }
            if (empty($dateTo)) {
                $dateTo = date('Y-m-d');
            }

            // تبدیل تاریخ شمسی به میلادی اگر نیاز باشد
            $dateFrom = $this->toGregorian($dateFrom);
            $dateTo = $this->toGregorian($dateTo);

            if ($dateFrom > $dateTo) {
                $temp = $dateFrom;
                $dateFrom = $dateTo;
                $dateTo = $temp;
            }

            $ModelBase = new ModelBase();
            $ModelBase->setTable('safarbank_reporting');

            // کوئری برای دریافت refer site ها
            $sql = "SELECT 
                    DATE(created_at) as visit_date,
                    COUNT(*) as total_count,
                    COUNT(DISTINCT session_id) as unique_sessions,
                    COUNT(DISTINCT ip_address) as unique_ips
                FROM safarbank_reporting
                WHERE provider_id = {$providerId}
                    AND DATE(created_at) BETWEEN '{$dateFrom}' AND '{$dateTo}'
                    AND event_type = 'agency_website_click'
                GROUP BY DATE(created_at)
                ORDER BY visit_date DESC";

            $results = $ModelBase->select($sql);

            $data = [];
            $totalVisits = 0;

            foreach ($results as $row) {
                $data[] = [
                    'visit_date' => $row['visit_date'],
                    'total_count' => (int)$row['total_count'],
                    'unique_sessions' => (int)$row['unique_sessions'],
                    'unique_ips' => (int)$row['unique_ips']
                ];
                $totalVisits += (int)$row['total_count'];
            }

            // گرفتن اطلاعات آژانس
            $agency = $this->getAgency($providerId);
            $agencyName = !empty($agency) ? $agency[0]['AgencyName'] ?? 'آژانس' : 'آژانس';

            return [
                'success' => true,
                'data' => $data,
                'total' => [
                    'total_visits' => $totalVisits,
                    'days_count' => count($data)
                ],
                'agency' => [
                    'id' => $providerId,
                    'name' => $agencyName
                ],
                'date_range' => [
                    'from' => $dateFrom,
                    'to' => $dateTo
                ]
            ];

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

    /**
     * نمایش صفحه refer site
     */
    public function showReferSiteStats()
    {
        try {
            $providerId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
            $dateFrom = isset($_GET['date_from']) ? $_GET['date_from'] : null;
            $dateTo = isset($_GET['date_to']) ? $_GET['date_to'] : null;

            if (!$providerId) {
                return [
                    'success' => false,
                    'message' => 'شناسه آژانس معتبر نیست'
                ];
            }

            return $this->getReferSiteStats($providerId, $dateFrom, $dateTo);

        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }

}