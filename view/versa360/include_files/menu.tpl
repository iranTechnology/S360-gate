{include file="include_files/quotation.tpl"}<!-- hold -->


{assign var="type_data" value=['is_active'=>1 , 'limit' =>1 , 'check_date' =>1]}
{assign var='list_daily_quote' value=$obj_main_page->getDailyQuote($type_data)}


    <header class="header_area fixedmenu{if $list_daily_quote[0]} text-day_header{/if}">
    <div class="main_header_area animated"  id="navigation1">
        <div class="container">
            <div class="top-menu">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_DOMAIN}">
                        <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                    </a>
                </div>
                <div class="nav-login d-flex">
                    <div class="top__user_menu position-relative">
                        <a class="__login_register_class__ button_header logIn btn-link-header stop-propagation {if $obj_main_page->isLogin()}show-box-login-js{else}main-navigation__button1{/if}" href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        {include file="../../include/signIn/topBarName.tpl"}
                            <i class="fa-light fa-user"></i>
                        </a>
                            <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                            <div class=" arrow-up new-click-sub  stop-propagation" >
                                {include file="../../include/signIn/topBar.tpl"}
{*                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}*}
                            </div>
                        </div>
                    </div>
                <div class="nav-buy">
                    <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="btn-link-header">
                        <span>پیگیری خرید </span>
                        <i class="fa-light fa-memo-circle-check"></i>
                    </a>
                </div>
                <div class="nav-phone">
                    <a href="tel:{$smarty.const.CLIENT_PHONE}" class="btn-link-header">
                        <span>خط ویژه {$smarty.const.CLIENT_PHONE}</span>
                        <i class="fa-light fa-phone"></i>
                    </a>
                </div>
                <div class="nav-toggle"></div>
                </div>
            </div>
        </div>
        <nav class="navigation">
            <div class="container">
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu align-to-right">
                        <li>
                                <a href="https://{$smarty.const.CLIENT_DOMAIN}" class="link-menu-padding-right">صفحه اصلی</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">بلیط هواپیما</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/train">بلیط قطار</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/bus">بلیط اتوبوس</a>
                        </li>
                        <li>
                            <a href="javascript:"> تور </a>
                            <ul class="nav-dropdown">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all">همه تور ها</a>
                                </li>
                                {*
                                <li>
                                    <a href="https://versagasht.com/gds/fa/resultTourLocal/all-all/all-all/all/7/0">تور ویژه نوروز</a>
                                </li>
                                *}
                            </ul>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">رزرو هتل </a>
                        </li>
                        <li>
                            <a href="https://www.about.versagasht.com/visacountry">ویزا</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/insurance">بیمه</a>
                        </li>
{*                        <li>*}
{*                            <a href="{$smarty.const.ROOT_ADDRESS}/loginUser">باشگاه مشتریان</a>*}
{*                        </li>*}
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/signRequest"> درخواست ساین</a>
                        </li>
                        <li class='mobile-pay'>
                            <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
                               پیگیری خرید
                            </a>
                        </li>
                        <li>
                            <a href="javascript:"> سایر</a>
                            <ul class="nav-dropdown">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/employment">استخدام</a>
                                </li>
{*                                <li>*}
{*                                    <a href="https://about.versagasht.com/fa/panel/panel.php?irantech_agency=1">لیست جوایز</a>*}
{*                                </li>*}
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/pay">پرداخت انلاین</a>
                                </li>

                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/currency">نرخ ارز</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>