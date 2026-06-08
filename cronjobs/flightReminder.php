<?php


//error_reporting(E_ALL);
//ini_set('display_errors', 1);
//ini_set('log_errors', 1);
class flightReminder extends clientAuth
{

    private $smsMessageManeger;
    private $smsMessagePassenger;
    private $logFile;
    private $table;

    public function __construct() {
        $this->smsMessageManeger = 'مسافری تا مرحله پیش رزرو یا درگاه بانکی رفته ولی خرید خود را قطعی نکرده است. اگر مایل باشید، برای برندینگ خود، پیگیری بفرمایید';
        $this->smsMessagePassenger = 'مسافر محترم، شما خرید بلیط خود را نیمه‌کاره رها کردید. اگر تمایل به خرید دارید، پیشنهاد می‌کنیم مراحل را تا انتها ادامه دهید.
با تشکر- دپارتمان فروش';
        $this->logFile = 'flightReminder.txt';
        $this->table = 'report_tb';
        $this->checkStatusFlightReminder();
    }

    public function checkStatusFlightReminder(){
        $this->log("========== START CRON ==========");

        $ModelBase = Load::library('ModelBase');

        $todayStart = strtotime(date('Y-m-d 00:00:00'));
        $todayEnd = strtotime(date('Y-m-d 23:59:59'));

        $this->log("Today's date range: from " . date('Y-m-d H:i:s', $todayStart) . " to " . date('Y-m-d H:i:s', $todayEnd));

        $sql = "SELECT * FROM $this->table
        WHERE successfull IN ('prereserve', 'bank')
        AND sms_30min_sent = 0
        AND creation_date_int BETWEEN $todayStart AND $todayEnd 
        ORDER BY id DESC 
        LIMIT 100";

        $this->log("SQL Query: " . $sql);

        $BookShow = $ModelBase->select($sql);
        $totalRecords = count($BookShow);
        $this->log("Total records found: " . $totalRecords);

        $currentTime = time();
        $this->log("Current time: " . date('Y-m-d H:i:s', $currentTime));

        $ModelBase->setTable($this->table);

        $smsSentCount = 0;
        $errorCount = 0;

        foreach($BookShow as $booking){
            $reserveTime = $booking['creation_date_int'];
            $timeDiff = $currentTime - $reserveTime;  // برعکس کردیم
            $minutesAfterReserve = $timeDiff / 60;     // الان مثبت میشه

            $this->log("Minutes after reservation: " . round($minutesAfterReserve, 2));

            if($minutesAfterReserve >= 29 && $minutesAfterReserve <= 31){
                $this->log("*** Sending SMS ***");
                $this->sendSmsToClient($booking);

                $data = [
                    'sms_30min_sent' => 1,
                    'sms_sent_at' => date('Y-m-d H:i:s')
                ];
                $condition = " id = '{$booking['id']}' ";
                $updateResult = $ModelBase->update($data, $condition);
                $this->log("Database update result: " . ($updateResult ? "SUCCESS ✅" : "FAILED ❌"));
                $smsSentCount++;
            }
        }

        $this->log("========== SUMMARY ==========");
        $this->log("Total records: " . $totalRecords);
        $this->log("SMS sent: " . $smsSentCount);
        $this->log("Errors: " . $errorCount);
        $this->log("========== END CRON ==========");
    }

    private function sendSmsToClient($eachDirection) {

        // لاگ برای دیباگ
        $this->log("start sending to phone number {$eachDirection['member_mobile']}");

        if(empty($eachDirection['client_id'])) {
            $this->log("client id not found");
            return false;
        }

        if(empty($eachDirection['member_mobile'])) {
            $this->log("member_mobile not found");
            return false;
        }

        try {
            //sms to buyer
            $sms_service = $this->getcontroller('smsServices');

            if(empty($sms_service)) {
                $this->log("sms service not found");
                return false;
            }

            $objSms = $sms_service->initService('0', $eachDirection['client_id']);

            if ($objSms) {
                $smsArray = array(
                    'smsMessage' => $this->smsMessagePassenger,
                    'cellNumber' => $eachDirection['member_mobile'],
                    'receiverName' => $eachDirection['member_name'] ?? 'مسافر گرامی',
                );

                $result = $sms_service->sendSMS($smsArray);
                $this->log("res sending to passenger => " . json_encode($result));

                if(!empty(CLIENT_MOBILE)) {
                    $smsArrayManager = array(
                        'smsMessage' => $this->smsMessageManeger,
                        'cellNumber' => CLIENT_MOBILE,
                        'receiverName' => 'مدیر سایت',
                    );
                    $result2 = $sms_service->sendSMS($smsArrayManager);
                    $this->log("res sending to manger" . json_encode($result2));
                } else {
                    $this->log("CLIENT_MOBILE not found");
                }

                return true;
            } else {
                $this->log("objSms is wrong");
                return false;
            }
        } catch (Exception $e) {
            $this->log("error : send sms is wrong " . $e->getMessage());
            return false;
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


new flightReminder();
echo "OK";