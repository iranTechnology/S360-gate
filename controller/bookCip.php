<?php


class bookCip extends cip
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
        return Load::getModel('cipModel');
    }

    /**
     * @return reportModel|bool
     */
    protected function reportModel() {
        return Load::getModel('cipBaseModel');
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


        functions::insertLog('params==>' . json_encode($dataBooked, 256), 'newBookCip');

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

        functions::insertLog('in foreach==>' . json_encode([$info['factor_number'], $info['successfull']], 256), 'newBookCip');
        if ($info['successfull'] !== "book" && $info['successfull'] !== "error") {
            functions::insertLog('before updateStatusProcessing==>' . json_encode([$info['factor_number'], $resultBook], 256), 'newBookCip');
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


            functions::insertLog('after reserveTicket==>' . json_encode([$info['factor_number'], $resultBook], 256), 'newBookCip');

            functions::insertLog('**************************************', 'newBookCip');

        }
        else {
            return functions::withError('', 403, 'تشریفات فرودگاه قبلا به نتیجه رسیده است');
        }

        if ($resultBook) {
            return functions::withSuccess($resultBook, 200, 'تشریفات فرودگاه با موفقیت صادر شد');
        }
        return functions::withError('failed', 400, 'cip booking encountered an error.');

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
                'sms_service' => 'تشریفات',
                'sms_factor_number' => $eachDirection['request_number'],
                'sms_cip_name' => $eachDirection['cip_name'],
                'sms_flight_date' => $eachDirection['date_time'],
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
        functions::insertLog('first reserve ticket==>' . json_encode([$eachDirection['factor_number']], 256), 'newBookCip');

        $ReserveTicket = parent::Book($eachDirection);



        functions::insertLog('after reserve ticket==>' . json_encode([$eachDirection['factor_number']], 256), 'newBookCip');

        if (!empty($ReserveTicket) && $ReserveTicket['curl_error'] == false && !empty($ReserveTicket['Pnr'])) {
            functions::insertLog('before updateInfo==>' . json_encode([$eachDirection['factor_number'], $ReserveTicket], 256), 'newBookCip');
            $resultBookedFlight = $this->updateInfo($payType, $eachDirection, $ReserveTicket);

            functions::insertLog('after updateInfo==>' . json_encode([$eachDirection['factor_number'], $resultBookedFlight], 256), 'newBookCip');
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


    public function TrackingInfo($param)
    {
        $Model = Load::library('Model');
        $ModelBase = Load::library('ModelBase');

//        $sql = "select *  from book_cip_tb where request_number = '{$param}' OR factor_number = '{$param}' OR provider_ref='{$param}'";
        $requestNumber = filter_input(INPUT_POST, 'request_number', FILTER_SANITIZE_STRING);
        $phoneNumber = filter_input(INPUT_POST, 'phone_number', FILTER_SANITIZE_STRING);


        if(!Session::IsLogin()){
            $sql = "SELECT * FROM book_cip_tb 
        WHERE factor_number = '$requestNumber' 
        AND member_mobile = '$phoneNumber'";
        }
        else {
            $sql = "SELECT * FROM book_cip_tb 
        WHERE factor_number = '$requestNumber'";
        }

        $res = $Model->load($sql);


        if ($res['successfull'] == 'book') {
            $status = functions::Xmlinformation("Definitivereservation");
        } else if ($res['successfull'] == 'prereserve') {
            $status = functions::Xmlinformation("Prereservation");
        } else if ($res['successfull'] == 'bank') {
            $status = functions::Xmlinformation("NavigateToPort");
        } else if ($res['successfull'] == 'nothing') {
            $status = functions::Xmlinformation("Unknow");
        }elseif ($res['successfull'] == 'processing') {
            $status = functions::Xmlinformation('processingPrintFlight');
        }elseif ($res['successfull'] == 'pending') {
            $status = functions::Xmlinformation('pendingPrintFlight');
        }

        if ($res['request_cancel'] == 'none') {
            $class = ' btn btn-warning fa fa-times';
        } else if ($res['request_cancel'] == 'request_user' || $res['request_cancel'] == 'request_admin') {
            $class = ' btn btn-warning fa fa-refresh';
        } else if ($res['request_cancel'] == 'confirm') {
            $class = 'btn btn-success fa fa-check';
        }

        if ($res['request_cancel'] == 'request_user' || $res['request_cancel'] == 'request_admin') {
            $title = functions::Xmlinformation("RequestBeingReviewed");
        } else if ($res['request_cancel'] == 'confirm') {
            $title = functions::Xmlinformation("CancellationRequestAccepted");
        }

        // $href = ROOT_ADDRESS . "/eticketLocal&num={$res['request_number']}";

        //            $href2 = ROOT_ADDRESS_WITHOUT_LANG . "/pdf&target=ticketForeign&id={$res['request_number']}";
        $href = '/';
        if ($res['successfull'] == 'book') {

            $op = "  <a href='{$href}' class='btn btn-info fa fa-file-pdf-o margin-10'  target='_blank' title='" . functions::Xmlinformation("ViewPDFTickets") . "'></a>";
            $op .= '<a title="' . functions::Xmlinformation("ViewDetails") . '" onclick="ModalUserList(' . "'cip'" . ',' . "'" . $res['request_number'] . "'" . '); return false;"  class="btn btn-primary fa fa-eye"></a>';
        }

        if ($res['type_app'] != 'reservation' && $res['successfull'] == 'book' && Session::IsLogin()){

            $op .= '<a id="cancelbyuser"  title="' . functions::Xmlinformation("CancelFlight") . '" onclick="ModalCancelUser(' . "'flight'" . ',' . "'" . $res['request_number'] . "'" . '); return false;"  class="btn btn-danger fa fa-times"></a>';
        }
        if($res['successfull'] != 'book'){
            $op .='-';
        }

        $result = "" ;
        if (!empty($res)) {

            $totalPrice = functions::calcDiscountCodeByFactor($res['total_price'],$res['factor_number']);




            $request_number = $res['request_number'];

            $result = '
                  <div class="main-Content-bottom-table-Title Dash-ContentL-B-Title">
                        <i class="icon-table"></i><h3>' . functions::Xmlinformation("Yourpurchase") . ' ' . functions::Xmlinformation("On") . ' ' . functions::Xmlinformation("Numberreservation") . '' . $res['request_number'] . ' <br/> ' . functions::Xmlinformation("Indate") . ' ' . dateTimeSetting::jdate('Y-m-d H:i:s', $res['creation_date_int']) . '</h3>
                    </div>
                    
            <table class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>' . functions::Xmlinformation("NameCip") . '<br/>' . '</th>
                        <th>' . functions::Xmlinformation("PnrCode") . '</th>
                        <th>' . functions::Xmlinformation("Namepassenger") . '</th>
                        <th>' . functions::Xmlinformation("Airport") . '<br/>' . functions::Xmlinformation("Typeflight") . '</th>
                        <th>' . functions::Xmlinformation("Amount") . '<br/>' . functions::Xmlinformation("RefundAmount") . '</th>
                        <th>' . functions::Xmlinformation("Status") . '</th>
                        <th>' . functions::Xmlinformation("Action") . '</th>
                    </tr>
                </thead>
                <tbody>
            ';
            //   echo $result;
            $name  = $res['passenger_name'] ? $res['passenger_name'] : $res['passenger_name_en'];
            $family  = $res['passenger_family'] ? $res['passenger_family'] : $res['passenger_family_en'];
            $flightType = $res['flight_type'] === 'inbound' ? 'پرواز ورودی به فرودگاه' : ' پرواز خروجی از فرودگاه';
            $tripType = $res['trip_type'] === 'international' ? 'پرواز بین المللی' : 'پرواز داخلی';
            $pnr = $res['provider_ref'] ? $res['provider_ref'] : '-' ;
            $result .= '<td>' . $res['cip_name'] . '</td><td>' . $pnr . '</td><td>' . $name . ' ' . $family . '</td><td>' . $res['airport_code_cip'] . '<br/>' . $flightType . ' (' . $tripType .')' .'</td><td>' . number_format($totalPrice) . ' ' . functions::Xmlinformation("Rial") . '</td><td>' . $status . '</td><td>' . $op . '</td>';
            $result .= '</table>';

        }

        return $result;

    }

    public function createPdfContent($factorNumber, $cash, $cancelStatus)
    {
        $info_cip = $this->getModel('cipModel')->get()->where('factor_number',$factorNumber);
        $subAgencyInfo = $this->getController('agency');

        if (isset($cancelStatus) && $cancelStatus != '') {
            $info_cip = $info_cip->where('successfull','canceled');
        }

        $info_cip = $info_cip->all();

        $getSubAgencyInfo = $subAgencyInfo->AgencyInfoByIdMember($info_cip[0]['member_id']);
        if (empty($info_cip)) {
            return '<div style="text-align:center; font-size:20px; font-family: yekanbakh;">اطلاعات مورد نظر موجود نمی باشد</div>';
        }

        // شروع HTML
        $html = '<!DOCTYPE html>
<html dir="rtl" lang="fa">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>واچر تشریفات</title>
<style>
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "yekanbakh" !important;
    }

    body {
        font-family: "yekanbakh" !important;
        font-size: 12px;
        line-height: 1.6;
        color: #333;
        background: #f5f5f5;
        margin: 0;
        padding: 20px;
    }
    
    .container {
        max-width: 850px;
        margin: 0 auto;
        background: #ffffff;
        padding: 30px 35px;
        border-radius: 12px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.08);
    }

    /* ===== HEADER ===== */
    .header {
        width: 100%;
        margin-bottom: 10px;
        padding-bottom: 10px;
        border-bottom: 1px solid #e8e8e8;
    }

    .header table {
        width: 100%;
        border: none;
    }

    .header table td {
        border: none;
        padding: 0;
        vertical-align: middle;
    }

    .header-logo {
        width: 70%;
        text-align: right;
    }

    .header-logo img {
        max-width: 130px;
        max-height: 80px;
        width: auto;
    }

    .header-logo .agency-name {
        font-size: 14px;
        font-weight: bold;
        color: #2c3e50;
        margin-right: 12px;
        vertical-align: middle;
    }

    .header-barcode {
        width: 30%;
        text-align: left;
    }

    .header-barcode img {
        max-width: 80px;
        max-height: 55px;
        width: auto;
    }

    /* ===== INFO BOX ===== */
    .info-box {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        padding: 18px 22px;
        margin: 18px 0;
    }

    .info-box-header {
        font-size: 15px;
        font-weight: bold;
        color: #1a202c;
        padding-bottom:10px;
        margin-bottom:10px;
        border-bottom: 1px solid #e2e8f0;
    }

    .info-table {
        width: 100%;
        border-collapse: collapse;
    }

    .info-table td {
        padding: 5px 10px 5px 0;
        border: none;
        vertical-align: top;
        width: 50%;
    }

    .info-table .label {
        color: #718096;
        font-size: 11px;
        font-weight: 400;
        display: inline-block;
        min-width: 70px;
    }

    .info-table .value {
        font-weight: 600;
        color: #1a202c;
        font-size: 13px;
        display: inline-block;
    }

    .info-table .border-bottom {
        border-bottom: 1px dashed #f0f0f0;
    }

    /* ===== TABLE ===== */
    .table-wrap {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        overflow: hidden;
        margin: 18px 0;
    }

    .table-wrap .table-title {
        background: #f7fafc;
        padding: 12px 20px;
        font-size: 14px;
        font-weight: bold;
        color: #1a202c;
        border-bottom: 1px solid #e2e8f0;
    }

    .table-wrap table {
        width: 100%;
        border-collapse: collapse;
        font-size: 12px;
    }

    .table-wrap th {
        background: #fff;
        padding: 10px 14px;
        text-align: right;
        font-weight: 600;
        color: #2d3748;
        border: 1px solid #e2e8f0;
        font-size: 11px;
    }

    .table-wrap td {
        padding: 10px 14px;
        text-align: right;
        border: 1px solid #e2e8f0;
        color: #2d3748;
    }

    .price-total td {
        background: #f7fafc;
        font-weight: 700;
        font-size: 13px;
    }

    /* ===== SERVICE TABLE ===== */
    .service-table-wrap {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        overflow: hidden;
        margin: 18px 0;
    }

    .service-table-wrap .table-title {
        background: #f7fafc;
        padding: 12px 20px;
        font-size: 14px;
        font-weight: bold;
        color: #1a202c;
        border-bottom: 1px solid #e2e8f0;
    }

    .service-table-wrap table {
        width: 100%;
        border-collapse: collapse;
        font-size: 12px;
    }

    .service-table-wrap th {
        background: #fff;
        padding: 10px 14px;
        text-align: right;
        font-weight: 600;
        color: #2d3748;
        border: 1px solid #e2e8f0;
        font-size: 11px;
    }

    .service-table-wrap td {
        padding: 10px 14px;
        text-align: right;
        border: 1px solid #e2e8f0;
        color: #2d3748;
        vertical-align: middle;
    }

    .service-table-wrap .service-details {
        font-size: 11px;
        color: #4a5568;
        line-height: 1.8;
    }

    .service-table-wrap .service-details br {
        display: block;
        margin: 2px 0;
        content: "";
    }

    /* ===== FINAL PRICE ===== */
    .final-price-box {
        background: #f0f7ff;
        border: 1px solid #bee3f8;
        border-radius: 10px;
        padding: 18px 22px;
        margin: 18px 0 10px;
    }

    .final-price-box .price-row {
        padding: 4px 0;
        font-size: 14px;
    }

    .final-price-box .price-row table {
        width: 100%;
        border: none;
    }

    .final-price-box .price-row td {
        border: none;
        padding: 2px 0;
    }

    .final-price-box .price-label {
        color: #2c5282;
        font-weight: 600;
        text-align: right;
    }

    .final-price-box .price-amount {
        color: #1a202c;
        font-weight: 700;
        font-size: 15px;
        text-align: left;
    }

    .final-price-box .price-note {
        font-size: 12px;
        color: #4a5568;
        margin-top: 6px;
        padding-top: 8px;
        border-top: 1px dashed #bee3f8;
    }

    /* ===== CANCEL BADGE ===== */
    .cancel-badge {
        background: #fff5f5;
        border: 1px solid #fed7d7;
        border-radius: 10px;
        padding: 14px 20px;
        text-align: center;
        font-weight: bold;
        color: #c53030;
        font-size: 15px;
        margin: 18px 0;
    }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 600px) {
        .container {
            padding: 16px;
        }
        .info-table td {
            display: block;
            width: 100% !important;
            padding: 3px 0 !important;
        }
        .header-logo {
            width: 60%;
        }
        .header-barcode {
            width: 40%;
        }
        .header-logo img {
            max-width: 80px;
            max-height: 50px;
        }
        .header-barcode img {
            max-width: 60px;
            max-height: 40px;
        }
        .table-wrap table {
            font-size: 11px;
        }
        .table-wrap th,
        .table-wrap td {
            padding: 6px 8px;
        }
        .service-table-wrap table {
            font-size: 11px;
        }
        .service-table-wrap th,
        .service-table-wrap td {
            padding: 6px 8px;
        }
        .final-price-box .price-row {
            font-size: 13px;
        }
    }

    @media print {
        body {
            background: #fff;
            padding: 0;
        }
        .container {
            box-shadow: none;
            border-radius: 0;
            padding: 20px;
            max-width: 100%;
        }
        .table-wrap {
            page-break-inside: avoid;
        }
        .service-table-wrap {
            page-break-inside: avoid;
        }
        .info-box {
            page-break-inside: avoid;
        }
        .final-price-box {
            page-break-inside: avoid;
        }
    }

    @page {
        footer: myFooter;
        margin-bottom: 25mm;
        margin-top: 10mm;
        margin-left: 10mm;
        margin-right: 10mm;
    }
