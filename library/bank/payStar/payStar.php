<?php

class paystar {

    private $apiBase = 'https://core.paystar.ir/api/pardakht/';
    private $gatewayId;
    private $amount;
    private $orderId;
    private $callback;

    public function requestPayment( $params ) {
        $this->gatewayId = $params['gateway_id'];
        $this->amount    = $params['amount'];
        $this->orderId   = $params['order_id'];
        $this->callback  = $params['callback'];

        $data = [
            'amount'     => $this->amount,
            'order_id'   => $this->orderId,
            'callback'   => $this->callback,
            'callback_method' => 0
        ];

        $response = $this->callAPI('create', $data);

        if ( isset($response['status']) && $response['status'] == 1 ) {
            return [
                'success' => true,
                'data' => [
                    'link' => $this->apiBase.'payment?token=' . $response['data']['token'],
                    'token' => $response['data']['token'],
                ]
            ];
        } else {
            return [
                'success' => false,
                'message' => $response['message'] ?? 'خطا در ارتباط با درگاه',
            ];
        }
    }

    public function verifyPayment( $params ) {
        $logFile = 'logs/logBankPaystar_request.txt';
        $logData = $this->findTokenFromLog($logFile, $params['gateway_id'], $params['order_id']);
        if (!$logData || !$logData['token'] || !$logData['amount']) {
            return [
                'success' => false,
                'message' => 'اطلاعات ارسالی به بانک اشتباه می باشد.'
            ];
        }

        $loggedToken = $logData['token'];
        $loggedAmount = $logData['amount'];

        $data = [
            'token' => $loggedToken,
            'ref_num'   => $params['ref_num'],
            'amount'    => $loggedAmount,//$params['amount']
        ];

        $this->gatewayId = $params['gateway_id'];
        functions::insertLog('callAPI$data: ' . json_encode($data) , '0abbasi');

        $response = $this->callAPI('verify', $data);

        functions::insertLog('callAPI$response: ' . json_encode($response) , '0abbasi');


        if ( isset($response['status']) && $response['status'] == 1 ) {
            return [
                'success' => true,
                'data' => [
                    'amount'         => $params['amount'],
                    'order_id'       => $params['order_id'],
                    'tracking_code'  => $params['tracking_code'],
                ]
            ];
        } else {
            return [
                'success' => false,
                'message' => $response['message'] ?? 'تراکنش ناموفق بود',
            ];
        }
    }


    private function callAPI($endpoint, $data) {
        $url = $this->apiBase . $endpoint;

        $headers = [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $this->gatewayId
        ];

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        $response = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if (curl_errno($ch)) {
            curl_close($ch);
            return [
                'status' => 0,
                'message' => 'cURL error: ' . curl_error($ch)
            ];
        }

        curl_close($ch);
        return json_decode($response, true);
    }
    public function findTokenFromLog($filePath, $gatewayId, $orderId) {
        if (!file_exists($filePath)) {
            return null;
        }

        $lines = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        if ($lines === false) {
            return null;
        }

        // معکوس کردن آرایه برای جستجو از انتها
        $lines = array_reverse($lines);

        foreach ($lines as $line) {
            if (strpos($line, 'requestPayment') === false) {
                continue;
            }

            $pos = strpos($line, 'requestPayment : ');
            if ($pos === false) {
                continue;
            }

            $jsonStr = trim(substr($line, $pos + strlen('requestPayment : ')));
            $data = json_decode($jsonStr, true);

            if (json_last_error() !== JSON_ERROR_NONE) {
                continue;
            }

            if (!isset($data['params']['gateway_id'], $data['params']['order_id'])) {
                continue;
            }

            if ($data['params']['gateway_id'] !== $gatewayId || $data['params']['order_id'] !== $orderId) {
                continue;
            }

            if (isset($data['request_payment']['data']['token'])) {
                return [
                    'token'   => $data['request_payment']['data']['token'],
                    'amount'  => $data['params']['amount'] ?? null,
                    'link'    => $data['request_payment']['data']['link'] ?? null,
                    'order_id' => $data['params']['order_id'],
                    'gateway_id' => $data['params']['gateway_id']
                ];
            }
        }

        return null;
    }

}
?>