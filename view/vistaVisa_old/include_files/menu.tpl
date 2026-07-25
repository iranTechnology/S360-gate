{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container-fluid">
            <nav id="navigation1" class="navigation">
                <div class="parent-menu-logo">
                    <div class="nav-header">
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img class="__logo_class__" src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                        </a>
                    </div>
                    <div class="nav-menus-wrapper ">
                        <ul class="nav-menu align-to-right">
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/Flight">بلیط هواپیما</a>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/InternalHotel">هتل داخلی</a>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/ExternalHotel">هتل خارجی</a>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/Tour">تور</a>
                                <ul class="nav-dropdown">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/InternalTour">تور داخلی</a>
                                        {if $objResult->ReservationTourCities('=1', 'return')}
                                            <ul class="nav-dropdown nav-submenu nav-menu_ul" style="display: block;">
                                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">
                                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                                <li><a class="a_header_active" href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-all/all/all/0">نمایش همه</a></li>
                                            </ul>
                                        {/if}
                                    </li>

                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/ExternalTour">تور خارجی</a>
                                        {if $objResult->ReservationTourCountries('yes')}
                                            <ul class="nav-dropdown nav-submenu nav-menu_ul" style="display: none;">
                                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                                {*                                            <li><a class="a_header_active" href="javascript:">نمایش همه</a></li>*}
                                            </ul>
                                        {/if}

                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/Visa">ویزا</a>
                                <ul class="nav-dropdown">
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/schengen">ویزا شنگن</a>
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/rejected"> رفع ریجکتی</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/Insurance">بیمه</a>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a>
                            </li>
                            <li>
                                <a class="link-header" href="javascript:">دانستنی ها</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/orderServices">درخواست خدمات</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/weather">هواشناسی</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/clock">ساعت کشورها</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/club">باشگاه مشتریان</a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="link-header" href="javascript:">آژانس ما</a>
                                <ul class="nav-dropdown nav-submenu">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">درگاه پرداخت آنلاین</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="parent-btn-header">
                    <a class="__phone_class__ btn-phone" href="tel:{$smarty.const.CLIENT_PHONE}">
                        <span>{$smarty.const.CLIENT_PHONE}</span>
                        <i class="far fa-phone"></i>
                    </a>
                    <a class="__login_register_class__ button btn-user {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}" href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                        <i class="far fa-user"></i>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="../../include/signIn/topBar.tpl"}
                    </div>
                </div>
                <div class="nav-toggle"></div>
            </nav>
        </div>
    </div>
</header>