</style>
</head>
<body>
    <div class="container">';

        // ===== HEADER =====
        $agencyName = !empty($getSubAgencyInfo['name_fa']) ? $getSubAgencyInfo['name_fa'] : CLIENT_NAME;
        $image = !empty($getSubAgencyInfo['logo']) ? ROOT_ADDRESS_WITHOUT_LANG . '/pic/' .'agencyPartner/' . CLIENT_ID . '/logo/'. $getSubAgencyInfo['logo'] : ROOT_ADDRESS_WITHOUT_LANG . '/pic/' . CLIENT_LOGO ;

        $html .= '
    <div class="header">
        <table>
            <tr>
                <td class="header-logo">
                    <img width="130" height="80" src="' . $image . '" alt="Logo">
                    <span class="agency-name">' . $agencyName . '</span>
                </td>
              
                
            </tr>
            <tr>
            <td style="padding-top:20px">
                <p style="font-size:18px"> ' . $info_cip[0]['cip_name'] .'</p>
                </td>
</tr>
        </table>
    </div>';

        // ===== BODY =====
        $firstInfo = $info_cip[0];

        // اگر کنسل شده
        if ($firstInfo['request_cancel'] == 'confirm') {
            $html .= '
    <div class="cancel-badge">
        ⚠️ این رزرو کنسل شده است
    </div>';
        }


        // === اطلاعات پرواز ===
        $html .= '
