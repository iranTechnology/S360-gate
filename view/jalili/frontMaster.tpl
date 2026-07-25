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
    <link rel="stylesheet" href="project_files/css/style.css">
    {if $smarty.session.layout neq 'pwa'}
    <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
    <link rel="stylesheet" href="project_files/css/font-awesome.min.css">
    <link rel="stylesheet" href="project_files/css/line-awesome.min.css" >
    <link rel="stylesheet" href="project_files/css/all.min.css">
    <link rel="stylesheet" href="project_files/css/animate.min.css">
    <link rel="stylesheet" href="project_files/css/aos.css">
   {* <link rel="stylesheet" href="project_files/css/select2.css">*}
{*    <link rel="stylesheet" href="project_files/css/owl.carousel.min.css">
    <link rel="stylesheet" href="project_files/css/owl.theme.default.min.css">*}
    <link rel="stylesheet" href="project_files/css/header.css">

    <link rel="stylesheet" type="text/css" href="https://drbilit.ir/fa/user/GlobalFile/css/register.css">

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
        <header class="header_area" id="header_area_op">
            <div class="main_header_area animated">
                <div class="container">
                    <nav id="navigation1" class="navigation">
                        <div class="nav-menus-wrapper">
                            <div class="top_menu_sub"><a class="nav-brand logo_in_menu" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/"> <img
                                            src="project_files/images/logo.png"> </a> <span>آژانس مسافرتی دکتر بلیط</span></div>
                            <ul class="nav-menu">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/flight"> <i class="fas fa-plane"></i>&nbsp;&nbsp; هواپیما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/bus"><i class="fa fa-bus"></i>&nbsp;&nbsp; اتوبوس</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog" class="SMBlog"> <i class="fas fa-newspaper"></i>&nbsp;&nbsp; مقالات مفید </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules" class="SMRules"> <i class="fas fa-clipboard-list"></i>&nbsp;&nbsp; قوانین و مقررات </a>
                                </li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus" class="SMAbout"><i class="fas fa-info"></i> درباره ما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus" class="SMContactUs"><i class="fa fa-phone-office"></i>&nbsp;&nbsp; تماس با ما </a></li>
                                <li><a href="https://fids.airport.ir"><i class="fa fa-info-circle  "></i> اطلاعات فرودگاه های کشور </a></li>
                            </ul>
                        </div>
                        <div class="nav-header"><a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/"> <img
                                        src="project_files/images/logo.png" alt="" class="logo"> </a>
                            <div class="left-header-nav">
                               {* <div class="menu-login">
                                    <div class="top-user-menu">
                                        <button class="main-navigation-button2"><i class="fas fa-user-plus"></i> ورود /
                                            ثبت نام
                                        </button>
                                    </div>
                                </div>*}
                                <div class="menu-login">
                                    <div class="c-header__btn">
                                        <div class="c-header__btn-login" href="javascript:;">
                                            <i class="fas fa-user-plus"></i>
                                            {include file="`$smarty.const.FRONT_THEMES_DIR`jalili/topBarName.tpl"}
                                        </div>
                                        <div class="main-navigation__sub-menu2 arrow-up">
                                            {include file="`$smarty.const.FRONT_THEMES_DIR`jalili/topBar.tpl"}
                                        </div>
                                    </div>
                                </div>
                                <div class="footer-network">
                                    <ul class="social-icons_top_footer">
                                        <li><a class="SMTelegram telegram" href="javascript:;" target="_blank"><i
                                                        class="fa fa-paper-plane"></i></a></li>
                                        <li><a class="SMInstageram instagram" href="javascript:;" target="_blank"><i
                                                        class="fab fa-instagram"></i></a></li>
                                        <li><a class="SMWhatsapp whatsapp" href="javascript:;" target="_blank"><i class="fab fa-whatsapp"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="paygiri-parent"><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="top-kharid">پیگیری بلیط / کنسلی</a> <i
                                            class="fa fa-shopping-cart"></i></div>
                            </div>
                            <div class="nav-toggle"></div>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
    </div>
