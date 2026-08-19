{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area">
    <div class="main_header_area animated" id="navbar">
        <nav class="navigation navigation-landscape" id="navigation1">
            <div class="parent-top">
                <div class="container parent-social">
                    <article class="parent-email-phone">
                        <div class="email-phone-item supoort">
                            <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"></path>
                            </svg>
                            <span>شماره پشتیبانی:</span>
                            <a class="__phone_class__"
                               href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                        </div>
                        <div class="email-phone-item">
                            <a class="exit_link blink_me" href="https://sadadpsp.ir/tollpayment/" rel="nofollow"
                               target="_blank">پرداخت عوارض خروجی</a>
                        </div>
                    </article>
                    {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                    {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youtube' => 'youtubeHref','facebook' => 'facebookHref','linkeDin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

                    {foreach $socialLinks as $key => $val}
                        {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                    {/foreach}
                    <article class="parent-social-header __social_class__">
                        <a class="__instagram_class__" href="{if $instagramHref}{$instagramHref}{/if}">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                        <a class="__telegram_class__" href="{if $telegramHref}{$telegramHref}{/if}">
                            <i class="fa-brands fa-telegram"></i>
                        </a>
                        <a class="__linkdin_class__" href="{if $linkeDinHref}{$linkeDinHref}{/if}">
                            <i class="fa-brands fa-linkedin-in"></i>
                        </a>
                        <a class="__facebook_class__" href="{if $facebookHref}{$facebookHref}{/if}">
                            <i class="fa-brands fa-facebook-f"></i>
                        </a>
                        <a class="__aparat_class__" href="{if $aparatHref}{$aparatHref}{/if}">
                            <svg id="Layer_1" version="1.1" viewbox="0 0 48 48" x="0px" xml:space="preserve"
                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" y="0px"><g>
                                    <path d="M21.881 6.136l-4.315-.974a6.533 6.533 0 0 0-7.812 4.934l-.983 4.351c2.832-4.497 7.586-7.659 13.11-8.311z"></path>
                                    <path d="M6.136 26.119l-.974 4.315a6.533 6.533 0 0 0 4.934 7.812l4.351.983c-4.497-2.833-7.659-7.586-8.311-13.11z"></path>
                                    <path d="M37.904 9.754l-4.351-.983c4.497 2.832 7.659 7.586 8.311 13.109l.974-4.315a6.533 6.533 0 0 0-4.934-7.811z"></path>
                                    <path d="M26.119 41.864l4.315.974a6.533 6.533 0 0 0 7.812-4.934l.983-4.351c-2.832 4.497-7.586 7.659-13.11 8.311z"></path>
                                </g>
                                <path d="M24 8C15.163 8 8 15.163 8 24s7.163 16 16 16 16-7.163 16-16S32.837 8 24 8zm-4 5a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-3 19a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm5-8a2 2 0 1 1 3.999-.001A2 2 0 0 1 22 24zm6 11a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm3-11a4 4 0 1 1 0-8 4 4 0 0 1 0 8z"></path>
</svg>
                        </a>
                    </article>
                </div>
            </div>
            <div class="parent-bottom">
                <div class="container-fluid parent-bottom-header">
                    <a class="nav-header" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img alt="{$obj->Title_head()}" class="__logo_class__ logo"
                             src="project_files/images/logo.png" />
                    </a>
                    <div class="nav-menus-wrapper">
                        <ul class="nav-menu align-to-right">
                            <li class="li-navs">
                                <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">صفحه اصلی</a>
                            </li>
                            <li class="li-navs">
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">هتل ها</a>
                            </li>
                            <li class="li-navs">
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/van-hotel-prices">قیمت هتلهای وان</a>
                            </li>
                            <li class="li-navs">
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/tour-prices">قیمت تور ها</a>
                            </li>
                            <li class="li-navs">
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/trabzon-hotel-prices">قیمت هتلهای ترابزون</a>
                            </li>

                            <!--

                            <li class="li-navs">
                                <a href="javascript:">دانستنی ها</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li class="">
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/weather">
<span class="navs-text">
                                                هواشناسی
                                            </span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/currency">
<span class="navs-text">
                                                ارز
                                            </span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/convert-date">
<span class="navs-text">
                                                تبدیل تاریخ
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/page/mag">
                                            <span class="navs-text">
                                                وبلاگ
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            -->


                            <li class="li-navs">
                                <a href="javascript:">برنامه سفر</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/page/conditions-traveling-to-van">
<span class="navs-text">
                                                شرایط سفر به وان ترکیه
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/page/ways-travel-iran-to-van">
<span class="navs-text">
                                                راههای سفر از ایران به شهر وان ترکیه
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/page/about-van-city">
<span class="navs-text">
                                                درباره شهر وان
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/page/bus-ticket-booking-guide">
<span class="navs-text">
                                                راهنمای رزرو بلیت اتوبوس
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="li-navs">
                                <a href="javascript:">آژانس ما</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
<span class="navs-text">
                                                درباره ما
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/rules">
<span class="navs-text">
                                                قوانین و مقررات
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/page/online-booking-guide">
<span class="navs-text">
                                                راهنمای رزرو آنلاین
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="link-drop" href="{$smarty.const.ROOT_ADDRESS}/contactUs">
<span class="navs-text">
                                                تماس با ما
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="parent-btn-header">

                        <a class="__login_register_class__ button btn-user {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                           href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                            <svg style="enable-background:new 0 0 512 512;" version="1.1" viewbox="0 0 512 512" x="0px"
                                 xml:space="preserve" y="0px">
<g>
    <g>
        <path d="M437.02,330.98c-27.883-27.882-61.071-48.523-97.281-61.018C378.521,243.251,404,198.548,404,148
                                                        C404,66.393,337.607,0,256,0S108,66.393,108,148c0,50.548,25.479,95.251,64.262,121.962
                                                        c-36.21,12.495-69.398,33.136-97.281,61.018C26.629,379.333,0,443.62,0,512h40c0-119.103,96.897-216,216-216s216,96.897,216,216
                                                        h40C512,443.62,485.371,379.333,437.02,330.98z M256,256c-59.551,0-108-48.448-108-108S196.449,40,256,40
                                                        c59.551,0,108,48.448,108,108S315.551,256,256,256z"></path>
    </g>
</g>
</svg>
                            <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                        </a>
                        <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js"
                             style="display: none">
                            {include file="../../include/signIn/topBar.tpl"}
                        </div>
                        <a class="__login_register_class__2 button btn-user btn-shopping  {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if} "
                           href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/UserTracking{/if}">
                            <span>پیگیری خرید</span>
                        </a>
                    </div>
                    <div class="nav-toggle"></div>
                </div>
            </div>
        </nav>
    </div>
</header>