{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
{assign var="gds_project_file_name" value="eliar_safar"}
<!doctype html>
<html lang="fa">

<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="{$obj->Title_head()}">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    <meta charset="utf-8">

    <link rel="stylesheet" type="text/css" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">
    {*    <script language="javascript" type="text/javascript"*}
    {*            src="project_files/js/jquery-2.1.4.min.js"></script>*}
    {*    <link rel="shortcut icon" type="image/x-icon" href="/fa/user/images/favicon.ico" />*}
    {*    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />*}

    {literal}
    <script src="{/literal}https://{$smarty.const.CLIENT_MAIN_DOMAIN}{literal}/fa/user/js/jquery-3.4.1.min.js"></script>
    {/literal}


    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/fontawsome6-Pro.css">
        <link rel="stylesheet" href="project_files/css/swiper.min.css">
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" href="project_files/js/owl.theme.default.min.css">
        <link rel="stylesheet" href="project_files/css/animate.min.css">
        <link rel="stylesheet" href="project_files/css/style.css">
        <link rel="stylesheet" href="project_files/css/blog.css">
        <link rel="stylesheet" href="project_files/css/responsive.css">
    {/if}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>

<body>
<div class="float-sm">
    <div class="fl-fl float-ig">
        <a href="#" target="_blank">
            <i class="fab fa-instagram"></i>ما رو دنبال کن!</a>
    </div>
    <div class="fl-fl float-gp">
        <a href="#" target="_blank">
            <i class="fab fa-telegram"></i>به ما ملحق شو!</a>
    </div>
    <div class="fl-fl float-rs">
        <a href="#" target="_blank">
            <i class="fab fa-whatsapp"></i>تماس با ما!</a>
    </div>
</div>

<div id="result"></div>
{if $smarty.session.layout neq 'pwa' }

<header class="header_area fixedmenu">
    <div class="main_header_area">
        <div class=" menus container">
            <nav id="navigation1" class="navigation">
                <!-- Logo Area Start -->
                <div class="nav-header">
                    <a class="flex-row" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <div class="logo logoHolder flex-col">
                            <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                        </div>
                    </a>
                    <div class="nav-toggle"></div>
                </div>

                <div class="nav-menus-wrapper">
                    <ul class="nav-menu ">
                        <li class=""><a href="javascript:;">تور</a>
                            <ul class="nav-dropdown first_child_menu  fadeIn animated">
                                <li><a href="javascript:;"> تور داخلی </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}


                                    </ul>
                                </li>
                                <li><a href="javascript:;"> تور خارجی </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/tour"> جست و جوی تور </a></li>

                            </ul>
                        </li>

                        <li id="tours_m" class="">
                            <a class=" TabScroll " data-target="#flightda-tab" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/flight">پرواز</a>
                        </li>

                        <li id="hotels_m" class=""><a class=" TabScroll " data-target="#hotel-tab" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/hotel">هتل </a></li>
                        <li class=""><a class="TabScroll" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/visacontinent">ویزا</a>
                        </li>
                        <li class=""><a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a>
                        </li>                            <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/article">وبلاگ</a></li>
                        <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار</a></li>
                        <li class=""><a href="javascript:"> آژانس ما</a>
                            <ul class="nav-dropdown first_child_menu ">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus"> درباره ما </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules"> قوانین و مقررات </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus"> تماس با ما</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>


                <div class="act-buttons">
                    <div class="nav-search">
                        <div class="top__user_menu">
                            <button class="main-navigation__button2">
                                <i class="far fa-user ml-1 mobileloginicon"></i>

                                {include file="`$smarty.const.FRONT_THEMES_DIR`{$gds_project_file_name}/topBarName.tpl"}
                                <div class="button-chevron-2 ">
                                </div>
                            </button>

                            <div class="main-navigation__sub-menu2 arrow-up" style="display: none">

                                {include file="`$smarty.const.FRONT_THEMES_DIR`{$gds_project_file_name}/topBar.tpl"}

                            </div>

                        </div>
                    </div>
                </div>

                <div class="act-buttons peygiri">

                    <div class="peigiri">
                        <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری
                            خرید</a>
                    </div>


                </div>

            </nav>
        </div>
    </div>


</header>
{/if}

