<?php

//
//error_reporting(1);
//        error_reporting(E_ALL | E_STRICT);
//        @ini_set('display_errors', 1);
//        @ini_set('display_errors', 'on');


class bookExclusiveTour extends exclusiveTour
{

    protected $reportModel;
    protected $bookModel;
    protected $flightDirectionOK;
    protected $smsService;
    protected $transaction;
    protected $paymentDate;
    protected $discountCodes;
    protected $members;
    protected $tracking_code;

    /**
     * bookTicketFlight constructor.
     */
    public function __construct() {
        parent::__construct();
        $this->bookModel = $this->bookLocalModel();
        $this->reportModel = $this->reportModel();
        $this->smsService = $this->smsService();
        $this->transaction = $this->transaction();
        $this->discountCodes = $this->discountCodes();
        $this->members = $this->members();
    }

    /**
     * @return bookLocalModel|bool
     */
    protected function bookLocalModel() {
        return Load::getModel('exclusiveTourModel');
    }

    /**
     * @return reportModel|bool
     */
    protected function reportModel() {
        return Load::getModel('exclusiveTourBaseModel');
    }

    /**
     * @return smsServices|bool
     */
    protected function smsService() {
        return Load::controller('smsServices');
    }

    /**
     * @return transaction|bool
     */
    protected function transaction() {
        return Load::controller('transaction');
    }

    /**
     * @return discountCodes|bool
     */
    protected function discountCodes() {
        return Load::controller('discountCodes');
    }

    /**
     * @return members|bool
     */
    protected function members() {
        return Load::controller('members');
    }

    /**
     * @param $dataBooked
     * @return boolean
     */
    public function book($dataBooked) {

        functions::insertLog('params==>' . json_encode($dataBooked, 256), 'newBookExclusiveTour');

        $factorNumber = $dataBooked['factorNumber'];
        $payType = $dataBooked['paymentType'];

        $this->updatePaymentWayBook($factorNumber, $payType);

        if ($payType != 'credit') {
            $this->updateInfoBankBookFlight($dataBooked['trackingCode']);
            $this->tracking_code = $dataBooked['trackingCode'] ;
        }

        $info = $this->bookModel->get(['*'])
            ->where('factor_number', $factorNumber)
            ->limit(0, 1)
            ->find();


        $resultBook = false;

            functions::insertLog('in foreach==>' . json_encode([$info['factor_number'], $info['successfull']], 256), 'newBookExclusiveTour');
            if ($info['successfull'] !== "book" && $info['successfull'] !== "error") {
                functions::insertLog('before updateStatusProcessing==>' . json_encode([$info['factor_number'], $resultBook], 256), 'newBookExclusiveTour');
                $this->updateStatusProcessing($info['factor_number']);

                    try {
                        $startTime = time();
                        $maxTime = 70;
                        set_time_limit($maxTime + 5);

                        $resultBook = $this->reserveTicket($payType, $info);

                        $elapsed = time() - $startTime;
                        if ($elapsed > $maxTime) {
                            return functions::withSuccess('pending', 408, 'Tickets require more time to be issued');
                        }

                    }
                    catch (Exception $e) {
                        return functions::withError('', 500, 'Error when booking a flight');
                    }


                    functions::insertLog('after reserveTicket==>' . json_encode([$info['factor_number'], $resultBook], 256), 'newBookExclusiveTour');

                functions::insertLog('**************************************', 'newBookExclusiveTour');

            }
            else {
                return functions::withError('', 403, 'تور قبلا به نتیجه رسیده است');
            }

        if ($resultBook) {
            return functions::withSuccess($resultBook, 200, 'تور با موفقیت صادر شد');
        }
        return functions::withError('failed', 400, 'tour booking encountered an error.');

    }

    //region bookPrivateSourceFiveOfSourceSeven

    /**
     * @param $factorNumber
     * @param $payType
     */
    private function updatePaymentWayBook($factorNumber, $payType) {
        $data['payment_date'] = Date('Y-m-d H:i:s');
        $data['payment_type'] = ($payType == 'credit') ? 'credit' : 'cash';
        $condition = "factor_number='{$factorNumber}'";
        $this->bookModel->updateWithBind($data, $condition);
        $this->reportModel->updateWithBind($data, $condition);
    }
    //endregion

    #region checkForeSourceFive

    private function updateInfoBankBookFlight($data) {
        $condition = " factor_number='" . $data['trackingCode'] . "' AND successfull = 'bank' ";
        $dataUpdate = array(
            'tracking_code_bank' => $data['trackingCode'],
            'payment_date' => Date('Y-m-d H:i:s')
        );
        $this->bookModel->updateWithBind($dataUpdate, $condition);
    }
#endregion

    private function updateStatusProcessing($factorNumber) {
        $data['successfull'] = 'processing';
        $condition = "factor_number='{$factorNumber}' AND successfull != 'pending' AND (successfull !='book' AND successfull !='private_reserve') ";
        $this->bookModel->updateWithBind($data, $condition);
        $this->reportModel->updateWithBind($data, $condition);
    }