<div class="table-wrap">
    <div class="table-title"> اطلاعات پرواز</div>
    <table class="info-table" style="padding:10px;">
        <tr>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">ایرلاین:</span>
                <span class="value">' . (!empty($firstInfo['airline_name']) ? $firstInfo['airline_name'] : '----')  . ' (' . $firstInfo['airline_iata'] . ') ' .  '</span>
            </td>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">فرودگاه:</span>
                <span class="value">' . (!empty($firstInfo['airport_code']) ? $firstInfo['airport_code'] : '----') . '</span>
            </td>
        </tr>
        <tr>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">شماره پرواز:</span>
                <span class="value">' . (!empty($firstInfo['flight_number']) ? $firstInfo['flight_number'] : '----') . '</span>
            </td>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">تاریخ خروج:</span>
                <span class="value">' . (!empty($firstInfo['date_time']) ? functions::printDateIntByLanguage('Y/m/d', strtotime($firstInfo['date_time']), SOFTWARE_LANG) : '----') . '</span>
            </td>
        </tr>
        <tr>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">نوع پرواز:</span>
                <span class="value">' . ($firstInfo['flight_type'] == 'outbound' ? 'خروج از فرودگاه' : 'ورود به فرودگاه') . '</span>
            </td>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">ساعت خروج:</span>
                <span class="value">' . (!empty($firstInfo['date_time']) ? date('H:i', strtotime($firstInfo['date_time'])) : '----') . '</span>
            </td>
        </tr>
        <tr>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">نوع سفر:</span>
                <span class="value">' . ($firstInfo['trip_type'] == 'international' ? 'بین‌المللی' : 'داخلی') . '</span>
            </td>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">شماره فاکتور:</span>
                <span class="value">' . (!empty($firstInfo['factor_number']) ? $firstInfo['factor_number'] : '----') . '</span>
            </td>
        </tr>
        <tr>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                <span class="label">رفرنس:</span>
                <span class="value">' . (!empty($firstInfo['provider_ref']) ? $firstInfo['provider_ref'] : '----') . '</span>
            </td>
            <td style="width:50%; padding:5px 10px 5px 0; border:none; vertical-align:top;">
                &nbsp;
            </td>
        </tr>
    </table>
