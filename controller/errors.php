<?php
//if(  $_SERVER['REMOTE_ADDR']=='2.176.222.237'  ) {
//    error_reporting(1);
//    error_reporting(E_ALL | E_STRICT);
//    @ini_set('display_errors', 1);
//    @ini_set('display_errors', 'on');
//}

class errors extends clientAuth
{


    public function __construct(){
        parent::__construct();
    }

    public function listErrors($type , $method = null , $sourceCode = null)
    {
        $sql = $this->getModel('errorModel')
            ->get(['id' , 'providerError' , 'displayAgency' , 'displayPassenger' , 'displayAdmin' , 'sourceCode'] , true)
            ->where('type', $type);

        if (!empty($sourceCode) && !empty($method)) {
            $sqlSource = $sql
                ->where('method ', $method )
                ->where('sourceCode', $sourceCode)
            ;
            $listErrSource = $sqlSource->all();
            return $listErrSource;
        }

        $listErr = $sql->all();

        return $listErr;
    }

    public function showAllErrors($type)
    {
        $sql = $this->getModel('errorModel')
            ->get(['id' , 'providerError' , 'displayAgency' , 'displayPassenger' , 'displayAdmin' , 'sourceCode' , 'creation_date_int'] , true)
            ->where('type', $type)
            ->orderBy();;

        $listErr = $sql->all();

        foreach ($listErr as &$err) {
            $timestamp = (int)$err['creation_date_int'];
            $datetime = date("Y-m-d H:i:s", $timestamp);
            $date = functions::ConvertToJalali(substr($datetime, 0, 10));
            $time = substr($datetime, 11);
            $err['creation_date_int'] = $date . ' ' . $time;
        }


        return $listErr;
    }

    public function updateErrorFlight($data)
    {

        $error_model = $this->getModel('errorModel');

        $data_update['displayAgency'] = $data['displayAgency'];
        $data_update['displayPassenger'] = $data['displayPassenger'];
        $data_update['displayAdmin'] = $data['displayAdmin'];
        $data_update['providerError'] = $data['displayProviderError'];

        $condition ="id='{$data['id']}'";
        $update_result = $error_model->updateWithBind($data_update , $condition);

        if ($update_result) {
            return functions::JsonSuccess($update_result, [
                'message' => 'با موفقیت ویرایش شد',
            ], 200);
        }
        return functions::JsonError($update_result, [
            'message' => 'خطا در ویرایش ',
        ], 200);

    }

    function processError($err , $type , $method , $sourceCode) {

        if (is_array($err)) {
            unset($err['curl_error']);
            unset($err['info']);
            unset($err['errno']);
            unset($err['error']);
        }

        $displayErr = $this->extractDisplayError($err , $type , $method , $sourceCode);
        if (!$displayErr) {
            $this->insertNewError($err , $type , $method , $sourceCode);
            return '';
        }

        return $displayErr;

    }


//    function extractDisplayError($err , $type , $method , $sourceCode) {
//
//        $allErr = $this->listErrors($type , $method , $sourceCode);
//
//        foreach ($allErr as $err0) {
//
//            $compare = $this->compareJsonErr(json_decode($err0['providerError'] , true) , $err);
//
//            if ($compare) {
//                return $err0;
//            }
//        }
//
//        return false;
//
//    }

    public function extractDisplayError($err, $type, $method, $sourceCode)
    {
        $text = $this->extractErrorText($err);

        if ($text === '') {
            return false;
        }

        $allErr = $this->listErrors($type, $method, $sourceCode);

        $bestMatch = false;
        $bestPercent = 0;

        foreach ($allErr as $storedError) {
            $storedText = $this->extractErrorText(
                $storedError['providerError']
            );

            if ($storedText === '') {
                continue;
            }

            $percent = $this->similarPercent($storedText, $text);

            if ($percent >= 70 && $percent > $bestPercent) {
                $bestPercent = $percent;
                $bestMatch = $storedError;
            }
        }

        return $bestMatch;
    }

    public function extractErrorText($data)
    {
        // پشتیبانی از JSON ذخیره‌شده و پیام متنی ساده
        if (is_string($data)) {
            $decoded = json_decode($data, true);

            if (json_last_error() === JSON_ERROR_NONE) {
                $data = $decoded;
            }
        }

        $texts = [];
        $this->collectErrorTexts($data, $texts);

        $texts = array_values(array_unique($texts));
        sort($texts, SORT_STRING);

        return implode("\n", $texts);
    }

