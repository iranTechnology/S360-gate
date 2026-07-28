{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area fixedmenu">
    <div class="main_header_area animated">
        <div class="container">
            <nav class="navigation" id="navigation1">
                <div class="nav-header">
                    <a alt="{$obj->Title_head()}" class="__logo_class__ nav-brand"
                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img alt="img-logo" src="project_files/images/logo.png" />
                    </a>
                </div>
                <div class="nav-menus-wrapper">
{*                    <ul class="nav-menu align-to-right">*}
{*                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور</a>*}
{*                            <ul class="nav-dropdown">*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تورهای داخلی</a>*}
{*                                    {if $objResult->ReservationTourCities('=1', 'return')}*}
{*                                        <ul class="nav-dropdown dropdown2" >*}
{*                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}*}
{*                                                <li>*}
{*                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">*}
{*                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}*}
{*                                                    </a>*}
{*                                                </li>*}
{*                                            {/foreach}*}
{*                                            <li><a class="bg-active" href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-all/all/all/0">نمایش همه</a></li>*}
{*                                        </ul>*}
{*                                    {/if}*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور های خارجی</a>*}
{*                                    {if $objResult->ReservationTourCountries('yes' , false , 31, 'notLike')}*}
{*                                        <ul class="nav-dropdown dropdown2">*}
{*                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes' , false , 31, 'notLike')}*}
{*                                                <li>*}
{*                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">*}
{*                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}*}
{*                                                    </a>*}
{*                                                    {if $item_tour['city_list']}*}
{*                                                        <ul class="nav-dropdown ">*}

{*                                                            {foreach $item_tour['city_list'] as $city }*}
{*                                                                <li>*}
{*                                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">*}
{*                                                                        {$city['name']}*}
{*                                                                    </a>*}
{*                                                                </li>*}
{*                                                            {/foreach}*}
{*                                                        </ul>*}
{*                                                    {/if}*}
{*                                                </li>*}
{*                                            {/foreach}*}
{*                                        </ul>*}
{*                                    {/if}*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">جست و جوی تور</a>*}
{*                                </li>*}
{*                            </ul>*}
{*                        </li>*}
{*                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز</a>*}
{*                        </li>*}
{*                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">هتل ها</a>*}
{*                        </li>*}
{*                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">ویزا</a>*}
{*                            <ul class="nav-dropdown">*}
{*                                {foreach key=key_continent item=item_continent from=$obj_main_page->continentsHaveVisa()}*}
{*                                    <li><a href="javascript:"> {$item_continent.titleFa}</a>*}
{*                                        <ul class="nav-dropdown nav-submenu nav-menu_ul">*}
{*                                            {foreach key=key_country item=item_country from=$obj_main_page->countriesHaveVisa($item_continent.id)}*}
{*                                                <li>*}
{*                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultVisa/{$item_country.code}/all/1-0-0">{$item_country.title}</a>*}
{*                                                </li>*}
{*                                            {/foreach}*}
{*                                        </ul>*}
{*                                    </li>*}
{*                                {/foreach}*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/visa">جست و جوی ویزا</a>*}
{*                                </li>*}
{*                            </ul>*}
{*                        </li>*}
{*                        <li>*}
{*                            <a href="{$smarty.const.ROOT_ADDRESS}/page/train">قطار</a>*}
{*                        </li>*}
{*                        <li>*}
{*                            <a href="{$smarty.const.ROOT_ADDRESS}/page/bus">اتوبوس</a>*}
{*                        </li>*}
{*                        <li><a href="javascript:">مسافران</a>*}
{*                            <div class="megamenu-panel">*}
{*                                <div class="megamenu-lists">*}
{*                                    <ul class="megamenu-list list-col-5 parent-list">*}
{*                                        <ul>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/authenticate" target="_blank">باشگاه*}
{*                                                    مسافران</a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/vote" target="_blank">نظرسنجی </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/contactUs" target="_blank">انتقادات و پیشنهادات </a>*}
{*                                            </li>*}
{*                                        </ul>*}
{*                                        <ul>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/lastMinute" target="_blank">دقیقه نود </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/pay" target="_blank">پرداخت*}
{*                                                    آنلاین </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/faq" target="_blank">پرسش و*}
{*                                                    پاسخ </a>*}
{*                                            </li>*}
{*                                        </ul>*}
{*                                    </ul>*}
{*                                    <ul class="megamenu-list list-col-5">*}
{*                                        <img alt="img-drop-menu" src="project_files/images/bgmenucustomer.jpg" />*}
{*                                    </ul>*}
{*                                </div>*}
{*                            </div>*}
{*                        </li>*}
{*                        <li>*}
{*                            <a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a>*}
{*                        </li>*}
{*                        <li><a href="javascript:">دانستنیها</a>*}
{*                            <div class="megamenu-panel my-position">*}
{*                                <div class="megamenu-lists">*}
{*                                    <ul class="megamenu-list list-col-5 parent-list">*}
{*                                        <ul>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/aboutCountry" target="_blank">معرفی*}
{*                                                    کشورها </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/aboutIran" target="_blank">معرفی*}
{*                                                    ایران </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/embassies" target="_blank">*}
{*                                                    سفارت</a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/weather" target="_blank">*}
{*                                                    هواشناسی</a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/clock" target="_blank"> ساعت کشور ها</a>*}
{*                                            </li>*}
{*                                        </ul>*}
{*                                        <ul>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/recommendation" target="_blank">*}
{*                                                    سفرنامه</a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/convertDate" target="_blank">*}
{*                                                    تبدیل تاریخ </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/currency" target="_blank">نرخ*}
{*                                                    ارز</a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/news" target="_blank">اخبار </a>*}
{*                                            </li>*}
{*                                            <li class="megamenu-list-title">*}
{*                                                <a href="{$smarty.const.ROOT_ADDRESS}/gallery" target="_blank">گالری جهان </a>*}
{*                                            </li>*}
{*                                        </ul>*}
{*                                    </ul>*}
{*                                    <ul class="megamenu-list list-col-5">*}
{*                                        <img alt="img-drop-menu" src="project_files/images/bgknow.jpg" />*}
{*                                    </ul>*}
{*                                </div>*}
{*                            </div>*}
{*                        </li>*}
{*                        <li><a href="javascript:">آژانس ما</a>*}
{*                            <ul class="nav-dropdown">*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs" target="_blank">درباره ما</a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/rules" target="_blank">قوانین و مقررات</a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/personnel" target="_blank">مدیران و پرسنل</a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/employment" target="_blank">فرم استخدام</a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/agencyList" target="_blank">نمایندگی ها </a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/video" target="_blank"> ویدئوها </a>*}
{*                                </li>*}
{*                            </ul>*}
{*                        </li>*}
{*                    </ul>*}
                </div>
                <div class="nav-search">

                    <a class="__login_register_class__ nav-search-button {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                       href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">{include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}</a>
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}
                    </div>
                </div>
                <div class="act-buttons peygiri">
                    <div class="peigiri">
                        <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a>
                    </div>
                </div>
                <div class="nav-toggle"></div>
            </nav>
        </div>
    </div>
</header>