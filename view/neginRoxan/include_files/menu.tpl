{load_presentation_object filename="reservationBasicInformation" assign="objResult"}

<header class="i_modular_menu header_area {if $smarty.const.GDS_SWITCH neq 'mainPage' } header_area_new {/if}">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav id="navigation1" class="navigation">
                <div class="parent-header-right">
                    <div class="nav-header">
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img class="" src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                            <div class="logo-caption">
                                <div>
                                    <span class="top-span"> نگین رکسان غرب </span>
                                    <span class="sum-span">آژانس  خدمات مسافرتی</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="nav-menus-wrapper ">
                        <ul class="nav-menu align-to-right">
                            <li>
                                <a class="link-header" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">خانه</a>
                            </li>
                            <li>
                                <a class="link-header" href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور</a>
                                <ul class="nav-dropdown nav-submenu" style="right: auto;display: block;">
                                    <li class="">
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/internalTour">داخلی</a>
                                        {if $objResult->ReservationTourCities('=1', 'return')}
                                        <ul class="nav-dropdown nav-submenu" style="display: block;">
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
                                    <li class="">
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/internationalTour">خارجی</a>
                                        {if $objResult->ReservationTourCountries('yes' , false , 31, 'notLike')}
                                        <ul class="nav-dropdown nav-submenu" style="display: none;">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes' , false , 31, 'notLike')}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>
                                                    {if $item_tour['city_list']}
                                                        <ul class="nav-dropdown ">

                                                            {foreach $item_tour['city_list'] as $city }
                                                                <li>
                                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">
                                                                        {$city['name']}
                                                                    </a>
                                                                </li>
                                                            {/foreach}
                                                        </ul>
                                                    {/if}
                                                </li>
                                            {/foreach}
                                        </ul>
                                        {/if}
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="link-header" href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a>
                            </li>
                            <li>
                                <a class="link-header" href="{$smarty.const.ROOT_ADDRESS}/news" target="_blank">اخبار</a>
                            </li>
                            <li>
                                <a class="link-header" href="{$smarty.const.ROOT_ADDRESS}/UserTracking" target="_blank">پیگیری خرید</a>
                            </li>
                            <li>
                                <a class="link-header" href="javascript:">آژانس ما</a>
                                <ul class="nav-dropdown nav-submenu ">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">درگاه پرداخت</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="parent-btn-header">
                    <a class="__login_register_class__ button  btn-user {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}" href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="../../include/signIn/topBar.tpl"}
                    </div>
                    <a class=" button  btn-phone" href="tel:{$smarty.const.CLIENT_PHONE}">
                        <span class="__phone_class__">{$smarty.const.CLIENT_PHONE}</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/></svg>
                    </a>
                </div>
                <div class="nav-toggle "></div>
            </nav>
        </div>
    </div>
</header>