<?php
//error_reporting(1);
//    error_reporting(E_ALL | E_STRICT);
//    @ini_set('display_errors', 1);
//    @ini_set('display_errors', 'on');
class safarbankReport extends clientAuth
{
    private $logFile;
    private $table;
    private $apiUrl;
    private $perPage;

    public function __construct()
    {
        $this->logFile = 'safarbank_report.log';
        $this->table = 'safarbank_reporting';
        $this->apiUrl = 'http://api.safarbank.ir/api/track/events/all';
        $this->perPage = 100; // تعداد رکورد در هر درخواست

        $this->run();
    }

    public function run()
    {
        $this->log("========== START SAFARBANK REPORT CRON ==========");

        try {
            // دریافت و ذخیره داده‌ها با pagination
            $page = 1;
            $totalSaved = 0;
            $totalPages = 0;

            do {
                $this->log("Fetching page: {$page}");

                $response = $this->fetchDataFromApi($page);

                if (!$response || !isset($response['status']) || $response['status'] !== true) {
                    $this->log("❌ Failed to fetch data from API (Page: {$page})");
                    break;
                }

                $data = $response['data'] ?? [];
                $pagination = $response['meta']['pagination'] ?? [];

                if (empty($data)) {
                    $this->log("⚠️ No data found in page {$page}");
                    break;
                }

                $totalPages = $pagination['last_page'] ?? 1;

                // ذخیره داده‌ها در دیتابیس
                $savedCount = $this->saveToDatabase($data);
                $totalSaved += $savedCount;

                $this->log("✅ Page {$page} saved: {$savedCount} records (Total so far: {$totalSaved})");

                $page++;

                // جلوگیری از حلقه بی‌نهایت
                if ($page > 50) {
                    $this->log("⚠️ Max page limit reached (50)");
                    break;
                }

                // اگر صفحه آخر بود یا داده‌ای نبود، حلقه را متوقف کن
                if ($page > $totalPages) {
                    $this->log("🏁 Reached last page ({$totalPages})");
                    break;
                }

            } while (true);

            $this->log("========== SUMMARY ==========");
            $this->log("📊 Total records saved: " . $totalSaved);
            $this->log("📄 Total pages processed: " . ($page - 1));
            $this->log("========== END SAFARBANK REPORT CRON ==========");

        } catch (Exception $e) {
            $this->log("❌ CRITICAL ERROR: " . $e->getMessage());
            $this->log("Stack trace: " . $e->getTraceAsString());
        }
    }

    /**
     * دریافت داده‌ها از API
     */
    private function fetchDataFromApi($page = 1)
    {
        try {
            $url = $this->apiUrl . '?page=' . $page . '&per_page=' . $this->perPage;

            $this->log("🌐 Requesting URL: " . $url);

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 30);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Accept: application/json',
                'Content-Type: application/json',
            ]);

            $response = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $curlError = curl_error($ch);
            curl_close($ch);

            if ($curlError) {
                $this->log("❌ CURL Error: " . $curlError);
                return null;
            }

            if ($httpCode !== 200) {
                $this->log("❌ HTTP Error: " . $httpCode);
                return null;
            }

            $decoded = json_decode($response, true);

            if (json_last_error() !== JSON_ERROR_NONE) {
                $this->log("❌ JSON Decode Error: " . json_last_error_msg());
                return null;
            }

            return $decoded;

        } catch (Exception $e) {
            $this->log("❌ Exception in fetchDataFromApi: " . $e->getMessage());
            return null;
        }
    }

    /**
     * ذخیره داده‌ها در دیتابیس
     */
    private function saveToDatabase($data)
    {
        if (empty($data)) {
            return 0;
        }
        $ModelBase = Load::library('ModelBase');
        $ModelBase->setTable($this->table);

        $savedCount = 0;
        $errorCount = 0;

        foreach ($data as $record) {
            try {

                $apiId = $record['provider_id'] .'-'. $record['id'].'-'. $record['tour_id'];

                $checkSql = "SELECT api_id FROM {$this->table} WHERE api_id = '{$apiId}'";
                $existing = $ModelBase->select($checkSql);

                if (!empty($existing)) {
                    $this->log("⏭️ Record ID {$record['id']} already exists, skipping...");
                    continue;
                }

                // آماده‌سازی داده‌ها برای ذخیره
                $insertData = $this->prepareDataForInsert($record);

                if (empty($insertData)) {
                    $this->log("⚠️ Empty data for record ID {$record['id']}, skipping...");
                    continue;
                }

                // ======== استفاده از insertLocal به جای insert ========
                $result = $ModelBase->insertLocal($insertData);

                if ($result) {
                    $savedCount++;
                    $this->log("✅ Saved record ID: {$record['id']} - Tour: {$record['tour_name']}");
                } else {
                    $errorCount++;
                    $this->log("❌ Failed to save record ID: {$record['id']}");
                }

            } catch (Exception $e) {
                $errorCount++;
                $this->log("❌ Error saving record ID {$record['id']}: " . $e->getMessage());
            }
        }

        $this->log("📊 Saved: {$savedCount}, Errors: {$errorCount}");
        return $savedCount;
    }

    /**
     * آماده‌سازی داده‌ها برای insert
     */
    private function prepareDataForInsert($record)
    {
        $allowedFields = [
            'id', 'api_id', 'provider_id', 'event_type', 'tour_name',
            'start_date', 'origin_city_id', 'origin_city_name', 'origin_country_name',
            'destination_city_id', 'destination_city_name', 'destination_country_id',
            'destination_country_name', 'search_id', 'session_id',
            'device_type', 'ip_address', 'user_agent', 'referrer',
            'meta', 'created_at', 'updated_at'
        ];

        $insertData = [];

        foreach ($allowedFields as $field) {
            if (isset($record[$field])) {
                $value = $record[$field];

                // پردازش ویژه برای فیلدهای خاص
                if ($field === 'meta' && is_array($value)) {
                    $value = json_encode($value);
                }

                if ($field === 'created_at' || $field === 'updated_at') {
                    if (!empty($value)) {
                        $value = date('Y-m-d H:i:s', strtotime($value));
                    }
                }
                if ($value === null) {
                    if (in_array($field, ['id', 'tour_id', 'provider_id', 'event_type'])) {
                        $this->log("⚠️ Required field {$field} is null for record ID {$record['id']}");
                        return [];
                    }
                    continue;
                }

                $insertData[$field] = $value;
            }
        }
        $insertData['date'] = $insertData['created_at'];
        // ساخت api_id
        $providerId = $record['provider_id'] ;
        $recordId = $record['id'];
        $tourId = $record['tour_id'];

        $insertData['api_id'] = preg_replace('/[^a-zA-Z0-9\-_]/', '', $providerId) . '-' .
            preg_replace('/[^a-zA-Z0-9\-_]/', '', $recordId) . '-' .
            preg_replace('/[^a-zA-Z0-9\-_]/', '', $tourId);

        // ========== مهم: Escape کردن همه مقادیر برای جلوگیری از خطای 1064 ==========
        foreach ($insertData as $key => $value) {
            if (is_string($value)) {
                $insertData[$key] = addslashes($value);
            }
        }

        return $insertData;
    }

    /**
     * تابع لاگ‌گیری
     */
    private function log($message)
    {
        $logMessage = date('Y-m-d H:i:s') . ' | ' . $message . PHP_EOL;
        error_log($logMessage, 3, LOGS_DIR . $this->logFile);

        if (php_sapi_name() === 'cli') {
            echo $logMessage;
        }
    }
}

// اجرای کلاس
new safarbankReport();
echo "✅ safarbankReport completed successfully!\n";