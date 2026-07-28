{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
<!doctype html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="{$obj->Title_head()}">
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>

    <link rel="stylesheet" type="text/css" href="https://vaj.ir/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.ico">

    {if $smarty.session.layout neq 'pwa'}
        <link rel="icon" type="image/x-icon" href="project_files/images/Logo.ico">
        <link rel="stylesheet" href="project_files/css/animate.min.css">
        <link rel="stylesheet" href="project_files/css/all.css">
        <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" href="project_files/css/slider.css">
        <link rel="stylesheet" href="project_files/css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="project_files/css/style.css">

    {/if}
    {literal}
        <script src="project_files/js/jquery-3.4.1.min.js"></script>
    {/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}


</head>
<body class="">
{if $smarty.session.layout neq 'pwa' }
<header class="header_area header-non-special-pages">
    <div class="top_header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 col-md-8 col-sm-5 col-6 pr-lg-0">
                    <div class="logo_top text-center">
                        <a class="" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                            <img src="project_files/images/logo_light.png" alt="{$obj->Title_head()}">
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-5 col-6 actbtn d-flex align-items-center flex-row-reverse">
                    <div class="right_top">
                        <div class="act-buttons">
                            <a  class="btn register main-navigation__button2 stop-propagation">
                                <i class="flat_login"></i>
                                {include file="`$smarty.const.FRONT_THEMES_DIR`vaj_parvaz/topBarName.tpl"}

                                <div class="button-chevron-2 ">

                                </div>
                            </a>
                            <div class="main-navigation__sub-menu2 arrow-up stop-propagation" style="display: none">

                                {include file="`$smarty.const.FRONT_THEMES_DIR`vaj_parvaz/topBar.tpl"}

                            </div>
                        </div>
                    </div>
                    <div class="lef_top">
                        <div class="social-btns float-left">
                            <a class="btn instagram" href="#">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="btn twitter" href="#">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="btn telegram" href="#">
                                <i class="fab fa-telegram-plane"></i>
                            </a>
                            <a class="btn whatsapp" href="#">
                                <i class="fab fa-whatsapp"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <a href="#" style="display:none;" class="reg_mobile">
                    <div>
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="main_header_area animated">
        <div class="container ">
            <nav id="navigation1" class="navigation">
                <div onclick="window.location = 'https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}'" class="logo_top_right">
                    <img src="project_files/images/logo_light.png" alt="{$obj->Title_head()}">
                </div>
                <div class="nav-header">

                    <div class="nav-toggle"></div>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu mx-auto">
{*                        <li id="flight_m" class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/flight">پرواز</a></li>*}
                        <li id="hotels_m" class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel"> هتل </a></li>
                        <li class="subblock"><a href="#">خدمات</a>
                            <ul class="nav-dropdown fadeIn animated">
{*                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/bus">اتوبوس</a></li>*}
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/insurance">بیمه</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/tour">تور</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/visacontinent">ویزا</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/entertainment">خدمات گردشگری</a></li>
                            </ul>

                        </li>
                        <li id="visa_m" class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/order2"> درخواست خدمات </a></li>
                        <li id="visa3_m" class=""><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید </a></li>
                        <li id="visa2_m" class=""><a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a></li>
                        <li class="customers subblock"><a href="#"> دانستنیها</a>

                            <ul class="nav-dropdown nav-submenu">


                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/blog" target="_blank">وبلاگ</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/article" target="_blank">مقالات مفید</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/news" target="_blank">اخبار</a></li>
                            </ul>



                        </li>
                        <li class="know subblock"><a href="#"> آژانس ما</a>


                            <ul class="nav-dropdown nav-submenu">


                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules" target="_blank">قوانین و مقررات</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus" target="_blank"> درباره ما  </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus" target="_blank">تماس باما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/vote" target="_blank">نظرسنجی</a></li>


                            </ul>



                        </li>
{*                        <li id="visa_m" class=""><a href="#"> زیبا تور </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> سورپرایز تور </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> زانا تور </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> مهاجرت </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> اقامت </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> ویزا </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> تعطیلات دندانپزشکی </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> نمکدون  </a></li>*}
{*                        <li id="visa_m" class=""><a href="#"> گردشگری خلاق  </a></li>*}
{*                        <li id="visa_m" class=""><a href="#">سایر خدمات  </a></li>*}

                    </ul>

                    <div class="act-buttons button_header_bottom ">
                        <a href="javascript:void(0)" class="btn register main-navigation__button2 stop-propagation">
                            <i class="flat_login"></i>
                            {include file="`$smarty.const.FRONT_THEMES_DIR`vaj_parvaz/topBarName.tpl"}

                            <div class="button-chevron-2 ">

                            </div>
                        </a>
                        <div class="main-navigation__sub-menu2 arrow-up stop-propagation" style="display: none">

                            {include file="`$smarty.const.FRONT_THEMES_DIR`vaj_parvaz/topBar.tpl"}

                        </div>
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
    <div class="content_tech" style="margin-top: 200px;">
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}

{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <footer class="footer">
            <div class="f_backs">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1920" height="80vh" style="bottom: 2em;" viewBox="0 0 1920 1069.03">
                    <defs>
                        <filter id="filter_back1" x="-107" y="6229.97" width="2107" height="1069.03" filterUnits="userSpaceOnUse">
                            <feImage preserveAspectRatio="none" x="-107" y="6229.97" width="2107" height="1069.03" result="image" xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjEwNyIgaGVpZ2h0PSIxMDY5LjAzIiB2aWV3Qm94PSIwIDAgMjEwNyAxMDY5LjAzIj4KICA8ZGVmcz4KICAgIDxzdHlsZT4KICAgICAgLmNscy0xIHsKICAgICAgICBmaWxsOiB1cmwoI2xpbmVhci1ncmFkaWVudCk7CiAgICAgIH0KICAgIDwvc3R5bGU+CiAgICA8bGluZWFyR3JhZGllbnQgaWQ9ImxpbmVhci1ncmFkaWVudCIgeDE9IjEyOTEuNDgxIiB5MT0iMTA2OS4wMyIgeDI9IjgxNS41MTkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSItMC4yNSIgc3RvcC1jb2xvcj0iIzRlYzdmNSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEuMjUiIHN0b3AtY29sb3I9IiM1Yzc1ZmUiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgPC9kZWZzPgogIDxyZWN0IGNsYXNzPSJjbHMtMSIgd2lkdGg9IjIxMDciIGhlaWdodD0iMTA2OS4wMyIvPgo8L3N2Zz4K"></feImage>
                            <feComposite result="composite" operator="in" in2="SourceGraphic"></feComposite>
                            <feBlend result="blend" in2="SourceGraphic"></feBlend>
                        </filter>
                    </defs>
                    <path id="FOOTER_copy" data-name="FOOTER copy" class="fb_back1" d="M-57,6419c1.352-11.23,254.118,277.89,989-51,821.97-367.86,1065,116,1065,116l3,815-2107-15Z" transform="translate(0 -6229.97)"></path>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1920" height="73vh" viewBox="0 0 1920 1016.94">
                    <defs>
                        <filter id="filter_back2" x="-107" y="6338.06" width="2107" height="1056.94" filterUnits="userSpaceOnUse">
                            <feImage preserveAspectRatio="none" x="-107" y="6338.06" width="2107" height="1056.94" result="image" xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjEwNyIgaGVpZ2h0PSIxMDU2Ljk0IiB2aWV3Qm94PSIwIDAgMjEwNyAxMDU2Ljk0Ij4KICA8ZGVmcz4KICAgIDxzdHlsZT4KICAgICAgLmNscy0xIHsKICAgICAgICBmaWxsOiB1cmwoI2xpbmVhci1ncmFkaWVudCk7CiAgICAgIH0KICAgIDwvc3R5bGU+CiAgICA8bGluZWFyR3JhZGllbnQgaWQ9ImxpbmVhci1ncmFkaWVudCIgeDE9Ijg1MC42MzkiIHgyPSIxMjU2LjM2MSIgeTI9IjEwNTYuOTQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSItMC4yNSIgc3RvcC1jb2xvcj0iIzRlYzdmNSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEuMjUiIHN0b3AtY29sb3I9IiM1Yzc1ZmUiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgPC9kZWZzPgogIDxyZWN0IGNsYXNzPSJjbHMtMSIgd2lkdGg9IjIxMDciIGhlaWdodD0iMTA1Ni45NCIvPgo8L3N2Zz4K"></feImage>
                            <feComposite result="composite" operator="in" in2="SourceGraphic"></feComposite>
                            <feBlend result="blend" in2="SourceGraphic"></feBlend>
                        </filter>
                    </defs>
                    <path id="FOOTER" class="fb_back2" d="M-60,6395c-0.553.21,264.737,365.49,992,69,833.9-339.96,1065,116,1065,116l3,815-2107-15Z" transform="translate(0 -6338.06)"></path>
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1920" height="45vh" viewBox="0 0 1920 669.78">
                    <defs>
                        <filter id="filter_back3" x="-99" y="6685.22" width="2144" height="762.78" filterUnits="userSpaceOnUse">
                            <feImage preserveAspectRatio="none" x="-99" y="6685.22" width="2144" height="762.78" result="image" xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjE0NCIgaGVpZ2h0PSI3NjIuNzgiIHZpZXdCb3g9IjAgMCAyMTQ0IDc2Mi43OCI+CiAgPGRlZnM+CiAgICA8c3R5bGU+CiAgICAgIC5jbHMtMSB7CiAgICAgICAgZmlsbDogdXJsKCNsaW5lYXItZ3JhZGllbnQpOwogICAgICB9CiAgICA8L3N0eWxlPgogICAgPGxpbmVhckdyYWRpZW50IGlkPSJsaW5lYXItZ3JhZGllbnQiIHgxPSI4OTQuMTU1IiB4Mj0iMTI0OS44NDUiIHkyPSI3NjIuNzgiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSItMC4yNSIgc3RvcC1jb2xvcj0iIzRlYzdmNSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEuMjUiIHN0b3AtY29sb3I9IiM1Yzc1ZmUiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgPC9kZWZzPgogIDxyZWN0IGNsYXNzPSJjbHMtMSIgd2lkdGg9IjIxNDQiIGhlaWdodD0iNzYyLjc4Ii8+Cjwvc3ZnPgo="></feImage>
                            <feComposite result="composite" operator="in" in2="SourceGraphic"></feComposite>
                            <feBlend result="blend" mode="screen" in2="SourceGraphic"></feBlend>
                        </filter>
                    </defs>
                    <path id="footer" class="fb_back3" d="M2045,6803s-250.73-234.24-704-42c-384.969,163.27-350.217,523.62-767,475C96.722,7180.33-99,7448-99,7448l2112-93Z" transform="translate(0 -6685.22)"></path>
                </svg>

            </div>

            <div>
                <div class="container footercontainer">
                    <div class="d-flex flex-wrap">

                        <div class="col-lg-3 col-md-4">
                            <div class="footer-widget">
                                <h4 class="widget-title"> درباره ما </h4>
                                <aside id="media_image-2" class="widget widget_media_image">
                                    <p> {$smarty.const.ABOUT_ME} </p>
                                </aside>
                                <aside id="text-2" class="mt-1 widget widget_text logo-moshtari">
                                    <div class="textwidget">
                                        <ul style="text-align: center">
                                            <li><a rel="nofollow" target="_blank" href="https://www.cao.ir/paxrights"><img
                                                            src="project_files/images/certificate1.png" alt=""></a></li>
                                            <li><a rel="nofollow" target="_blank" href="https://www.cao.ir/"><img
                                                            src="project_files/images/certificate2.png" alt=""></a></li>
                                            <li><a rel="nofollow" target="_blank"
                                                   href="http://aira.ir/images/uptoshahrivar.pdf"><img
                                                            src="project_files/images/certificate3.png" alt=""></a></li>


                                        </ul>

                                    </div>

                                </aside>

                            </div>
                        </div>

                        <div class="col-lg-9 col-md-8">
                            <div class="d-flex flex-wrap">

{*                                <div class="col-lg-4 col-md-4 col-sm-6 col-12">*}
{*                                    <div class="footer-widget">*}
{*                                        <h4 class="widget-title"> مسیر های پر تردد داخلی </h4>*}
{*                                        <ul class="footer-menu">*}

{*                                            {assign 'cities' ['MHD' => functions::Xmlinformation('S360MHD'),'TBZ' => functions::Xmlinformation('S360TBZ'),'AWZ' =>  functions::Xmlinformation('S360AWZ'),'AZD' => functions::Xmlinformation('S360AZD'),'KSH' =>functions::Xmlinformation('S360KSH'),'RAS' => functions::Xmlinformation('S360RAS') , 'ADU' => functions::Xmlinformation('S360ADU') , 'BND' =>  functions::Xmlinformation('S360BND')]}*}


{*                                            {foreach $cities as $item}*}
{*                                                <li>*}
{*                                                    <a onclick="ShowModalOfFlights('THR','{$item@key}','searchFlight')"*}
{*                                                       style="cursor: pointer;"*}
{*                                                       data-toggle="modal"*}
{*                                                       data-target="#ModalOfFifteenFlights">*}
{*                                                        ##S360FlightTo## {$item}*}
{*                                                    </a>*}
{*                                                </li>*}
{*                                            {/foreach}*}


{*                                        </ul>*}
{*                                    </div>*}
{*                                </div>*}

{*                                <div class="col-lg-4 col-md-4 col-sm-6 col-12">*}
{*                                    <div class="footer-widget">*}
{*                                        <h4 class="widget-title"> مسیر های پر تردد خارجی از تهران </h4>*}
{*                                        <ul class="footer-menu">*}

{*                                            {assign 'cities' ['IST' => functions::Xmlinformation('S360ISTALL'),'DXB' => functions::Xmlinformation('S360DXB'),'AMS' => functions::Xmlinformation('S360BON'),'CDG' => functions::Xmlinformation('S360SYD'),'BER' => functions::Xmlinformation('S360DXBALL'),'LHR' => functions::Xmlinformation('S360BERALL'), 'FCO' => functions::Xmlinformation('S360YXUALL'), 'BOM' => functions::Xmlinformation('S360NJF')]}*}


{*                                            {foreach $cities as $item}*}
{*                                                <li>*}
{*                                                    <a onclick="ShowModalOfFlights('IKA','{$item@key}','international')"*}
{*                                                       style="cursor: pointer;"*}
{*                                                       data-toggle="modal"*}
{*                                                       data-target="#ModalOfFifteenFlights">*}
{*                                                        ##S360FlightTo## {$item}*}
{*                                                    </a>*}
{*                                                </li>*}
{*                                            {/foreach}*}


{*                                        </ul>*}
{*                                    </div>*}
{*                                </div>*}

                                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                                    <div class="footer-widget">
                                        <h4 class="widget-title">تماس با ما</h4>
                                        <p style="cursor: pointer;" onclick="window.location = 'tel:{$smarty.const.CLIENT_PHONE}'">
                                            <i class="fa fa-headphones"></i>
                                            {$smarty.const.CLIENT_PHONE}</p>
                                        <p style="cursor: pointer;" onclick="window.location = 'mailto:{$smarty.const.CLIENT_EMAIL}'">
                                            <i class="fa fa-envelope"></i>
                                            {$smarty.const.CLIENT_EMAIL}</p>
                                        <p>
                                            <i class="fa fa-map-marker-alt"></i>

                                             {$smarty.const.CLIENT_ADDRESS}

                                        </p>



{*                                        <div class="coderah">*}
{*                                            <form class="TrcBox" action="temp.php?irantech_parvaz=refrense" method="post"*}
{*                                                  name="FormCodeRahgiriPrj" id="FormCodeRahgiriPrj" style="width: 100%;">*}
{*                                                <input id="txtsearch" aria-describedby="basic-addon1" type="text"*}
{*                                                       name="CodeRahgiriTemp" onfocus="{this.value='';}"*}
{*                                                       onblur="if (this.value==''){this.value='کد رهگیری خود را وارد کنید...';}"*}
{*                                                       value="کد رهگیری خود را وارد کنید..." autocomplete="off">*}
{*                                                <button class="btn button-winona" type="submit"><i class="fas fa-check"></i>*}
{*                                                </button>*}
{*                                            </form>*}
{*                                        </div>*}
                                        <div class="">
                                            <ul class="footer-bottom-social">
                                                <div class="row">

                                                    <div class="social-btns float-left" style="margin: 20px 11px;">
                                                        <a class="btn instagram instagramfooter" href="#">
                                                            <i class="fab fa-instagram"></i>
                                                        </a>

                                                        <a class="btn twitter" href="#">
                                                            <i class="fab fa-twitter"></i>
                                                        </a>

                                                        <a class="btn telegram" href="#">
                                                            <i class="fab fa-telegram-plane"></i>
                                                        </a>

                                                        <a class="btn whatsapp" href="#">
                                                            <i class="fab fa-whatsapp"></i>
                                                        </a>


                                                    </div>

                                                </div>
                                                <div class="evidence_footer">
                                                    <a href="project_files/images/f1.jpg" data-fancybox="gallery"><img src="project_files/images/f1.jpg" alt="مدرک"></a>
                                                    <a href="project_files/images/f2.jpg" data-fancybox="gallery"><img src="project_files/images/f2.jpg" alt="مدرک"></a>
                                                    <a href="project_files/images/f5.jpg" data-fancybox="gallery"><img src="project_files/images/f5.jpg" alt="مدرک"></a>
                                                    <a href="project_files/images/f3.jpg" data-fancybox="gallery"><img src="project_files/images/f3.jpg" alt="مدرک"></a>
                                                    <a href="project_files/images/f4.jpg" data-fancybox="gallery"><img src="project_files/images/f4.jpg" alt="مدرک"></a>
                                                </div>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">


                        <div class="col-lg-12 col-md-12 p-0">
                            <p class="copyright"><span>
                            <a href="https://www.iran-tech.com/"> طراحی سایت آژانس هواپیمایی </a>: ایران تکنولوژی  </span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>

        </footer>
        <div class="modal fade bd-example-modal-lg" id="ModalOfFifteenFlights"
             tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    ...
                </div>
            </div>
        </div>
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}

<div class="theme-config ">
    <div class="main-color">
        <div class="title">تم اصلی :</div>
        <div class="colours-wrapper">
            <div class="entry color1 m-color active" id="dark_theme"></div>
            <div class="entry color3 m-color" id="light_theme"></div>


        </div>
    </div>
</div>
<a  data-placement="top"  id="scroll-top" style="cursor: pointer;" >
    <button><i class="fas fa-arrow-up"></i></button>
</a>


{literal}
    <script src="project_files/js/bootstrap.min.js"></script>
    <script src="project_files/js/megamenu.js"></script>
    <script src="project_files/js/jquery.fancybox.min.js"></script>
    <script src="project_files/js/scripts.js"></script>
{/literal}
{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

</body>
</html>