</header>
{/if}





    {if $smarty.const.GDS_SWITCH eq 'app'}
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
    {else}
        <main>
            <div class="fastflight2 {if $smarty.session.layout eq 'pwa'} fastflight2-pwa {/if} ">
                <div class="container">
                    <div class="center-eleman {if $smarty.session.layout eq 'pwa'} center-eleman-pwa {/if} ">
                    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
                    </div>
                </div>
            </div>
        </main>
    {/if}

{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

    <footer>     <!-- Main -->
    <div class="footer-menu">
        <div class="container">
            <div class="row">
                <div class="nav-footer col-md-4 col-sm-12 col-xs-12"><h4>اطلاعات</h4>
                    <div class="nav-menus-wrapper">
                        <ul class="nav-menu-footer">
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/"> <i class="fa fa-angle-double-left" aria-hidden="true"></i> صفحه اصلی </a>
                            </li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog"> <i class="fa fa-angle-double-left" aria-hidden="true"></i> مقالات مفید </a>
                            </li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> <i class="fa fa-angle-double-left" aria-hidden="true"></i> پیگیری خرید </a>
                            </li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules"> <i class="fa fa-angle-double-left" aria-hidden="true"></i> قوانین و مقررات
                                </a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus"> <i class="fa fa-angle-double-left" aria-hidden="true"></i> درباره ما </a>
                            </li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus"> <i class="fa fa-angle-double-left" aria-hidden="true"></i> تماس با ما </a>
                            </li>
                        </ul>
                    </div>
                    <!--  <h4>دریافت اپلیکیشن گردشگری دکتر بلیط</h4>                       <div class="col-xs-12 nimappimg">                           <div class="nimimgs42">                               <a href="#"><img src="images/android.png"></a>                           </div>                           <div class="nimimgs42">                               <a href="#"><img src="images/appstore.png"></a>                           </div>                       </div>-->
                </div>
                <div class="cantact col-md-4 col-sm-6 col-xs-12"><h4>تماس</h4>
                    <div class="address"><i class="fas fa-map-marked-alt"></i>
                        <span class="SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</span>

                    </div>
                    <div class="email"><i class="fad fa-envelope-open-text"></i> <a
                                href="mailto:{$smarty.const.CLIENT_EMAIL}" class="SMFooterEmail email">{$smarty.const.CLIENT_EMAIL}</a>
                    </div>
                    <div class="phoneNumber"><i class="fas fa-mobile-alt"></i><!--<Span> موبایل:</Span>--> <a
                                class="SMFooterPhone mobile">{$smarty.const.CLIENT_PHONE}</a></div>

                </div>

                <div class="footer-icon col-md-4 col-sm-6 col-xs-12 map-aita">
                    <div id="g-map">


                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-end">
        <div class="container-fluid">
            <div class="row ">
                <!-- Copyright -->
                <div class="col-xs-12 copy-titr">
                    <!--  <i class="fa fa-copyright" aria-hidden="true"></i>-->
                    کلیه حقوق این سایت متعلق به دکتر بلیط می باشد.
                </div>

            </div>
        </div>
    </div>
</footer>
{/if}

{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}

{/if}

<a id="scroll-top" style="cursor: pointer; display: block;">
    <button><i class="fa fa-angle-up"></i></button>
</a>
{*<script  src="project_files/js/bootstrap.bundle.min.js"></script>*}

{literal}
    <script  src="project_files/js/megamenu.js"></script>
    <script  src="project_files/js/scripts.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>

    <script type="text/javascript">
        // position we will use later ,
        var lat = 35.72819750227703;
        var lon = 51.522827854231345;
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
        marker.bindPopup("دکتر بلیط").openPopup();
    </script>
{/literal}

{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

</body>
</html>