    public function checkForSourceFive($param) {
        /** @var airline $airlineController */
        $airlineController = Load::controller('airline');
        $dataCheckConfigAirline['flightType'] = $param['flight_type'];
        $dataCheckConfigAirline['airline'] = $param['airline_iata'];
        $dataCheckConfigAirline['isInternal'] = ($param['IsInternal'] == '1') ? 'isInternal' : 'External';
        $dataCheckConfigAirline['sourceId'] = $param['sourceId'];
        $dataCheckConfigAirline['info'] = 'completed';

        return $airlineController->checkSourceAirline($dataCheckConfigAirline);
    }
    
    private function updateInfo($payType, $eachDirection, $ReserveTicket = array()) {


        if ($payType != 'credit') {
            // Caution: آپدیت تراکنش به موفق
            $this->transaction->setCreditToSuccess($eachDirection['factor_number'], $eachDirection['tracking_code_bank']);
        }

                $this->members->memberCreditConfirm($eachDirection['factor_number'], $this->tracking_code);

                //email to buyer
                $this->sendSmsToClient($eachDirection);


        return true;
    }

    /**
     *
     */
    private function sendSmsLowChargeClient() {

        $accountchargeController = $this->getcontroller('transaction')->getCredit();
        if ($accountchargeController < 10000000) {
            //sms to site manager
            $objSms = $this->smsService->initService('1');
            if ($objSms) {
                $sms = "مدیریت محترم آژانس" . " " . CLIENT_NAME . PHP_EOL . " شارژ حساب کاربری شما در نرم افزار سفر 360 به کمتر از 10,000,000 ریال رسیده است";
                $smsArray = array(
                    'smsMessage' => $sms,
                    'cellNumber' => CLIENT_MOBILE
                );
                $this->smsService->sendSMS($smsArray);
            }
        }
    }
    /**
     *
     */

    /**
     * @param $eachDirection
     */
    private function sendSmsWarningToMangerIrantech($eachDirection) {
        $objSms = $this->smsService->initService('1');
        if ($objSms) {
            $ServerName = functions::TitleSource($eachDirection['api_id']);
            $date = dateTimeSetting::jdate("Y-F-d", functions::ConvertToDateJalaliInt($eachDirection['date_flight']));
            $sms = "{$ServerName} -" . CLIENT_NAME . "-{$eachDirection['airline_name']}-{$date}";
            $cellArray = array(
                'afshar' => '09123493154',

            );
            foreach ($cellArray as $cellNumber) {
                $smsArray = array(
                    'smsMessage' => $sms,
                    'cellNumber' => $cellNumber
                );
                $this->smsService->sendSMS($smsArray);
            }
        }
    }

    /**
     * @param $data
     */

    /**
     * @param $eachDirection
     * @return mixed
     */
    private function sendSmsToClient($eachDirection) {
//sms to buyer
        $objSms = $this->smsService->initService('0');
        if ($objSms) {
            //to member
            $messageVariables = array(
                'sms_name' => $eachDirection['member_name'],
                'sms_service' => 'بلیط',
                'sms_factor_number' => $eachDirection['request_number'],
                'sms_origin' => $eachDirection['origin_city'],
                'sms_destination' => $eachDirection['desti_city'],
                'sms_flight_date' => $eachDirection['date_flight'],
                'sms_flight_time' => $eachDirection['time_flight'],
                'sms_agency' => CLIENT_NAME,
                'sms_agency_mobile' => CLIENT_MOBILE,
                'sms_agency_phone' => CLIENT_PHONE,
                'sms_agency_email' => CLIENT_EMAIL,
                'sms_agency_address' => CLIENT_ADDRESS
            );
            $smsArray = array(
                'smsMessage' => $this->smsService->getUsableMessage('afterTicketReserve', $messageVariables),
                'cellNumber' => $eachDirection['member_mobile'],
                'smsMessageTitle' => 'afterTicketReserve',
                'memberID' => (!empty($eachDirection['member_id']) ? $eachDirection['member_id'] : ''),
                'receiverName' => $messageVariables['sms_name'],
            );
            $this->smsService->sendSMS($smsArray);

            //to manager
            $smsArray = array(
                'smsMessage' => $this->smsService->getUsableMessage('afterReserveToManager', $messageVariables),
                'cellNumber' => CLIENT_MOBILE,
                'smsMessageTitle' => 'afterReserveToManager',
                'memberID' => (!empty($eachDirection['member_id']) ? $eachDirection['member_id'] : ''),
                'receiverName' => 'مدیر سایت',
            );
            $this->smsService->sendSMS($smsArray);

            //to first passenger
            $messageVariables['sms_name'] = $eachDirection['passenger_name'] . ' ' . $eachDirection['passenger_family'];
            $smsArray = array(
                'smsMessage' => $this->smsService->getUsableMessage('afterTicketReserve', $messageVariables),
                'cellNumber' => $eachDirection['mobile_buyer'],
                'smsMessageTitle' => 'afterTicketReserve',
                'memberID' => (!empty($eachDirection['member_id']) ? $eachDirection['member_id'] : ''),
                'receiverName' => $messageVariables['sms_name'],
            );
            $this->smsService->sendSMS($smsArray);
        }
    }

