<?php

require '../config/bootstrap.php';
require CONFIG_DIR . 'config.php';
require LIBRARY_DIR . 'Load.php';
require CONFIG_DIR . 'application.php';
spl_autoload_register(array('Load', 'autoload'));

class ModalCreatorForHotel
{

    public $Controller;
    public $Method;
    public $target;
    public $id;

    public function __construct()
    {

        $this->Controller = $_POST['Controller'];
        $Method = $_POST['Method'];
        $Param = $_POST['Param'];

        self::$Method($Param);
    }

    public function ModalShow($Param)
    {

        $objbook = Load::controller($this->Controller);
        $Hotel = $objbook->info_hotel_client($Param);

        ?>

        <div class="modal-header site-bg-main-color">
            <span class="close" onclick="modalClose('<?php echo $Param; ?>')">&times;</span>
            <h6 class="modal-h">  <?php echo functions::Xmlinformation("Viewhotelpurchasetobookingnumber"); ?>:<?php echo $Param; ?> </h6>
        </div>

        <div class="modal-body">

            <?php
            foreach ($Hotel as $key => $view) {
                if ($key < 1) {
                    ?>
                    <div class="row margin-both-vertical-20">
                        <div class="col-md-12 modal-text-center modal-h"><span> <?php echo functions::Xmlinformation("Specifications"); ?> <?php echo $view['hotel_name'] ?></span></div>
                    </div>

                    <div class="row">

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("City"); ?> : </span>
                            <span><?php echo $view['city_name'] ?></span>
                        </div>

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("Hotel"); ?> : </span>
                            <span><?php echo $view['hotel_name'] ?></span>
                        </div>

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("Stayigtime"); ?> : </span>
                            <span><?php echo $view['number_night'] ?></span>
                        </div>

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("Amount"); ?> : </span>
                            <span><?php echo number_format(functions::calcDiscountCodeByFactor($view['total_price'], $Param)) ?> <?php echo functions::Xmlinformation("Rial"); ?></span>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("HotelBookingDate"); ?> : </span>
                            <span dir="rtl"><?php echo $objbook->set_date_reserve($view['payment_date']) ?></span>
                        </div>

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("Enterdate"); ?> : </span>
                            <span dir="rtl"><?php echo $view['start_date'] ?></span>
                        </div>

                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("Exitdate"); ?> : </span>
                            <span dir="rtl"><?php echo $view['end_date'] ?></span>
                        </div>
                        <div class="col-md-3 ">
                            <span><?php echo functions::Xmlinformation("Status"); ?> : </span>
                            <span dir="rtl">
                            <?php
                            if ($view['status'] == 'BookedSuccessfully') {
                                echo functions::Xmlinformation('Definitivereservation');
                            } elseif ($view['status'] == 'bank') {
                                echo functions::Xmlinformation('RedirectPayment');
                            } elseif ($view['status'] == 'PreReserve') {
                                echo functions::Xmlinformation('Prereservation');
                            }elseif ($view['status'] == 'OnRequest') {
                                echo functions::Xmlinformation('OnRequestedHotel');
                            } elseif ($view['status'] == 'Cancelled') {
                                echo functions::Xmlinformation('Cancel');
                            } else {
                                echo functions::Xmlinformation('Unknow');
                            }
                            ?>
                        </span>
                        </div>

                    </div>

                    <?php if (!empty($view['passenger_name']) || !empty($view['passenger_name_en'])){ ?>

                        <div class="row margin-top-10">
                            <div class="col-md-12 modal-text-center modal-h"><span><?php echo functions::Xmlinformation("Travelerprofile"); ?></span></div>
                        </div>
                    <?php }else { ?>
                        <div class="row margin-top-10">
                            <div class="col-md-12 modal-text-center modal-h">
                                <span><?php echo functions::Xmlinformation("HeadOfRoom"); ?>: <?php echo $view['passenger_leader_room_fullName'] ?></span>
                            </div>
                        </div>
                    <?php } ?>


                <?php } ?>

                <?php if (!empty($view['passenger_name']) || !empty($view['passenger_name_en'])){ ?>
                    <div class="row modal-padding-bottom-15">
                        <div class="col-md-3"><span><?php echo functions::Xmlinformation("Room"); ?> : </span><span><?php echo $view['room_name'] ?></span>
                        </div>
                        <div class="col-md-3">
                            <span><?php echo functions::Xmlinformation("Namefamily"); ?> :</span><span>
                                <?php
                                if (!empty($view['passenger_name'])){
                                    echo $view['passenger_name'] . ' ' . $view['passenger_family'];
                                } elseif (!empty($view['passenger_name_en'])){
                                    echo $view['passenger_name_en'] . ' ' . $view['passenger_family_en'];
                                }
                                ?>
                            </span>
                        </div>
                        <div class="col-md-3">
                            <span><?php echo functions::Xmlinformation("Nationalnumber"); ?>/<?php echo functions::Xmlinformation("Passport"); ?>:</span><span><?php echo (!empty($view['passenger_national_code'])) ? $view['passenger_national_code'] : $view['passportNumber'] ?></span>
                        </div>
                        <div class="col-md-3">
                            <span><?php echo functions::Xmlinformation("DateOfBirth"); ?>: </span><span dir="rtl"><?php echo (!empty($view['passenger_birthday'])) ? $view['passenger_birthday'] : $view['passenger_birthday_en'] ?></span>
                        </div>
                    </div>

                <?php }else { ?>
                    <div class="row modal-padding-bottom-15">
                        <div class="col-md-12">
                            <span><?php echo functions::Xmlinformation("Room"); ?> : </span><span><?php echo $view['room_name'] ?></span>
                        </div>
                    </div>
                <?php } ?>


            <?php } ?>




            <?php if ($Hotel[0]['type_application'] == 'reservation' && $Hotel[0]['origin'] != '') { ?>
                <div class="row margin-top-10">
                    <div class="col-md-12 modal-text-center modal-h"><span><?php echo functions::Xmlinformation("Informationtravel"); ?></span></div>
                </div>
                <div class="row modal-padding-bottom-15">
                    <div class="col-md-6">
                        <span><?php echo functions::Xmlinformation("Origin"); ?> : </span><span></span>
                    </div>
                    <div class="col-md-6">
                        <span><?php echo functions::Xmlinformation("Destination"); ?> :</span><span><?php echo $Hotel[0]['origin'] ?></span>
                    </div>
                </div>
                <div class="row modal-padding-bottom-15">
                    <div class="col-md-3"><span> <?php echo functions::Xmlinformation('NameTransport')?>:</span><span><?php echo $Hotel[0]['airline_went'] ?></span></div>
                    <div class="col-md-3"><span> <?php echo functions::Xmlinformation('Numflight')?>: </span><span><?php echo $Hotel[0]['flight_number_went'] ?></span></div>
                    <div class="col-md-3"><span> <?php echo functions::Xmlinformation('Starttime')?>: </span><span><?php echo $Hotel[0]['hour_went'] ?></span></div>
                    <div class="col-md-3"><span> <?php echo functions::Xmlinformation('Wentdate')?>: </span><span><?php echo $Hotel[0]['flight_date_went'] ?></span></div>
                </div>
                <div class="row modal-padding-bottom-15">
                    <div class="col-md-3"><span><?php echo functions::Xmlinformation('NameTransport')?> :</span><?php echo $Hotel[0]['airline_back'] ?><span></span></div>
                    <div class="col-md-3"><span><?php echo functions::Xmlinformation('Numflight')?> : </span><span><?php echo $Hotel[0]['flight_number_back'] ?></span></div>
                    <div class="col-md-3"><span><?php echo functions::Xmlinformation('Returntime')?> : </span><span><?php echo $Hotel[0]['hour_back'] ?></span></div>
                    <div class="col-md-3"><span><?php echo functions::Xmlinformation('Datewentback')?>: </span><span><?php echo $Hotel[0]['flight_date_back'] ?></span></div>
                </div>
            <?php } ?>



            <?php if ($Hotel[0]['type_application'] == 'reservation' && $objbook->showOneDayTour == 'True'){
                ?>
                <div class="row margin-top-10">
                    <div class="col-md-12 modal-text-center modal-h"><span><?php echo functions::Xmlinformation('AuthToureOneDay')?></span></div>
                </div>
                <?php
                foreach ($objbook->listOneDayTour as $val){
                    ?>
                    <div class="row modal-padding-bottom-15">
                        <div class="col-md-6">
                            <span> <?php echo functions::Xmlinformation('Title')?>: </span><span><?php echo $val['title'] ?></span>
                        </div>
                        <div class="col-md-6">
                            <span> <?php echo functions::Xmlinformation('Price')?>:</span><span><?php echo $val['price'] ?></span>
                        </div>
                    </div>
                <?php }
            } ?>
        </div>

        <div class="modal-footer site-bg-main-color"></div>

        <?php

    }



