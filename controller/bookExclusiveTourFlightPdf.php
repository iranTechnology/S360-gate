<?php
if(  $_SERVER['REMOTE_ADDR']=='93.118.161.174'  ) {
//    error_reporting(1);
//    error_reporting(E_ALL | E_STRICT);
//    @ini_set('display_errors', 1);
//    @ini_set('display_errors', 'on');
}
class bookExclusiveTourFlightPdf  extends exclusiveTour
{

    public function getTicketDataByRequestNumber($request_number, $conditionCancelStatus = null)
    {
        $model = Load::library('Model');

        //$query = "SELECT * FROM book_local_tb WHERE  request_number='{$request_number}' AND (successfull='book' OR successfull='private_reserve')";
        $query = "
        SELECT
        *
        FROM
            book_exclusive_tour_tb 
        WHERE
            request_number = '{$request_number}' 
            AND  successfull = 'book'
            {$conditionCancelStatus}
        ";
        $info_ticket = $model->select($query);

        return $info_ticket;
    }
    private function isTomorrow($start_time, $end_time) {
        // Current date
        $current_date = date('Y-m-d');

        // Parse start and end times into DateTime objects
        $start = new DateTime("$current_date $start_time");
        $end = new DateTime("$current_date $end_time");

        // If the end time is earlier than the start time, it's on the next day
        if ($end < $start) {
            return true; // End time is tomorrow
        }
        return false; // End time is the same day
    }
    public function createPdfContent($param, $cash, $cancelStatus)
    {


        $resultLocal = Load::controller('resultLocal');
        $airline_model = $this->getModel('airlineModel') ;
        $businessCabinTypes = ['C' => true, 'C1' => true, 'C2' => true, 'C3' => true,'C4' => true,'C5' => true, 'J' => true, 'I' => true, 'Z' => true];

        $conditionCancelStatus = '';
        if (isset($cancelStatus) && $cancelStatus != ''){
            $conditionCancelStatus = " AND report.request_cancel = '{$cancelStatus}' ";
        }

        if (TYPE_ADMIN == '1') {

            $ModelBase = Load::library('ModelBase');
            $sql = "select client_id from report_tb where request_number='{$param}' AND (successfull = 'book' OR successfull = 'private_reserve') ";
            $ticketReport = $ModelBase->load($sql);

            $admin = Load::controller('admin');
            $queryClient = "
        SELECT
            report.*,
            (
        SELECT
            PercentIndemnity 
        FROM
            cancel_ticket_details_tb AS cancelTicketDetail
            LEFT JOIN cancel_ticket_tb AS cancelTicket ON cancelTicket.IdDetail = cancelTicketDetail.id
        WHERE
            ( cancelTicket.NationalCode = report.passenger_national_code OR cancelTicket.NationalCode = report.passportNumber )
             AND report.request_number = cancelTicketDetail.RequestNumber
        GROUP BY
            cancelTicket.NationalCode 
            ) AS cancelTicketPercent,
            (
        SELECT
            DateRequestCancelClientInt 
        FROM
            cancel_ticket_details_tb AS cancelTicketDetail
            LEFT JOIN cancel_ticket_tb AS cancelTicket ON cancelTicket.IdDetail = cancelTicketDetail.id
        WHERE
            ( cancelTicket.NationalCode = report.passenger_national_code OR cancelTicket.NationalCode = report.passportNumber )
            AND report.request_number = cancelTicketDetail.RequestNumber 
        GROUP BY
            cancelTicket.NationalCode 
            ) AS cancelTicketDate ,
(
		SELECT
			PriceIndemnity
		FROM
			cancel_ticket_details_tb AS cancelTicketDetail
		LEFT JOIN cancel_ticket_tb AS cancelTicket ON cancelTicket.IdDetail = cancelTicketDetail.id
		WHERE
			(
				cancelTicket.NationalCode = report.passenger_national_code
				OR cancelTicket.NationalCode = report.passportNumber
			)
		AND report.request_number = cancelTicketDetail.RequestNumber
		GROUP BY
			cancelTicket.NationalCode
	) AS cancelTicketPriceIndemnity
        FROM
            book_local_tb AS report 
        WHERE
            report.request_number = '{$param}' 
            AND ( report.successfull = 'book' OR report.successfull = 'private_reserve' )
            {$conditionCancelStatus}
        ";

            $info_ticket = $admin->ConectDbClient($queryClient, $ticketReport['client_id'], 'SelectAll', '', '', '');
            $clientid = $admin->getClient(CLIENT_ID);
        } else {
            $info_ticket = $this->getTicketDataByRequestNumber($param, $conditionCancelStatus);

        }
        $sqlAirline = "SELECT * FROM airline_tb WHERE abbreviation = '".$info_ticket[0]['airline_iata']."'";
        $infoAirline =  $airline_model->select($sqlAirline);
        $objOffCode = Load::controller('interactiveOffCodes');
        $resultOffCode = $objOffCode->getOffCodeByFactorNumber($info_ticket[0]['factor_number']);

        $ClientId =  CLIENT_ID;
        $agencyController = Load::controller('agency');
        $agencyInfo = $agencyController->infoAgency($info_ticket[0]['agency_id'], $ClientId);
        /*    if ($ClientId == '79') {
                $ClientMainDomain = (!empty($info_ticket[0]['agency_id']) && ($info_ticket[0]['agency_id'] > 0) && !empty($agencyInfo['domain'])) ? (!empty($agencyInfo['domain']) ? $agencyInfo['domain'] : '') : CLIENT_MAIN_DOMAIN;
                $phone = (!empty($info_ticket[0]['agency_id']) && ($info_ticket[0]['agency_id'] > 0) && !empty($agencyInfo['domain'])) ? (!empty($agencyInfo['phone']) ? $agencyInfo['phone'] : '') : CLIENT_PHONE;
                $ClientAddress = (!empty($info_ticket[0]['agency_id']) && ($info_ticket[0]['agency_id'] > 0) && !empty($agencyInfo['domain'])) ? (!empty($agencyInfo['address_fa']) ? $agencyInfo['address_fa'] : '') : CLIENT_ADDRESS;
                $LogoAgencyPic = (!empty($info_ticket[0]['agency_id']) && ($info_ticket[0]['agency_id'] > 0) && !empty($agencyInfo['domain'])) ? (!empty($agencyInfo['logo']) ? $agencyInfo['logo'] : '') : CLIENT_LOGO;
                $LogoAgency = ROOT_ADDRESS_WITHOUT_LANG . '/pic/' . $LogoAgencyPic;

            } else {*/


        if($agencyInfo['hasSite'])
        {
            $LogoAgency = ROOT_ADDRESS_WITHOUT_LANG . '/pic/agencyPartner/' .CLIENT_ID.'/logo/'. CLIENT_LOGO;

        }else{
            $LogoAgency = ROOT_ADDRESS_WITHOUT_LANG . '/pic/' . CLIENT_LOGO;
            $StampAgency = ROOT_ADDRESS_WITHOUT_LANG . '/pic/' . CLIENT_STAMP;
        }
        $ClientMainDomain = CLIENT_MAIN_DOMAIN;
        $phone = CLIENT_PHONE;
        $ClientAddress = CLIENT_ADDRESS;


        $PhoneManage = CLIENT_MOBILE;
        $AgencyName = CLIENT_NAME;
//    }

        $gender = '';
        $genderEn = '';
        $airplan = '';
        $PrintTicket = '';
        $subAgencyInfo = $this->getController('agency');


        if (!empty($info_ticket)) {

            ob_start();

            ?>
            <!DOCTYPE html>
            <html>
            <head>
                <title>مشاهده فایل pdf بلیط</title>
                <style type="text/css">
                    .divborder {
                        border: 1px solid #CCC;
                    }

                    .divborderPoint {
                        border: 1px solid #CCC;
                        background-color: #FFF;
                        border-radius: 5px;
                        z-index: 100000000;
                        width: 200px;
                        padding: 5px;
                        margin-right: 20px;
                        text-align:center;
                    }

                    /*.page td {*/
                    /*    padding: 0;*/
                    /*    margin: 0;*/
                    /*}*/

                    /*.page {*/
                    /*    border-collapse: collapse;*/
                    /*}*/

                    /*@font-face {
                        font-family: "iranyekan";
                        font-style: normal;
                        font-weight: normal;
                        src: url("../view/administrator/assets/css/font/web/persian/iranyekanwebregular/iranyekanwebregular.eot") format("opentype"),
                        url("../view/administrator/assets/css/font/web/persian/iranyekanwebregular/iranyekanwebregular.ttf") format("truetype");
                    }*/
                    *{
                        font-family: 'yekanbakh'!important;
                    }
                    body   {
                        font-family: 'yekanbakh' !important;
                    }


                    table {
                        font-family: 'yekanbakh' !important;
                        border-collapse: collapse;
                    }

                    /*table.solidBorder, .solidBorder th, .solidBorder td {*/
                    /*    !*border: 1px solid #CCC;*!*/
                    /*}*/

                    /*.element:last-child {*/
                    /*    page-break-after: auto;*/
                    /*}*/
                    /*.head-logo-info{*/
                    /*    width:100% !important;*/
                    /*    display:flex !important;*/
                    /*    justify-content:space-between;*/
                    /*    align-items:center;*/
                    /*}*/
                    .head-p{
                        font-size:13px;
                        color: #a8a7a7;

                    }
                    .head-detail-p{
                        font-size:15px;
                    }

                </style>

            </head>
            <body style="font-family:'iranyekan'">
            <?php





            foreach ($info_ticket as $key=>$info) {


            $getSubAgencyInfo = $subAgencyInfo->AgencyInfoByIdMember($info['member_id']);
            $start_time = $info['time_flight'];
            $end_time = $info['ret_time_flight'];

            if($this->isTomorrow($start_time, $end_time)) {
                $date = new DateTime($info['date_flight']);
                $date->modify('+1 day');
                $end_date =  $date->format('Y-m-d\TH:i:s');
            }else {
                $end_date = $info['date_flight'];
            }

            if ($info['passenger_age'] == "Adt") {
                $infoAge = 'بزرگسال';
            } else if ($info['passenger_age'] == 'Chd') {
                $infoAge = 'کودک';
            } else if ($info['passenger_age'] == 'Inf') {
                $infoAge = 'نوزاد';
            }
            if ($info['passenger_gender'] == 'Male') {
                $gender = ' آقای';
                $genderEn = 'Mr';
            } else if ($info['passenger_gender'] == 'Female') {
                $gender = ' خانم';
                $genderEn = 'Ms';
            }

            if ($info['flight_type'] == '' || $info['flight_type'] == 'charter') {
                $flight_type = 'چارتری';
            } else if ($info['flight_type'] == 'system') {
                $flight_type = 'سیستمی';
            }

            if (($info['seat_class'] == 'C' || $info['seat_class'] == 'B')) {
                $seat_class = 'بیزینس';
            } else {
                $seat_class = 'اکونومی';
            }

            $CabinType = $info['cabin_type'];

            //               $Fee = functions::FeeCancelFlight($info['airline_iata'], $CabinType);
            $params = [
                'airline_iata'=>$info['airline_iata'],
                'cabin_type'=>$CabinType
            ];
            $Fee = Load::controller( 'cancellationFeeSetting' )->feeByAirlineAndCabinTypeNew($params);
            $Price = '0';
            if (functions::TypeUser($info['member_id']) == 'Ponline') {
                $Price = functions::CalculateDiscountOnePerson($info['request_number'], ($info['passenger_national_code'] == '0000000000' || $info['passenger_national_code'] == '' ? $info['passportNumber'] : $info['passenger_national_code']), 'yes');
                $PriceWithOut = 0;
            } else if (functions::TypeUser($info['member_id']) == 'Counter') {
                $Price = functions::CalculatePriceTicketOnePerson($info['request_number'], ($info['passenger_national_code'] == '0000000000' || $info['passenger_national_code'] == '' ? $info['passportNumber'] : $info['passenger_national_code']), 'yes');
                $PriceWithOut = functions::CalculateDiscountOnePerson($info['request_number'], ($info['passenger_national_code'] == '0000000000' || $info['passenger_national_code'] == '' ? $info['passportNumber'] : $info['passenger_national_code']), 'yes');
            }

            $AddOnPrice = ((!empty($info['amount_added']) && $info['amount_added'] > 0) ? $info['amount_added'] : '0');
            $priceTotal = $info['total_flight_price'];
            $priceTotalWithOutDiscount = $info['total_flight_price'];



            $cancelTicketPrice = 0;
            if ($info['request_cancel'] == 'confirm'){
//        $cancelTicketPrice = $priceTotal - (($priceTotal * $info['cancelTicketPercent']) / 100);

            }
            $picAirline = functions::getAirlinePhoto($info['airline_iata']);
            $airlineName = functions::InfoAirline($info['airline_iata']);
            // $price = functions::CalculateDiscountOnePerson($info['request_number'], $info['passenger_national_code'] == '0000000000' ? $info['passenger_national_code'] : $info['passportNumber'], 'yes');
            $airplan = 'https://versagasht.com/gds/view/client/assets/images/air.png';
            //               $barcodeBase64 = barcode128_base64($info['pnr']);
            ?>
            <div  style='margin-top: 1000px;font-family: "yekanbakh"'>
                <table width="100%" align="center" style="margin: 20px 100px;" class="page">
                    <tr>
                        <td style="padding-bottom:30px">
                            <img src="<?php echo  ROOT_ADDRESS_WITHOUT_LANG . '/pic/' .'agencyPartner/' . CLIENT_ID . '/logo/'. $getSubAgencyInfo['logo'] ?>" height="80" style="vertical-align: middle;">
                            <span style="display: inline-block; vertical-align: middle; padding-left: 10px;">
                <?php echo $getSubAgencyInfo['name_fa'] ?>
            </span>
                        </td>
                        <td style="<?= $_GET['lang'] == 'fa' ? 'text-align:left' : 'text-align:right'; ?>
                            ">
                            <!--                          <img src="https://safar360.com/gds/library/barcode/barcode_creator.php?barcode=--><?php //echo trim($info['pnr']); ?><!--"-->
                            <!--                               style="max-width: 80px; min-height: 50px">-->
                            <img src="https://api.qrserver.com/v1/create-qr-code/?size=300&data=<?= urlencode('http://' . CLIENT_DOMAIN .'/gds/pdf&target=parvazBookingLocal&id='. $info['request_number'] .'&lang=fa') ?>" style="max-width: 80px; min-height: 50px">                       </td>
                    </tr>
                </table>

                <div class="divborder" style="margin: 20px 100px;">
                    <table width="100%" align="center" class="page">
                        <?php if (isset($cancelStatus) && $cancelStatus == 'confirm') { ?>
                            <tr style="text-align: center;">
                                <td style="font-size: 30px; font-weight: 700; padding: 10px;">
                                    رسید کنسلی
                                </td>
                            </tr>
                        <?php } ?>
                        <tr>
                            <?php if($_GET['lang'] == 'fa'){ ?>
                                <td style="padding:15px;">
                                    <p class="head-p">نام و نام خانوادگی</p>
                                    <p class="head-detail-p">
                                        <?php echo !empty($info['passenger_name']) && !empty($info['passenger_family'])
                                            ? $info['passenger_name'] . ' ' . $info['passenger_family']
                                            : '-'; ?>
                                    </p>
                                    <p class="head-p">کد ملی</p>
                                    <p class="head-detail-p">
                                        <?php echo !empty($info['passenger_national_code']) ? $info['passenger_national_code'] : $info['passportNumber']; ?>
                                    </p>
                                </td>
                            <?php } ?>
                            <td style="padding:15px; text-align:left;">
                                <p class="head-p">Passenger Name</p>
                                <p class="head-detail-p">
                                    <?php echo !empty($info['passenger_name']) && !empty($info['passenger_family'])
                                        ? $info['passenger_name'] . ' ' . $info['passenger_family']
                                        : '-'; ?>
                                </p>
                                <p class="head-p">National Code</p>
                                <p class="head-detail-p">
                                    <?php echo !empty($info['passenger_national_code']) ? $info['passenger_national_code'] : $info['passportNumber']; ?>
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>

                <table width="100%" align="center" style="margin: 10px 90px; border-collapse: separate; border-spacing: 10px 0;" class="page">
                    <tr>
                        <!-- سمت چپ اطلاعات پرواز -->
                        <td width="50%" class="divborder" style="overflow:hidden;">
                            <table width="100%" style="border-collapse: collapse;">
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top;">
<!--                                            <p class="head-p">شماره بلیط</p>-->
<!--                                            <p class="head-detail-p">--><?php //echo $info['eticket_number']?><!--</p>-->
                                            <p class="head-p">رفرنس</p>
                                            <p class="head-detail-p" ><?php echo $info['provider_ref']?></p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top;">
<!--                                        <p class="head-p">Ticket Number</p>-->
<!--                                        <p class="head-detail-p">--><?php //echo $info['eticket_number']?><!--</p>-->
                                        <p class="head-p">PNR</p>
                                        <p class="head-detail-p"><?php echo $info['provider_ref']?></p>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px solid #ccc;">
                                            <p class="head-p">مبدا</p>
                                            <p class="head-detail-p"><?php echo $info['origin_city']?></p>
                                            <p class="head-p">مقصد</p>
                                            <p class="head-detail-p"><?php echo $info['desti_city']?></p>
                                        </td>
                                    <?php  } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px solid #ccc;">
                                        <p class="head-p">Origin</p>
                                        <p class="head-detail-p"><?php echo $info['origin_city']?></p>
                                        <p class="head-p">Destination</p>
                                        <p class="head-detail-p"><?php echo $info['desti_city']?></p>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px solid #ccc;">
                                            <p class="head-p">تاریخ حرکت</p>
                                            <p class="head-detail-p"><?php $date = functions::OtherFormatDate($info['date_flight']); echo $date['DepartureDate']; ?></p>
                                            <p class="head-p">ساعت حرکت</p>
                                            <p class="head-detail-p"><?php echo $resultLocal->format_hour($info['time_flight']); ?></p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px solid #ccc;">
                                        <p class="head-p">Flight Date</p>
                                        <p class="head-detail-p"><?php $dateRet = functions::ConvertToMiladi($info['date_flight']); echo $dateRet;?></p>
                                        <p class="head-p">Flight Time</p>
                                        <p class="head-detail-p"><?php echo $resultLocal->format_hour($info['time_flight']); ?></p>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px solid #ccc;">
                                            <p class="head-p">تاریخ رسیدن</p>
                                            <p class="head-detail-p"><?php $date = functions::OtherFormatDate($info['ret_date_flight']); echo $date['DepartureDate'];?></p>
                                            <p class="head-p">ساعت رسیدن</p>
                                            <p class="head-detail-p"><?php echo $resultLocal->format_hour($info['ret_time_flight']); ?></p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px solid #ccc;">
                                        <p class="head-p">Arrival Date</p>
                                        <p class="head-detail-p"><?php $dateRet = functions::ConvertToMiladi($info['ret_date_flight']); echo $dateRet;?></p>
                                        <p class="head-p">Arrival Time</p>
                                        <p class="head-detail-p"><?php echo $resultLocal->format_hour($info['ret_time_flight']); ?></p>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <!-- سمت راست اطلاعات ایرلاین و قیمت -->
                        <td width="50%" class="divborder">
                            <table width="100%" style="border-collapse: collapse;">
                                <tr>
                                    <td style="<?= ($_GET['lang'] == 'en' ? 'text-align:left;padding:10px' : 'padding:10px')  ?>">
                                        <img src="<?php echo $picAirline ?>" style="max-height:70px;">
                                        <p class="head-detail-p" style="margin-right:50px !important;"><?=  ($_GET['lang'] == 'en' ? $infoAirline[0]['name_en'] : $infoAirline[0]['name_fa'])   ?></p></td>
                                </tr>
                                <tr>
                                    <?php  if($_GET['lang'] == 'fa'){  ?>
                                        <td style="padding:10px; vertical-align:top;">
                                            <p class="head-p">ایرلاین</p>
                                            <p class="head-detail-p"><?php echo $info['airline_name'] . ' (' . $info['airline_iata'] . ')'?></p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top;">
                                        <p class="head-p">Airline</p>
                                        <p class="head-detail-p" style="text-align:right">
                                            <?php echo $info['airline_name']; ?>
                                            (<span dir="rtl"><?php echo $info['airline_iata']; ?></span>)
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px solid #ccc;">
                                            <p class="head-p">شماره پرواز</p>
                                            <p class="head-detail-p"><?php echo $info['flight_number']?></p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px solid #ccc;">
                                        <p class="head-p">Flight Number</p>
                                        <p class="head-detail-p"><?php echo $info['flight_number']?></p>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px solid #ccc;">
                                            <p class="head-p">بار مجاز</p>
                                            <?php if (isset($info['cabin_type']) && isset($businessCabinTypes[$info['cabin_type']])) { ?>
                                                <p class="head-detail-p">25 کیلوگرم</p>
                                            <?php } else {?>
                                                <p class="head-detail-p">20 کیلو بار اصلی + 5 کیلو بار دستی </p>
                                            <?php }  ?>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px solid #ccc;">
                                        <p class="head-p">Permissible Load</p>
                                        <?php if (isset($info['cabin_type']) && isset($businessCabinTypes[$info['cabin_type']])) { ?>
                                            <p class="head-detail-p">25 KG</p>
                                        <?php } else {?>
                                            <p class="head-detail-p">20 kg main baggage + 5 kg hand baggage</p>
                                        <?php }  ?>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px solid #ccc;">
                                            <p class="head-p">کلاس پرواز</p>
                                            <p class="head-detail-p"><?php echo $info['seat_class'] ? $info['seat_class'] : '-'?></p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px solid #ccc;">
                                        <p class="head-p">Flight Class</p>
                                        <p class="head-detail-p"><?php echo $info['seat_class'] ? $info['seat_class'] : '-'?></p>
                                    </td>
                                </tr>
                                <tr>
                                    <?php if($_GET['lang'] == 'fa'){ ?>
                                        <td style="padding:10px; vertical-align:top; border-top:1px dashed #000;">
                                            <p class="head-p">بهای بلیط</p>
                                            <p class="head-detail-p" style="font-weight:bolder;">
                                                <?php
                                                if ($cash == 'no') {
                                                    echo 'Cash';
                                                } else {
                                                    $isCounter = functions::TypeUser($info['member_id']) === 'Counter';
                                                    if ($isCounter && $info['percent_discount'] > 0) {
                                                        echo number_format($priceTotalWithOutDiscount) . ' ریال';
                                                    } else {
                                                        echo number_format($priceTotal) . ' ریال';
                                                    }
                                                }
                                                ?>
                                            </p>
                                        </td>
                                    <?php } ?>
                                    <td style="padding:10px; text-align:left; vertical-align:top; border-top:1px dashed #000;">
                                        <p class="head-p">Price</p>
                                        <p class="head-detail-p" style="font-weight:bold">
                                            <?php
                                            if ($cash == 'no') {
                                                echo 'Cash';
                                            } else {
                                                $isCounter = functions::TypeUser($info['member_id']) === 'Counter';
                                                if ($isCounter && $info['percent_discount'] > 0) {
                                                    echo number_format($priceTotalWithOutDiscount) . ' Rial';
                                                } else {
                                                    echo number_format($priceTotal) . ' Rial';
                                                }
                                            }
                                            ?>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr><td colspan="2" style="height:10px;"></td></tr>
                </table>



                <?php
                if ($info['request_cancel'] != 'confirm' && ($info['successfull'] == 'book' || $info['successfull'] == 'private_reserve')){
                    ?>
                    <div class="" style="margin: 10px 100px ;border:1px solid #ccc">
                        <!--                     <div style="font-size: 19px ; color: #006cb5; margin-top: -20px" class="divborderPoint"> به نکات زیر توجه-->
                        <!--                        نمایید:-->
                        <!--                     </div>-->
                        <table width="100%" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="padding:20px">
                                    <ul>
                                        <?php if($_GET['lang'] == 'fa'){ ?>
                                            <li> حداکثر بار مجاز برابر با 25کیلو گرم می باشد</li>
                                            <li>در هنگام سوار شدن حتما مدرک شناسایی (کارت ملی یا پاسپورت) همراه خود داشته باشید</li>
                                            <li>در پروازهای داخلی 2 ساعت و در پروازهای خارجی 3 ساعت زودتر در فرودگاه حاضر باشید</li>
                                            <li>در صورتیکه از پرواز به دلیل کنسلی، تاخیر یا تعجیل استفاده نکردید، نسبت به مهر نمودن بلیط اقدام نمایید </li>
                                            <!--                           <li>در صورتیکه به دلایل شخصی از پرواز استفاده نمیکنید، نسبت به مهر نمودن بلیط اقدام نمایید </li>-->
                                            <!--                          <li>ترمینال 1 : کیش ایر، وارش ، زاگرس ، چابهار ، اروان</li>-->
                                            <!--                          <li>ترمینال 2 : ایران ایر ، ایر تور ، آتا ، قشم ایر ، معراج ، نفت(کارون)</li>-->
                                            <!--                          <li>ترمینال 4 : ماهان ، کاسپین ، آسمان ، اترک ، تابان ، سپهران ، فلای پرشیا ، ساها ، پویا ، اترک ، پارس ، یزد ایر</li>-->
                                            <!--                          <li>درصورتی که بلیط شما به هر دلیلی با مشکل مواجه شد لطفا با شماره تلفن های آژانس که در انتهای-->
                                            <!--                            بلیط نمایش داده شده تماس حاصل فرمائید-->
                                            <!--                          </li>-->

                                        <?php } else { ?>

                                            <li>The maximum allowable load is 25 kg.</li>
                                            <li>Be sure to have your identification document (national card or passport) with you when boarding.</li>
                                            <li>Be at the airport 2 hours early for domestic flights and 3 hours early for international flights.</li>
                                        <?php }  ?>
                                        <?php
                                        if($info['api_id'] == 14)  {
                                            if($_GET['lang'] == 'fa'){
                                                echo '
                             <li>هزینه های کنسلی طبق قوانین ایرلاین محاسبه میگردد</li>
                            <li>مسافر گرامی، شما می بایستی 2 ساعت قبل از زمان پرواز در فرودگاه حضور داشته باشید</li>
                            <li>در صورت ایجاد هرگونه محدودیت در پذیرش مسافر، این شرکت هیچگونه مسئولیتی در این خصوص نخواهد داشت و کلیه خسارات متوجه خریدار می باشد.</li>
                        
                            ';}else {?>
                                                <li>Cancellation fees are calculated according to airline rules.</li>
                                                <li>Dear passenger, you must be at the airport 2 hours before your flight time.</li>
                                                <li>In the event of any restrictions on passenger acceptance, this company will not be responsible for this and all damages will be borne by the buyer.</li>
                                                <?php

                                            }
                                        }
                                        ?>

                                    </ul>

                                </td>

                            </tr>

                        </table>
                    </div>
                    <?php
                }
                ?>
                <?php
                if ($info['origin_airport_iata'] == 'THR' || $info['origin_airport_iata'] == 'IKA' || $info['desti_airport_iata'] == 'THR' || $info['desti_airport_iata'] == 'IKA'){
                    ?>
                    <div class="" style="margin: 10px 100px ;border:1px solid #ccc">
                        <!--                     <div style="font-size: 19px ; color: #006cb5; margin-top: -20px" class="divborderPoint"> به نکات زیر توجه-->
                        <!--                        نمایید:-->
                        <!--                     </div>-->
                        <table width="100%" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="padding:20px">
                                    <ul>
                                        <?php

                                        $thrAirport = (
                                            $info['origin_airport_iata'] === 'THR' ||
                                            $info['desti_airport_iata'] === 'THR'
                                        ) ? 'مهرآباد' : '';

                                        $thrAirportEn = (
                                            $info['origin_airport_iata'] === 'THR' ||
                                            $info['desti_airport_iata'] === 'THR'
                                        ) ? 'Mehrabad' : '';


                                        if($_GET['lang'] == 'fa'){
                                            if ($info['origin_airport_iata'] == 'THR'){ ?>
                                                <li>
                                                    این پرواز از ترمینال خروجی  <?=  $infoAirline[0]['out_thr'] . ' ' . $thrAirport ?> صورت می‌گیرد
                                                </li>
                                            <?php }  if ($info['desti_airport_iata'] == 'THR'){ ?>
                                                <li>
                                                    این پرواز از ترمینال ورودی  <?=  $infoAirline[0]['enter_thr'] . ' ' . $thrAirport ?> صورت می‌گیرد
                                                </li>
                                            <?php } ?>




                                        <?php  }  else {   if ($info['origin_airport_iata'] == 'THR'){ ?>
                                            <li>
                                                This flight departs from the terminal  <?=   $infoAirline[0]['out_thr'] . ' ' . $thrAirportEn ?> It takes place.
                                            </li>
                                        <?php }  if ($info['desti_airport_iata'] == 'THR'){ ?>
                                            <li>
                                                This flight departs from the arrivals terminal  <?=  $infoAirline[0]['enter_thr'] . ' ' . $thrAirportEn ?> It takes place.
                                            </li>
                                        <?php }?>






                                        <?php  }  ?>
                                        <?php
                                        if($info['api_id'] == 14)  {
                                            if($_GET['lang'] == 'fa'){
                                                echo '
                             <li>هزینه های کنسلی طبق قوانین ایرلاین محاسبه میگردد</li>
                            <li>مسافر گرامی، شما می بایستی 2 ساعت قبل از زمان پرواز در فرودگاه حضور داشته باشید</li>
                            <li>در صورت ایجاد هرگونه محدودیت در پذیرش مسافر، این شرکت هیچگونه مسئولیتی در این خصوص نخواهد داشت و کلیه خسارات متوجه خریدار می باشد.</li>
                        
                            ';}else {?>
                                                <li>Cancellation fees are calculated according to airline rules.</li>
                                                <li>Dear passenger, you must be at the airport 2 hours before your flight time.</li>
                                                <li>In the event of any restrictions on passenger acceptance, this company will not be responsible for this and all damages will be borne by the buyer.</li>
                                                <?php

                                            }
                                        }
                                        ?>

                                    </ul>

                                </td>

                            </tr>

                        </table>
                    </div>
                    <?php
                }
                ?>
                <?php

                if (!empty($info['request_cancel']) && $info['request_cancel'] == 'confirm'){

                    $date = dateTimeSetting::jdate('Y-m-d (H:i:s)', $info['cancelTicketDate'],'','','en');
                    ?>
                    <div class="divborder" style="bottom: 0; margin: 10px 100px 100px 100px;">
                        <div style="font-size: 19px ; color: #006cb5; margin-top: -20px;text-align: center;" class="divborderPoint"> توضیحات</div>
                        <table width="100%" align="center" cellpadding="5" cellspacing="0" style="margin: 10px;">
                            <tr>
                                <?php if($_GET['lang'] == 'fa'){ ?>
                                    <td class="cancellationPolicy-title" colspan="6" style="font-size: 20px; font-weight: 700;">پرواز فوق در تاریخ <?php echo $date ?> با درصد <?php echo  $info['cancelTicketPercent'] ?> و مبلغ <?php echo number_format($info['cancelTicketPriceIndemnity']) ?>  ریال استرداد شده است.</td>


                                <?php } else { ?>
                                    <td class="cancellationPolicy-title" colspan="6" style="font-size: 20px; font-weight: 700;">The above flight in history <?php echo $date ?> By percentage <?php echo  $info['cancelTicketPercent'] ?> and the amount <?php echo number_format($info['cancelTicketPriceIndemnity']) ?> The rial has been refunded. </td>



                                <?php }  ?>
                            </tr>
                        </table>
                    </div>
                    <br/>
                    <!--                <br/>-->
                    <!--                <br/>-->
                    <!--                <br/>-->
                    <!--                <br/>-->
                    <!--                <br/>-->
                    <!--                <br/>-->


                    <?php
                }
                elseif (strtolower($info['flight_type']) == 'system' && $cash !='no') {

//                  if($info['amount_added'] ==0)
//                  {
//                      $type='';
//                      if($info['passenger_age']=='Adt'){
//                          $type = 'adt';
//                      }else if($info['passenger_age']=='Chd'){
//                          $type = 'chd';
//                      }else if($info['passenger_age']=='Inf'){
//                          $type = 'inf';
//                      }
//                      ?>
                    <!--                    <div class="divborder" style="margin: 20px 100px;">-->
                    <!--                      <div style="font-size: 19px ; color: #006cb5; margin-top: -20px" class="divborderPoint">جزئیات قیمت:-->
                    <!--                      </div>-->
                    <!--                      <table width="100%" align="center" cellpadding="5" cellspacing="0" style="margin:10px;" border="1"-->
                    <!--                             class="solidBorder">-->
                    <!--                        <tr class="cancellationPolicy-tableHead">-->
                    <!--                          <td class="cancellationPolicy-c1"> fare</td>-->
                    <!--                          <td class="cancellationPolicy-c2">tax</td>-->
                    <!--                          <td class="cancellationPolicy-c3">total</td>-->
                    <!--                        </tr>-->
                    <!--                        <tr>-->
                    <!--                          <td class="cancellationPolicy-title">--><?php //echo $info[$type.'_fare'] ?><!--</td>-->
                    <!--                          <td class="cancellationPolicy-title">--><?php //echo $info[$type.'_tax'] ?><!--</td>-->
                    <!--                          <td class="cancellationPolicy-title">--><?php //echo $info[$type.'_price'] ?><!--</td>-->
                    <!--                      </table>-->
                    <!--                    </div>-->
                    <!--                    <br/>-->
                    <!--                      --><?php
//                  }


                    if($info['api_id'] != 14) {
                        if (!empty($Fee) ) {
                            ?>
                            <div class="divborder" style="margin: 30px 98px 30px 98px;">
                                <?php if($_GET['lang'] == 'fa'){ ?>
                                    <div style="font-size: 19px ; color: #000; margin-top: -20px" class="divborderPoint">
                                        جدول جرائم کنسلی
                                    </div>
                                <?php } ?>
                                <table width="100%" align="center" cellpadding="5" cellspacing="0" style="margin:10px;" border="1" class="solidBorder">
                                    <?php if($_GET['lang'] == 'fa'){ ?>

                                        <tr class="cancellationPolicy-tableHead">
                                            <td class="cancellationPolicy-c1">کلاس نرخی</td>
                                            <?php foreach($Fee['data'] as $item): ?>
                                                <td class="cancellationPolicy-title"><?php echo $item['title']; ?></td>
                                            <?php endforeach; ?>
                                        </tr>
                                    <?php } else { ?>

                                        <tr class="cancellationPolicy-tableHead">
                                            <td class="cancellationPolicy-c1">Cabin Type</td>
                                            <?php foreach($Fee['data'] as $item): ?>
                                                <td class="cancellationPolicy-title"><?php echo $item['title_en']; ?></td>
                                            <?php endforeach; ?>
                                        </tr>

                                    <?php }  ?>
                                    <tr>
                                        <td class="cancellationPolicy-title"><?php echo $CabinType ?></td>
                                        <?php foreach($Fee['data'] as $item): ?>
                                            <?php if($_GET['lang'] == 'fa'){ ?>
                                                <td class="cancellationPolicy-title"><?php echo $item['fine_text']; ?></td>
                                            <?php } else { ?>
                                                <td class="cancellationPolicy-title"><?php echo $item['fine_text_en']; ?></td>
                                            <?php } ?>
                                        <?php endforeach; ?>

                                    </tr>
                                </table>
                            </div>
                        <?php } else { ?>


                            <div class="divborder" style="margin: auto 100px">
                                <?php if($_GET['lang'] == 'fa'){ ?>

                                    <div style="font-size: 19px ; color: #000; margin-top: -20px" class="divborderPoint">
                                        جدول جرائم کنسلی
                                    </div>
                                <?php } ?>
                                <table width="100%" align="center" cellpadding="5" cellspacing="0" style="margin:10px;" border="1"
                                       class="solidBorder">
                                    <?php if($_GET['lang'] == 'fa'){ ?>

                                        <tr class="cancellationPolicy-tableHead">
                                            <td class="cancellationPolicy-c1">کلاس پروازی</td>
                                            <td class="cancellationPolicy-c2">تا 12 ظهر 3 روز قبل از پرواز</td>
                                            <td class="cancellationPolicy-c3">تا 12 ظهر 1 روز قبل از پرواز</td>
                                            <td class="cancellationPolicy-c4">تا 3 ساعت قبل از پرواز</td>
                                            <td class="cancellationPolicy-c5">تا 30 دقیقه قبل از پرواز</td>
                                            <td class="cancellationPolicy-c6">از 30 دقیقه قبل پرواز به بعد</td>
                                        </tr>


                                        <tr>
                                            <td class="cancellationPolicy-title" colspan="6">برای اطلاع از میزان جریمه کنسلی تماس بگیرید
                                            </td>
                                        </tr>
                                    <?php } else { ?>

                                        <tr class="cancellationPolicy-tableHead">
                                            <td class="cancellationPolicy-c1">Cabin Type</td>
                                            <td class="cancellationPolicy-c2">Until 12 noon 3 days before flight</td>
                                            <td class="cancellationPolicy-c3">Until 12 noon 1 day before flight</td>
                                            <td class="cancellationPolicy-c4">Up to 3 hours before flight</td>
                                            <td class="cancellationPolicy-c5">Up to 30 minutes before flight</td>
                                            <td class="cancellationPolicy-c6">From 30 minutes before the flight onwards</td>
                                        </tr>
                                        <tr>
                                            <td class="cancellationPolicy-title" colspan="6">
                                                Call to find out the cancellation fee amount.
                                            </td>
                                        </tr>
                                    <?php }  ?>

                                </table>
                            </div>
                        <?php }

                    }


                }
                ?>
                <table width="100%" align="center" style="margin: 15px 95px 15px 95px ;border-collapse: separate; border-spacing: <?php echo ((strtolower($info['flight_type']) == 'system' ? '0 0' : '10px 0')) ?>; "
                       class="page">

                    <tr style="padding-top:25px;">
                        <td style="padding:15px;" <?php $info['api_id'] != 14 ? "width='100%'" :" width='50%'"?> class="divborder">
                            <?php if($_GET['lang'] == 'fa'){ ?>
                                <h3>راهنمای ابطال و استرداد بلیط</h3>

                                <ul>
                                    <li><span style="font-size:14px !important">در صورتی که به هر دلیلی بلیط شما کنسل شود مبلغ آن حداکثر در 72 ساعت از زمان درخواست به کیف پول شما واریز میشود</span></li>
                                    <li><span style="font-size:14px !important;">شما به کیف پول خود میتوانید مجددا اقدام به خرید کنید و یا درخواست واریز به حساب خود را ثبت نمایید</span></li>
                                </ul>
                            <?php }else{ ?>
                                <h3>Ticket cancellation and refund guide</h3>

                                <ul>
                                    <li><span style="font-size:14px !important">If your ticket is canceled for any reason, the amount will be credited to your wallet within 72 hours of the request.</span></li>
                                    <li><span style="font-size:14px !important;">You can make purchases again with your wallet or request a deposit to your account.</span></li>
                                </ul>
                            <?php } ?>
                        </td>

                        <?php
                        if(strtolower($info['flight_type'])  != 'system' && $info['api_id'] != 14) {
                            ?>

                            <td style="padding:15px; text-align:right;" width="50%" class="divborder">
                                <?php if($_GET['lang'] == 'fa'){ ?>
                                    <h3>قوانین کنسلی</h3>

                                    <ul>
                                        <li><span style="font-size:14px !important">ﻗﻮاﻧﻴﻦ کنسلی پروازهای چارتری ﺑﺮ اﺳﺎس ﺗﻔﺎﻫﻢ چارتر ﻛﻨﻨﺪه و ﺳﺎزﻣﺎن هواپیمایی ﻛﺸﻮری می ﺑﺎﺷﺪ</span></li>
                                    </ul>
                                <?php }else{ ?>
                                    <h3>Cancellation rules</h3>

                                    <ul>
                                        <li><span style="font-size:14px !important">Cancellation rules for charter flights are based on an agreement between the charterer and the national airline.</span></li>
                                    </ul>
                                <?php } ?>
                            </td>
                            <?php

                        }

                        ?>


                    </tr>

                    <tr><td colspan="2" style="height:10px;"></td></tr>
                </table>

                <div style="
                <?php
                if (CLIENT_ID == '166') {
                    echo 'display:none;';
                }
                if(strtolower($info['flight_type']) != 'system'){
                    echo 'margin-top:35%';
                }
                if(strtolower($info['flight_type']) == 'system'){
                    echo 'margin-top:30%';
                }
                ?>
                    ">
                    <?php if($StampAgency != ROOT_ADDRESS_WITHOUT_LANG.'/pic/'){ ?>
                        <div style='width: 90%' >
                            <img src="<?php echo $StampAgency ?>" height="100" style="max-width: 230px; float: left; margin: 0 -50px 0 0">
                        </div>
                    <?php } ?>
                    <hr style="margin: <?php echo ($StampAgency != ROOT_ADDRESS_WITHOUT_LANG.'/pic/') ? '10px' : '100px';?> 100px 5px 100px ; width: 90%"/>
                    <table width="100%" align="center" style="width:100%; margin: 10px 100px <?php echo ($info['request_cancel'] !='confirm' && $cash=='no') ? '20px' : '10px'?> 50px ;    font-size: 17px" scellpadding="0"
                           cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <?= $_GET['lang'] == 'fa' ? 'آدرس :' : 'Address:'; ?>
                                <?php echo $getSubAgencyInfo['address_fa']; ?>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:15px">
                                <?= $_GET['lang'] == 'fa' ? 'وب سایت :' : 'Website:'; ?>
                                <?php echo $ClientMainDomain; ?>

                            </td>
                            <td style="padding-top:15px">
                                <?= $_GET['lang'] == 'fa' ? ' تلفن پشتیبانی :' : 'Support phone:'; ?>

                                <?php echo $phone; ?>
                            </td>
                            <?php if($info_ticket[0]['agency_id']) {?>
                                <td style="padding-top:15px">
                                    <?= $_GET['lang'] == 'fa' ? 'تلفن کانتر فروش :' : 'Sales counter telephone:'; ?>

                                    <?php echo $PhoneManage; ?>
                                </td>
                            <?php  } ?>
                        </tr>


                    </table>

                </div>





                <?php  } ?>
            </body>
            </html>
            <?php
        } else {
            echo '<div style = "text-align:center ; fon-size:20px ;font-family: iransans;" > اطلاعات مورد نظر موجود نمی باشد </div > ';
        }

        return $PrintTicket = ob_get_clean();
    }
}