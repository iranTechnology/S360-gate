{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
{assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
<!doctype html >
<html class="no-js" lang="fa">
<head>
    <!-- Required meta tags -->
    <title>{$obj->Title_head()}</title>
    <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png"/>
    <meta name="description" content="{$obj->Title_head()}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    <!-- Main CSS files -->


    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
        <link rel="stylesheet" href="project_files/css/all.min.css" >
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" href="project_files/css/style.css">
        <link rel="stylesheet" type="text/css" href="https://mobinseir.ir/fa/user/GlobalFile/css/register.css">
    {/if}



    {literal}
        <script  src="project_files/js/jquery-3.4.1.min.js"></script>
    {/literal}


    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
</head>
<body>
{if $smarty.session.layout neq 'pwa' }
<header>
    <div class="main_head">
        <div class="top_header" id="top_header">
            <div class="container">
                <div class="row">
                    <div class="right-header col-lg-7 col-md-12 col-xs-12 col-sm-12">
                        <div class="phone_number"><i class="fas fa-phone-volume"></i>
                            <span class="phone_number_titr"> پشتیبانی 24 ساعته:</span>
                            <a class="SMFooterMobile blink_me2" href="tel:{$smarty.const.CLIENT_MOBILE}">

                                {$smarty.const.CLIENT_MOBILE} </a></div>
                      {*  <div class="menu-login">
                            <div class="top-user-menu">
                                <button class="main-navigation-button2"><i class="fas fa-user-alt"></i> ورود / عضویت
                                </button>
                            </div>
                        </div>*}
                        <div class="menu-login">
                            <div class="c-header__btn">
                                <div class="c-header__btn-login" href="javascript:;">
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`sanaseir/topBarName.tpl"}
                                </div>
                                <div class="main-navigation__sub-menu2 arrow-up">
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`sanaseir/topBar.tpl"}
                                </div>
                            </div>
                        </div>
                        <div class="nav-top-text-troll"><a rel="nofollow" href="https://tollpayment.sadadpsp.ir/" class="blink_me"
                                                           target="_blank"> پرداخت عوارض خروجی </a></div>
                    </div>
                    <div class="left-side col-xs-12 col-sm-12 col-lg-5 col-md-12">
                        <ul class="social-icons_top">
                            <li><a class="SMFaceBook facebook"      href="javascript:" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a class="SMTwitter twitter"        href="javascript:" target="_blank"><i class="fab fa-twitter"></i></a></li>
                            <li><a class="SMPinterest pinterest"    href="javascript:" target="_blank"><i class="fab fa-pinterest"></i></a></li>
                            <li><a class="SMInstageram instagram"   href="javascript:" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            <li><a class="SMWhatsapp whatsapp"      href="javascript:" target="_blank"><i class="fab fa-whatsapp"></i></a></li>
                        </ul>
                    </div>                                 </div>
            </div>
        </div>
        <header class="header_area" id="header_area_op">
            <div class="main_header_area animated">
                <div class="container">
                    <nav id="navigation1" class="navigation">
                        <div class="nav-header"><a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/"> <img
                                        src="project_files/images/logo.png" alt="" class="logo"> <img src="project_files/images/logo-txt.png" alt=""
                                                                                        class="logo-txt"> </a>
                            <div class="nav-toggle"></div>
                        </div>
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید و استرداد </a></li>
                                <li><a class="SMNews" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار گردشگری </a></li>
                                <li><a href="javascript:;">مشتریان</a>
                                    <ul class="nav-dropdown">
                                        <li><a class="SMBlog" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog">مقالات مفید</a></li>
                                    </ul>
                                </li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aparat" class="SMVideoAparat">ویدئوها </a></li>
                                <li><a class="SMRules" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules"> قوانین و مقررات </a></li>
                                <li><a class="SMFeedback" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/feedback">انتقادات و پیشنهادات</a></li>

                                <li><a class="SMAbout" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus">درباره ما</a></li>
                                <li><a class="SMContactUs" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus">تماس با ما</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
    </div>
</header>
{/if}
<main class="main_sana">


        <div class="container">
            <div class="{if $smarty.session.layout neq 'pwa'}row{/if} center-eleman">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>

        </div>


</main>

{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

<footer>
    <div class="container">
        <div class="row">
            <div class="footer-icon col-md-3 col-lg-4 col-sm-6 col-xs-12 map-aita">
                <div id="g-map">


                </div>
            </div>
            <div class="cantact col-md-3 col-lg-3 col-sm-6 col-xs-12"><h4>اطلاعات تماس</h4>
                <p class="address"><span>آدرس : </span>{$smarty.const.CLIENT_ADDRESS}</p>

            </div>


            <div class="info col-md-3 col-lg-3 col-sm-6 col-xs-12" style="padding: 10px;">
                <h4>اطلاعات</h4>
                <div class="cantactBox">
                    <i class="fa fa-envelope-open" aria-hidden="true"></i><a  href="mailto:{$smarty.const.CLIENT_EMAIL}" class="SMFooterEmail email">{$smarty.const.CLIENT_EMAIL}</a>
                </div>
                <div class="cantactBox">
                    <i class="fa fa-phone" aria-hidden="true"></i><a class="SMFooterPhone phoneNumber">{$smarty.const.CLIENT_PHONE}</a>
                </div>
                <div class="cantactBox">
                    <i class="fa fa-mobile" aria-hidden="true"></i><a class="SMFooterMobile mobile">{$smarty.const.CLIENT_MOBILE}</a></div>
             </div>

        </div>
        <div class="row">
            <div class="copyright col-xs-12"> <a href="https://www.iran-tech.com/" target="_blank">طراحی سایت آژانس هواپیمایی
                </a>
                : ایران تکنولوژی
            </div>
        </div>

    </div>
    <div class="footer-network">
        <ul class="social-icons_top_footer">
            <li><a class="SMFaceBook facebook" href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
            <li><a class="SMTwitter twitter" href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
            <li><a class="SMPinterest pinterest" href="#" target="_blank"><i class="fab fa-pinterest"></i></a></li>
            <li><a class="SMInstageram instagram" href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
            <li><a class="SMWhatsapp whatsapp" href="#" target="_blank"><i
                            class="fab fa-whatsapp"></i></a></li>
        </ul>
    </div>
</footer>
{/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}

{/if}
<a id="scroll-top" style="cursor: pointer; display: block;">
    <button><i class="fa fa-angle-up"></i></button>
</a>
{literal}
    <script  src="project_files/js/bootstrap.bundle.min.js"></script>
    <script  src="project_files/js/megamenu.js"></script>
    <script  src="project_files/js/scripts.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>

    <script type="text/javascript">
        // position we will use later ,
        var lat = 29.683520760555798;
        var lon = 52.46706696441774;
        // initialize map
        map = L.map('g-map').setView([lat, lon], 15);
        // set map tiles source
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
            maxZoom: 16,
            minZoom: 10,
        }).addTo(map);
        // add marker to the map
        marker = L.marker([lat, lon]).addTo(map);
        // add popup to the marker
        marker.bindPopup(" ساناسیر مبین شیراز ").openPopup();
    </script>


{/literal}
{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}

</body>
</html>