{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}

{assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
{assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}


<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="description" content="{$obj->Title_head()}">
    <title>{$obj->Title_head()}</title>
    <base href="https://{$smarty.const.CLIENT_DOMAIN}" />

    <link rel="stylesheet" href="project_files/css/style.css">
    {if $smarty.session.layout neq 'pwa'}
        <link rel="icon" type="image/png" sizes="32x32" href="project_files/images/favicon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="project_files/images/favicon.png">
        <link rel="icon" type="image/png" sizes="16x16" href="project_files/images/favicon.png">
        <link rel="stylesheet" href="project_files/css/bootstrap.css">
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" type="text/css"
              href="https://razdonya.ir/fa/user/GlobalFile/css/register.css">
    {/if}
    {literal}
        <script src="project_files/js/jquery-3.6.0.min.js"></script>
    {/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
</head>
<body>
{if $smarty.session.layout neq 'pwa' }
    <header class="header">
        <div class="header_first">
            <div class="header_first-main container">
                <div class="menu-login">
                    <div class="c-header__btn">
                        <div class="c-header__btn-login" href="javascript:;">
                            <i class="fas fa-user-plus"></i>

                            {include file="`$smarty.const.FRONT_THEMES_DIR`donyaye_parvaz/topBarName.tpl"}
                        </div>
                        <div class="main-navigation__sub-menu2 arrow-up">
                            {include file="`$smarty.const.FRONT_THEMES_DIR`donyaye_parvaz/topBar.tpl"}
                        </div>
                    </div>
                </div>
                <div class="icon-header">
                    <a href="mailto:https://{$smarty.const.CLIENT_EMAIL}" style="font-family: sans-serif;"
                       class="icon-header__nav SMFooterEmail">
                        {$smarty.const.CLIENT_EMAIL}
                        <i class="fa fa-envelope" style="margin-right: 5px;"> </i>
                    </a>
                    <a href="tel:https://{$smarty.const.CLIENT_MOBILE}" class="icon-header__nav SMFooterPhone"
                       style="font-family: sans-serif;">
                        {$smarty.const.CLIENT_MOBILE}
                        <i class="fa fa-phone" style="margin-right: 5px;"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="header_tow">
            <div class="header_tow-main container">
                <a class="logo" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                    <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                    <div>
                        <span>راز دنیای پرواز</span>
                        <span>Raz Donyaye Parvaz</span>
                    </div>
                </a>
                <nav class="menu-main">
                    <i class="fa fa-bars menu"></i>
                </nav>
                <div class="header_ris_bg"></div>
                <ul class="header_tow_list">
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a pointer"> تور
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="header_tow_list_li__ul header_tow_list_li__ul_first">
                            <li class="header_tow_list_li123">
                                <a class="header_tow_list_li__ul_a border-radius1 pointer">تور داخلی
                                    <i class="fa fa-angle-left"></i> </a>

                                <ul class="list_zirmenu_first">
                                    {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                        <li class="header_tow_list_li123 header_tow_list_li133">
                                            <a class="header_tow_list_li__ul_a" target="_blank"
                                               href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-1/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </li>
                            <li class="header_tow_list_li123">
                                <a class="header_tow_list_li__ul_a border-radius2 pointer">تور خارجی
                                    <i class="fa fa-angle-left"></i></a>
                                <ul class="list_zirmenu_first2">
                                    {foreach key=key_tour_country item=item_tour_country from=$objResult->ReservationTourCountries(true,false)}
                                        <li class="header_tow_list_li123 header_tow_list_li133">
                                            <a href="javascript:;"
                                               class="header_tow_list_li__ul_a">{$item_tour_country.name}</a>
                                            <ul class="nav-dropdown submenu-child fadeIn animated">
                                                {foreach key=key_tour item=item_tour from=$objResult->ReservationtourCities("=`$item_tour_country.id`",'return',false)}
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-1/{$item_tour_country.id}-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </li>
                                    {/foreach}
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a"> هتل
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="header_tow_list_li__ul header_tow_list_li__ul_first">
                            <li class="header_tow_list_li123">
                                <a class="header_tow_list_li__ul_a border-radius1 pointer">هتل داخلی <i
                                            class="fa fa-angle-left"></i> </a>

                                <ul class="list_zirmenu_first">
                                    {foreach key=key_hotel item=item_hotel from=$objResult->ReservationHotelCities('=1','20')}
                                        <li class="header_tow_list_li123 header_tow_list_li133">
                                            <a class="header_tow_list_li__ul_a"
                                               href="{$smarty.const.ROOT_ADDRESS}/searchHotel/{$item_hotel.City_id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/1">
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_hotel.NAME : $item_hotel.name_en}
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </li>
                            <li class="header_tow_list_li123">
                                <a class="header_tow_list_li__ul_a border-radius2 pointer">هتل خارجی <i
                                            class="fa fa-angle-left"></i></a>
                                <ul class="list_zirmenu_first2 list_zirmenu_first">
                                    {foreach key=key_hotel_country item=item_hotel_country from=$objResult->ReservationHotelCountry('','!=1')}
                                        <li class="header_tow_list_li144">
                                            <a class="header_tow_list_li__ul_a"
                                               href="javascript:;">{$item_hotel_country.name_country}</a>
                                            <ul class="list_zirmenu_first4">
                                                {foreach key=key_hotel item=item_hotel from=$objResult->ReservationHotelCities("=`$item_hotel_country.id`",'20')}
                                                    <li>
                                                        <a class="header_tow_list_li__ul_a"
                                                           href="{$smarty.const.ROOT_ADDRESS}/searchHotel/{$item_hotel.City_id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/1">
                                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_hotel.NAME : $item_hotel.name_en}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </li>
                                    {/foreach}
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a"
                           href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
                            پیگیری خرید
                        </a>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a"
                           href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog">وبلاگ</a>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a"> مشتریان
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="header_tow_list_li__ul header_tow_list_li__ul_first">
                            <li><a class="header_tow_list_li__ul_a border-radius1 pointer"
                                   href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules">قوانین و مقررات </a>
                            </li>
                            <li><a class="header_tow_list_li__ul_a border-radius2 pointer"
                                   href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/order">درخواست همکاری</a>
                            </li>
                        </ul>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a"> دانستنیها
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="header_tow_list_li__ul header_tow_list_li__ul_last">
                            <li><a class="header_tow_list_li__ul_a border-radius1"
                                   href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/logbook">سفر
                                    نامه </a>
                            </li>
                            {*                        <li><a class="header_tow_list_li__ul_a" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/brand">خدمات*}
                            {*                                گردشگری </a>*}
                            </li>
                            <li><a class="header_tow_list_li__ul_a pointer"
                                   href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار سایت </a>
                            </li>
                            <li><a class="header_tow_list_li__ul_a" target="_blank" rel="nofollow"
                                   href="https://sadadpsp.ir/tollpayment/"> پرداخت عوارض خروجی</a>
                            </li>
                            </li>
                            <li><a class="header_tow_list_li__ul_a pointer"
                                   href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/worldclock">ساعت کشورها</a></li>
                            <li><a class="header_tow_list_li__ul_a pointer SMChange" href="/change">نرخ ارز</a></li>
                            <li><a class="header_tow_list_li__ul_a border-radius2 pointer"
                                   href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/weather">هواشناسی</a></li>
                        </ul>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a pointer"
                           href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus">
                            درباره ما
                        </a>
                    </li>
                    <li class="header_tow_list_li">
                        <a class="header_tow_list_li__a pointer"
                           href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus"> تماس با ما
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
{/if}

{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <main>
        <div class="container">
            <div class="row center-eleman" style="margin: auto;display: flex;justify-content:center">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </main>
{/if}


{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <footer>
            <div class="container">
                <ul class="footer_ul row">
                    <li class="footer_li col-lg-3 col-md-6 col-xs-12">
                        <a class="logo" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img src="project_files/images/logo.png" alt="راز دنیای پرواز">
                        </a>
                        <p class="footer_li_p">{$smarty.const.ABOUT_ME}</p>
                    </li>
                    <li class="footer_li col-lg-3 col-md-6 col-xs-12">
                        <span class="footer_li_span">اطلاعات تماس</span>
                        <p class="footer_li_p SMFooterAddress">
                            <i class="fa fa-map-marker" style="margin-left: 5px;">
                                {$smarty.const.CLIENT_ADDRESS}
                            </i>
                        </p>
                        <a class="footer_li_a SMFooterEmail" href="mailto:https://{$smarty.const.CLIENT_EMAIL}">
                            <i class="fa fa-envelope" style="margin-left: 5px;"></i>
                            {$smarty.const.CLIENT_EMAIL}
                        </a>
                        <a class="footer_li_a SMFooterPhone" href="tel:https://{$smarty.const.CLIENT_PHONE}">
                            <i class="fa fa-phone"></i>
                            {$smarty.const.CLIENT_PHONE}
                        </a>
                        <a class="footer_li_a SMFooterMobile" href="tel:https://{$smarty.const.CLIENT_MOBILE}">
                            <i class="fa fa-phone"></i>
                            {$smarty.const.CLIENT_MOBILE}
                        </a>
                        <div class="icon">
                            <a href="javascript:" class="fa fa-instagram SMInstageram"></a>
                            <a href="javascript:" class="fa fa-whatsapp SMWhatsapp"></a>
                            <a href="javascript:" class="fa fa-twitter SMTwitter"></a>
                            <a href="javascript:" class="fa fa-facebook SMFaceBook"></a>
                            <a href="javascript:" class="fa fa-pinterest-p SMPatientInformation"></a>
                        </div>
                    </li>
                    <li class="footer_li col-lg-3 col-md-6 col-xs-12">
                        <div class="d-flex footer_li-div">
                            <a class="footer_li-div_a" rel="nofollow" target="_blank"
                               href="http://aira.ir/images/final3.pdf">
                                <img src="project_files/images/namad-1.png" alt="">
                            </a>
                            <a class="footer_li-div_a" rel="nofollow" target="_blank" href="https://www.cao.ir/">
                                <img src="project_files/images/namad-2.png" alt="">
                            </a>
                            <a class="footer_li-div_a" rel="nofollow" target="_blank"
                               href="https://www.cao.ir/paxrights">
                                <img src="project_files/images/namad-3.png" alt="">
                            </a>
                        </div>
                    </li>
                    <li class="footer_li col-lg-3 col-md-6 col-xs-12">
                        <span class="footer_li_span">آدرس</span>
                        <div id="g-map">
                        </div>
                    </li>
                </ul>
            </div>
            <div class="last">
            <span class="last_span">
                <a class="last_a" href="https://www.iran-tech.com/" target="_blank">طراحی سایت گردشگری</a>
                <p class="last_p_text">: ایران تکنولوژی</p>
            </span>
            </div>
        </footer>
    {/if}
    <div class="but-top" id="scroll-top">
        <a href="javascript:" class="fa fa-angle-up"></a>
    </div>
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
    {*    {/if}*}


{/if}


{literal}
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"
          integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
          crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
            integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
            crossorigin=""></script>
    <script type="text/javascript">
      // position we will use later ,

      var lat = 31.318860536620775
      var lon = 48.63976289744311
      // initialize map
      map = L.map('g-map').setView([lat, lon], 15)
      // set map tiles source
      L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '',
        maxZoom: 16,
        minZoom: 14,
      }).addTo(map)
      // add marker to the map
      marker = L.marker([lat, lon]).addTo(map)
      // add popup to the marker
      marker.bindPopup('خوزستان ، اهواز ، کمپلو جنوبی ، بین کیان و غزنوی ، خیابان بهارستان ، ساختمان ملیکا ، طبقه سوم').openPopup()
    </script>
    <script src="project_files/js/bootstrap.bundle.js"></script>
    <script src="project_files/js/script.js"></script>
    <script src="project_files/js/bootstrap.min.js"></script>
{/literal}


{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}
</body>
</html>