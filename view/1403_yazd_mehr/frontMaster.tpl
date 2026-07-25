{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
{assign var="gds_project_file_name" value="yazd_mehr"}
{*ofoghtravel*}
<!DOCTYPE html>
<html lang="fa-IR" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>

    <link rel="stylesheet" type="text/css" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">

    {literal}
        <script src="project_files/js/jquery-3.4.1.min.js"></script>
    {/literal}

    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/all.css">
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" href="project_files/css/style.css">
    {/if}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}



</head>
<body>
{if $smarty.session.layout neq 'pwa' }
<header class="header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container-fluid">
            <nav class="navigation d-flex align-items-center">
                <div class="nav-header">
                    <a class="d-flex"
                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img src="project_files/images/logo.png" alt="یزد مهر نوین">
                        <div class="text-nav-header">
                            <h1>یزد مهرنوین</h1>
                            <span>خدمات مسافرتی</span>
                        </div>
                    </a>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
{*                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/flight">پرواز</a></li>*}
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/bus">اتوبوس</a></li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/hotel">هتل ها</a></li>
                        <li class=""><a href="javascript:">تور</a>
                            <ul class="nav-dropdown first_child_menu  ">
                                <li><a href="javascript:"> تور داخلی </a>
                                    <ul class="nav-dropdown submenu-child  ">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>

                                <li><a href="javascript:"> تور خارجی </a>
                                    <ul class="nav-dropdown submenu-child  ">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/tour">جست و جوی تور</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:">خدمات گردشگری</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/insurance">بیمه</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/order2">درخواست خدمات</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/visacountry">ویزا</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/pay">پرداخت</a></li>
                            </ul>
                        </li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fun">تفریحات</a></li>
                        <li><a href="javascript:">دانستنیها</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/vote">نظرسنجی</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/faq">سوالات متداول</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/logbook">سفرنامه</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog">وبلاگ</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus">درباره ما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus">تماس با ما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules">قوانین و مقررات</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:">آژانس های همکار</a></li>
                    </ul>
                </div>
                <div class="box_button_header">
                    <button class="stop-propagation main-navigation__button2 button_header logIn">
                            <i>
                                <svg viewBox="0 0 448 512">
                                    <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM224 32c52.94 0 96 43.06 96 96c0 52.93-43.06 96-96 96S128 180.9 128 128C128 75.06 171.1 32 224 32zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM413.3 480H34.66C33.2 480 32 478.8 32 477.3C32 399.4 95.4 336 173.3 336h101.3C352.6 336 416 399.4 416 477.3C416 478.8 414.8 480 413.3 480z"/>
                                </svg>
                            </i>
                            {include file="`$smarty.const.FRONT_THEMES_DIR`{$gds_project_file_name}/topBarName.tpl"}
                            <div class="button-chevron-2 ">
                            </div>
                    </button>
                    <div class="stop-propagation main-navigation__sub-menu2 arrow-up" style="display: none">

                        {include file="`$smarty.const.FRONT_THEMES_DIR`{$gds_project_file_name}/topBar.tpl"}

                    </div>
                    <a class="button_header" href="{$smarty.const.ROOT_ADDRESS}/UserTracking"><span>پیگیری خرید</span></a>
                </div>
                <div class="nav-toggle mr-1">
                    <svg viewBox="0 0 448 512">
                        <path d="M0 80C0 71.16 7.164 64 16 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H16C7.164 96 0 88.84 0 80zM0 240C0 231.2 7.164 224 16 224H432C440.8 224 448 231.2 448 240C448 248.8 440.8 256 432 256H16C7.164 256 0 248.8 0 240zM432 416H16C7.164 416 0 408.8 0 400C0 391.2 7.164 384 16 384H432C440.8 384 448 391.2 448 400C448 408.8 440.8 416 432 416z"/>
                    </svg>
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



<footer class="footer">
    <div class="footer_main container">
        <ul class="m-0 p-0 d-flex">
            <li class="col-12 col-md-6 my-4 col-lg-4 call">
                <h6>تماس با ما</h6>
                <span> <i class="far fa-map-marker"></i> آدرس : {$smarty.const.CLIENT_ADDRESS}</span>
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
                    <a href="https://instagram.com/yazdmehrtour?igshid=NTc4MTIwNjQ2YQ==" class="fab fa-instagram footer_instagram"></a>
                    <a href="javascript:" class="fab fa-whatsapp footer_whatsapp"></a>
                    <a href="https://t.me/yazdmehrtour" class="fab fa-telegram footer_telegram"></a>
                </div>
            </li>
            <li class="col-12 col-md-6 my-4 col-lg-4">
                <h6>دسترسی آسان</h6>
                <div class="asan">
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/faq">انتقادات و پیشنهادات</a>
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/news">اخبار</a>
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/blog">وبلاگ</a>
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/logbook">سفر نامه</a>
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/rules">قوانین و مقررات</a>
                    <a class="asan_link" href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a>
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/aboutus">درباره ما</a>
                    <a class="asan_link" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/contactus">تماس با ما</a>
                </div>
            </li>
            <li class="col-12 col-md-6 my-4 col-lg-4 d-flex flex-column">

                <div class="namads">
                    <a href="javascript:"><img src="project_files/images/Enamad1.png" alt="Enamad1"></a>
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

<div class="float-sm">

    <div class="fl-fl float-gp">
        <a href="
                " target="_blank">
            <i class="fab fa-telegram"></i>به ما ملحق شو!</a>
    </div>
    <div class="fl-fl float-rs">
        <a href="https://api.whatsapp.com/send?phone=+9892143322558" target="_blank">
            <i class="fab fa-whatsapp"></i>تماس با ما!</a>
    </div>
    <div class="fl-fl float-ig">
        <a href="https://instagram.com/username " target="_blank">
            <i class="fab fa-instagram"></i>ما رو دنبال کن!</a>
    </div>
</div>

{literal}
    <script type="text/javascript" src="project_files/js/modernizr.js"></script>
    <script src="project_files/js/mega-menu.js"></script>
    <script src="project_files/js/bootstrap.min.js"></script>
    <script src="project_files/js/script.js"></script>
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