<?php

class safarBankDeductConsumption extends clientAuth
{
    private $safarBankController;
    private $logFile = 'safarBankDeductConsumption.txt';

    public function __construct()
    {
        $this->log("========== START CRON ==========");
        $this->log("زمان اجرا: " . date('Y-m-d H:i:s'));

        $this->safarBankController = Load::controller('safarBankController');
        $this->run();

        $this->log("========== END CRON ==========");
    }

    private function run()
    {
        try {
            // بازه زمانی دیروز
            $yesterdayShamsi = dateTimeSetting::jdate('Y-m-d', strtotime('-1 day'));
            $yesterdayGregorian = $this->safarBankController->toGregorian($yesterdayShamsi);
            $todayGregorian = date('Y-m-d');

            $this->log("بازه مصرف: {$yesterdayShamsi} ({$yesterdayGregorian} تا {$todayGregorian})");

            // گرفتن همه آژانس‌ها
            $agencies = $this->safarBankController->getAgencies();
            $this->log("تعداد کل آژانس‌ها: " . count($agencies));

            $successCount = 0;
            $failedCount = 0;
            $totalDeducted = 0;

            foreach ($agencies as $agency) {
                $agencyId = $agency['id'];
                $agencyName = $agency['AgencyName'];

                $this->log("----------------------------------------");
                $this->log("بررسی آژانس: {$agencyName} (ID: {$agencyId})");

                // کسر مصرف
                $result = $this->safarBankController->deductConsumption($agencyId, $yesterdayGregorian, $todayGregorian);
                $resultArray = json_decode($result, true);

                if ($resultArray['success']) {
                    $successCount++;
                    $totalDeducted += ($resultArray['details']['total_cost'] ?? 0);
                    $this->log("✅ موفق: " . $resultArray['message']);
                } else {
                    $failedCount++;
                    $this->log("❌ خطا: " . $resultArray['message']);
                }
            }

            $this->log("========== SUMMARY ==========");
            $this->log("کسر موفق: {$successCount}");
            $this->log("کسر ناموفق: {$failedCount}");
            $this->log("کل مبلغ کسر شده: " . number_format($totalDeducted) . " ریال");
            $this->log("کل مبلغ کسر شده: " . number_format($totalDeducted / 10) . " تومان");

            // ========== بخش جدید: بررسی و غیرفعال کردن آژانس‌های با اعتبار منفی ==========
            $this->log("----------------------------------------");
            $this->log("بررسی آژانس‌های با اعتبار منفی...");

            $deactivationResult = $this->safarBankController->deactivateLowCreditAgencies();
            $deactivationArray = json_decode($deactivationResult, true);

            if ($deactivationArray['success']) {
                $this->log("✅ " . $deactivationArray['message']);
                if ($deactivationArray['deactivated_count'] > 0) {
                    $this->log("آژانس‌های غیرفعال شده: " . implode(', ', $deactivationArray['deactivated_agencies']));
                }
            } else {
                $this->log("❌ خطا در بررسی اعتبار: " . $deactivationArray['message']);
            }

        } catch (Exception $e) {
            $this->log("🔥 خطای کلی: " . $e->getMessage());
        }
    }

    private function log($message)
    {
        $logMessage = date('Y-m-d H:i:s') . ' | ' . $message . PHP_EOL;
        error_log($logMessage, 3, LOGS_DIR . $this->logFile);

        if (php_sapi_name() === 'cli') {
            echo $logMessage;
        }
    }
}

new safarBankDeductConsumption();