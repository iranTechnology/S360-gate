<?php

//        error_reporting(1);
//        error_reporting(E_ALL | E_STRICT);
//        @ini_set('display_errors', 1);
//        @ini_set('display_errors', 'on');
require_once(LIBRARY_DIR . 'bank/BankBase.php');

class ap extends BankBase
{
    private $baseUrl = 'https://ipgrest.asanpardakht.ir/v1/';

    private $username = '';
    private $password = '';
    private $merchantConfigurationId = 0;

    /**
     * تنظیم اطلاعات درگاه
     *
     * param1 = username
     * param2 = password
     * param3 = merchantConfigurationId
     */
    public function setConfig($username, $password, $merchantConfigurationId)
    {
        $this->username = trim((string)$username);
        $this->password = trim((string)$password);
        $this->merchantConfigurationId = (int)$merchantConfigurationId;

        if (
            $this->username === '' ||
            $this->password === '' ||
            $this->merchantConfigurationId <= 0
        ) {
            throw new Exception('اطلاعات پیکربندی درگاه آپ نامعتبر است.');
        }

        return $this;
    }

    /**
     * دریافت توکن پرداخت
     */
    public function requestPayment($requestData = array())
    {
        $request = array(
            'serviceTypeId' => 1,
            'merchantConfigurationId' => $this->merchantConfigurationId,
            'localInvoiceId' => $requestData['invoice'],
            'amountInRials' => $requestData['amount'],
            'localDate' => $requestData['localDate'],
            'additionalData' => isset($requestData['additionalData'])
                ? (string)$requestData['additionalData']
                : '',
            'callbackURL' => $requestData['callbackURL'],
            'paymentId' => isset($requestData['paymentId'])
                ? (string)$requestData['paymentId']
                : '0'
        );

        if (!empty($requestData['mobileNumber'])) {
            $request['mobileNumber'] = $requestData['mobileNumber'];
        }

        functions::insertLog(
            'AP requestPayment request ===> ' .
            json_encode(
                $request,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            ),
            'logBankAp'
        );

        $response = $this->request(
            'Token',
            $request,
            'POST'
        );

        functions::insertLog(
            'AP requestPayment response ===> ' .
            json_encode(
                $response,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            ),
            'logBankAp'
        );

        if (!$response['success']) {
            return $this->showResult(
                false,
                $response,
                $this->getErrorMessage($response, 'خطا در دریافت توکن درگاه آپ')
            );
        }

        /*
         * در پاسخ موفق Token،
         * body خود توکن است.
         */
        $token = json_decode($response['body'], true);

        if (!is_string($token)) {
            $token = trim($response['body'], "\" \t\n\r\0\x0B");
        }

        if ($token === '') {
            return $this->showResult(
                false,
                $response,
                'توکن دریافتی از درگاه آپ نامعتبر است.'
            );
        }

        return $this->showResult(
            true,
            array(
                'token' => $token,
                'redirect_url' => 'https://asan.shaparak.ir/',
                'invoice' => (string)$requestData['invoice']
            ),
            'توکن پرداخت با موفقیت دریافت شد.'
        );
    }

    /**
     * استعلام نتیجه تراکنش
     */
    public function transactionResult($localInvoiceId)
    {
        $params = array(
            'merchantConfigurationId' => $this->merchantConfigurationId,
            'localInvoiceId' => $localInvoiceId
        );

        functions::insertLog(
            'AP TranResult request ===> ' .
            json_encode($params, JSON_UNESCAPED_UNICODE),
            'logBankAp'
        );

        $response = $this->request(
            'TranResult',
            $params,
            'GET'
        );

        functions::insertLog(
            'AP TranResult response ===> ' .
            json_encode(
                $response,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            ),
            'logBankAp'
        );

        if (!$response['success']) {
            return $this->showResult(
                false,
                $response,
                $this->getErrorMessage(
                    $response,
                    'استعلام تراکنش از درگاه آپ ناموفق بود.'
                )
            );
        }

        $data = json_decode(
            $response['body'],
            true,
            512,
            JSON_BIGINT_AS_STRING
        );

        if (!is_array($data)) {
            return $this->showResult(
                false,
                $response,
                'پاسخ استعلام تراکنش آپ نامعتبر است.'
            );
        }

        return $this->showResult(
            true,
            $data,
            'اطلاعات تراکنش دریافت شد.'
        );
    }

    /**
     * Verify
     */
    public function verifyPayment($verify_params = [])
    {
        $payGateTranId = isset($verify_params['payGateTranId'])
            ? $verify_params['payGateTranId']
            : null;

        if (empty($payGateTranId)) {
            return $this->showResult(
                false,
                [],
                'شناسه تراکنش payGateTranId ارسال نشده است.'
            );
        }

        return $this->transactionOperation(
            'Verify',
            $payGateTranId,
            'تراکنش با موفقیت وریفای شد.'
        );
    }

    /**
     * Settlement
     */
    public function settlementPayment($payGateTranId)
    {
        return $this->transactionOperation(
            'Settlement',
            $payGateTranId,
            'تراکنش با موفقیت تسویه شد.'
        );
    }

    /**
     * Reverse
     */
    public function reversePayment($payGateTranId)
    {
        return $this->transactionOperation(
            'Reverse',
            $payGateTranId,
            'تراکنش با موفقیت Reverse شد.'
        );
    }