    private function collectErrorTexts($data, &$texts)
    {
        if (is_string($data)) {
            // پشتیبانی از JSON داخل فیلدهای پاسخ
            $decoded = json_decode($data, true);

            if (
                json_last_error() === JSON_ERROR_NONE
                && (is_array($decoded) || is_string($decoded))
                && $decoded !== $data
            ) {
                $this->collectErrorTexts($decoded, $texts);
                return;
            }

            $text = preg_replace('/\s+/u', ' ', trim($data));

            if ($text === null || $text === '') {
                return;
            }

            // مقادیر ساده و شناسه‌ها وارد مقایسه نشوند
            if (
                is_numeric($text)
                || in_array(
                    strtolower($text),
                    ['true', 'false', 'null', 'success', 'no err'],
                    true
                )
                || preg_match(
                    '/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i',
                    $text
                )
                || preg_match(
                    '/^\d{4}-\d{2}-\d{2}(?:[T ].*)?$/',
                    $text
                )
            ) {
                return;
            }

            $texts[] = $text;
            return;
        }

        if (!is_array($data)) {
            return;
        }

        // فقط این فیلدها حذف می‌شوند؛ سایر ساختارها عمومی بررسی می‌شوند
        $ignoredKeys = [
            'curlerror', 'info', 'errno',
            'traceid', 'sessionid', 'bookid',
            'requestid', 'correlationid', 'transactionid',
            'token', 'accesstoken', 'refreshtoken',
            'executiontime', 'currenttime',
            'url', 'headers',
        ];

        foreach ($data as $key => $value) {
            $normalizedKey = strtolower(
                preg_replace('/[^a-z0-9]/i', '', (string) $key)
            );

            if (in_array($normalizedKey, $ignoredKeys, true)) {
                continue;
            }

            $this->collectErrorTexts($value, $texts);
        }
    }

    function insertNewError($err , $type , $method , $sourceCode) {
        $errorModel = $this->getModel('errorModel');
        $insertErr = $errorModel->insertWithBind([
            'providerError'     => json_encode($err),
            'creation_date_int'        => time(),
            'type'     => $type,
            'method'     => $method,
            'sourceCode'         => $sourceCode,
        ]);
    }
    public function insertNewErrorWithManual($data)
    {
        $error_model = $this->getModel('errorModel');

        $data_insert['displayAgency'] = $data['displayAgency'];
        $data_insert['displayPassenger'] = $data['displayPassenger'];
        $data_insert['displayAdmin'] = $data['displayAdmin'];
        $data_insert['providerError'] = $data['providerError'];
        $data_insert['sourceCode'] = $data['sourceCode'] ?? 'SYSTEM_ERROR';
        $data_insert['type'] = $data['typeLog'] ?? 'flight';
        $data_insert['method'] = $data['methodData'];
        $data_insert['creation_date_int'] = time();

        $update_result = $error_model->insertWithBind($data_insert);

        if ($update_result) {
            return functions::JsonSuccess($update_result, [
                'message' => 'با موفقیت ثبت شد',
            ], 200);
        }
        return functions::JsonError($update_result, [
            'message' => 'خطا در ثبت ارور ',
        ], 200);
    }

    function compareJsonErr($a, $b, $threshold = 70)
    {
        // مقایسه دو رشته
        if (is_string($a) && is_string($b)) {
            return $this->similarPercent($a, $b) >= $threshold;
        }

        if (!is_array($a) || !is_array($b)) {
            return false;
        }

        $this->normalizeArray($a);
        $this->normalizeArray($b);

        // مقایسه دقیق
        if (serialize($a) === serialize($b)) {
            return true;
        }

        // مقایسه درصدی
        $flatA = $this->flattenArray($a);
        $flatB = $this->flattenArray($b);

        $allKeys = array_unique(array_merge(array_keys($flatA), array_keys($flatB)));

        if (empty($allKeys)) {
            return false;
        }

        $matchScore = 0;
        $totalKeys = count($allKeys);

        foreach ($allKeys as $key) {
            if (!isset($flatA[$key]) || !isset($flatB[$key])) {
                continue;
            }

            $valA = (string)$flatA[$key];
            $valB = (string)$flatB[$key];

            if ($valA === $valB) {
                $matchScore += 1;
            } else {
                $matchScore += $this->similarPercent($valA, $valB) / 100;
            }
        }

        $percent = ($matchScore / $totalKeys) * 100;

        return $percent >= $threshold;
    }

    function similarPercent($strA, $strB)
    {
        $percent = 0;
        similar_text((string)$strA, (string)$strB, $percent);
        return $percent;
    }

    function flattenArray($array, $prefix = '')
    {
        $result = [];
        foreach ($array as $key => $value) {
            $newKey = $prefix === '' ? $key : $prefix . '.' . $key;
            if (is_array($value)) {
                $result = array_merge($result, $this->flattenArray($value, $newKey));
            } else {
                $result[$newKey] = $value;
            }
        }
        return $result;
    }

    function normalizeArray(&$array)
    {
        // تشخیص associative array
        $keys = array_keys($array);
        $isAssoc = $keys !== range(0, count($keys) - 1);

        if ($isAssoc) {
            ksort($array);
        }

        foreach ($array as &$value) {
            if (is_array($value)) {
                $this->normalizeArray($value);
            }
        }
    }

}