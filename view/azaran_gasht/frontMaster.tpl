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

    <link rel="stylesheet" type="text/css" href="https://kifsafar.com/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">


    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/all.min.css">
        <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
        <link rel="stylesheet" href="project_files/css/header.css">
        <link rel="stylesheet" href="project_files/css/style.css">
    {/if}
    {literal}
        <script src="https://kifsafar.com/fa/user/js/jquery-3.4.1.min.js"></script>
    {/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
</head>
<body>
<div class="footer_fix_parent">
    {if $smarty.session.layout neq 'pwa' }
        <header class="header_area">
            <div class="main_header_area animated" id="navbar">
                <div class="container-fluid">
                    <nav id="navigation1" class="navigation">
                        <div class="nav-header">
                            <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                                <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                            </a>
                        </div>
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu align-to-right">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/tour">تور</a>

                                </li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/flight">پرواز</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel">هتل</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/visacountry">ویزا</a>
                                </li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/article">وبلاگ</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a></li>
                                <li><a href="javascript:">آژانس ما</a>
                                    <ul class="nav-dropdown">
                                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules">قوانین و مقررات</a></li>
                                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus">درباره ما</a></li>
                                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus">تماس با ما</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                        <a href="tel:{$smarty.const.CLIENT_PHONE}" class="bg-transparent btn btn-primary phon-me mr-auto my-0 p-0">
                            <span>                         <i class=" far fa-phone-alt"></i>
     پشتیبانی : <br> {$smarty.const.CLIENT_PHONE}</span>
                        </a>
                        <a class=" stop-propagation main-navigation__button2 btn btn-primary mr-3 btn-me" href="javascript:">
                            <i class="far fa-user"></i>
                            {include file="`$smarty.const.FRONT_THEMES_DIR`azaran_gasht/topBarName.tpl"}
                            <div class="button-chevron-2 "></div>

                        </a>
                        <div class="stop-propagation main-navigation__sub-menu2 arrow-up">
                            {include file="`$smarty.const.FRONT_THEMES_DIR`azaran_gasht/topBar.tpl"}
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
</div>
{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

        <footer class="footer">
            <div class="container">
                <div class="best w-100">
                    <div class="col-lg-4 my-3 col-md-6 col-12">
                        <i class="far fa-plane"></i>
                        <div>
                            <h6>رزرو بلیط</h6>
                            <span>رزرو بلیط هواپیما از معتبرترین ایرلاین ها</span>
                        </div>
                    </div>
                    <div class="col-lg-4 my-3 col-md-6 col-12">
                        <i class="far fa-circle-dollar"></i>
                        <div>
                            <h6>درخواست استرداد</h6>
                            <span>سریع‌ترین راه برای کنسلی و لغو رزرو</span>
                        </div>
                    </div>
                    <div class="col-lg-4 my-3 col-md-6 col-12">
                        <i class="fa fa-ticket"></i>
                        <div>
                            <h6>خرید بلیط چارتری</h6>
                            <span>خرید بلیط چارتری با بهترین قیمت</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 footer-main-right">
                    <ul class="flex-wrap">
                        <li class="col-sm-4 my-3 my-xs-0 col-xs-6 col-6">
                            <h6>دسترسی آسان</h6>
                            <a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules">قوانین و مقررات</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus">درباره ما</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus">تماس با ما</a>
                        </li>
                        <li class="col-sm-4 my-3 my-xs-0 col-xs-6 col-6">
                            <h6>خدمات ما</h6>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/tour">تور</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/flight">پرواز</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel">هتل</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/bus">اتوبوس</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">ویزا</a>
                        </li>
                        <li class="col-sm-4 my-3 my-xs-0 col-xs-6 col-6">
                            <h6>دانستنیها</h6>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/article">وبلاگ</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/news">اخبار</a>
                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/newspaper">  عضویت در خبرنامه</a>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-6 col-md-12 footer-main-left">
                    <a class="footer-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                        <img src="project_files/images/logoFooter.png" alt="{$obj->Title_head()}">
                    </a>
                    <span>شماره تماس :<a href="tel:{$smarty.const.CLIENT_MOBILE}" class="">{$smarty.const.CLIENT_MOBILE}</a><a href="tel:{$smarty.const.CLIENT_PHONE}" class="">{$smarty.const.CLIENT_PHONE}</a></span>
                    <span>ایمیل :<a href="mailto:{$smarty.const.CLIENT_EMAIL}"
                                    class="amailto">{$smarty.const.CLIENT_EMAIL}</a></span>
                    <p class="m-0">آدرس : {$smarty.const.CLIENT_ADDRESS}</p>
                    <div class="code my-3">
                        {*                        <input id="txtsearch" aria-describedby="basic-addon1" type="text" name="CodeRahgiriTemp"*}
                        {*                               onfocus="{this.value='';}"*}
                        {*                               onblur="if (this.value==''){this.value='کد رهگیری خود را وارد کنید...';}"*}
                        {*                               value="کد رهگیری خود را وارد کنید..." autocomplete="off">*}
                        {*                        <button class="btn button-winona" type="submit">*}
                        {*                            <i class="fas fa-check"></i>*}
                        {*                        </button>*}
                    </div>
                    <div class="namads">

                        <div class="col_namads">
                            <a target="_blank" rel="nofollow" href="https://www.cao.ir/paxrights"><img
                                        src="project_files/images/certificate1.png" alt=""></a>
                            <a target="_blank" rel="nofollow" href="https://www.cao.ir/"><img src="project_files/images/certificate2.png"
                                                                                              alt=""></a>
                            <a target="_blank" rel="nofollow" href="http://aira.ir/images/final3.pdf"><img
                                        src="project_files/images/certificate3.png" alt=""></a>
                            <a target="_blank" rel="nofollow" href="https://enamad.ir/"><img src="project_files/images/enamad.png" alt=""></a>
                            <a target="_blank" rel="nofollow" href="https://samandehi.ir/Pages/HomePage.aspx"><img
                                        src="project_files/images/samandeh.jpg" alt=""></a>
                        </div>

                    </div>
                </div>
                <div class="col-12 last">
                    <p>کلیه حقوق این وب‌سایت محفوظ و متعلق به شرکت کیف سفر می‌باشد.</p>
                    <div class="last_text">
                        <a class="last_a" href="https://www.iran-tech.com/" target="_blank">طراحی سایت گردشگری</a>
                        <p class="last_p_text">: ایران تکنولوژی</p>
                    </div>
                </div>
            </div>
        </footer>
        <div class="but-top" id="scroll-top" style="display: block;"><a href="javascript:" class="fa fa-angle-up"></a></div>

    {/if}
    {else}
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
    {/if}

{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}
{literal}
    <script src="project_files/js/mega-menu.js"></script>
    <script src="project_files/js/script.js"></script>
{/literal}

</body>

</html>