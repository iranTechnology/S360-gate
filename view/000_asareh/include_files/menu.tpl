{load_presentation_object filename="reservationBasicInformation" assign="objResult"}

<header class="header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container-fluid">
            <nav id="navigation1" class="navigation">
                <div>
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_DOMAIN}/{$smarty.const.SOFTWARE_LANG}">
                        <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                    </a>
                </div>
                <div class="nav-menus-wrapper ">
                    <ul class="nav-menu align-to-right">
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">هتل</a>
                            <ul class="nav-dropdown nav-submenu ">
                                {assign var='reservation_htoels' value=$obj_main_page->getExternalHotelCityList()}
                                {foreach $reservation_htoels as $item}
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0">{$item['DepartureCityFa']}</a>
                                    </li>
                                {/foreach}
                            </ul>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/visa">ویزا</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور</a>
                            {*                            <ul class="nav-dropdown first_child_menu  fadeIn animated">*}
                            {*                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-all/all/all/0"> تور داخلی </a>*}
                            {*                                    <ul class="nav-dropdown submenu-child fadeIn animated">*}

                            {*                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}*}

                            {*                                            <li>*}
                            {*                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">*}
                            {*                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}*}
                            {*                                                </a>*}
                            {*                                            </li>*}
                            {*                                        {/foreach}*}


                            {*                                    </ul>*}
                            {*                                </li>*}
                            {*                                <li><a href="javascript:"> تور خارجی </a>*}
                            {*                                    <ul class="nav-dropdown submenu-child fadeIn animated">*}
                            {*                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}*}
                            {*                                            <li>*}
                            {*                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">*}
                            {*                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}*}
                            {*                                                </a>*}
                            {*                                            </li>*}
                            {*                                        {/foreach}*}
                            {*                                    </ul>*}
                            {*                                </li>*}
                            {*                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/tour"> جست و جوی تور </a></li>*}

                            {*                            </ul>*}
                        </li>
                        <li>
                            <a href="javascript:">بیشتر</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/introductIran">معرفی ایران</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/gallery">گالری جهان</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">درگاه پرداخت آنلاين</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="nav-header">
                    <div class="parent-btn-header">
                        <a class=" button  btn-user
{if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}" href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}"
                        >
                            <span>
                        <span>{include file="../../include/signIn/topBarName.tpl"}</span>

                                <div class="button-chevron-2 ">

                                </div>
                            </span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                        </a>

                        <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">

                            {include file="../../include/signIn/topBar.tpl"}

                        </div>
                    </div>
                </div>
                <div class="nav-toggle "></div>
            </nav>
        </div>
    </div>
</header>