    /**
     * Cancel
     */
    public function cancelPayment($payGateTranId)
    {
        return $this->transactionOperation(
            'Cancel',
            $payGateTranId,
            'تراکنش با موفقیت Cancel شد.'
        );
    }

    /**
     * عملیات مشترک
     * Verify / Settlement / Reverse / Cancel
     */
    private function transactionOperation(
        $method,
        $payGateTranId,
        $successMessage
    ) {
        $params = array(
            'merchantConfigurationId' => $this->merchantConfigurationId,
            'payGateTranId' => $payGateTranId
        );

        functions::insertLog(
            'AP ' . $method . ' request ===> ' .
            json_encode($params, JSON_UNESCAPED_UNICODE),
            'logBankAp'
        );

        $response = $this->request(
            $method,
            $params,
            'POST'
        );

        functions::insertLog(
            'AP ' . $method . ' response ===> ' .
            json_encode(
                $response,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            ),
            'logBankAp'
        );

        if (!$response['success']) {
            return $this->showResult(
                false,
                $response,
                $this->getErrorMessage(
                    $response,
                    'عملیات ' . $method . ' درگاه آپ ناموفق بود.'
                )
            );
        }

        return $this->showResult(
            true,
            array(
                'payGateTranId' => (string)$payGateTranId,
                'httpStatus' => $response['status']
            ),
            $successMessage
        );
    }

    /**
     * ارسال درخواست اصلی به AP
     */
    private function request($method, array $params, $verb = 'POST')
    {
        if (!function_exists('curl_init')) {
            return array(
                'success' => false,
                'status' => 0,
                'body' => '',
                'curl_errno' => 0,
                'curl_error' => 'افزونه cURL فعال نیست.'
            );
        }

        $url = $this->baseUrl . $method;

        if ($verb === 'GET') {
            $url .= '?' . http_build_query($params);
        }

        $headers = array(
            'Content-Type: application/json',
            'Accept: application/json',
            'Usr: ' . $this->username,
            'Pwd: ' . $this->password
        );

        $curl = curl_init($url);

        $options = array(
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CONNECTTIMEOUT => 10,
            CURLOPT_TIMEOUT => 30,

            CURLOPT_SSL_VERIFYPEER => true,
            CURLOPT_SSL_VERIFYHOST => 2,

            CURLOPT_HTTPHEADER => $headers
        );

        $requestBody = '';

        if ($verb === 'POST') {

            $requestBody = json_encode(
                $params,
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            );

            if ($requestBody === false) {
                curl_close($curl);

                return array(
                    'success' => false,
                    'status' => 0,
                    'body' => '',
                    'curl_errno' => 0,
                    'curl_error' => 'ساخت JSON درخواست ناموفق بود.'
                );
            }

            $options[CURLOPT_POST] = true;
            $options[CURLOPT_POSTFIELDS] = $requestBody;
        }

        /*
         * برای Debug
         *
         * پسورد را عمداً لاگ نکرده‌ایم.
         */
        functions::insertLog(
            'AP HTTP REQUEST ===> ' .
            json_encode(
                array(
                    'url' => $url,
                    'method' => $verb,
                    'headers' => array(
                        'Content-Type' => 'application/json',
                        'Accept' => 'application/json',
                        'Usr' => $this->username,
                        'Pwd' => $this->password
                    ),
                    'body' => $requestBody
                ),
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            ),
            'logBankAp'
        );

        curl_setopt_array(
            $curl,
            $options
        );

        $responseBody = curl_exec($curl);

        $status = curl_getinfo(
            $curl,
            CURLINFO_HTTP_CODE
        );

        $curlError = curl_error($curl);
        $curlErrno = curl_errno($curl);

        curl_close($curl);

        functions::insertLog(
            'AP HTTP RESPONSE ===> ' .
            json_encode(
                array(
                    'status' => $status,
                    'body' => $responseBody,
                    'curl_errno' => $curlErrno,
                    'curl_error' => $curlError
                ),
                JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
            ),
            'logBankAp'
        );

        if ($responseBody === false) {
            return array(
                'success' => false,
                'status' => $status,
                'body' => '',
                'curl_errno' => $curlErrno,
                'curl_error' => $curlError
            );
        }

        /*
         * طبق مستند AP فقط HTTP 200 موفق است.
         */
        return array(
            'success' => ((int)$status === 200),
            'status' => (int)$status,
            'body' => $responseBody,
            'curl_errno' => $curlErrno,
            'curl_error' => $curlError
        );
    }

    /**
     * استخراج متن خطا از پاسخ AP
     */
    private function getErrorMessage(array $response, $defaultMessage)
    {
        if (!empty($response['curl_error'])) {
            return $defaultMessage .
                ' - CURL: ' .
                $response['curl_error'];
        }

        if (!empty($response['body'])) {

            $body = json_decode(
                $response['body'],
                true
            );

            if (
                is_array($body) &&
                isset($body['error'])
            ) {

                $error = $body['error'];

                $message = isset($error['message'])
                    ? $error['message']
                    : $defaultMessage;

                $code = isset($error['code'])
                    ? $error['code']
                    : '';

                return $defaultMessage .
                    ' - HTTP ' .
                    $response['status'] .
                    ($code !== '' ? ' - Code ' . $code : '') .
                    ' - ' .
                    $message;
            }
        }

        return $defaultMessage .
            ' - HTTP ' .
            $response['status'];
    }

    public function showResult(
        $status,
        $data,
        $message = ''
    ) {
        return array(
            'status' => $status,
            'data' => $data,
            'message' => $message
        );
    }
}