    /**
     * @param $payType
     * @param $eachDirection
     * @return boolean
     */
    private function reserveTicket($payType, $eachDirection) {


        $resultBookedFlight = false;
        functions::insertLog('first reserve ticket==>' . json_encode([$eachDirection['factor_number']], 256), 'newBookExclusiveTour');

        $ReserveTicket = parent::Book($eachDirection);

        functions::insertLog('after reserve ticket==>' . json_encode([$eachDirection['factor_number']], 256), 'newBookExclusiveTour');

        if (!empty($ReserveTicket) && $ReserveTicket['curl_error'] == false && !empty($ReserveTicket['Pnr'])) {
                functions::insertLog('before updateInfo==>' . json_encode([$eachDirection['factor_number'], $ReserveTicket], 256), 'newBookExclusiveTour');
                $resultBookedFlight = $this->updateInfo($payType, $eachDirection, $ReserveTicket);

                functions::insertLog('after updateInfo==>' . json_encode([$eachDirection['factor_number'], $resultBookedFlight], 256), 'newBookExclusiveTour');
        }
        else {
            if ($payType == 'credit') {
                if ($eachDirection['successfull'] != 'book') {
                        $this->transaction->pendingTransactionCurrent($eachDirection['factor_number']);
                    $this->transaction->deleteCreditAgencyCurrent($eachDirection['request_number']);
                }
            }
        }
        return $resultBookedFlight;
    }

    public function getItem($reqNum) {
        return $this->bookModel->getOneByReq($reqNum);
    }



    public function createPdfContent($factorNumber, $cash, $cancelStatus)
    {


        $Model = Load::library('Model');
        $tableName = 'book_exclusive_tour_tb';
        $info_hotel = $this->getModel('exclusiveTourModel')->get()->where('factor_number',$factorNumber);
        if (TYPE_ADMIN == '1') {
            $Model = Load::library('ModelBase');
            $tableName = 'report_exclusive_tour_tb';
            $info_hotel = $this->getModel('exclusiveTourBaseModel')->get()->where('factor_number',$factorNumber);
        }

        if (isset($cancelStatus) && $cancelStatus != '') {
            $info_hotel = $info_hotel->where('status','canceled');
        }
        $info_hotel = $info_hotel->all();

        if (empty($info_hotel)) {
            return '<div style="text-align:center; font-size:20px; font-family: yekanbakh;">The requested information is not available.</div>';
        }

        // شروع HTML
        $html = '<!DOCTYPE html>
<html dir="rtl" lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>بیلط (پرواز + هتل)</title>
    <style>


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "yekanbakh" !important;
            direction:rtl !important;
            text-align:left !important;
        }

        body {
            font-family: "yekanbakh" !important;
            font-size: 12px;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
            margin-bottom: 40mm;
              direction:rtl !important;
            text-align:left !important;
        }

        .container {
//            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
           
        }

        /* Header */
        .header {
            width: 100%;
            margin-bottom: 20px;
            border-bottom: 2px solid #ccc;
            padding-bottom: 15px;
        }

        .header table {
            width: 100%;
            border: none;
            margin: 0;
        }

        .header table td {
            border: none;
            padding: 0;
            vertical-align: middle;
        }

        .header-logo {
            width: 50%;
            text-align: left;
            width:50% !important;
        }

        .header-logo img {
            max-width: 80px;
            min-height: 50px;
        }

        .header-barcode {
            width: 50%;
            text-align: right;
           width:50% !important;

        }

        .header-voucher {
            display: table-cell;
            width: 150px;
            vertical-align: middle;
            text-align: left;
        }

        .voucher-badge {
            background: #f44336;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            display: inline-block;
        }

        /* Hotel Info Section */
        .hotel-info-section {
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            padding: 2px;
            margin: 20px !important;
        }

