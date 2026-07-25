{load_presentation_object filename="transaction" assign="objTransaction"}
{load_presentation_object filename="bookshow" assign="objbook"}
{load_presentation_object filename="viewLog" assign="objLog"}
{load_presentation_object filename="partner" assign="objPartner"}
{$objPartner->showedit($smarty.const.CLIENT_ID)}
{$objbook->ticket_sell_in_time()}
<div class="container-fluid" >
    <div class="row bg-title" style="margin-top:50px !important;">

        <!-- باکس هشدار سمت چپ (عریض تر) -->

        <div class="d-flex gap-5 justify-content-center align-items-center">

            <div class="">
                <div class="border border-ccc p-3 rounded-md d-flex justify-content-center" style="border-radius: 14px;font-size:13px">
                    <span> میزان اعتبار حساب شما: </span>
                    <p class="text-center m-0 p-0">
                        {assign var="total_credit" value=$objTransaction->getCredit()}
                        {$total_credit|number_format} ریال -{if $total_credit > 0}بستانکار{elseif $objAccountotal_credit< 0}بدهی{else}تسویه{/if}

                    </p>

                </div>
            </div>
            <div class="">
                <div class="border border-ccc p-3 rounded-md" style="border-radius: 14px;font-size:13px">
                    پیامک‌های اطلاع‌رسانی تغییرات رزرو به شماره
                    <a>{$objPartner->list['Mobile']}</a> ارسال می‌شود
                </div>
            </div>



        </div>
        <!-- خانه سمت راست (کوچیک تر) -->
        {*        <div class="col-lg-6 col-md-5 col-sm-5 col-xs-12 pull-right">*}
        {*            <ol class="breadcrumb FloatRight">*}
        {*                <li><a href="http://192.168.1.100/gds/itadmin/admin">خانه</a></li>*}
        {*            </ol>*}
        {*        </div>*}

    </div>
    {if $smarty.const.TYPE_ADMIN neq '1' && $smarty.const.CLIENT_ID neq '166'  && $smarty.const.memberIdCounterInAdmin eq ''}{*   domain safar360.com  تو پنل آآژنس و کانتر هم دیده نشود*}
        <div id="DivResultCurll" >
            <div id="DivDore1" class="BoxResultCurlAsli">

            </div>
            <div id="DivDore2" class="BoxResultCurlAsli">

            </div>
            <div id="DivDore3" class="BoxResultCurlAsli">

            </div>
        </div>
    {/if}

    <!-- ============================================================== -->
    <!-- Other sales widgets -->
    <!-- ============================================================== -->
    {if $smarty.const.TYPE_ADMIN != '1'}
        {include file="view/administrator/reports/alert_agency_exeed_limit_report.tpl"}
    {/if}
    {if $smarty.const.LANG_PANEL_ADMIN neq 'ar' && $smarty.const.LANG_PANEL_ADMIN neq 'en'}
        {include file="view/administrator/reports/user_module_reports.tpl"}
        {include file="view/administrator/reports/user_bookMarks_link.tpl"}
    {/if}
    {if $smarty.const.TYPE_ADMIN eq '1' && ($smarty.const.LANG_PANEL_ADMIN neq 'ar' && $smarty.const.LANG_PANEL_ADMIN neq 'en')}
        {include file="view/administrator/reports/agency_exceed_limit_report.tpl"}
        {include file="view/administrator/reports/WithoutHashIdWhmcs.tpl"}<!-- 1404/11/19 -->
        {include file="view/administrator/reports/closedCustomersForFactor.tpl"}<!-- 1404/10/17 -->
        {include file="view/administrator/reports/closedCustomersForFactor_admin.tpl"}<!-- 1404/10/19 -->
        {include file="view/administrator/reports/reportBuyFromIt.tpl"}<!-- 1404/05/13 -->
    {else}
        {include file="view/administrator/reports/wholeSystemSalesInformation.tpl"}<!-- 1404/04/16 -->
    {/if}
    {if $smarty.const.LANG_PANEL_ADMIN neq 'ar' && $smarty.const.LANG_PANEL_ADMIN neq 'en'}
        <div class="row white-box mx-1 border border-ccc" style="padding-top: 30px;">
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                <div class="panel panel-danger">
                    <div class="panel-heading TitleSectionsDashboard" style=" border-radius:14px">
                        <h6 style='font-weight: 500;font-size: 17px; color: #3c3939; '>
                            <i class="fa fa-exclamation-triangle"></i>
                            همکار گرامی به نکات زیر توجه فرمایید
                            <div class="pull-right">
                                <a href="#" data-perform="panel-collapse"><i class="ti-minus"></i></a>
                            </div>
                        </h6>
                    </div>
                    <div class="panel-wrapper collapse in" aria-expanded="true">
                        <div class="panel-body panel-body-top modern-notice">
                            <ul>
                                <li>
                                    نرم‌افزار سفر۳۶۰ هیچ ‌گونه فروش مستقیم خدمات گردشگری انجام نمی دهد و صرفاً بستر ارتباط اینترنتی میان شما و ارائه‌ دهندگان مختلف این خدمات را فراهم می‌سازد. بنابراین، هرگونه اختلال در قیمت، فرایند صدور، یا بازگشت مبلغ ناشی از کنسلی، بر عهده سرویس‌ دهنده مربوطه است. سفر۳۶۰ تنها پیگیری موضوع را از جانب شما انجام داده و هم ‌زمان اطلاعات کامل سرویس‌دهنده را در اختیار شما قرار می ‌دهد تا در صورت تمایل، شخصاً نیز امکان پیگیری داشته باشید.
                                </li>
                                <li>
                                    بعضا چارتر کنندگان اسم مسافر را در لیست مانیفست ایرلاین رد نمی کنند و یا با تاخیر این کار را انجام می دهند درصورتی که اسم مسافر شما در کانتر پرواز نبود سریعا با پشتیبانی ایران تکنولوژی تماس بگیرید.
                                </li>

                                <li>در زمانیکه سیستم شما به اندازه کافی شارژ ندارد، برای حفظ محرمانگی سیستم شما، ما به مشتری پیغام "متاسفانه سامانه در حال بروز رسانی می باشد لطفا کمی بعد مجددا تلاش نمائید" را نمایش می دهیم و این به آن معنا است که شما باید پنل خود را شارژ بفرمایید</li>

                                <li>پیامک تایید رزرو فقط در صورتی که پنل پیامکی خریداری و شارژ نموده باشید، برای مسافر ارسال خواهد شد</li>
                                <li>از آنجایی که تمام اطلاع رسانی های سیستم از طریق شماره موبایل ثبت شده در سیستم انجام میپذیرد، لطفا اطلاعات خود را از طریق لینک مشاهده پروفایل، اطلاعات خود را تکمیل نمائید </li>
                                <li>در تنظیم مارک آپ و تخفیف خدمات خود دقت بفرمایید تا اختلاف قیمت فاحشی با رقبا نداشته باشید. در نظر داشته باشید سود شما برای پروازهای چارتری همان مارک آپی است که انجام داده اید و در پروازهای سیستمی داخلی 80% کمیسیون ایرلاین و در پروازهای خارجی مارک آپی است که انجام داده اید</li>
                                <li>تامین کنندگان پرواز و هتل در ایران و دنیا بسیار زیاد میباشد و هرکدام قیمت و سیاست رزرو و کنسلی خود را دارند برای آگاهی از این سیاست ها
                                    <a href="https://www.iran-tech.com/whmcs/knowledgebase/409/-----------.html" target='_blank'>اینجا</a> را مطالعه کنید</li>

                                <li>در ایران و جهان سرویس دهندگان بسیار زیادی برای خدمات گردشگری وجود دارند. هیچ سرویس دهنده ای نمی تواند ادعا کند بهترین قیمت های جهان را دارد پس لطفا جهت دیدن مرجع قیمت هایی که به شما ارائه می دهیم همواره به سایت
                                    <a href="https://safar360.com" target="_blank">safar360.com</a>
                                    مراجعه بفرمایید.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="panel panel-info ">
                    {*                <div class="panel-heading TitleSectionsDashboard">*}
                    {*                    <h6 style='font-weight: 50;font-size: 17px; color: #3c3939; line-height: 20px;'>*}

                    {*                        میزان اعتبار حساب شما*}
                    {*                        <div class="pull-right"><a href="#" data-perform="panel-collapse"><i class="ti-minus"></i></a></div>*}
                    {*                    </h6>*}
                    {*                </div>*}
                    <div class="panel-wrapper collapse in panel-body-down" aria-expanded="true">
                        {*                    <div class="panel-body ">*}
                        {*                        <p class="OpacityZero">*}
                        {*                            {assign var="total_credit" value=$objTransaction->getCredit()}*}
                        {*                            {$total_credit|number_format} ریال -{if*}
                        {*                            $total_credit > 0}بستانکار{elseif $objAccountotal_credit< 0}بدهی{else}تسویه{/if}*}

                        {*                        </p>*}
                        {*                        <p class="text-center FontSize26">*}
                        {*                            {assign var="total_credit" value=$objTransaction->getCredit()}*}
                        {*                            {$total_credit|number_format} ریال -{if $total_credit > 0}بستانکار{elseif $objAccountotal_credit< 0}بدهی{else}تسویه{/if}*}

                        {*                        </p>*}
                        {*                        <p class="OpacityZero">*}
                        {*                            {assign var="total_credit" value=$objTransaction->getCredit()}*}
                        {*                            {$total_credit|number_format} ریال -{if*}
                        {*                            $total_credit > 0}بستانکار{elseif $objAccountotal_credit< 0}بدهی{else}تسویه{/if}*}

                        {*                        </p>*}
                        {*                        <p></p>*}
                        {*                    </div>*}

                        <style>
                            .help-download {
                                position: relative;
                                margin: 25px 0;
                                padding: 0;
                                background: linear-gradient(135deg, #f03c52 0%, #d42a40 50%, #ff6b81 100%);
                                border-radius: 16px;
                                box-shadow:
                                        0 10px 30px rgba(240, 60, 82, 0.25),
                                        inset 0 1px 0 rgba(255, 255, 255, 0.3);
                                color: white;
                                text-align: center;
                                cursor: pointer;
                                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                                overflow: hidden;
                                border: none;
                                text-decoration: none;
                                display: block;
                            }

                            .help-download::before {
                                content: '';
                                position: absolute;
                                top: 0;
                                left: -100%;
                                width: 100%;
                                height: 100%;
                                background: linear-gradient(90deg,
                                transparent,
                                rgba(255, 255, 255, 0.3),
                                transparent);
                                transition: left 0.6s ease;
                            }

                            .help-download:hover::before {
                                left: 100%;
                            }

                            .help-download:hover {
                                transform: translateY(-8px) scale(1.02);
                                box-shadow:
                                        0 20px 40px rgba(240, 60, 82, 0.4),
                                        0 0 0 1px rgba(255, 255, 255, 0.2);
                            }

                            .help-download:active {
                                transform: translateY(-2px) scale(1);
                            }

                            .help-download-content {
                                position: relative;
                                z-index: 2;
                                display: flex;
                                flex-direction: column;
                                align-items: center;
                                gap: 15px;
                                padding: 30px 25px;
                                background: rgba(0, 0, 0, 0.1);
                                backdrop-filter: blur(10px);
                            }

                            .help-download-icon {
                                width: 60px;
                                height: 60px;
                                background: rgba(255, 255, 255, 0.2);
                                border-radius: 50%;
                                padding: 12px;
                                backdrop-filter: blur(20px);
                                border: 1px solid rgba(255, 255, 255, 0.3);
                                transition: all 0.3s ease;
                            }

                            .help-download:hover .help-download-icon {
                                transform: scale(1.1) rotate(5deg);
                                background: rgba(255, 255, 255, 0.3);
                            }

                            .help-download-text {
                                display: flex;
                                flex-direction: column;
                                gap: 8px;
                            }

                            .help-download h3 {
                                margin: 0;
                                font-size: 20px;
                                font-weight: 700;
                                letter-spacing: -0.5px;
                                text-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
                                color: #fff;
                                line-height: 1.3;
                            }

                            .help-download p {
                                margin: 0;
                                font-size: 15px;
                                font-weight: 400;
                                line-height: 1.5;
                                color: rgba(255, 255, 255, 0.95);
                                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                            }

                            .help-download-cta {
                                display: flex;
                                align-items: center;
                                gap: 10px;
                                padding: 12px 24px;
                                background: rgba(255, 255, 255, 0.25);
                                border-radius: 50px;
                                border: 1px solid rgba(255, 255, 255, 0.4);
                                transition: all 0.3s ease;
                                margin-top: 5px;
                                backdrop-filter: blur(10px);
                            }

                            .help-download:hover .help-download-cta {
                                background: rgba(255, 255, 255, 0.35);
                                transform: translateX(5px);
                            }

                            .help-download-cta-text {
                                font-size: 14px;
                                font-weight: 600;
                                color: #fff;
                                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                            }

                            .help-download-arrow {
                                font-size: 18px;
                                transition: transform 0.3s ease;
                                font-weight: bold;
                                color: #fff;
                                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                            }

                            .help-download:hover .help-download-arrow {
                                transform: translateX(8px);
                            }

                            /* افکت شیشه‌ای (Glassmorphism) */
                            .help-download::after {
                                content: '';
                                position: absolute;
                                top: 0;
                                left: 0;
                                right: 0;
                                bottom: 0;
                                background: linear-gradient(135deg,
                                rgba(255, 255, 255, 0.15) 0%,
                                rgba(255, 255, 255, 0.08) 100%);
                                border-radius: 16px;
                                pointer-events: none;
                            }

                            /* استایل برای حالت موبایل */
                            @media (max-width: 768px) {
                                .help-download {
                                    margin: 20px 0;
                                    border-radius: 14px;
                                }

                                .help-download-content {
                                    padding: 25px 20px;
                                    gap: 12px;
                                }

                                .help-download-icon {
                                    width: 50px;
                                    height: 50px;
                                    padding: 10px;
                                }

                                .help-download h3 {
                                    font-size: 18px;
                                }

                                .help-download p {
                                    font-size: 14px;
                                }

                                .help-download-cta {
                                    padding: 10px 20px;
                                }
                            }

                            /* انیمیشن ورود */
                            @keyframes fadeInUp {
                                from {
                                    opacity: 0;
                                    transform: translateY(30px);
                                }
                                to {
                                    opacity: 1;
                                    transform: translateY(0);
                                }
                            }

                            .help-download {
                                animation: fadeInUp 0.6s ease-out;
                            }

                            /* بهبود خوانایی متن */
                            .help-download * {
                                text-rendering: optimizeLegibility;
                                -webkit-font-smoothing: antialiased;
                                -moz-osx-font-smoothing: grayscale;
                            }

                            .custom-alert {
                                font-size: 12px;
                                color: #2c3e50;
                                background: linear-gradient(135deg, #ffefba, #ffffff); /* گرادیان ملایم */
                                padding: 12px 8px;
                                border-radius: 16px;
                                border: 1px solid #f1c40f;
                                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
                                overflow: hidden;
                                line-height: 1.5;
                                transition: transform 0.3s ease, box-shadow 0.3s ease;
                            }
                            .bg-title {
                                background: #fff;
                                overflow: hidden;
                                padding: 8px !important;
                                margin-bottom: 24px;
                                margin-left: -25.5px;
                                margin-right: -25.5px;
                            }

                            .custom-alert:hover {
                                transform: translateY(-2px);
                                box-shadow: 0 6px 18px rgba(0,0,0,0.12);
                            }

                            .phone-number {
                                color: #e67e22;
                                font-weight: 600;
                                text-decoration: none;
                            }

                            .phone-number:hover {
                                text-decoration: underline;
                            }
                        </style>

                        {*                    <a href="https://admin.chartertech.ir/gds/pic/panelHelp/panelHelp.html" target="_blank" class="help-download">*}
                        <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/panelHelp/panel_help" target="_blank" class="help-download">
                            <div class="help-download-content">
                                <svg class="help-download-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 16L12 8M12 16L9 13M12 16L15 13" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M8 12H6C4.89543 12 4 11.1046 4 10V6C4 4.89543 4.89543 4 6 4H18C19.1046 4 20 4.89543 20 6V10C20 11.1046 19.1046 12 18 12H16" stroke="white" stroke-width="2" stroke-linecap="round"/>
                                    <path d="M16 12V14C16 15.1046 16.8954 16 18 16C19.1046 16 20 15.1046 20 14V12" stroke="white" stroke-width="2" stroke-linecap="round"/>
                                </svg>

                                <div class="help-download-text">
                                    <h3>📚 راهنمای استفاده از صفحات مدیریت</h3>
                                    <p>لینک ها و دسترسی های مهم را پیدا کنید</p>
                                </div>

                                <div class="help-download-cta">
                                    <span class="help-download-cta-text">مشاهده راهنما</span>
                                    <div class="help-download-arrow">⟶</div>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
            </div>

        </div>
    {/if}
    <!-- .row -->

    <!-- ============================================================== -->
    <!-- Other sales widgets -->
    <!-- ============================================================== -->
    <!--
    <div class="row" style="direction: ltr !important;">
        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
            <div class="white-box">
                <h3 class="box-title pull-left">نمودار خرید در 12 روز گذشته</h3>
                <ul class="list-inline text-right">

                    <li>
                    <h5><i class="fa fa-circle m-r-5 text-danger"></i>میزان بازدید</h5>
                    </li>
                    <li>
                        <h5><i class="fa fa-circle m-r-5 text-info"></i>میزان خرید</h5>
                    </li>
                </ul>
                <div id="ct-visits" style="height: 285px;"></div>
            </div>
        </div>

    </div>
    -->

    {* {if $smarty.const.TYPE_ADMIN eq '1'}
         <div class="row" style="direction: ltr !important;">
             <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                 <div class="white-box">
                     <h3 class="box-title pull-left">نمودارتعداد خرید به تفکیک نوع خرید در 12 روز گذشته</h3>
                     <ul class="list-inline text-right">

                         <li>
                             <h5><i class="fa fa-circle m-r-5 " style=" color: #d70206"></i>چارتری</h5>
                         </li>
                         <li>
                             <h5><i class="fa fa-circle m-r-5" style=" color:#f1664d"></i>سیستمی اشتراکی</h5>
                         </li>
                         <li>
                             <h5><i class="fa fa-circle m-r-5" style=" color:#f4c63d"></i>سیستمی اختصاصی</h5>
                         </li>
                     </ul>
                     <div id="CountTicketType" style="height: 285px;"></div>
                 </div>
             </div>

         </div>
     {/if}
     *}
    <!-- ============================================================== -->
    <!-- Other sales widgets -->
    <!-- ============================================================== -->
    <!--   <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box">
                <h3 class="box-title">تعداد کل بلیط های فروخته شده </h3>
                <ul class="list-inline two-part">
                    <li><i class="ti-ticket  text-info"></i></li>
                    <li class="text-right"><span class="counter yn">{$objbook->countTotal}</span></li>
                </ul>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box">
                <h3 class="box-title">تعداد بلیط های چارتری </h3>
                <ul class="list-inline two-part">
                    <li><i class="fa fa-ticket text-purple"></i></li>
                    <li class="text-right"><span class="counter yn">{$objbook->countTotalCharter}</span></li>
                </ul>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box">
                <h3 class="box-title">تعداد بلیط های سیستمی اشتراکی </h3>
                <ul class="list-inline two-part">
                    <li><i class="ti-tag text-danger"></i></li>
                    <li class="text-right"><span class="counter yn">{$objbook->countTotalSystem}</span></li>
                </ul>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box">
                <h3 class="box-title">تعداد بلیط های سیستمی اختصاصی </h3>
                <ul class="list-inline two-part">
                    <li><i class="ti-wallet text-success"></i></li>
                    <li class="text-right"><span class="counter yn">{$objbook->countTotalSystemPrivate}</span></li>
                </ul>
            </div>
        </div>
    </div>-->
    <!-- /.row -->
    <!--
        <div class="row">
        <div class="col-lg-6  col-md-6 col-sm-6 col-xs-12">
            <div class="white-box">
                <h3 class="box-title">فروش آژانس شما تا این لحظه </h3>
                <ul class="list-inline two-part">
                    <li class="hidden-xs hidden-sm"><i class="fa fa-money  text-info"></i></li>
                    <li class="text-right"><span class=" yn FontSize36">{$objbook->profit_sell_in_time()} ریال</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box">
                <h3 class="box-title">سود شما تا این لحظه </h3>
                <ul class="list-inline two-part">
                    <li class="hidden-xs hidden-sm"><i class="ti-money  text-purple"></i></li>
                    <li class="text-right"><span class=" yn FontSize36">{$objbook->profit_agency_and_it()} ریال</span>
                    </li>
                </ul>
            </div>
        </div>

    </div>-->
    <!-- /.row -->
    {*    {include file="view/administrator/reports/user_module_reports.tpl"}*}





    <div class='parent-toast-notifications TitleSectionsDashboard'>
        <div class='parent-icon-notifications'>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480H40c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24V296c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"/></svg>
        </div>
        <div class='parent-description-notifications'>
            <h3>همکار محترم،</h3>
            <h4>نرم‌افزار سفر 360 به امکانات جدیدی برای سئو مجهز شده است، از جمله:</h4>
            <ul>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>افزودن Title و Description</span>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>استفاده از تگ h1</span>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>اتصال صفحات به یکدیگر</span>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>آدرس‌دهی دلخواه (Slug)</span>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>Canonical Link</span>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>ایجاد متن سؤالات دلخواه در صفحات</span>
                </li>
                <li>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M320 256C320 344.4 248.4 416 160 416C71.63 416 0 344.4 0 256C0 167.6 71.63 96 160 96C248.4 96 320 167.6 320 256zM160 144C98.14 144 48 194.1 48 256C48 317.9 98.14 368 160 368C221.9 368 272 317.9 272 256C272 194.1 221.9 144 160 144z"/></svg>
                    <span>و...</span>
                </li>
            </ul>
            <div class='parent-support'>
                <p>برای اطلاع از چگونگی دسترسی به این امکانات، لطفاً با پشتیبانی ایران تکنولوژی تماس بگیرید.</p>
                <span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M375.8 275.2c-16.4-7-35.4-2.4-46.7 11.4l-33.2 40.6c-46-26.7-84.4-65.1-111.1-111.1L225.3 183c13.8-11.3 18.5-30.3 11.4-46.7l-48-112C181.2 6.7 162.3-3.1 143.6 .9l-112 24C13.2 28.8 0 45.1 0 64v0C0 295.2 175.2 485.6 400.1 509.5c9.8 1 19.6 1.8 29.6 2.2c0 0 0 0 0 0c0 0 .1 0 .1 0c6.1 .2 12.1 .4 18.2 .4l0 0c18.9 0 35.2-13.2 39.1-31.6l24-112c4-18.7-5.8-37.6-23.4-45.1l-112-48zM441.5 464C225.8 460.5 51.5 286.2 48.1 70.5l99.2-21.3 43 100.4L154.4 179c-18.2 14.9-22.9 40.8-11.1 61.2c30.9 53.3 75.3 97.7 128.6 128.6c20.4 11.8 46.3 7.1 61.2-11.1l29.4-35.9 100.4 43L441.5 464zM48 64v0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0s0 0 0 0"/></svg>
                            شماره تماس: 02188866609</span>
            </div>
        </div>
    </div>
</div>


{if $smarty.const.CLIENT_ID eq '149'}
    <div class="modal_video modal_video_active">
        <span class='modal_video_after'></span>
        <div class="modal_video_main">
            <button class="close_modal_video"><i class='fa fa-times'></i></button>
            <div class="h_iframe-aparat_embed_frame">
                <span style="display: block;padding-top: 57%"></span>
                <iframe src="https://www.aparat.com/video/video/embed/videohash/CPe27/vt/frame"></iframe>
            </div>
            {*        <video controls>*}
            {*            <source src="assets/plugins/videos/video_demo.mp4" type="video/mp4">*}
            {*        </video>*}
        </div>
    </div>
    <div class="btn_show_modal_parent">
        <div class="btn_show_modal_info">
        <span>
            <img src='assets/images/modal.png' alt=''>
             راهنمای مشاهده پنل مدیریت
        </span>
        </div>
        <div class='btn_show_modal d-none i-btn'>
            <i class='fa fa-video-camera'></i>
        </div>
    </div>
{/if}




{*<div id="popUpShow" ></div>*}



{*<div class="modal-backdrop fade in"></div>*}
<div class="modal fade"
     id="exampleModal_s"
     tabindex="1"
     role="dialog"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="i-section">
    <div class="i-info">
        <span> ویدیو آموزشی صفحه اصلی</span>
    </div>

    <a href="https://www.iran-tech.com/whmcs/knowledgebase/354/-.html" target="_blank" class="i-btn"></a>

</div>
<!-- /.container-fluid -->
<script src="assets/JsFiles/admin.js"></script>
<script src="assets/JsFiles/demoMovie.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
//        //ct-visits
        new Chartist.Line('#ct-visits', {
            labels: [

                {foreach $objFunctions->dateArray() as $i}
                '{$i}',
                {/foreach}

            ],
            series: [
                [
                    {foreach $objLog->showLog() as $j}
                    {$j['CountView']},
                    {/foreach}
                ],
                [
                    {foreach $objbook->ShowLogBuyTicket() as $k}

                    {if $smarty.const.TYPE_ADMIN eq '1'}{$k['reqNumber']*10}{else} {$k['reqNumber']}{/if},
                    {/foreach}
                ]

            ]

        }, {
            top: 0,

            low: 1,
            showPoint: true,

            fullWidth: true,
            plugins: [
                Chartist.plugins.tooltip()
            ],
            axisY: {
                labelInterpolationFnc: function (value) {
                    return value;
                }
            },
            showArea: true
        });

        new Chartist.Line('#CountTicketType', {
            labels: [

                {foreach $objFunctions->dateArray() as $i}
                '{$i}',
                {/foreach}

            ],
            series: [
                [
                    {foreach $objbook->CountTypeTicketCharter() as $j}
                    {$j['CountCharter']*10},
                    {/foreach}
                ],
                [
                    {foreach $objbook->CountTypeTicketSystemPublic() as $k}
                    {$k['CountPublicSystem']*10},
                    {/foreach}
                ],
                [
                    {foreach $objbook->CountTypeTicketSystemPrivate() as $M}
                    {$M['CountPrivateSystem']*10},
                    {/foreach}
                ]

            ]

        }, {
            top: 1,

            low: 0,
            showPoint: true,

            fullWidth: true,
            plugins: [
                Chartist.plugins.tooltip()
            ],
            axisY: {
                labelInterpolationFnc: function (value) {
                    return value;
                }
            },
            showArea: true
        });
    });
