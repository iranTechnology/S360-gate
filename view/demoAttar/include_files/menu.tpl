{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav class="navigation" id="navigation1">
                <div class="parent-logo-menu">
                    <a class="nav-header" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img id="siteLogo" alt="{$obj->Title_head()}" class="__logo_class__ logo"
                             src="project_files/images/logo.png"/>
                        <!--                            <div class="logo-caption">-->
                        <!--                                <img class="title-logo" src="project_files/images/title-logo.png" alt="title-logo">-->
                        <!--                                <h1>-->
                        <!--                                    <span class="sub-span">  آژانس مسافرتی </span>-->
                        <!--                                </h1>-->
                        <!--                            </div>-->
                    </a>
                    <div class="nav-menus-wrapper">
                        <ul class="nav-menu align-to-right">
                            <li>
                                <a href="javascript:">بلیط</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/flight-attar">هواپیما</a>
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/train-attar">قطار</a>
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/bus-attar">اتوبوس</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:">اقامت</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel-attar">هتل </a>
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/dorm-attar">خوابگاه</a>
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/Residence-attar">اقامتگاه</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all/0">تور</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-all/all/all/0">تور
                                            های داخلی</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/international-tour">تور های خارجی</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:">بیشتر</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/insurance-attar">بیمه</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa-attar">ویزا</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/entertainment-attar">تفریحات</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/rentCar-attar">اجاره خودرو</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:">مسافران</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/authenticate">باشگاه مسافران</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/recommendation">سفرنامه</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/vote">نظرسنجی</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">انتقاد و پیشنهاد</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">پرداخت آنلاین</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/faq">پرسش و پاسخ</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:">دانستنیها</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/introductCountry">معرفی کشورها</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/introductIran">معرفی ایران</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/weather">هواشناسی</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/clock">ساعت کشورها</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/convertDate">تبدیل تاریخ</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/currency">نرخ ارز</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:">آژانس ما</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                </ul>
                            </li>
                        </ul>
                        </ul>
                    </div>
                </div>
                <div class="parent-btn-header">
                    <a class="__login_register_class__ button btn-user {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                       href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                            <!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. -->
                            <path d="M352 144a96 96 0 1 0 -192 0 96 96 0 1 0 192 0zm-240 0a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zM49.3 464H462.7c-8.3-54.4-55.3-96-112-96H161.3c-56.7 0-103.6 41.6-112 96zM0 481.3C0 392.2 72.2 320 161.3 320H350.7C439.8 320 512 392.2 512 481.3c0 17-13.8 30.7-30.7 30.7H30.7C13.8 512 0 498.2 0 481.3z"></path>
                        </svg>
                        <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="../../include/signIn/topBar.tpl"}
                    </div>
                </div>
                <div class="nav-toggle">
                    <i class="fa fa-bars"></i>
                </div>

            </nav>
        </div>
    </div>
</header>