{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <div class="content_tech" style="margin-top: 20px;" >
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}
{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
<svg version="1.1" id="wave_footer" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
     x="0px" y="0px" viewBox="0 0 500 250" enable-background="new 0 0 500 250" xml:space="preserve"
     preserveAspectRatio="none">
        <path id="path_footer_svg"
              d="M250,246.5c-97.85,0-186.344-40.044-250-104.633V250h500V141.867C436.344,206.456,347.85,246.5,250,246.5z">
        </path>

    </svg>
<footer class="footer">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-md-6 col-lg-3 col_foo">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            مسیر های پر تردد داخلی از تهران
                        </h3>
                        <ul class="links double_links">


                            {assign 'cities' ['MHD' => functions::Xmlinformation('S360MHD'),'TBZ' => functions::Xmlinformation('S360TBZ'),'AWZ' =>  functions::Xmlinformation('S360AWZ'),'AZD' => functions::Xmlinformation('S360AZD'),'KSH' =>functions::Xmlinformation('S360KSH'),'RAS' => functions::Xmlinformation('S360RAS') , 'ADU' => functions::Xmlinformation('S360ADU') , 'BND' =>  functions::Xmlinformation('S360BND')]}


                            {foreach $cities as $item}
                                <li>
                                    <a onclick="ShowModalOfFlights('THR','{$item@key}','searchFlight')"
                                       data-toggle="modal"
                                       data-target="#ModalOfFifteenFlights">
                                        ##S360FlightTo## {$item}
                                    </a>
                                </li>
                            {/foreach}


                        </ul>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3 col_foo">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            مسیر های پر تردد خارجی از تهران
                        </h3>
                        <ul class="links double_links">

                            {assign 'cities' ['ISTALL' => functions::Xmlinformation('S360ISTALL'),'DXB' => functions::Xmlinformation('S360DXB'),'BON' => functions::Xmlinformation('S360BON'),'SYD' => functions::Xmlinformation('S360SYD'),'DXBALL' => functions::Xmlinformation('S360DXBALL'),'BERALL' => functions::Xmlinformation('S360BERALL'), 'YXUALL' => functions::Xmlinformation('S360YXUALL'), 'NJF' => functions::Xmlinformation('S360NJF')]}


                            {foreach $cities as $item}
                                <li>
                                    <a onclick="ShowModalOfFlights('THR','{$item@key}','searchFlight')"
                                       data-toggle="modal"
                                       data-target="#ModalOfFifteenFlights">
                                        ##S360FlightTo## {$item}
                                    </a>
                                </li>
                            {/foreach}


                        </ul>

                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3 col_foo">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            خدمات توریستی
                        </h3>
                        <ul class="links double_links">
                            <li><a href="ttps://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/tour">تور</a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/flight">پرواز</a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/hotel"> هتل </a></li>
                            <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/visacontinent">ویزا</a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules">قوانین و مقررات</a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/article">وبلاگ</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/loginUser"> باشگاه مشتریان </a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید </a></li>

                        </ul>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3 col_foo foo_contact">
                    <div class="address footer_widget">
                        <h3 class="footer_title">
                            تماس با ما
                        </h3>
                        <div class="contact_info_text ">
                            <i class="fa-regular fa-map-location-dot"></i>
                            <a>{$smarty.const.CLIENT_ADDRESS}</a>
                        </div>
                        <div class="contact_info_text">
                            <i class="fa-regular fa-phone"></i>
                            <a href="tel:{$smarty.const.CLIENT_PHONE}" target="_top">{$smarty.const.CLIENT_PHONE}</a>
                        </div>

                        <div class="contact_info_text">
                            <i class="fa-regular fa-envelope"></i>
                            <a href="mailto:{$smarty.const.CLIENT_EMAIL}" target="_top">{$smarty.const.CLIENT_EMAIL}</a>
                        </div>


                    </div>

                </div>

                <div class="col-12 ">
                    <div class="col_namads">

                        <a target="_blank" rel="nofollow" href="https://www.cao.ir/paxrights">
                            <img src="project_files/images/certificate1.png" alt="">
                        </a>
                        <a target="_blank" rel="nofollow" href="https://www.cao.ir/">
                            <img src="project_files/images/certificate2.png" alt="">
                        </a>
                        <a target="_blank" rel="nofollow" href="http://aira.ir/images/final3.pdf">
                            <img src="project_files/images/certificate3.png" alt="">
                        </a>
                        <a target="_blank" rel="nofollow" href="javascript">
                            <img src="project_files/images/enamad.png" alt="">
                        </a>
                        <a target="_blank" rel="nofollow" href="javascript">
                            <img src="project_files/images/samandeh.jpg" alt="">
                        </a>

                    </div>


                </div>
            </div>
        </div>
    </div>
    <div class="copy-right_text">
        <div class="container">

            <div class="row">
                <div class="col-xl-12">
                    <div class="copyright_content d-flex flex-row justify-content-center">
                        <a href="https://www.iran-tech.com/" target="_blank">
                            طراحی سایت آژانس مسافرتی
                        </a> : ایران تکنولوژی
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>
{/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}

<a href="javascript:" id="scroll-top" data-type="section-switch" class="scrollup back-top">
    <i class="fas fa-angle-up"></i>
</a>

<div class="modal fade bd-example-modal-lg" id="ModalOfFifteenFlights"
     tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            ...
        </div>
    </div>
</div>
</body>
{literal}
    <script language="javascript" type="text/javascript" src="project_files/js/jquery.smoothscroll.min.js"></script>
    <script language="javascript" type="text/javascript" src="project_files/js/swiper.min.js"></script>
    <script language="javascript" type="text/javascript" src="project_files/js/wow.min.js"></script>
    <script language="javascript" type="text/javascript" src="project_files/js/scripts.js"></script>
    <script language="javascript" type="text/javascript" src="project_files/js/header.js"></script>
{/literal}
{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

<div class="p-popup-container">
    <div class="p-popup-wrapper">
        <span class="p-close-popup"></span>
        <div id="ShowPopup"></div>
    </div>
</div>

</body>

</html>