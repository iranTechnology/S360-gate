{load_presentation_object filename="bookshowTest" assign="objbook"}
{load_presentation_object filename="bookhotelshow" assign="objRsult"}
{load_presentation_object filename="reportAgenciesSearch" assign="objSearch"}
<style>
    .select2-container {
        width: 100% !important;
        height: 100% !important;
    }
    .select2-container--default .select2-selection--single .select2-selection__arrow {
        height: 26px !important;
        width: 40px !important;
    }
    .select2-container--default .select2-selection--single {
        background: #eee !important;
        border: 1px solid #dcdcdc !important;
        height: 34px;
    }

    .bookings-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
        gap: 20px;
        /*padding: 15px;*/
        /*min-height: 400px;*/
        margin-top: 10px;
        width:100% !important;
    }

    .booking-card {
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        transition: all 0.3s ease;
        border: 1px solid #eef2f6;
        height: fit-content;

    }

    .booking-card:hover {
        transform: translateY(-3px);
        /*box-shadow: 0 8px 25px rgba(0,0,0,0.12);*/
    }

    .card-header-service {
        padding: 8px 5px;
        color: white;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .service-flight,.service-hotel, .service-insurance ,.service-bus ,.service-other  { background: #5E5E5E }

    .service-icon {
        font-size: 18px;
        background: rgba(255,255,255,0.2);
        width: 32px;
        height: 32px;
        border-radius: 50%;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        margin-right: 8px;
    }

    .service-name {
        font-size: 14px;
    }

    .card-badge {
        background: rgba(255,255,255,0.2);
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        display:none
    }

    .card-body {
        padding: 16px;
    }

    .info-item {
        display: flex;
        margin-bottom: 10px;
        padding-bottom: 8px;
        border-bottom: 1px dashed #f0f0f0;
        flex-wrap: wrap;
    }
    .info-item:last-child{
        border-bottom:0 !important;
        margin-bottom: 0 !important;
        padding-bottom: 0 !important;
    }

    .info-label {
        width: 100px;
        font-weight: 600;
        color: #6c757d;
        font-size: 12px;
    }

    .info-value {
        flex: 1;
        color: #2c3e50;
        font-size: 13px;
        word-break: break-word;
    }

    .status-badge {
        display: inline-block;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 500;
    }

    .status-warning {
        background: #ffecb3;
        color: #5c4400;
        font-weight: bold;
    }

    .status-info {
        background: #aee0e8;
        color: #07323b;
        font-weight: bold;
    }

    .status-success {
        background: #b8dfbe;
        color: #0a2e14;
        font-weight: bold;
    }

    .status-secondary {
        background: #cdd0d3;
        color: #1e2124;
        font-weight: bold;
    }

    .status-danger {
        background: #e9a2ad;
        color: #4a0a10;
        font-weight: bold;
    }

    .status-purple {
        background: #c4b5fd;
        color: #2e1065;
        font-weight: bold;
    }

    .card-loading {
        text-align: center;
        padding: 50px;
        grid-column: 1 / -1;
    }

    .card-spinner {
        width: 40px;
        height: 40px;
        border: 3px solid #f3f3f3;
        border-top: 3px solid #667eea;
        border-radius: 50%;
        animation: cardSpin 1s linear infinite;
        margin: 0 auto 10px auto;
    }

    @keyframes cardSpin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    .card-empty {
        text-align: center;
        padding: 50px;
        grid-column: 1 / -1;
        background: white;
        border-radius: 16px;
        font-size: 16px;
        color: #6c757d;
    }

    .counter-badge {
        background: #e9ecef;
        border-radius: 50px;
        padding: 5px 15px;
        font-size: 13px;
        font-weight: 500;
        display: inline-block;
        margin-bottom: 15px;
    }

    @media (max-width: 768px) {
        .bookings-container {
            grid-template-columns: 1fr;
            gap: 15px;
            padding: 10px;
        }

        .info-label {
            width: 100%;
            margin-bottom: 4px;
        }

        .info-item {
            flex-direction: column;
        }
    }
    /* استایل دکمه‌های فیلتر تاریخ */
    .btn-filter-date {
        background: #7b88f7 !important;
        color: white;
        border: none;
        width:fit-content !important;
        transition: all 0.2s;
        font-size:13px !important;
        border-radius: 5px !important;
    }

    .btn-filter-date:hover {
        background: #5a67d8;
        color:#fff !important;
        transform: translateY(-1px);
    }

    .btn-filter-date.active {
        color:#fff !important;
        background-color: #15b704 !important;
        transform: translateY(0);
    }

    /* برای نمایش بهتر دکمه‌ها در موبایل */
    @media (max-width: 768px) {
        .tabs_ticket-history .w-100 {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .tabs_ticket-history .btn {
            font-size: 12px;
            padding: 6px 12px;
        }
    }
</style>
<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li>گزارش خرید</li>
                <li class="active">خرید ها در یک  نگاه</li>
            </ol>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <!--<h4 class="page-title FloatLeft">Dashboard 3</h4>-->
        </div>
    </div>


    <div class="row">

        <div class="col-sm-12">

            <div class="white-box">

{*                <h3 class="box-title m-b-0">خرید ها در یک  نگاه</h3>*}


                <div class="table_history_admin">

                    <div class="w-100 tabs_ticket-history">
                        <div class="w-100">
                            <a data-target="allTicket"
                               data-info="pendingBtn" onclick="RenderBookingsAsCards($(this).attr('data-target'))"
                               class="btn btn-default waves-effect waves-light ld-ext-left d-none" type="button">
                                <span class="btn-label"><i class="fa fa-history"></i></span>همه خرید ها
                                <div class="ld ld-ring ld-spin"></div>
                            </a>
                            <input type="hidden" id="date_of" name="date_of" value="">
                            <input type="hidden" id="to_date" name="to_date" value="">
                            <button type="button" class="btn-filter-date active" onclick="filterByDays(0 , event)">
                               امروز (<span id="todayDate"></span>)
                            </button>

                            <button type="button" class="btn-filter-date " onclick="filterByDays(1 , event)">
                              دیروز (<span id="yesterdayDate"></span>)
                            </button>

                            <button type="button" class="btn-filter-date  " onclick="filterByDays(2 , event)">
                              دو روز قبل (<span id="twoDaysAgoDate"></span>)
                            </button>

                            <button type="button" class="btn-filter-date " onclick="filterByDays(3 , event)">
                               سه روز قبل (<span id="threeDaysAgoDate"></span>)
                            </button>
                        </div>
                    </div>


{*                    <div class="myTable01 table-responsive ld-over p-4 border w-100">*}
{*                        <div class="ld ld-ring ld-spin"></div>*}
{*                        *}{*                    <table id="mainTicketHistory" class="flyTableBody01 media02 w-100 table table-striped text-center">*}
{*                        *}{*                        این قسمت برای ثابت بودن هدر جداول بود*}
{*                        *}{*                    </table>*}
{*                        <table id="mainTicketHistory" class="flyTableBody w-100 table table-striped text-center">*}
{*                        </table>*}
{*                    </div>*}

{*                    <div id="resultCount" class="counter-badge" style="display: inline-block; margin-bottom: 15px;">0 رکورد</div>*}

                    <!-- کانتینر کارت‌ها -->
                    <div id="bookingsContainer" class="bookings-container">
                        <!-- کارت‌ها اینجا قرار می‌گیرند -->
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script type="text/javascript" src="assets/JsFiles/TitleSectionsDashboard"></script>
<script type="text/javascript" src="assets/JsFiles/bookshow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookExclusiveTourShow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookhotelshow.js"></script>
<script type="text/javascript" src="assets/JsFiles/reservationHotel.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookinsuranceshow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookvisashow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookGashtShow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookTourShow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookBusShow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookTrainShow.js"></script>
<script type="text/javascript" src="assets/JsFiles/bookCipShow.js"></script>

<script>
    RenderBookingsAsCards('allTicket');
    $(document).ready(function () {
        var interval = null;
        $('#AutoRefreshInput').change(function () {
            clearInterval(interval);
            var thiss = $(this);
            if(thiss.val() == '0'){
                clearInterval(interval);
            }
            if(thiss.val() >= '5')
            {
                interval = setInterval(function () {
                    ExecuteHistoryFilter($('a:not(.btn-default)[data-info=pendingBtn]').attr('data-target'));
                }, thiss.val() * 1000);
            }
            if(thiss.val() <= '5' && thiss.val() != 0)
            {
                thiss.val(5);
                clearInterval(interval);
                interval = setInterval(function () {
                    ExecuteHistoryFilter($('a:not(.btn-default)[data-info=pendingBtn]').attr('data-target'));
                }, thiss.val() * 1000);
            }
        });

        {if $smarty.const.TYPE_ADMIN eq '1'}
        setInterval(function () {
            CheckReserveHotelTab();
        }, 30000);
        {/if}


    });

</script>
