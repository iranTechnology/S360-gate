{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}

{if $smarty.session.userId neq ''}
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

    <link rel="stylesheet" href="project_files/css/style.css">
    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/bootstrap.css">
        <link rel="stylesheet" href="project_files/css/all.css">
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" type="text/css" href="https://ani-p.com/fa/user/GlobalFile/css/register.css">
    {/if}
    {literal}
        <script src="project_files/js/jquery-3.6.0.min.js"></script>
        <script src="project_files/js/bootstrap.bundle.js"></script>
    {/literal}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>
<body>
{if $smarty.session.layout neq 'pwa' }
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <header class="header_area">
        <div id="navbar">
            <div class="main_header_area animated container">
                <nav id="navigation1" class="navigation">
                    <div class="nav-header">
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img width="100px" src="project_files/images/logo.png" alt="{$obj->Title_head()}"></a>
                        <h1>آنی پرداخت</h1>
                    </div>
                    <div class="nav-menus-wrapper">
                        <ul class="nav-menu align-to-right">
                            <li>
                                <a href="javascript:">تور</a>
                                <ul class="nav-dropdown">
                                    <li><a href="javascript:">داخلی</a>
                                        <ul class="nav-dropdown">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </li>
                                    <li><a href="javascript:">خارجی</a>
                                        <ul class="nav-dropdown">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/tour"> جست و جوی تور </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/flight">پرواز</a>
                            </li>
                            <li>
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/hotel">هتل</a>
                            </li>

                            <li>
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/insurance">بیمه</a>
                            </li>
                            <li>
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/visacountry">ویزا</a>
                            </li>
                            <li>
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog">وبلاگ</a>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a>
                            </li>
                            <li>
                                <a href="javascript:">دانستنیها</a>
                                <div class="megamenu-panel">
                                    <div class="megamenu-lists">
                                        <ul class="megamenu-list">
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules">قوانین و
                                                    مقررات</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutiran">معرفی
                                                    ایران</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutcountry">معرفی
                                                    کشور ها</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/faq">پرسش های
                                                    متداول</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/embassy">سفارت
                                                    خانه</a></li>
                                        </ul>
                                        <ul class="megamenu-list">
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/order">درخواست
                                                    خدمات</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/worldclock">ساعت
                                                    کشور ها</a></li>
                                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/vote">نظر سنجی</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:">آژانس ما</a>
                                <ul class="nav-dropdown">
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus">درباره آنی
                                            پرداخت</a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus">تماس با ما</a>
                                    </li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/staff">مدیران و پرسنل</a>
                                    </li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/registerAgency">اخذ و اعطای نمایندگی</a>
                                    </li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/specific/19">جذب همکار و
                                            نیروی متخصص</a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/specific/20">مشارکت و ایده
                                            های نو</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mt-auto mb-auto mr-auto">
                        <div class="logIn top__user_menu">
                            <i class="far fa-user"></i>
                            <button class="main-navigation__button2">
                               <span>
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`ani_pardakht/topBarName.tpl"}
                                </span>
                                <div class="button-chevron-2 ">
                                </div>
                            </button>
                            <div class="main-navigation__sub-menu2 arrow-up">
                                {include file="`$smarty.const.FRONT_THEMES_DIR`ani_pardakht/topBar.tpl"}
                            </div>
                        </div>
                    </div>
                    <div class="nav-toggle"></div>
                </nav>
            </div>
        </div>
    </header>
    {/if}
{/if}


{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
    {else}
    <div class="content_tech mt-3">
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}


{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <footer class="footer mt-3">
            <div class="footer_main container">
                <ul class="m-0 p-0 d-flex">
                    <li class="col-12 col-md-6 col-lg-4">
                        <h6>درباره ما</h6>
                        <p>
                            {$smarty.const.ABOUT_ME}
                        </p>
                        <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus"> بیشتر <i
                                    class="far fa-angle-left mr-1"></i></a>
                    </li>
                    <li class="col-12 col-md-6 col-lg-4 call">
                        <h6>تماس با ما</h6>
                        <span> <i class="far fa-map-marker"></i> آدرس:  {$smarty.const.CLIENT_ADDRESS}</span>
                        <span> <i class="far fa-phone"></i>
                    شماره :
                    <a href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                </span>
                        <span> <i class="far fa-phone"></i>
                    شماره :
                    <a href="tel:{$smarty.const.CLIENT_MOBILE}">{$smarty.const.CLIENT_MOBILE}</a>
                </span>
                        <span>
                     <i class="far fa-envelope"></i>
                    ایمیل :
                    <a href="mailto:{$smarty.const.CLIENT_EMAIL}">{$smarty.const.CLIENT_EMAIL}</a>
                </span>
                        <div class="footer_icons">
                            <a rel="nofollow" target="_blank"
                               class="SMInstageram fab fa-instagram footer_instagram"></a>
                            <a rel="nofollow" target="_blank" class="SMWhatsApp fab fa-whatsapp footer_whatsapp"></a>
                            <a rel="nofollow" target="_blank" class="SMTelegram fab fa-telegram footer_telegram"></a>
                        </div>
                    </li>
                    <li class="col-12 col-md-6 col-lg-4 d-flex flex-column">
                        <div class="namads">
                            <a href="javascript:"><img src="project_files/images/namad-1.png" alt="namad-1"></a>
                            <a href="javascript:"><img src="project_files/images/Enamad2.png" alt="namad-2"></a>
                            <a href="javascript:"><img src="project_files/images/namad-3.png" alt="namad-3"></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="last_text col-12">
                <a class="last_a" href="https://www.iran-tech.com/" target="_blank">طراحی سایت گردشگری</a>
                <p class="last_p_text">: ایران تکنولوژی</p>
            </div>
        </footer>
    {/if}

{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}

{/if}

{literal}
    <script src="project_files/js/select2.min.js"></script>
    <script src="project_files/js/megamenu.js"></script>
    <script src="project_files/js/script.js"></script>
{/literal}

{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

</body>
</html>