</div>';

        // === جدول مسافرین ===
        $html .= '
    <div class="table-wrap">
        <div class="table-title"> اطلاعات مسافرین</div>
        <table>
            <thead>
                <tr>
                    <th style="width:8%;">ردیف</th>
                    <th style="width:37%;">نام و نام خانوادگی</th>
                    <th style="width:18%;">رده سنی</th>
                    <th style="width:17%;">ملیت</th>
                    <th style="width:20%;">شماره ملی</th>
                </tr>
            </thead>
            <tbody>';

        $row = 1;
        foreach ($info_cip as $passenger) {
            $fullName = '';
            if (!empty($passenger['passenger_name'])) {
                $fullName = $passenger['passenger_name'] . ' ' . $passenger['passenger_family'];
            } elseif (!empty($passenger['passenger_name_en'])) {
                $fullName = $passenger['passenger_name_en'] . ' ' . $passenger['passenger_family_en'];
            } else {
                $fullName = '-';
            }

            $ageGroup = '';
            if ($passenger['passenger_age'] == 'Adt') {
                $ageGroup = 'بزرگسال';
            } elseif ($passenger['passenger_age'] == 'Chd') {
                $ageGroup = 'کودک';
            } elseif ($passenger['passenger_age'] == 'Inf') {
                $ageGroup = 'نوزاد';
            }

            $nationality = !empty($passenger['passportCountry']) ? $passenger['passportCountry'] : 'IR';
            $nationalCode = !empty($passenger['passenger_national_code']) ? $passenger['passenger_national_code'] : '----';

            $html .= '
                <tr>
                    <td>' . $row . '</td>
                    <td>' . $fullName . '</td>
                    <td>' . $ageGroup . '</td>
                    <td>' . $nationality . '</td>
                    <td>' . $nationalCode . '</td>
                </tr>';
            $row++;
        }

        $html .= '
            </tbody>
        </table>
    </div>';

        // ===== جدول اطلاعات سرویس (service_data_json) =====
        if (!empty($firstInfo['service_data_json'])) {
            $serviceData = json_decode($firstInfo['service_data_json'], true);

            if (is_array($serviceData) && count($serviceData) > 0) {
                $html .= '
    <div class="service-table-wrap">
        <div class="table-title"> اطلاعات سرویس</div>
        <table>
            <thead>
                <tr>
                    <th style="width:25%;">نام سرویس</th>
              
                    <th style="width:20%;">قیمت</th>
                </tr>
            </thead>
            <tbody>';

                foreach ($serviceData as $service) {
                    $cipName = isset($service['CipName']) ? $service['CipName'] : '----';
                    $price = isset($service['Price']) ? number_format($service['Price']) : '0';
                    $serviceInputAnswer = isset($service['ServiceInputAnswer']) ? $service['ServiceInputAnswer'] : '';

                    // تبدیل توضیحات به خطوط جداگانه
                    $detailsHtml = '';
                    if (!empty($serviceInputAnswer)) {
                        $lines = explode('<br />', $serviceInputAnswer);
                        $lines = array_map('trim', $lines);
                        $lines = array_filter($lines);

                        if (count($lines) > 0) {
                            $detailsHtml = '<div class="service-details">';
                            foreach ($lines as $line) {
                                $detailsHtml .= ' ' . htmlspecialchars($line) . '<br>';
                            }
                            $detailsHtml .= '</div>';
                        }
                    }
//<td>' . $detailsHtml . '</td>
                    $html .= '
                <tr>
                    <td>' . htmlspecialchars($cipName) . '</td>
                    
                    <td>' . $price . '</td>
                </tr>';
                }

                $html .= '
            </tbody>
        </table>
    </div>';
            }
        }

        // === جدول قیمت ===
        $totalPrice = 0;
        $adultCount = 0;
        $childCount = 0;
        $infantCount = 0;

        foreach ($info_cip as $passenger) {
            if ($passenger['passenger_type'] == 'ADT') $adultCount++;
            elseif ($passenger['passenger_type'] == 'CHD') $childCount++;
            elseif ($passenger['passenger_type'] == 'INF') $infantCount++;
            $totalPrice += $passenger['total_price'];
        }

        $html .= '
   <div class="table-wrap">
    <div class="table-title"> شرح قیمت</div>
    <table>
        <thead>
            <tr>
                <th style="width:50%;">جمع مسافران</th>
                <th style="width:50%;">جمع سرویس ها</th>
            </tr>
        </thead>
        <tbody>';

        $totalPricePassenger = !empty($info_cip[0]['total_price']) ? $info_cip[0]['total_price'] : '0';
        $totalPriceService = 0;

        if (!empty($serviceData)) {
            foreach ($serviceData as $service) {
                $totalPriceService += $service['Price'];
            }
        }

        $html .= '
            <tr>
                <td>' . number_format($totalPricePassenger) . ' ریال</td>
                <td>' . number_format($totalPriceService) . ' ریال</td>
            </tr>';

        $totalPrice = (int)$totalPricePassenger + (int)$totalPriceService;
        $totalPriceFormatted = number_format($totalPrice);

        $html .= '
            <tr class="price-total">
                <td colspan="2" style="text-align:center; font-size:14px; font-weight:700;">
                    جمع کل: ' . $totalPriceFormatted . ' ریال
                </td>
            </tr>
        </tbody>
    </table>
</div>';


        // ===== FOOTER =====
        $phone = !empty($getSubAgencyInfo['phone']) ? $getSubAgencyInfo['phone'] : CLIENT_PHONE;
        $address = !empty($getSubAgencyInfo['address_fa']) ? $getSubAgencyInfo['address_fa'] : CLIENT_ADDRESS;

        $html .= '
<htmlpagefooter name="myFooter">
    <div style="border-top:1px solid #e2e8f0; padding-top:12px; padding-bottom:20px; margin:0 25px;">
        <table style="width:100%; border-collapse:collapse; font-family:yekanbakh; font-size:13px; color:#4a5568;">
            <tr>
                <td style="border:none; text-align:center; padding:4px 8px;">
                    <span style="font-weight:600;">وب سایت:</span>
                    <span dir="ltr" style="color:#2b6cb0;">' . CLIENT_MAIN_DOMAIN . '</span>
                </td>
                <td style="border:none; text-align:center; padding:4px 8px;">
                    <span style="font-weight:600;">تلفن:</span>
                    <span dir="ltr">' . $phone . '</span>
                </td>
                <td style="border:none; text-align:center; padding:4px 8px;">
                    <span style="font-weight:600;">آدرس:</span>
                    <span>' . $address . '</span>
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