        .hotel-header {
            display: table;
            width: 100%;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .hotel-icon {
            display: table-cell;
            width: 35px;
            text-align: center;
            vertical-align: middle;
            padding-left: 5px;
        }

        .hotel-name {
            display: table-cell;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            vertical-align: middle;
            padding: 0 10px;
        }

        .hotel-stars {
            display: table-cell;
            color: #ffa726 !important;
            font-size: 18px;
            vertical-align: middle;
            text-align: left;
        }

        .info-grid {
            display: table;
            width: 100%;
        }

        .info-row {
            display: table-row;
        }

        .info-cell {
            display: table-cell;
            padding: 8px 10px;
            vertical-align: top;
            width: 50%;
        }

        .info-label {
            color: #666;
            font-size: 11px;
            margin-bottom: 3px;
        }

        .info-value {
            font-weight: bold;
            color: #333;
            font-size: 13px;
        }

        /* Booking Details */
        .booking-details {
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 14px;
            font-weight: bold;
            color: #1976d2;
            margin-bottom: 12px;
            padding-bottom: 8px;
            border-bottom: 1px solid #ccc;
        }

        .detail-row {
            display: table;
            width: 100%;
            padding: 8px 0;
            border-bottom: 1px dashed #ccc;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            display: table-cell;
            width: 120px;
            color: #666;
            font-size: 11px;
            vertical-align: top;
        }

        .detail-value {
            display: table-cell;
            font-weight: bold;
            color: #333;
            font-size: 12px;
            vertical-align: top;
        }

        /* Guest Info */
        .guest-info {
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .guest-info .section-title {
            color: #7b1fa2;
            border-bottom-color: #ccc;
        }

        .guest-card {
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 12px;
            margin-bottom: 10px;
        }

        .guest-card:last-child {
            margin-bottom: 0;
        }

        .guest-number {
            background: #9c27b0;
            color: white;
            display: inline-block;
            padding: 3px 10px;
            border-radius: 3px;
            font-size: 11px;
            margin-bottom: 8px;
        }

        /* Important Notes */
        .important-notes {
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin:20px !important;
            margin-bottom: 20px;
        }

        .important-notes .section-title {
            color: #c62828;
            border-bottom-color: #ccc;
        }

        .note-item {
            padding: 8px 0 8px 20px;
            position: relative;
            color: #555;
            font-size: 11px;
            line-height: 1.8;
        }

        .note-item:before {
            content: "•";
            position: absolute;
            left: 0;
            color: #f44336;
            font-weight: bold;
            font-size: 14px;
        }

        /* Cancellation Rules */
        .cancellation-rules {
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            text-align:left !important;
        }

        .cancellation-rules .section-title {
            color: #f57f17;
            border-bottom-color: #ccc;
        }

        /* Map Section */
        .map-section {
            background: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            margin: 20px;
            page-break-inside: avoid;
        }

        .map-section .section-title {
            color: #000;
            border-bottom-color: #ccc;
        }

        .map-container {
            width: 100%;
            border-radius: 5px;
            overflow: hidden;
            margin-top: 10px;
        }

        .map-container img {
            width: 100%;
            height: auto;
        }

        /* Footer */
        .footer {
            width: 100%;
            padding: 10px 0;
            text-align: center;
            border-top: 2px solid #ccc;
            position: fixed;
            bottom: -20mm;
            left: 0;
            right: 0;
            background: white;
        }

        .footer-info {
            width: 100%;
            border: none;
        }

        .footer-item {
            padding: 5px 15px;
            font-size: 16px;
            color: #666;
            text-align: center;
            border: none;
        }

        .footer-label {
            font-weight: bold;
            color: #333;
        }
     @page {
            footer: myFooter;
            margin-bottom: 25mm;
        }

        .footer-table {
            width: 100%;
            font-size: 10pt;
            padding-top: 5px;
            font-family: yekanbakh;
        }
        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        th {
            background: #fff;
            font-weight: bold;
            color: #333;
        }

        /* Utilities */
        .text-center {
            text-align: center;
        }

        .text-bold {
            font-weight: bold;
        }

        .text-red {
            color: #f44336;
        }

        .text-green {
            color: #4caf50;
        }

        .mb-10 {
            margin-bottom: 10px;
        }

        .mb-20 {
            margin-bottom: 20px;
        }

        @media print {
            body {
                background: #fff;
            }

            .container {
                margin: 0;
                box-shadow: none;
            }
        }
        .barcode {
            max-width: 80px;
            min-height: 50px;
            display: inline-block;
        }
    </style>
</head>
<body style="text-align:left; font-family: yekanbakh;">
    ';
        $firstInfo = $info_hotel[0];
        $subAgencyInfo = $this->getController('agency');
        $getSubAgencyInfo = $subAgencyInfo->AgencyInfoByIdMember($firstInfo['member_id']);

        // Header با لوگو و بارکد
        $html .= '

              <div class="container">
                          <div style="width:50%; float: right;text-align:right;">
                            <img src="' . ROOT_ADDRESS_WITHOUT_LANG . '/pic/' . CLIENT_LOGO . '" alt="Logo" height="80" style="vertical-align: middle;">   
                              <span style="display: inline-block; vertical-align: middle; padding-left: 10px;"> ' .
               $getSubAgencyInfo['name_fa']. '
            </span>                        
                        </div>
                        <div style="text-align:left;width:50%;float: left;padding-top:1%">  <img src="https://safar360.com/gds/library/barcode/barcode_creator.php?barcode=' . trim($info_hotel[0]["pnr"]) . '" alt="Barcode"  style="width: 80px" height="50px"></div>
                </div>

       ';

        // اطلاعات اصلی برای استفاده در بخش‌های مختلف


        if (!empty($firstInfo['payment_date'])) {
            $pd = functions::set_date_payment($firstInfo['payment_date']);
            $pd = explode(' ', $pd)[0]; // فقط تاریخ
            $p = explode('-', $pd);
            $pay_date = "{$p[0]}/{$p[1]}/{$p[2]}";
        } else {
            $pay_date = '-';
        }

        // بخش اطلاعات هتل
        $html .= '
        <div class="hotel-info-section">
                <table cellpadding="0" cellspacing="0" style="width: 100%; border-collapse: collapse; font-family: yekanbakh;">
                <tr style="">
                    <td style="width:28%;color: #333;vertical-align: middle;float: right;text-algin:right; border: none; padding:0 0 15px 10px; font-family: yekanbakh;">
                     <svg height="24px" width="24px" fill="#ff9800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M24 0C10.7 0 0 10.7 0 24S10.7 48 24 48h8V464H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H488c13.3 0 24-10.7 24-24s-10.7-24-24-24h-8V48h8c13.3 0 24-10.7 24-24s-10.7-24-24-24H24zM432 48V464H304V384h32c8.8 0 16.1-7.2 14.7-15.9C343.1 322.6 303.6 288 256 288s-87.1 34.6-94.7 80.1c-1.5 8.7 5.8 15.9 14.7 15.9h32v80H80V48H432zM144 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H144zm80 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H240c-8.8 0-16 7.2-16 16zM336 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H336zM128 208v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H144c-8.8 0-16 7.2-16 16zm112-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H240zm80 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/></svg>
                    <span style="font-size: 18px;vertical-align: middle;color: #333;font-family: yekanbakh;"> ' . $firstInfo['hotel_name'] . '</span>
                    </td>
                   
                </tr> 
                ';

//        // اضافه کردن آدرس و تلفن در row جدید (زیر آیکون هتل)
//        if (!empty($firstInfo[''])) {
//            $html .= '<tr>
//                    <td colspan="3" style="padding: 5px 5px 5px 0; font-size: 11px; color: #666; border: none; vertical-align: top; text-align: left; font-family: yekanbakh;">';
//
//            if (!empty($firstInfo['hotel_address'])) {
//                $html .= '<div style="margin-bottom: 8px; padding-bottom: 8px;font-family: yekanbakh;">
//
//                    <span style="vertical-align: middle; font-family: yekanbakh;">Address: ' . $firstInfo['hotel_address'] . '</span>
//                </div>';
//            }
//
//            $html .= '</td>
//                </tr>
//                <tr>
//                    <td colspan="3" style="border: none; padding: 0; height: 12px;"></td>
//                </tr>';
//        }


        // محاسبه شماره واچر


        $voucherNumber = $firstInfo['provider_ref'];

        if (!empty($firstInfo['payment_date'])) {

            $pd = $firstInfo['payment_date']; // مقدار: 2025-10-21 08:20:23

            // جدا کردن تاریخ و ساعت
            list($datePart, $timePart) = explode(' ', $pd);

            // تبدیل تاریخ از - به /
            $p = explode('-', $datePart);

            $pay_date = dateTimeSetting::gregorian_to_jalali($p[0],$p[1],$p[2],'-');

            $pay_time = $timePart;

        } else {
            $pay_date = '-';
            $pay_time = '-';
        }

        $html .= '

                <tr>
                        <td colspan="3" style="border-top: 2px solid #ccc; border-left: none; border-right: none; border-bottom: none;  padding: -10px 30px -24px 0px; font-family: yekanbakh;">
                        <table cellpadding="0" cellspacing="0" style="width: 100%; border: none; border-collapse: collapse; font-family: yekanbakh;">
                            <tr>
                                 <td style="border: none; vertical-align: top; font-family: yekanbakh;padding-right:-30%;">
                                    <table cellpadding="0" cellspacing="0" style="width: 100%; border: none; border-collapse: collapse; font-family: yekanbakh;margin-top:-6px;margin-bottom:-20px !important;">
                                      
                                        <tr>
                                            <td style="border: none; padding: 2px 0;font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">تاریخ ورود:</td>
                                            <td style="border: none;"></td>
                                            <td style="border: none; padding: 2px 0px; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">'. (!empty($firstInfo['check_in']) ? $firstInfo['check_in'] : '-')  .  '</td>
                                        </tr>
                                        <tr>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">تاریخ خروج: </td>
                                             <td style="border: none;"></td>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">'. (!empty($firstInfo['check_out']) ? $firstInfo['check_out'] : '-') .'</td>
                                        </tr>
                                        <tr>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">تعداد اتاق: </td>
                                            <td style="border: none;"></td>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">' . (!empty($firstInfo) ? '1' : '0')  . ' اتاق </td>  
                                        </tr> <tr>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">کد بلیط هواپیما: </td>
                                           <td style="border: none;"></td>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">' . $voucherNumber  . '</td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 1px; border-left: 2px solid #ccc; border-top: none; border-bottom: none; border-right: none; padding: 0; font-family: yekanbakh;"></td>
                                <td style="width: 10px; border: none; padding: 0; font-family: yekanbakh;">&nbsp;</td>
                                <td style="border: none; vertical-align: top; font-family: yekanbakh;padding-right:-31%;">
                                    <table cellpadding="0" cellspacing="0" style="width: 100%; border: none; border-collapse: collapse; font-family: yekanbakh;margin-top:-6px;margin-bottom:-20px !important;">
                                      
                                        <tr>
                                            <td style="border: none; padding: 2px 7px; font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">شماره فاکتور:</td>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">' . $firstInfo['factor_number'] . '</td>
                                        </tr>
                                        <tr>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">تاریخ رزرو: </td>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">' . ($pay_date !== '-' ? $pay_date : '-'). '</td>
                                        </tr>
                                        <tr>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #333; font-weight: bold; line-height: 1.4; font-family: yekanbakh;">ساعت رزرو: </td>
                                            <td style="border: none; padding: 2px 0; font-size: 11px; color: #666; line-height: 1.4; font-family: yekanbakh;">' . ($pay_time !== '-' ? $pay_time : '-') . '</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            ';



        $html .= '

                        </div>
                   ';

        // اگر کنسل شده
        if ($firstInfo['request_cancel'] == 'confirm') {
            $html .= '<div style="background: #fff; border: 2px solid #ccc; padding: 15px; border-radius: 5px; margin-bottom: 20px; text-align: center; font-family: yekanbakh;">
                <span style="font-weight: bold; color: #c62828; font-size: 16px; font-family: yekanbakh;"> این  پرواز + هتل کنسل شده است</span>
            </div>';
        }



        // باکس اطلاعات اتاق‌ها
        $html .= '
        <div style="background: #fff; border-radius: 8px; overflow: hidden; margin: 20px; border: 2px solid #ddd; font-family: yekanbakh;">
            <div style="text-align:right !important;background: #d5dddd; color: #333; padding: 12px; font-weight: bold; font-size: 14px; font-family: yekanbakh;">
                اطلاعات اتاق ها
            </div>
            <div style="padding: 15px; font-family: yekanbakh; overflow-x: auto;">
                <table style="width: 100%; border-collapse: collapse; font-family: yekanbakh;">
                    <thead>
                        <tr style="background: #d5dddd; border-bottom: 2px solid #ddd;">
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">#</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">تعدا تخت (تخت اضافه)</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">نوع</th>
                        </tr>
                    </thead>
                    <tbody>';

        $roomCounter = 1;
        $room_info = json_decode($info_hotel[0]['room_info'] , true);

        foreach ($room_info as $info) {
            // تعداد تخت اضافه یا نوع تخت
            $bedInfo = '';
            if ($info['type_application'] == 'reservation') {
                $flatType = '';
                if ($info['flat_type'] == 'DBL') {
                    $flatType = 'تخت اصلی';
                } elseif ($info['flat_type'] == 'EXT') {
                    $flatType = 'تخت اضافه بزرگسال';
                } elseif ($info['flat_type'] == 'ECHD') {
                    $flatType = 'تخت اضافه کودک';
                }
                $bedInfo = $flatType != '' ? $flatType : '-';
            } else {
                $bedInfo = ' Number of extra beds: ' . (!empty($info['extra_bed_count']) ? $info['extra_bed_count'] : '0');
            }

            $adt = $info['Adults'] ? $info['Adults'] . ' بزرگسال ' : '';
            $chd = $info['Children'] ? $info['Children'] . ' کودک ' : '';

            $html .= '
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . $roomCounter . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333; font-weight: bold;">' . (!empty($info['name']) ? $info['name'] . ' ' .  $adt .' '. $chd . ' ('. $info['Extrabed'].' تخت )' : '-') . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info['Type']) ? $info['Type'] : '-') . '</td>
                        </tr>';

            $roomCounter++;
        }

        $html .= '
                    </tbody>
                </table>
            </div>
        </div>';

        // باکس اطلاعات مسافرین
        $html .= '
        <div style="background: #fff; border-radius: 8px;text-align: right; overflow: hidden; margin: 20px; border: 2px solid #ddd; font-family: yekanbakh;">
            <div style="background: #d5dddd; color: #333; padding: 12px; font-weight: bold; font-size: 14px; font-family: yekanbakh;">
                اطلاعات مسافران
            </div>
            <div style="padding: 15px; font-family: yekanbakh; overflow-x: auto;">
                <table style="width: 100%; border-collapse: collapse; font-family: yekanbakh;">
                    <thead>
                        <tr style="background: #f5f5f5; border-bottom: 2px solid #ddd;">
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">#</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">نام و نام خانوادگی</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">تاریخ تولد</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">کدملی/پاسپورت</th>
                        </tr>
                    </thead>
                    <tbody>';

        $passengerNum = 1;
        foreach ($info_hotel as $passenger) {
            // نام و نام خانوادگی
            $fullName = '';
            if (!empty($passenger['passenger_name'])) {
                $fullName = $passenger['passenger_name'] . ' ' . $passenger['passenger_family'];
            }elseif(!empty($passenger['passenger_family'])) {
                $fullName = $passenger['passenger_name'] . ' ' . $passenger['passenger_family'];

            }else {
                $fullName = '-';
            }

            // تاریخ تولد
            $birthday = '';
            if (!empty($passenger['passenger_birthday'])) {
                $birthday = $passenger['passenger_birthday'];
            } elseif (!empty($passenger['passenger_birthday_en'])) {
                $birthday = $passenger['passenger_birthday_en'];
            } else {
                $birthday = '-';
            }

            // شماره ملی/پاسپورت
            $nationalCode = '';
            if ($passenger['passenger_national_code'] != '') {
                $nationalCode = $passenger['passenger_national_code'];
            } elseif (!empty($passenger['passportNumber'])) {
                $nationalCode = $passenger['passportNumber'];
            } else {
                $nationalCode = '-';
            }

            $html .= '
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . $passengerNum . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333; font-weight: bold;">' . $fullName . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . $birthday . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . $nationalCode . '</td>
                        </tr>';

            $passengerNum++;
        }

        $html .= '
                    </tbody>
                </table>
            </div>
        </div>';


        // باکس اطلاعات پرواز
        $html .= '
        <div style="background: #fff; border-radius: 8px;text-align: right; overflow: hidden; margin: 20px; border: 2px solid #ddd; font-family: yekanbakh;">
            <div style="background: #d5dddd; color: #333; padding: 12px; font-weight: bold; font-size: 14px; font-family: yekanbakh;">
                اطلاعات پرواز
            </div>
            <div style="padding: 15px; font-family: yekanbakh; overflow-x: auto;">
                <table style="width: 100%; border-collapse: collapse; font-family: yekanbakh;">
                    <thead>
                        <tr style="background: #f5f5f5; border-bottom: 2px solid #ddd;">
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">#</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">مبدا</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">مقصد</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">تاریخ و ساعت</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">شماره پرواز</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">نام ایرلاین</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">کلاس نرخی</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">یاتا</th>
                        </tr>
                    </thead>
                    <tbody>';

            $html .= '
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">رفت</td>
                               <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($firstInfo['origin_city']) ? $firstInfo['origin_city'] : '-') .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333; font-weight: bold;">' . (!empty($info_hotel[0]['desti_city']) ? $info_hotel[0]['desti_city'] : '-' ). '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['date_flight'] || $info_hotel[0]['time_flight']) ? $info_hotel[0]['date_flight']. ' ' . $info_hotel[0]['time_flight'] : '-') .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['flight_number']) ? $info_hotel[0]['flight_number'] : '-')   .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['airline_name']) ? $info_hotel[0]['airline_name'] : '-').'</td>
                            <td style="padding: 12px; text-align: right; direction:ltr; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($info_hotel[0]['seat_class']) ? $info_hotel[0]['seat_class'] : '-')  .'</td>
                            <td style="padding: 12px; text-align: right;direction:ltr; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($info_hotel[0]['airline_iata']) ? $info_hotel[0]['airline_iata'] : '-')   .'</td>
                        </tr>
                            <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">برگشت</td>
                                                        <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333; font-weight: bold;">' . (!empty($info_hotel[0]['desti_city']) ? $info_hotel[0]['desti_city'] : '-' ). '</td>
                               <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($firstInfo['origin_city']) ? $firstInfo['origin_city'] : '-') .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['ret_date_flight'] || $info_hotel[0]['ret_time_flight']) ? $info_hotel[0]['ret_date_flight']. ' ' . $info_hotel[0]['ret_time_flight'] : '-') .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['ret_flight_number']) ? $info_hotel[0]['ret_flight_number'] : '-')   .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['ret_airline_name']) ? $info_hotel[0]['ret_airline_name'] : '-').'</td>
                            <td style="padding: 12px; text-align: right; direction:ltr; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($info_hotel[0]['ret_seat_class']) ? $info_hotel[0]['ret_seat_class'] : '-')  .'</td>
                            <td style="padding: 12px; text-align: right;direction:ltr; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($info_hotel[0]['ret_airline_iata']) ? $info_hotel[0]['ret_airline_iata'] : '-')   .'</td>
                        </tr>
                        ';
        $html .= '
                    </tbody>
                </table>
            </div>
        </div>';

        // باکس اطلاعات تفریحات
        $html .= '
        <div style="background: #fff; border-radius: 8px;text-align: right; overflow: hidden; margin: 20px; border: 2px solid #ddd; font-family: yekanbakh;">
            <div style="background: #d5dddd; color: #333; padding: 12px; font-weight: bold; font-size: 14px; font-family: yekanbakh;">
                اطلاعات تفریحات
            </div>
         ';
        $entertainments = json_decode($info_hotel[0]['entertainment_data_json'] , true);
        if(!empty($entertainments)){
         $html .='   
            <div style="padding: 15px; font-family: yekanbakh; overflow-x: auto;">
                <table style="width: 100%; border-collapse: collapse; font-family: yekanbakh;">
                    <thead>
                        <tr style="background: #f5f5f5; border-bottom: 2px solid #ddd;">
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">#</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">عنوان</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">مبلغ</th>
                        </tr>
                    </thead>
                    <tbody>';
        $entertainmentNum = 1;

        $total_price_entertaimant = 0;
        foreach ($entertainments as $entertainment) {
            $total_price_entertaimant += $entertainment['final_price'];
            $html .= '
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . $entertainmentNum . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333; font-weight: bold;">' . (!empty($entertainment['tourTitle']) ? $entertainment['tourTitle'] : '-') . '</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($entertainment['final_price']) ? number_format($entertainment['final_price']) . ' ریال '  : '-') . '</td>
                        </tr>';
            $entertainmentNum++;
        }


        $html .= '
                    </tbody>
                </table>
                </div>
                ';
        }
    else{
        $html .= '
<div style="text-align:center ;padding:20px;width:100%">بدون تفریح</div>
        </div>';
    }




        // باکس اطلاعات هزینه ها
        $html .= '
        <div style="background: #fff; border-radius: 8px;text-align: right; overflow: hidden; margin: 20px; border: 2px solid #ddd; font-family: yekanbakh;">
            <div style="background: #d5dddd; color: #333; padding: 12px; font-weight: bold; font-size: 14px; font-family: yekanbakh;">
                هزینه ها
            </div>
            <div style="padding: 15px; font-family: yekanbakh; overflow-x: auto;">
                <table style="width: 100%; border-collapse: collapse; font-family: yekanbakh;">
                    <thead>
                        <tr style="background: #f5f5f5; border-bottom: 2px solid #ddd;">
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">جمع مبلغ هتل</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">جمع مبلغ پرواز</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">جمع مبلغ تفریحات</th>
                            <th style="padding: 12px; text-align: right; font-weight: bold; color: #333; border: 1px solid #ddd; font-family: yekanbakh;">جمع مبلغ (هتل + پرواز + تفریحات)</th>
                        </tr>
                    </thead>
                    <tbody>';

        $html .= '
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">' . (!empty($info_hotel[0]['total_hotel_price']) ? number_format($info_hotel[0]['total_hotel_price']) . ' ریال ' : '-').'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($info_hotel[0]['total_flight_price']) ?number_format($info_hotel[0]['total_flight_price']) . ' ریال ' : '-')  .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($total_price_entertaimant) ? number_format($total_price_entertaimant) . ' ریال ' : '-')   .'</td>
                            <td style="padding: 12px; text-align: right; border: 1px solid #ddd; font-family: yekanbakh; color: #333;">'. (!empty($info_hotel[0]['total_price']) ? number_format($info_hotel[0]['total_price'] + $total_price_entertaimant) . ' ریال ' : '-')   .'</td>
                        ';
        $html .= '
                    </tbody>
                </table>
            </div>
        </div>';


