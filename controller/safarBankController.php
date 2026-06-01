<?php

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

}