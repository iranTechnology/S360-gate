{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}
<!DOCTYPE html>

<html class="no-js" lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">

    <title>{$obj->Title_head()}</title>
    <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png"/>
    <meta name="description" content="{$obj->Title_head()}">
    <meta charset="UTF-8">
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    <!-- Main CSS files -->
    <link rel="stylesheet" href="project_files/css/baseFa.css">
    <!-- Animation CSS file -->
    <link rel="stylesheet" href="project_files/css/animate.css">
    <!-- custom CSS file -->
    <link rel="stylesheet" href="project_files/css/custom.css">
    <!-- plugin css file -->
    <link rel="stylesheet" href="project_files/css/plugin.css" >
    <link rel="stylesheet" href="project_files/css/responsive.css">
    <!-- jQuery Library files -->


    <!-- jQuery Library files -->
    <script src="project_files/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="project_files/js/modernizr.js"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>
<body>
<div class="blackContainer "></div>


<div class="body-wrapper ">


    <div class="top-wrapper temp-banner">


        {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
        <div class="header-top">
            <div class="container">
                <div class="header-top-inner  {if $objSession->IsLogin() } logined {/if}">


                    <div class="user-box">

                        {if $objSession->IsLogin() }
                            <a target="_parent" class="userProfile-name"
                               href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                <span>{$objSession->getNameUser()} عزیز خوش آمدید</span>
                                {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                                    <span class="CreditHide">(اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
                                        ریال)</span>
                                {/if}
                            </a>
                            <div class="logined-links">
                                <div class="user_box_profile">
                                    <a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/userProfile">پروفایل
                                        کاربری</a>
                                </div>
                                <div class="user_box_logout">
                                    <a style=" cursor: pointer " class="no-border" target="_parent"
                                       onclick="signout()">خروج</a>
                                </div>
                            </div>
                        {else}
                            <div class="login-box">
                                <a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/loginUser">ورود</a>
                            </div>
                            <div class="register-box">
                                <a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/registerUser">ثبت
                                    نام</a>
                            </div>
                        {/if}

                        <div class="info-head-box">
                            <div class="tell-head-box"><span class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</span>
                            </div>
                            <div class="email-head-box"><span class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</span>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <header>

            <div class="container menuContainer">
                <a class="header-logo" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                    <div class="logo-title">

                        <img class="logo" src="project_files/images/logo.png" alt="logo">
                        <div class="title">
                            <h1>سیما پرواز جام جم</h1>
                            <h2>شرکت خدمات مسافرت هوایی و جهانگردی </h2>

                        </div>

                    </div>
                </a>

                <div class="top-menu">
                    <a href="javascript:;" class="mobMenu"></a>

                    <div class="mainMenuContainer yekan">
                        <span class="close-menu"></span>

                        <ul class="mainMenu">
                            <li class="resp-home-menu"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه
                                    اصلی</a></li>
                           {* <li><a href="javascript:;">تور ها</a>
                                <ul class="subMenu">
                                    <li><a href="javascript:;">تور داخلی</a>
                                        <ul>
                                            <li><a class="other-tour SMTourLocal"
                                                   href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1">کلیه تورها</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li><a href="javascript:;">تور خارجی</a>
                                        <ul>

                                            <li><a class="other-tour SMTourPortal"
                                                   href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour&level=1">کلیه تورها</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li><a href="javascript:;">تور ویژه</a>
                                        <ul>
                                            <li><a href="" class="SMTourLocalSp"
                                                   href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantour&level=1&sptour=1">داخلی</a>
                                            </li>
                                            <li><a href="" class="SMTourPortalSp"
                                                   href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=tour&level=1&sptour=1">خارجی</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="other-tour SMAllTours" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=alltours">تورها
                                            در یک نگاه</a></li>

                                </ul>
                            </li>

                            <li><a href="javascript:;">هتل ها</a>
                                <ul class="subMenu">
                                    <li><a class="SMHotelLocal" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=iranhotelcity">هتل
                                            داخلی</a></li>
                                    <li><a class="SMHotelPortal" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=hotelcountry">هتل
                                            خارجی</a></li>
                                </ul>
                            </li>

                            <li><a href="javascript:;">پکیج</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=package" class="SMPackage">سیستم پکیج
                                            مسافران</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=packageregister" class="SMPackageRegister">ثبت
                                            نام پکیج همکاران</a></li>
                                </ul>
                            </li>

                            <li><a href="http://safar360.com/">بلیط آنلاین</a></li>

                            <li><a href="http://ticket.simaparvazjamejam.com/">بلیط</a>

                            </li>


                            <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacontinent" class="SMVisa">ویزا</a></li>
*}
                            <li class="reserve_bimeh"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">بیمه مسافرتی </a></li>
                            <li class="reserve_online"><a href="http://ticket.simaparvazjamejam.ir">رزرواسیون آنلاین</a></li>

                            <li><a href="javascript:;">خدمات</a>
                                <ul class="subMenu">
                                    <!--
                                    <li><a href="">بلیط</a>
                                      <ul>
                                        <li><a href="" class="SMIranTicket">داخلی</a></li>
                                        <li><a href="" class="SMTicket">خارجی</a></li>
                                      </ul>
                                    </li>
                                   -->
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=lastminate" class="SMLastminate">دقیقه نود</a>
                                    </li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=blog" class="SMBlog">سفرنامه</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=pay" class="SMPay">پرداخت آنلاین</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=agentlist" class="SMAgentList">نمایندگی ها</a>
                                    </li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=agent" class="SMAgent">درخواست نمایندگی</a>
                                    </li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq" class="SMFaq">پرسش و پاسخ</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=order" class="SMOrder">درخواست خدمات</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=product1" class="SMCarRent">اجاره اتومبیل</a>
                                    </li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=product3" class="SMTourismServices">خدمات
                                            گردشگری</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:;">درباره ما</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus" class="SMAbout">درباره ما</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules" class="SMRules">قوانین و مقررات</a>
                                    </li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=staff" class="SMStaff">مدیران و پرسنل</a></li>
                                </ul>
                            </li>
                            <li><a class="SMContactUs" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس با ما</a></li>
                        </ul>
                    </div>


                </div>


            </div>

            <!-- menu-->


        </header>


        <!-- customers and information -->

        <!-- end customers and information -->

    </div>
    {/if}
    <!-- end top wrapper -->


    <!-- temp -->
    <div class="container temp">
        <div class="temp-content">
            <div class="clear"></div>
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>

    </div>
    <!-- end temp -->


    <div class="before-footer"></div>

    <!--Footer-->
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

    <footer>

        <div class="top-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 f-c-item">
                        <p class="f-item wow bounceIn" data-wow-delay=".15s" dir="rtl">
                            <span class="f-address"></span>
                            <span class="SMFooterAddress txtFFF yekan ">{$smarty.const.CLIENT_ADDRESS}</span>
                        </p>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 f-c-item">
                        <p class="f-item wow bounceIn" data-wow-delay=".25s" dir="ltr">
                            <span class="f-tel"></span>
                            <span class="ltr SMFooterPhone txtFFF yekan "><a href="tel:{$smarty.const.CLIENT_PHONE}" class="txtFFF yekan">{$smarty.const.CLIENT_PHONE}</a></span>
                        </p>
                    </div>


                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 f-c-item">
                        <p class="f-item wow bounceIn" data-wow-delay=".45s">
                            <span class="f-email"></span>
                            <span class="SMFooterEmail txtFFF yekan "><a href="mailto:{$smarty.const.CLIENT_EMAIL}" class=" txt16 txtFFF tdNU padr15">{$smarty.const.CLIENT_EMAIL} </a></span>
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>


        </div>


        <!--CopyRight-->
        <div class="copyright ">
            <div class="container">
                <div class="col-lg-8 col-md-8 col-xs-12 company ">
                    <p class="txt14 yekan txtEEE">کلیه حقوق وب سایت متعلق به <a
                                href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">سیما پرواز جام جم</a> می باشد.
                    </p>
                </div>
                <div class="col-lg-4 col-md-4 col-xs-12 irantech ">
                    <p class="txt14 yekan txtEEE">طراحی وب سایت: <a class="it-link" href="http://iran-tech.com/"
                                                                    target="_blank">ایران تکنولوژی</a></p>
                </div>
            </div>
        </div>
    </footer>
</div>

{/if}

<!--BACK TO TOP BUTTON-->
<div class="backToTop"></div>

{*<script type="text/javascript" src="project_files/js/ajSlider.js"></script>*}
{literal}
<script type="text/javascript" src="project_files/js/wow.js"></script>
<script src="project_files/js/script.js"></script>
{/literal}

{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}

</body>
</html>