</script>
<style src="assets/css/Dashboar.css"></style>
{if $smarty.const.TYPE_ADMIN neq '1' && $smarty.const.CLIENT_ID neq '166'  && $smarty.const.memberIdCounterInAdmin eq ''}{* domain safar360.com  تو پنل آآژنس و کانتر هم دیده نشود*}
{literal}
    <script>
        $(document).ready(function(){
            function isFilled(val) {
                return typeof val === "string" && $.trim(val) !== "";
            }

            function hideAllSections() {
                $("#page-wrapper").remove();
                $(".sidebar-nav").remove();
                $(".slimScrollDiv").remove();
            }

            $.ajax({
                url: libraryPath + "CallCurllFactorIrantech.php",
                type: "GET",
                dataType: "json",
                success: function(response) {
                    console.log("AJAX Response:", response);
                    if (isFilled(response.error)) {
                        $("#DivResultCurll").css('display', 'block');
                        $("#ErrorCurllIrantech").html(response.error).show();
                        hideAllSections();
                        return;
                    } else {
                        $("#ErrorCurllIrantech").hide();
                    }

                    let html = "";
                    if (isFilled(response.dore1)) {
                        html += '<div class="BoxResultCurlAsli ' + response.ClassBoxDore1 + '">دوره 1: ' + response.dore1 + '</div>';
                    }
                    if (isFilled(response.dore2)) {
                        html += '<div class="BoxResultCurlAsli ' + response.ClassBoxDore2 + '">دوره 2: ' + response.dore2 + '</div>';
                    }
                    if (isFilled(response.dore3)) {
                        html += '<div class="BoxResultCurlAsli ' + response.ClassBoxDore3 + '">دوره 3: ' + response.dore3 + '</div>';
                    }

                    if (html !== "") {
                        $("#DivResultCurll").html(html).show();
                    } else {
                        $("#DivResultCurll").hide();
                        $(".bg-title").attr("style", "margin-top:5px !important;");
                    }

                    $("#ShowDivFactorIrantech").show();

                    // اگر هیچ دوره‌ای پر نشده بود، margin-top بده
                    if (!isFilled(response.dore1) && !isFilled(response.dore2) && !isFilled(response.dore3)) {
                        $("#page-wrapper").css('margin-top', '55px'); // مقدار دلخواه خودت
                    } else {
                        $("#page-wrapper").css('margin-top', '0'); // یا مقدار اولیه
                    }

                    if (response.stop_execution) {
                        hideAllSections();
                        return;
                    }
                },
                error: function() {
                    $("#DivResultCurll").css('display', 'block');
                    $(".BoxResultCurlAsli").hide();
                    $("#ErrorCurllIrantech").html('آیدی تیکت شما در بخش تمدید دامنه نیاز به تنظیم مجدد دارد. لطفا با شرکت تماس حاصل فرمائید').show();
                    hideAllSections();
                    return;
                }
            });
        });
    </script>
{/literal}
{else}
    <script>
        $(document).ready(function(){
            $(".report-accordion").attr("style", "margin-top:20px !important;");
        });
    </script>
{/if}
