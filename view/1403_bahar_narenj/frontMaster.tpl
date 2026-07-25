{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
<!DOCTYPE html>
<html lang="fa-IR" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="description" content="{$obj->Title_head()}">
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>

    <link rel="stylesheet" type="text/css" href="https://bahartravel.com/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">

    <link rel="stylesheet" href="project_files/css/all.css">
    <link rel="stylesheet" href="project_files/css/bootstrap.css">
    <link rel="stylesheet" href="project_files/css/header.css">
    <link rel="stylesheet" href="project_files/css/style.css">

    {literal}
        <script src="project_files/js/jquery-3.6.0.min.js"></script>
    {/literal}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>
<body>
<header class="header header_area header-two">
    <div class="header_tow main_header_area animated h-100">
        <div class="header_tow-main">
            <nav id="navigation1" class="h-100 navigation d-flex justify-content-between align-items-center">
                <a class="logo" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                    <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                </a>
                <div class="nav-menus-wrapper d-flex align-items-start flex-column mx-auto" >
                    <ul class="nav-menu align-to-right">
                        <li><a href="javascript:">تور</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/countrytour/1">تور خارجی</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/irantourcity/1">تور داخلی</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:">پرواز</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/flight-local"> داخلی</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/flight-international"> خارجی</a></li>
                            </ul>
                        </li>
                        <li><a href="<?php echo $linkSlash; ?>hotel">هتل ها</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel"> داخلی</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel-international"> خارجی</a></li>
                            </ul>
                        </li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/visacountry">ویزا</a></li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/article">مجله گردشگری</a></li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/news">اخبار</a></li>
                        <li><a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مسافران</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules">قوانین و مقررات</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus">درباره ما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus">تماس با ما</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
                <div class="but_log mr-lg-0 mr-auto position-relative">
                    <div class="tel_header">
                        <a href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE} <i class="far fa-phone"></i> </a>
                        <a href="tel:09381124420">09381124420 <i class="far fa-phone"></i> </a>
                    </div>
                    <a class="stop-propagation main-navigation__button2" ><i class="fas ml-1 fa-user"> </i>
                        {include file="`$smarty.const.FRONT_THEMES_DIR`bahar_narenj/topBarName.tpl"}

                        <div class="button-chevron-2 ">

                        </div>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up p-0">

                        {include file="`$smarty.const.FRONT_THEMES_DIR`bahar_narenj/topBar.tpl"}

                    </div>
                </div>
                <div class="nav-toggle mr-3"></div>
            </nav>
        </div>
    </div>
</header>

<div class="content_tech mt-2">
    <div class="container">
        <div class="temp-wrapper">
            {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
        </div>
    </div>
</div>


{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan && $smarty.const.GDS_SWITCH neq 'app'}
    <footer>
    <div class="container">
        <ul class="footer_ul">
            <li class="col-12 col-md-6 col-lg-4 footer_li">
                <a class="logo" href="javascript:">
                    <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                </a>
                <p class="footer_li_p">
                    {$smarty.const.ABOUT_ME}
                </p>
                <div class="d-flex footer_li-div">
                    <a class="footer_li-div_a" rel="nofollow" target="_blank"
                       href="http://aira.ir/images/final3.pdf"><img src="project_files/images/namad-1.png" alt=""></a>
                    <a class="footer_li-div_a" rel="nofollow" target="_blank" href="https://www.cao.ir/"><img
                                src="project_files/images/namad-2.png" alt=""></a>
                    <a class="footer_li-div_a" rel="nofollow" target="_blank"
                       href="https://www.cao.ir/paxrights"><img src="project_files/images/namad-3.png" alt=""></a>
                </div>
            </li>
            <li class="col-12 col-md-6 col-lg-4 footer_li">
                <span class="footer_li_span">اطلاعات تماس</span>
                <p class="footer_li_p"><i class="fa fa-map-marker" style="margin-left: 5px;"></i>{$smarty.const.CLIENT_ADDRESS}</p>
                <a class="footer_li_a" href="mailto:{$smarty.const.CLIENT_EMAIL}"><i class="fa fa-envelope" style="margin-left: 5px;"></i>{$smarty.const.CLIENT_EMAIL} </a>
                <div class="d-flex flex-wrap">
                    <a class="footer_li_a w-50" href="tel:{$smarty.const.CLIENT_PHONE}"><i class="fa fa-phone-alt"></i> {$smarty.const.CLIENT_PHONE}</a>
                    <a class="footer_li_a w-50" href="tel:{$smarty.const.CLIENT_MOBILE}"><i class="fa fa-phone-alt"></i> {$smarty.const.CLIENT_MOBILE} </a>
                    <a class="footer_li_a w-50" href="tel:09211264215"><i class="fa fa-phone-alt"></i> 09211264215</a>
                </div>
                <div class="icon w-100">
                    <a href="javascript:" class="fab fa-instagram"></a>
                    <a href="javascript:" class="fab fa-whatsapp"></a>
                    <a href="javascript:" class="fab fa-twitter"></a>
                    <a href="javascript:" class="fab fa-facebook"></a>
                    <a href="javascript:" class="fab fa-pinterest-p"></a>
                </div>
            </li>
            <li class="col-12 col-md-6 col-lg-4 footer_li">
                <span class="footer_li_span">آدرس</span>
                <div id="g-map">


                </div>

            </li>
        </ul>
    </div>
    <div class="last">
            <span class="last_span">
                <a class="last_a" href="https://www.iran-tech.com">طراحی سایت گردشگری</a>
                <p class="last_p_text">: ایران تکنولوژی</p>
            </span>
    </div>
</footer>
{/if}

<div class="but-top" id="scroll-top">
    <a href="javascript:" class="fa fa-angle-up"></a>
</div>
</body>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"
      integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
      crossorigin=""/>
{literal}
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
        integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
        crossorigin=""></script>
<script type="text/javascript">
    // position we will use later ,
    {/literal}
    var lat = {$smarty.const.CLIENT_MAP_LAT};
    var lon = {$smarty.const.CLIENT_MAP_LNG};
    {literal}
    // initialize map
    map = L.map('g-map').setView([lat, lon], 15);
    // set map tiles source
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '',
        maxZoom: 16,
        minZoom: 14,
    }).addTo(map);
    // add marker to the map
    marker = L.marker([lat, lon]).addTo(map);
    // add popup to the marker
    marker.bindPopup("سفرهای بهار نارنج").openPopup();
</script>
<script src="project_files/js/select2.min.js"></script>
<script src="project_files/js/megamenu.js"></script>
<script src="project_files/js/bootstrap.bundle.js"></script>
<script src="project_files/js/script.js"></script>
{/literal}

{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}
</html>