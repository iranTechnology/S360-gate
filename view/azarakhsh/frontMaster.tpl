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
        <link rel="stylesheet" href="project_files/css/font-awesome.min.css">
        <link rel="stylesheet" href="project_files/css/all.min.css" >
        <link rel="stylesheet" href="project_files/css/main.css">
        <link rel="stylesheet" href="project_files/css/tabs.css">
        <link rel="stylesheet" type="text/css" href="https://azp24.ir/fa/user/GlobalFile/css/register.css">
        <link rel="stylesheet" href="project_files/css/header.css">
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
        <div class="top_header">
            <div class="container">
                <div class="row">
                    <div class="phone_number col-md-6 col-xs-8 col-sm-8">
                        <a href="tel:02166949218" class="SMFooterPhone number-header">
                           {$smarty.const.CLIENT_PHONE} </a>
                        <i class="fas fa-phone-volume rotate-phone"></i>
                        <a href="mailto:azarakhsh.parseh@yahoo.com" class="SMFooterEmail email-header">
                           {$smarty.const.CLIENT_EMAIL}</a>
                        <i class="fa fa-envelope" aria-hidden="true"></i>
                    </div>
                    <!-- Left Side Content -->
                    <div class="left-side col-xs-12 col-sm-12 col-md-6">
                        <!-- Social Icons -->
                        <ul class="social-icons_top">
                            <li><a class="SMFaceBook facebook"    href="javascript:" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a class="SMTwitter twitter"      href="javascript:" target="_blank"><i class="fab fa-twitter"></i></a></li>
                            <li><a class="SMGoogle googleplus"    href="javascript:" target="_blank"><i class="fab fa-google-plus-g"></i></a></li>
                            <li><a class="SMInstageram instagram" href="javascript:" target="_blank"><i class="fab fa-instagram"></i></a></li>
                        </ul>
                        <div class="menu-login">
                            <div class="c-header__btn-container">
                                <div class="c-header__btn">
                                    <a class="c-header__btn-login" href="javascript:;">
                                        <i class="fas fa-user-alt"></i>
                                        {include file="`$smarty.const.FRONT_THEMES_DIR`azarakhsh/topBarName.tpl"}
                                        <div class="main-navigation__sub-menu2 arrow-up">
                                            {include file="`$smarty.const.FRONT_THEMES_DIR`azarakhsh/topBar.tpl"}
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Left Side Content / End -->
                </div>
            </div>
        </div>
        <header class="header_area">
            <div class="main_header_area animated">
                <div class="container">
                    <nav id="navigation1" class="navigation">
                        <div class="nav-header"><a class="nav-brand d-flex align-items-center justify-content-center" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                                <img src="project_files/images/logo.png" alt="azarakhsh-parseh-ariana" class="logo-icon">
                                <div class="parent-titr-logo">
                                    <h2>آذرخش پارسه آریانا</h2>
                                    <span>آژانس مسافرتی</span>
                                </div>
                            </a>
                            <div class="nav-toggle"></div>
                        </div>
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu">
                                <li><a href="javascript:;"> تورها </a>

                                    <ul class="nav-dropdown submenu-child fadeIn animated">

                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-1/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>
                                <li><a href="javascript:;"> هتل ها </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">

                                        {foreach key=key_hotel item=item_hotel from=$objResult->ReservationHotelCities('=1','20')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/searchHotel/{$item_hotel.City_id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/1/all/reservation">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_hotel.NAME : $item_hotel.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>

                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید </a></li>
                                <li><a  class="SMNews" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار سایت </a></li>
                                <li><a href="javascript:;">مشتریان</a>
                                    <ul class="nav-dropdown">
                                        <li><a class="SMRules" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules"> قوانین و مقررات </a></li>
                                        <li><a class="SMBlog" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog">مقالات مفید</a></li>
                                    </ul>
                                </li>
                                <li class="hotels_m viza"><a href="javascript:;">ویزا</a>
                                    <ul class="nav-dropdown fadeIn animated">


                                        {foreach key=key_continent item=item_continent from=$objResult->GetGdsContinents()}
                                            <li>
                                                <a href="javascript:;">
                                                    {$item_continent.titleFa}
                                                </a>
                                                <ul class="nav-dropdown submenu-child fadeIn animated my-dropdown">

                                                    {foreach key=key_country item=item_country from=$objResult->GetGdsCountriesByContinent($item_continent.id)}
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/resultVisa/{$item_country.code}/all/1-0-0">{$item_country.title}</a>
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </li>
                                        {/foreach}

                                    </ul>
                                </li>

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


{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <main>
        <div class="news-parent">
            <div class="container">
                <div class="temp-content temp-content2">
                    <div class="temp-wrapper" id="public_load">
                        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
                    </div>
                </div>
            </div>
        </div>
    </main>
{/if}
{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

<footer>      <!-- Main -->
    <div class="container">
        <div class="row footer_section">
            <div class="footer-icon col-lg-4 col-md-4 col-sm-6 col-xs-12 map"></div>
            <div class="cantact col-lg-4 col-md-4 col-sm-6 col-xs-12"><h4>اطلاعات تماس</h4>
                <p class="address SMFooterAddress">
                    <span>آدرس : </span>{$smarty.const.CLIENT_ADDRESS}</p>
                <a class="phoneNumber">{$smarty.const.CLIENT_PHONE}</a>
                <div class="footer-network">
                    <ul class="social-icons_top">
                        <li><a class="SMFaceBook facebook" href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a class="SMTwitter twitter" href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                        <li><a class="SMGoogle googleplus" href="#" target="_blank"><i class="fab fa-google-plus-g"></i></a></li>
                        <li><a class="SMInstageram instagram" href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="info col-lg-4 col-md-4 col-sm-6 col-xs-12"><h4>اطلاعات</h4>
                <div class="cantactBox">

                    <div class="SMFooterPhonemobile">
                        {$smarty.const.CLIENT_PHONE}
                    </div>
                    <a href="mailto:azarakhsh.parseh@yahoo.com" class="email SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a></div>
            </div>
        </div>
    </div>
    <div class="container-fluid copyright-parent">
        <div class="row">
            <!-- Copyright -->
            <div class="copyright">کپی رایت © 1399 | تمامی حقوق متعلق به <a href="https://www.iran-tech.com/"
                                                                            target="_blank"> ایران تکنولوژی می باشد.</a>
                &nbsp;|&nbsp;<a class="SMAbout" href="">درباره ما</a>&nbsp;|&nbsp;<a class="SMContactUs" href="#">تماس با ما</a></div>
        </div>
    </div>
</footer>
{/if}

{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}

{/if}
<a id="scroll-top" style="cursor: pointer; display: block;">
    <button><i class="fas fa-arrow-up"></i></button>
</a>
{literal}
    <script  src="project_files/js/bootstrap.bundle.min.js"></script>
    <script  src="project_files/js/megamenu.js"></script>
    <script  src="project_files/js/scripts.js"></script>
{/literal}

{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

</body>
</html>