//        if ($firstInfo['type_application'] == 'api') {
//            // قوانین کنسلی
//            $html .= '
//             <div class="important-notes" style="font-family: yekanbakh;">
//                <div class="section-title" style="font-family: yekanbakh;;Cancellation laws"> Cancellation laws</div>
//
//                <div class="note-item" style="font-family: yekanbakh;">
//                Reservation cancellation during peak and off-peak times: Given that cancellation rates vary between different times and hotels, the exact cancellation fee will be determined after inquiring with the hotel.
//                </div>
//
//            </div>';
//
//        }else{
//            $html .= '
//             <div class="important-notes" style="font-family: yekanbakh;">
//                <div class="section-title" style="font-family: yekanbakh;">Cancellation laws</div>
//
//                <div class="note-item" style="font-family: yekanbakh;">
//            '
//                .
//                $firstInfo['hotel_rules'] . '
//                </div> .
//
//            </div>';
//        }
//        // نکات مهم
//        $html .= '
//             <div class="important-notes" style="font-family: yekanbakh;">
//            <div class="section-title" style="font-family: yekanbakh;">Important Notes for Hotel Check-in</div>
//
//            <div class="note-item" style="font-family: yekanbakh;">
//                Having a photo ID for check-in and accommodation at the hotel is mandatory.
//            </div>
//
//            <div class="note-item" style="font-family: yekanbakh;">
//                Check-in and check-out times are according to the voucher. Flight arrival and departure times are not considered, and the hotel has no obligation to deliver the room before the stated time or keep the room after the stated time.
//            </div>
//
//
//            <div class="note-item" style="font-family: yekanbakh;">
//                Airport transfer (arrival or departure) is provided upon passenger request and is subject to charges.
//            </div>
//
//            <div class="note-item" style="font-family: yekanbakh;">
//                Canceling room reservations is subject to penalties according to regulations, or in case of hotel guarantee, the amount is non-refundable.
//            </div>
//            </div>';
//
//        if (!empty($firstInfo['hotel_location'])) {
//            $location = json_decode($firstInfo['hotel_location'], true);
//            if (!empty($location['latitude']) && !empty($location['longitude'])) {
//                $lat = $location['latitude'];
//                $lng = $location['longitude'];
//                $html .= '
//            <div class="map-section" style="font-family: yekanbakh; page-break-inside: avoid;">
//                <div class="section-title" style="font-family: yekanbakh;">Hotel Location on Map</div>
//                <div class="map-container">
//                    <img src="https://static-maps.yandex.ru/1.x/?lang=fa_IR&ll=' . $lng . ',' . $lat . '&z=14&l=map&size=600,150&pt=' . $lng . ',' . $lat . ',pm2rdm" alt="نقشه هتل" style="width: 100%; height: auto; border-radius: 5px;">
//                </div>
//            </div>';
//            }
//        }



        // Footer
        $html .= '
<htmlpagefooter name="myFooter">
    <div style="">
        <table style="border-top:2px solid #ccc;width:100%; border-collapse:collapse;margin:10px 25px 10px 25px; font-family:yekanbakh;font-size:16px;">
            <tr>
                <td style="border:none;">
                    <span>وبسایت:</span>
                    <span dir="rtl">'.$getSubAgencyInfo['address_fa'].'</span>
                </td>
                <td style="border:none;">
                    <span>تلفن:</span>
                    <span dir="rtl">'.CLIENT_PHONE.'</span>
                </td>
                <td style="border:none;">
                    <span>آدرس:</span>
                    <span>'.CLIENT_ADDRESS.'</span>
                </td>
            </tr>
        </table>
    </div>
</htmlpagefooter>

</body>
</html>';

        return $html;
    }


}