    public function ModalShowBook($Param)
    {
        $objDiscountCode = Load::controller('discountCodes');
        $objbook = Load::controller($this->Controller);
        $Hotel = $objbook->info_hotel_client($Param, TYPE_ADMIN);
        ?>
        <div class="modal-dialog modal-lg modal-dialog-centered hotel-modal">
            <div class="modal-content">

                <!-- ===== هدر ===== -->
                <div class="modal-header hotel-modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="header-icon">
                        <i class="fa fa-hotel"></i>
                    </div>
                    <div>
                        <h4 class="modal-title">مشخصات رزرو هتل</h4>
                        <small class="header-subtitle">
                            <i class="fa fa-user"></i> <?php echo !empty($Hotel[0]['member_name']) ? 'کاربر اصلی : ' . $Hotel[0]['member_name'] : 'کاربر مهمان'; ?>
                        </small>
                    </div>
                </div>

                <div class="modal-body hotel-modal-body">

                    <?php
                    foreach ($Hotel as $key => $view) {
                        if ($key < 1) {

                            $statusColor = [
                                'BookedSuccessfully' => '#28a745',
                                'pending' => '#ffc107',
                                'Requested' => '#17a2b8',
                                'RequestAccepted' => '#28a745',
                                'RequestRejected' => '#dc3545',
                                'canceled' => '#6c757d',
                                'PreReserve' => '#fd7e14',
                                'NoReserve' => '#ff7676',
                                'bank' => '#707cd2',
                            ];
                            $statusText = [
                                'BookedSuccessfully' => 'رزرو قطعی',
                                'pending' => 'در انتظار',
                                'Requested' => 'درخواست شده',
                                'RequestAccepted' => 'تایید شده',
                                'RequestRejected' => 'رد شده',
                                'canceled' => 'لغو شده',
                                'credit' => 'انتخاب اعتباری',
                                'bank' => 'هدایت به درگاه',
                                'PreReserve' => 'پیش رزرو',
                                'NoReserve' => 'خطای پروایدر'
                            ];
                            $currentStatus = $view['status'] ?? 'PreReserve';
                            ?>

                            <!-- ===== STATUS CARD ===== -->
                            <div class="hotel-status-card">
                                <div>
                                    <span class="voucher-label">شماره واچر :</span>
                                    <span class="voucher-number"><?php echo $view['request_number']; ?></span>
                                </div>
                                <div>
                                <span class="hotel-status-badge" style="background: <?php echo $statusColor[$currentStatus] ?? '#6c757d'; ?>;">
                                    <i class="fa fa-circle"></i>
                                    <?php echo $statusText[$currentStatus] ?? $currentStatus; ?>
                                </span>
                                </div>
                            </div>

                            <!-- ===== CARD: مشخصات کاربر ===== -->
                            <div class="hotel-info-card border-user">
                                <div class="hotel-card-header">
                                    <div class="card-icon icon-user"><i class="fa fa-user"></i></div>
                                    <h5 class="card-title">مشخصات کاربر</h5>
                                </div>
                                <div class="hotel-card-grid">
                                    <div class="grid-item">
                                        <div class="label">نام و نام خانوادگی</div>
                                        <div class="value"><?php echo $view['member_name']; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">شماره موبایل</div>
                                        <div class="value"><?php echo $view['member_mobile']; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">ایمیل</div>
                                        <div class="value"><?php echo $view['member_email']; ?></div>
                                    </div>
                                </div>
                            </div>

                            <!-- ===== CARD: اطلاعات خریدار ===== -->
                            <div class="hotel-info-card border-buyer">
                                <div class="hotel-card-header">
                                    <div class="card-icon icon-buyer"><i class="fa fa-shopping-cart"></i></div>
                                    <h5 class="card-title">اطلاعات خریدار</h5>
                                </div>
                                <div class="hotel-card-grid">
                                    <div class="grid-item">
                                        <div class="label">نام</div>
                                        <div class="value"><?php echo $view['passenger_leader_room_fullName']; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">موبایل</div>
                                        <div class="value"><?php echo $view['passenger_leader_room']; ?></div>
                                    </div>
                                    <?php if($view['passenger_leader_room_email']){ ?>
                                        <div class="grid-item">
                                            <div class="label">ایمیل</div>
                                            <div class="value"><?php echo $view['passenger_leader_room_email']; ?></div>
                                        </div>
                                    <?php } ?>
                                    <?php if($view['passenger_leader_room_postalcode']){ ?>
                                        <div class="grid-item">
                                            <div class="label">کدپستی</div>
                                            <div class="value"><?php echo $view['passenger_leader_room_postalcode']; ?></div>
                                        </div>
                                    <?php } ?>
                                    <?php if($view['passenger_leader_room_address']){ ?>
                                        <div class="grid-item full-width">
                                            <div class="label">آدرس</div>
                                            <div class="value"><?php echo $view['passenger_leader_room_address']; ?></div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>

                            <!-- ===== CARD: مشخصات پرداخت ===== -->
                            <div class="hotel-info-card border-payment">
                                <div class="hotel-card-header">
                                    <div class="card-icon icon-payment"><i class="fa fa-credit-card"></i></div>
                                    <h5 class="card-title">مشخصات پرداخت</h5>
                                </div>
                                <div class="hotel-card-grid">
                                    <?php if($view['status']=='BookedSuccessfully' || $view['status']=='pending'){ ?>
                                        <div class="grid-item">
                                            <div class="label">تاریخ پرداخت</div>
                                            <div class="value"><?php echo($view['payment_date'] != '' ? functions::set_date_payment($view['payment_date']) : 'پرداخت نشده'); ?></div>
                                        </div>
                                        <?php if ($view['payment_date'] != ''){ ?>
                                            <div class="grid-item">
                                                <div class="label">نوع پرداخت</div>
                                                <div class="value"><?php echo ($view['payment_type'] == 'cash') ? 'نقدی' : 'اعتباری'; ?></div>
                                            </div>
                                            <div class="grid-item">
                                                <div class="label">کد پیگیری</div>
                                                <div class="value"><?php echo !empty($view['tracking_code_bank']) ? $view['tracking_code_bank'] : 'ندارد'; ?></div>
                                            </div>
                                        <?php } ?>
                                    <?php } else { ?>
                                        <div class="grid-item">
                                            <div class="label">تاریخ پرداخت</div>
                                            <div class="value">پرداخت نشده</div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>

                            <!-- ===== CARD: مشخصات هتل ===== -->
                            <div class="hotel-info-card border-hotel">
                                <div class="hotel-card-header">
                                    <div class="card-icon icon-hotel"><i class="fa fa-hotel"></i></div>
                                    <h5 class="card-title">مشخصات هتل</h5>
                                </div>
                                <div class="hotel-card-grid">
                                    <div class="grid-item">
                                        <div class="label">نام هتل</div>
                                        <div class="value"><?php echo $view['hotel_name']; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">شهر</div>
                                        <div class="value"><?php echo $view['city_name']; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">مدت اقامت</div>
                                        <div class="value"><?php echo $view['number_night'] . ' شب'; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">تاریخ ورود</div>
                                        <div class="value"><?php echo $view['start_date']; ?></div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">تاریخ خروج</div>
                                        <div class="value"><?php echo $view['end_date']; ?></div>
                                    </div>
                                    <?php if ($view['payment_status'] != '') { ?>
                                        <div class="grid-item">
                                            <div class="label">مبلغ پیش پرداخت</div>
                                            <div class="value"><?php echo number_format($view['hotel_payments_price']); ?> ریال</div>
                                        </div>
                                        <div class="grid-item">
                                            <div class="label">مبلغ باقی مانده</div>
                                            <div class="value"><?php echo number_format($view['total_price'] - $view['hotel_payments_price']); ?> ریال</div>
                                        </div>
                                    <?php } else { ?>
                                        <div class="grid-item">
                                            <div class="label">مبلغ پرداختی</div>
                                            <div class="value"><?php echo number_format($view['total_price']); ?> ریال</div>
                                        </div>
                                    <?php } ?>
                                    <?php if (!empty($view['hotel_confirm_code'])) { ?>
                                        <div class="grid-item">
                                            <div class="label">کد کانفرم هتل</div>
                                            <div class="value"><?php echo $view['hotel_confirm_code']; ?></div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>

                            <!-- ===== CARD: مشخصات مسافرین ===== -->
                            <div class="hotel-info-card border-passenger">
                                <div class="hotel-card-header">
                                    <div class="card-icon icon-passenger"><i class="fa fa-users"></i></div>
                                    <h5 class="card-title">مشخصات مسافرین (سرگروه اول هر اتاق)</h5>
                                </div>
                                <div class="hotel-card-grid">
                                    <div class="grid-item">
                                        <div class="label">نام و نام خانوادگی</div>
                                        <div class="value">
                                            <?php
                                            if (!empty($view['passenger_name'])){
                                                echo $view['passenger_name'] . ' ' . $view['passenger_family'] . ' (' . ($view['passportCountry'] != 'IRN' && $view['passportCountry'] != '' ? $view['passportCountry'] : 'IRN') . ')';
                                            } elseif (!empty($view['passenger_name_en'])){
                                                echo $view['passenger_name_en'] . ' ' . $view['passenger_family_en'] . ' (' . ($view['passportCountry'] != 'IRN' && $view['passportCountry'] != '' ? $view['passportCountry'] : 'IRN') . ')';
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="label">شماره ملی/پاسپورت</div>
                                        <div class="value"><?php echo $view['passenger_national_code'] == '0000000000' ? $view['passportNumber'] : $view['passenger_national_code']; ?></div>
                                    </div>
                                    <?php if(!($view['source_id']==29)){ ?>
                                        <div class="grid-item">
                                            <div class="label">تاریخ تولد</div>
                                            <div class="value"><?php echo !empty($view['passenger_birthday']) ? $view['passenger_birthday'] : $view['passenger_birthday_en']; ?></div>
                                        </div>
                                    <?php } ?>
                                    <div class="grid-item">
                                        <div class="label">اتاق</div>
                                        <div class="value"><?php echo $view['room_count'] . ' باب ' . $view['room_name']; ?></div>
                                    </div>
                                </div>
                            </div>

                            <!-- ===== CARD: اطلاعات ترانسفر ===== -->
                            <?php
                            $transferData = json_decode($view['transfer_hotel'], true);
                            $vehicleTypes = ['flight'=>'پرواز', 'bus'=>'اتوبوس', 'train'=>'قطار', 'other'=>'سایر'];
                            ?>
                            <?php if($transferData && is_array($transferData) && (!empty($transferData['type_vehicle']) || !empty($transferData['type_vehicle_arrival']))): ?>
                                <div class="hotel-info-card border-transfer">
                                    <div class="hotel-card-header">
                                        <div class="card-icon icon-transfer"><i class="fa fa-exchange"></i></div>
                                        <h5 class="card-title">اطلاعات ترانسفر</h5>
                                    </div>
                                    <div class="hotel-transfer-wrapper">
                                        <?php if(!empty($transferData['type_vehicle']) || !empty($transferData['number_vehicle'])): ?>
                                            <div class="hotel-transfer-box border-enter">
                                                <h6 class="transfer-title enter"><i class="fa fa-arrow-down"></i> ترانسفر ورود</h6>
                                                <div class="transfer-grid">
                                                    <span class="label">نوع وسیله</span>
                                                    <span class="value"><?php echo $vehicleTypes[$transferData['type_vehicle']] ?? $transferData['type_vehicle'] ?? '-'; ?></span>
                                                    <span class="label">شماره وسیله</span>
                                                    <span class="value"><?php echo $transferData['number_vehicle'] ?? '-'; ?></span>
                                                    <span class="label">ساعت حرکت</span>
                                                    <span class="value"><?php echo $transferData['time_vehicle'] ?? '-'; ?></span>
                                                    <span class="label">شرکت حمل کننده</span>
                                                    <span class="value"><?php echo $transferData['carrier_company'] ?? '-'; ?></span>
                                                    <span class="label">شهر مبدا</span>
                                                    <span class="value"><?php echo $transferData['origin_city'] ?? '-'; ?></span>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        <?php if(!empty($transferData['type_vehicle_arrival']) || !empty($transferData['number_vehicle_arrival'])): ?>
                                            <div class="hotel-transfer-box border-exit">
                                                <h6 class="transfer-title exit"><i class="fa fa-arrow-up"></i> ترانسفر خروج</h6>
                                                <div class="transfer-grid">
                                                    <span class="label">نوع وسیله</span>
                                                    <span class="value"><?php echo $vehicleTypes[$transferData['type_vehicle_arrival']] ?? $transferData['type_vehicle_arrival'] ?? '-'; ?></span>
                                                    <span class="label">شماره وسیله</span>
                                                    <span class="value"><?php echo $transferData['number_vehicle_arrival'] ?? '-'; ?></span>
                                                    <span class="label">ساعت حرکت</span>
                                                    <span class="value"><?php echo $transferData['time_vehicle_arrival'] ?? '-'; ?></span>
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                    </div>
                                </div>
                            <?php endif; ?>

                            <?php
                            // ======== دکمه‌های وضعیت ========
                            if ($view['status'] == 'Requested' && $view['payment_status'] != '') { ?>
                                <div class="hotel-modal-footer">
                                    <div class="btn-confirm-wrapper">
                                        <div>
                                            <label class="code-label">کد کانفرم هتل</label>
                                            <input class="code-input" name="ConfirmAdminRequestedPrereserveHotelUserCode" id="ConfirmAdminRequestedPrereserveHotelUserCode">
                                        </div>
                                        <button type="button" class="btn btn-success" onclick="ConfirmAdminRequestedPrereserveHotelUser('<?php echo $view['factor_number']; ?>')">
                                            <i class="fa fa-check"></i> تایید پیش پرداخت
                                        </button>
                                    </div>
                                    <button type="button" class="btn btn-danger" onclick="RejectAdminRequestedPrereserveHotelUser('<?php echo $view['factor_number']; ?>')">
                                        <i class="fa fa-times"></i> عدم تایید
                                    </button>
                                </div>
                            <?php } elseif($view['status'] == 'RequestAccepted' && $view['payment_status'] != ''){ ?>
                                <div class="hotel-modal-footer">
                                    <button type="button" class="btn btn-success btn-success-disabled">
                                        <i class="fa fa-check-circle"></i> پیش رزرو توسط ادمین تایید شد
                                    </button>
                                </div>
                            <?php } elseif($view['status'] == 'RequestRejected' && $view['payment_status'] != ''){ ?>
                                <div class="hotel-modal-footer">
                                    <button type="button" class="btn btn-danger btn-danger-disabled">
                                        <i class="fa fa-times-circle"></i> پیش رزرو توسط ادمین رد شد
                                    </button>
                                </div>
                            <?php } ?>

                        <?php } ?>
                    <?php } ?>

                </div>
            </div>
        </div>
        <?php
    }

    public function ModalShowEditBookHotel($Param)
    {

        $objbook = Load::controller($this->Controller);
        $edit = $objbook->infoEditBookingHotel($Param, TYPE_ADMIN);
        //echo Load::plog($edit);

        $hotel = functions::GetInfoHotel($Param);
        ?>

        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header site-bg-main-color">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">مشاهده ویرایش های رزرو هتل
                        &nbsp; <?php echo !empty($hotel['member_name']) ? 'کاربر اصلی ' : 'کاربرمهمان'; ?>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="row margin-both-vertical-20">
                        <div class="col-md-12 text-center text-bold " style="color: #fb002a;"><span> مشخصات <?php echo $hotel['hotel_name'] ?></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 ">
                            <span>شهر : </span>
                            <span><?php echo $hotel['city_name'] ?></span>
                        </div>
                        <div class="col-md-3 ">
                            <span>هتل : </span>
                            <span><?php echo $hotel['hotel_name'] ?></span>
                        </div>
                        <div class="col-md-3 ">
                            <span>مدت اقامت : </span>
                            <span><?php echo $hotel['number_night'] ?></span>
                        </div>
                        <div class="col-md-3 ">
                            <span>مبلغ : </span>
                            <span><?php echo number_format(functions::calcDiscountCodeByFactor($hotel['total_price'], $Param)) ?> ریال</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 ">
                            <span>تاریخ رزرو هتل : </span>
                            <span dir="rtl"><?php echo $objbook->set_date_reserve($hotel['payment_date']) ?></span>
                        </div>
                        <div class="col-md-3 ">
                            <span>تاریخ ورود : </span>
                            <span dir="rtl"><?php echo $hotel['start_date'] ?></span>
                        </div>
                        <div class="col-md-3 ">
                            <span>تاریخ خروج : </span>
                            <span dir="rtl"><?php echo $hotel['end_date'] ?></span>
                        </div>
                    </div>

                    <div class="row margin-both-vertical-20">
                        <div class="col-md-12 text-center text-bold " style="color: #fb002a;"><span>تغییرات انجام شده:</span>
                        </div>
                    </div>

                    <?php foreach ($edit as $key => $view) { ?>
                        <div class="row margin-both-vertical-20">
                            <div class="col-md-4"><span> تاریخ و ساعت تغییر: </span>
                                <span dir="rtl"><?php echo $objbook->set_date_reserve($view['creation_date']) ;?></span>
                                <span><?php echo $objbook->set_time_payment($view['creation_date']) ;?></span>
                            </div>
                            <div class="col-md-8">
                                <span>توضیحات: </span><span><?php echo $view['description'] ;?></span>
                            </div>
                        </div>
                    <?php } ?>

                </div>
            </div>

        </div>

        <?php

    }



    #region setCancelExternalHotel
    public function setCancelExternalHotel($factorNumber)
    {
        $objExternalHotel = Load::controller('resultExternalHotel');
        $resultCancel = $objExternalHotel->productCancelDetail($factorNumber);
        ?>
        <div class="modal-header site-bg-main-color">
            <div class="col-md-10">
                <h6 class="modal-h"><?php echo functions::Xmlinformation("Cancelpurchasebookingnumber")?><?= $factorNumber ?></h6>
            </div>
            <div class="col-md-2">
                <span class="close" onclick="modalClose()">×</span>
            </div>
        </div>

        <?php
        if ($resultCancel['error'] == false){
            ?>
            <div class="modal-body" style="overflow: initial;">
                <div class="modal-padding-bottom-15">

                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 reservation-cancellations-ticket">
                            <?php echo $resultCancel['message']; ?>
                        </div>
                    </div>

                    <?php if (functions::TypeUser(CLIENT_ID) == 'Ponline') { ?>
                        <div class="row">
                            <div class="col-md-12 modal-text-center modal-h ">
                                <label><?php echo functions::Xmlinformation("Pleaseenteryourinformationreturningmoneyyouraccount") ?></label>
                            </div>
                            <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12 nopad  " style="direction: rtl;margin: 10px">
                                <label style="float:right;"><?php echo functions::Xmlinformation("Cardnumber") ?></label>
                                <input class="form-control " type="text" id="cardNumber" name="cardNumber"
                                       style="float: right;margin-right: 10px">
                            </div>
                            <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12 nopad  " style="direction: rtl;margin: 10px">
                                <label style="float:right;"><?php echo functions::Xmlinformation("Namebankowner") ?></label>
                                <input class="form-control " type="text" id="accountOwner" name="accountOwner"
                                       style="float: right;margin-right: 10px">
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-12 col-xs-12 nopad  " style="direction: rtl;margin: 10px">
                                <label style="float:right;"><?php echo functions::Xmlinformation("Cardname") ?></label>
                                <input class="form-control " type="text" id="nameBank" name="nameBank"
                                       style="float: right;margin-right: 10px">
                            </div>
                        </div>
                    <?php } ?>


                    <div class="row">
                        <div class="col-md-4 col-lg-4 col-sm-12  nopad ">
                            <div class="col-md-1 col-lg-1 col-sm-12 col-xs-12 nopad">
                                <input class="form-control " type="checkbox" id="Ruls" name="Ruls" style="height: 40px">
                            </div>
                            <div class="col-md-11 col-lg-11 col-sm-12 col-xs-12 lh45">
                                <?php echo functions::Xmlinformation("Iam") ?> <a
                                        href="<?php echo URL_RULS ?>"
                                        style="margin-top: 5px"><?php echo functions::Xmlinformation("Seerules") ?></a> <?php echo functions::Xmlinformation("IhavestudiedIhavenoobjection") ?>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                            <div class="DescriptionReason showContentTextModal" style="display : none"></div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="modal-footer site-bg-main-color">
                <div class="col-md-12" style="text-align:left;">
                    <input class="close btn btn-primary btn-send-information"
                           onclick="requestCancelExternalHotel('<?= $factorNumber ?>')"
                           type="button" value="<?php echo functions::Xmlinformation("Sendinformation") ?>">
                </div>
            </div>
            <?php

        } else {
            ?>
            <div class="modal-body" style="overflow: initial;">
                <div class="modal-padding-bottom-15">
                    <div class="row">
                        <div class="col-md-12 modal-text-center modal-h">
                            <?php echo $resultCancel['message']; ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>


        <?php




    }
    #endregion

    #region setCancelExternalHotel
    public function ModalSetHotelInvoice($param)
    {

        if(isset($param) && $param != '' ) {

            ?>
            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header site-bg-main-color">
                        <div class="col-md-10">
                            <h6 class="modal-h">برای ثبت فاکتور رزرو انجام شده انجام شده موراد زیر را وارد کنید.</h6>
                        </div>
                        <div class="col-md-2">
                            <span class="close" onclick="modalClose()">×</span>
                        </div>
                    </div>
                    <div class="modal-body" style="overflow: initial;">
                        <div class="modal-padding-bottom-15">

                            <input type='hidden' name='tracking_code' id='tracking_code' value='<?php echo $param ?>'>
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12" >
                                    <label style="float:right;">واریز از</label>
                                    <input class="form-control " type="text" id="from_company" name="nameBank"
                                           style="float: right;margin-right: 10px">
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12" >
                                    <label style="float:right;">واریز به</label>
                                    <input class="form-control " type="text" id="to_company" name="to_company"
                                           style="float: right;margin-right: 10px">
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12" >
                                    <label style="float:right;">حساب مبدا</label>
                                    <input class="form-control " type="text" id="origin_account" name="origin_account"
                                           style="float: right;margin-right: 10px">
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                                    <label style="float:right;">حساب مقصد</label>
                                    <input class="form-control " type="text" id="destination_account" name="destination_account"
                                           style="float: right;margin-right: 10px">
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12" >
                                    <label style="float:right;">نام صاحب حساب</label>
                                    <input class="form-control " type="text" id="account_holder" name="account_holder"
                                           style="float: right;margin-right: 10px">
                                </div>
                                <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                                    <label style="float:right;">توضیحات</label>
                                    <input class="form-control " type="text" id="description" name="description"
                                           style="float: right;margin-right: 10px">
                                </div>
                                <div class="col-md-12" style="text-align:left;">
                                    <input class="close btn btn-primary btn-send-information"
                                           onclick="setPaymentData('<?php echo $param ?>')"
                                           type="button" value="<?php echo functions::Xmlinformation("Sendinformation") ?>">
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <?php
        }else{

            ?>
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header site-bg-main-color">
                        <div class="col-md-10">
                            <h6 class="modal-h">برای ثبت فاکتور خریدهای انتخاب شده موراد زیر را وارد کنید.</h6>
                        </div>
                        <div class="col-md-2">
                            <span class="close" onclick="modalClose()">×</span>
                        </div>
                    </div>
                    <div class="modal-body" style="overflow: initial;">
                        <div class="modal-padding-bottom-15">
                            <div class="row">
                                <div class="col-md-12 modal-text-center modal-h">
                                    شما برای ثبت فاکتور حداقل باید یک خرید را انتخاب کنید.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>

        <?php

    }
    #endregion



}

new ModalCreatorForHotel();
?>