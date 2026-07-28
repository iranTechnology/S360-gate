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
    <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
    <link rel="stylesheet" href="project_files/css/all.min.css">
    <link rel="stylesheet" href="project_files/css/animate.min.css" >
    <link rel="stylesheet" href="project_files/css/aos.css">
    <link rel="stylesheet" href="project_files/css/style.css">
    <link rel="stylesheet" href="project_files/css/select2.css">
    <link rel="stylesheet" href="project_files/css/tabs.css">
    <link rel="stylesheet" href="project_files/css/owl.carousel.min.css">
    <link rel="stylesheet" href="project_files/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="project_files/css/header.css">
    <link rel="stylesheet" type="text/css" href="https://eskantour.com/fa/user/GlobalFile/css/register.css">




    {literal}
        <script  src="project_files/js/jquery-3.4.1.min.js"></script>
    {/literal}


    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
</head>
<body>

<header>
    <div class="main_head">
        <div class="top_header">
            <div class="container">
                <div class="row">
                    <div class="right-parent-head">
                        {*<div class="menu-login">
                            <div class="top-user-menu">
                                <button class="main-navigation-button2"><i class="fas fa-user-alt"></i> ورود / ثبت نام
                                </button>
                            </div>
                        </div>*}
                        <div class="menu-login">
                            <div class="c-header__btn">
                                <div class="c-header__btn-login" href="javascript:;">
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`aftab_shargh/topBarName.tpl"}
                                </div>
                                <div class="main-navigation__sub-menu2 arrow-up">
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`aftab_shargh/topBar.tpl"}
                                </div>
                            </div>
                        </div>
                        <div class="paygiri-parent"><i class="fa fa-shopping-cart" aria-hidden="true"></i><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="top-kharid">پیگیری خرید</a></div>
                    </div>
                    <div class="phone_number">
                        <i class="fa fa-mobile" aria-hidden="true"></i>
                        <a href="tel:09335716004" class="SMFooterPhone top-header-parent">  {$smarty.const.CLIENT_PHONE} </a></div>
                </div>
            </div>
        </div>
        <header class="header_area" id="header_area_op">
            <div class="main_header_area animated">
                <div class="container">
                    <nav id="navigation1" class="navigation">
                        <div class="nav-header"><a class="nav-brand" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/"> <img
                                        src="project_files/images/logo.png" alt="" class="logoc"> </a>
                            <div class="nav-toggle"></div>
                        </div>
                        {assign var="urlHotelRoomInfo" value="/hotelRoomInfo"}
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu">
                                <li><a href="javascipt:">امکانات اقامتگاه </a>
                                    <ul class="nav-dropdown">
                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/specific/2">اماکن عمومی</a>
                                        {*<li><a href="javascript:" id="HotelRoominfo" onclick="viewHotel('{$smarty.const.ROOT_ADDRESS}{$urlHotelRoomInfo}')">اتاقها</a>*}
                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/specific/3">رستورانها</a>
                                    </ul>
                                </li>
                                <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/logbook" >دفترچه خاطرات مهمانها</a></li>
                                <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog" class="SMBlog">اطلاعات مفید</a></li>
                                <li><a href="javascript:">درباره ما</a>
                                    <ul class="nav-dropdown">
                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus" class="SMAbout">درباره اقامتگاه</a>
                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/news" class="SMNews">اخبار اقامتگاه</a>
                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules" class="SMRules"> قوانین و مقررات </a></li>
                                    </ul>
                                </li>
                                <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus" class="SMContactUs">تماس با ما</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </header>
    </div>


    <main>

        <div class="parent">
{*            <div class="container">*}

{*                <div class="row center-eleman">*}
{*                    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}*}
{*                </div>*}

{*            </div>*}
            <div class="container">
                <div class="temp-content temp-content2">
                    <div class="temp-wrapper" id="public_load">

                        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}

                    </div>
                </div>
            </div>
        </div>

    </main>
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}


    <footer>      <!-- Main -->
        <div class="container">
            <div class="row">
                <div class="footer-icon col-md-4 col-sm-6 col-xs-12 map"></div>

                <div class="cantact col-md-3 col-sm-6 col-xs-12"><h4>اطلاعات تماس</h4>
                    <p class="address SMFooterAddress"><span>آدرس : </span>{$smarty.const.CLIENT_ADDRESS}</p>
                </div>
                <div class="links col-md-2 col-sm-6 col-xs-12" style="padding: 10px;"><h4>دسترسی سریع</h4>
                    <div class="links-parents">
                        <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus" class="SMAbout">دریاره اقامتگاه</a>
                        <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus" class="SMContactUs">تماس با اقامتگاه</a>
                        <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules" class="SMRules">قوانین و مقررات</a>
                    </div>
                </div>
                <div class="info col-md-3 col-sm-6 col-xs-12" style="padding: 10px;"><h4>اطلاعات</h4>
                    <div class="cantactBox">
                        <div class="cantactBox-child">
                            <i class="fa fa-envelope-open" aria-hidden="true"></i>
                            <a href="mailto:{$smarty.const.CLIENT_EMAIL}" class=" SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a>
                        </div>
                        <div class="cantactBox-child">
                            <i class="fa fa-mobile" aria-hidden="true"></i>
                            <a class="SMFooterMobile">{$smarty.const.CLIENT_PHONE}</a></div>
                        </div>
                    </div>

            </div>
            <div class="row">              <!-- Copyright -->
                <div class="copyright col-xs-12 col-sm-6"><a href="https://www.iran-tech.com/" target="_blank"> طراحی سایت
                        آژانس هواپیمایی : </a> ایران تکنولوژی
                </div>
                <div class="footer-network col-xs-12 col-sm-6">
                    <ul class="social-icons_top">
                        <li><a class="SMTelegram telegram" href="javascript:" target="_blank"><i class="fab fa-telegram-plane"></i></a></li>
                        <li><a class="SMTwitter twitter" href="javascript:" target="_blank"><i class="fab fa-twitter"></i></a></li>
                        <li><a class="SMInstageram instagram" href="javascript:" target="_blank"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    {/if}
    <a id="scroll-top" style="cursor: pointer; display: block;">
        <button><i class="fa fa-angle-double-up" aria-hidden="true"></i></button>
    </a>
    {literal}

        <script  src="project_files/js/megamenu.js"></script>
        <script  src="project_files/js/scripts.js"></script>

    {/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>
</html>