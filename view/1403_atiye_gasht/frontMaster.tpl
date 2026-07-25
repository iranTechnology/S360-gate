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
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="{$obj->Title_head()}">
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>


    <link rel="stylesheet" type="text/css" href="https://ghatar.ir/fa/user/GlobalFile/css/register.css">
    <link rel="stylesheet" type="text/css" href="project_files/css/all.min.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">
    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" href="project_files/css/style.css">
    {/if}
    {literal}
        <script src="https://ghatar.ir/fa/user/js/jquery-3.4.1.min.js"></script>
    {/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
</head>
<body>
{if $smarty.session.layout neq 'pwa' }
<header class="header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav id="navigation1" class="navigation">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                        <img src="project_files/images/logo_head.png" alt="{$obj->Title_head()}">
                    </a>
                </div>
                <div class="nav-menus-wrapper  mx-auto">
                    <ul class="nav-menu align-to-right">
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/train">قطار</a></li>
                        <li class=""><a href="javascript:;">تور</a>
                            <ul class="nav-dropdown first_child_menu  fadeIn animated">
                                <li><a href="javascript:;"> تور داخلی </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}


                                    </ul>
                                </li>
                                <li><a href="javascript:;"> تور خارجی </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>
                            </ul>
                        </li>

                        <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/article">وبلاگ</a></li>
                        <li><a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules">قوانین و مقررات</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/newsletter">عضویت در خبرنامه</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus">درباره ما</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus">تماس با ما</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <a class="button main-navigation__button2 stop-propagation" href="javascript:"
                {include file="`$smarty.const.FRONT_THEMES_DIR`atiye_gasht/topBarName.tpl"}

                <div class="button-chevron-2 "></div>
                </a>
                <div class="main-navigation__sub-menu2 arrow-up">
                    {include file="`$smarty.const.FRONT_THEMES_DIR`atiye_gasht/topBar.tpl"}
                </div>
                <div class="nav-toggle mr-3"></div>

            </nav>
        </div>
    </div>
</header>
{/if}

{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <div class="content_tech mt-2">
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
            <div class="but-top" id="scroll-top">
                <a href="javascript:" class="fa fa-angle-up"></a>
            </div>
            <div class="footer_main container">
                <ul class="m-0 p-0 d-flex">
                    <li class="col-12 col-md-12 my-2 col-lg-4 d-flex flex-column call">
                        <div class="nav-header">
                            <a class="nav-brand nav-brand2" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                                <img src="project_files/images/logo_foot.png" alt="{$obj->Title_head()}">
                                <div>
                                    <h2>آتیه گشت سبز</h2>
                                </div>
                            </a>
                        </div>

                        <span> <i class="far fa-map-marker"></i>  آدرس : {$smarty.const.CLIENT_ADDRESS} </span>
                        <span> <i class="far fa-phone-alt"></i>
                            شماره :
                            <a href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                        </span>
                        <span>
                             <i class="far fa-envelope"></i>
                            ایمیل :
                                <a href="mailto:{$smarty.const.CLIENT_EMAIL}">{$smarty.const.CLIENT_EMAIL}</a>
                        </span>

                    </li>
                    <li class="col-12 col-md-6 my-2 col-lg-4 d-flex flex-column">
                        <h6>دسترسی آسان</h6>
                        <div class="asan">
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/iran-tour" class="asan_link">تور داخلی</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/world-tour" class="asan_link">تور خارجی</a>
                            <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="asan_link">پیگیری خرید</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules" class="asan_link">قوانین و مقررات</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus" class="asan_link">درباره ما</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus" class="asan_link">تماس با ما</a>
                        </div>
                    </li>
                    <li class="col-9 col-sm-9 mx-auto col-md-6 my-2 col-lg-4 d-flex flex-column">
{*                        <h6>کد رهگیری</h6>*}
{*                        <form class="TrcBox w-100" action="/refrense/پیگیری-کد-رهگیری" method="get" name="FormCodeRahgiriPrj" id="FormCodeRahgiriPrj" style="width: 100%;">*}
{*                            <div class="code" style="margin-top: 1rem;">*}
{*                                <input id="txtsearch" aria-describedby="basic-addon1" type="text" name="CodeRahgiriTemp"*}
{*                                       onfocus="{this.value='';}"*}
{*                                       onblur="if (this.value==''){this.value='کد رهگیری خود را وارد کنید...';}"*}
{*                                       value="کد رهگیری خود را وارد کنید..." autocomplete="off">*}
{*                                <button class="btn button-winona" type="submit">*}
{*                                    <i class="fas fa-check"></i>*}
{*                                </button>*}
{*                            </div>*}
{*                        </form>*}
                        <div class="namads">
                            <a href="javascript:"><img src="project_files/images/certificate1.png" alt="Enamad1"></a>
                            <a href="javascript:"><img src="project_files/images/certificate2.png" alt="namad-1"></a>
                            <a href="javascript:"><img src="project_files/images/certificate3.png" alt="namad-2"></a>
                            <a href="javascript:"><img src="project_files/images/certificate4.png" alt="namad-3"></a>
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
    <script src="project_files/js/bootstrap.bundle.min.js"></script>
    <script src="project_files/js/mega-menu.js"></script>
    <script src="project_files/js/select2.min.js"></script>
    <script src="project_files/js/script.js"></script>
{/literal}
{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}
</body>
</html>