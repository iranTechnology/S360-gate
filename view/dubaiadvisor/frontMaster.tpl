{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{load_presentation_object filename="reservationHotel" assign="objHotel"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
<!DOCTYPE html>
<html lang="fa-IR" dir="rtl">
<head>
    <title>{$obj->Title_head()}</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="description" content="{$obj->Title_head()}">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">
    <link rel="stylesheet" href="project_files/css/all.css">
    <link rel="stylesheet" href="project_files/css/header.css">
    <link rel="stylesheet" href="project_files/css/style.css">
    <link rel="stylesheet" type="text/css" href="https://dubaiadvisor.ir/fa/user/GlobalFile/css/register.css">

    {literal}
        <script src="project_files/js/jquery-3.6.0.min.js"></script>
    {/literal}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
</head>
<body>
    <header class="header_area">
        <div class="main_header_area animated" id="nav">
            <div class="header_top">
                <div class="container">
                    <div>
                        <div class="menu-login">
                            <div class="c-header__btn">
                                <button class="main-navigation__button2 logIn d-flex align-items-center">
                                    <i class="far fa-user mr-2"></i>
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`dubaiadvisor/topBarName.tpl"}
                                    <div class="button-chevron-2 ">
                                    </div>
                                </button>
                                <div class="main-navigation__sub-menu2 arrow-up">
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`dubaiadvisor/topBar.tpl"}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tells">
                        <span>
                            <a class="SMFooterPhone" href="tel:{$smarty.const.CLIENT_PHONE}"><i class="far fa-phone"></i> {$smarty.const.CLIENT_PHONE}</a>
                        </span>
                        <span>
                            <a href="mailto:{$smarty.const.CLIENT_EMAIL}" target="_top" class="SMFooterEmail"><i class="far fa-envelope"></i>{$smarty.const.CLIENT_EMAIL}</a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="container ">
                <nav id="navigation1" class="navigation">
                    <div class="nav-header">
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img src="project_files/images/logoo.png" alt="{$obj->Title_head()}">
                        </a>
                    </div>
                    <div class="nav-menus-wrapper ml-auto">
                        <ul class="nav-menu align-to-right">

                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}"><i class="fa fa-home"></i> HOME</a></li>
                            <li>
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/#search_hotel">
                                    <i class="fa fa-hotel"></i>
                                    HOTELS
                                </a>
                            </li>
                            <li>
                                <a href="javascript:"><i class="fas fa-passport"></i> VISA</a>
                                <ul class="nav-dropdown">
                                        <li>
                                            <a href="javascript:;">
                                               Asia
                                            </a>
                                            <ul class="nav-dropdown submenu-child fadeIn animated">
                                                {foreach key=key_country item=item_country from=$objResult->GetGdsCountriesByContinent(1)}
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultVisa/{$item_country.code}/all/1-0-0">{$item_country.title_en}</a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </li>
                                    <li>
                                        <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/#search_visa">Search Visa</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus"><i class="fa fa-user"></i> ABOUT US</a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog"><i class="fa fa-book"></i> UAE News </a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"><i class="fa fa-address-card"></i> TRACK ORDER</a></li>

                        </ul>
                    </div>
                    <div class="nav-toggle ml-2"></div>
                </nav>
            </div>
        </div>
    </header>

    <div class="content_tech mt-3">
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>

        </div>
    </div>

    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
    <footer dir="ltr">

        <div class="main-footer row">
            <div class="container clear-padding row">
                <div id="text-2" class="col-lg-4 col-md-6 col-12 about-box widget_text">
                    <h4>ABOUT US</h4>
                    <div class="textwidget d-flex flex-column">
                        <p>
                            {$smarty.const.ABOUT_ME}
                        </p>
                        <div class="d-flex">
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus" class="SMAbout mr-2">More</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus" class="SMContactUs">CONTACT US</a>
                        </div>
                    </div>
                </div>
                <div id="text-3" class="col-lg-4 col-md-6 col-12 links widget_text">
                    <h4>Popular hotels</h4>
                    <div class="textwidget">
                        <ul>
                            {foreach key=key_hotel item=item_hotel from=$objHotel->hotelReservationFullyData('1', '4', '', '= 1')}
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item_hotel.id}/{$item_hotel.name_en}">
                                        {$item_hotel.name_en}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                <div id="text-5" class="col-lg-4 col-md-6 col-12 contact-box widget_text">
                    <h4>contact us</h4>
                    <div class="textwidget">
                        <p>
                            <i class="fa fa-home "></i>
                            <a class="SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</a>
                        </p>
                        <p>
                            <i class="fa fa-phone"></i>
                            <a class="SMFooterPhone" href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                        </p>
                        <p>
                            <i class="fa fa-envelope"></i>
                            <a href="mailto:{$smarty.const.CLIENT_EMAIL}" target="_top" class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a>
                        </p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </footer>
    {/if}

    <div class="but-top" id="scroll-top">
        <a href="javascript:" class="fa fa-angle-up"></a>
    </div>
</body>
{literal}
<script type="text/javascript" src="project_files/js/bootstrap.bundle.js"></script>
<script type="text/javascript" src="project_files/js/megamenu.js"></script>
<script type="text/javascript" src="project_files/js/scripts.js"></script>
{/literal}
{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</html>