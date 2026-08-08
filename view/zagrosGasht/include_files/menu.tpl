{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area {if $smarty.const.GDS_SWITCH neq 'mainPage'} header_area_page {/if} ">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav class="navigation" id="navigation1">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img alt="{$obj->Title_head()}" class="__logo_class__" src="project_files/images/logo.png"/>
                    </a>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu align-to-right">
                        <li>
                            <a href="javascript:">

                                خدمات سفر

                            </a>
                            <ul class="nav-dropdown nav-submenu nav-menu_ul  {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if} ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/1-all/all/all">پکیج داخلی</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all">پکیج خارجی</a></li>
                                <li><a href="javascript:">پکیج تجاری</a></li>
                                <li><a href="javascript:">پکیج علمی</a></li>
                                <li><a href="javascript:">پکیج عتبات</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">تور داخلی</a>
                            <ul class="nav-dropdown nav-submenu nav-menu_ul  {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if} ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/1-all/all/1">یک روزه</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/1-all/all/2">چند روزه</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/23">ویژه کرامت</a></li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/30">تورعلمی</a>
                                    <ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                        <li><a href="javascript:">سفیران فردا</a></li>
                                    </ul>
                                </li>
                            </ul>
{*                            {if $objResult->ReservationTourCities('=1', 'return')}*}
{*                                <ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}" style="display: grid; grid-template-columns: 1fr 1fr;">*}
{*                                    {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/1-{$item_tour.id}/all/all">*}
{*                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}*}
{*                                            </a></li>*}
{*                                    {/foreach}*}
{*                                </ul>*}
{*                            {/if}*}
                        </li>
                        <li>
                            <a href="javascript:">تور خارجی</a>
                            <ul class="nav-dropdown  {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if} ">
                                <li><a href="javascript:">اروپا</a></li>
                                <li><a href="javascript:">آسیا</a></li>
                                <li><a href="javascript:">آفریقا</a></li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/21">تور تجاری</a>
                                    <ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                        <li><a href="javascript:">رویدادها</a></li>
                                        <li><a href="javascript:">نمایشگاهی</a></li>
                                    </ul>
                                </li>
                            </ul>
{*                            {if $objResult->ReservationTourCountries('yes')}*}
{*                                <ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}" style="display: grid; grid-template-columns: 1fr 1fr;">*}
{*                                    {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/{$item_tour.id}-all/all/all">*}
{*                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}*}
{*                                            </a></li>*}
{*                                    {/foreach}*}
{*                                </ul>*}
{*                            {/if}*}
                        </li>
                        <li class="">
                            <a href="javascript:">عتبات عالیات</a>
                            <ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                <li><a href="javascript:">ویژه فرهنگیان</a></li>
                                <li><a href="javascript:">ویژه اقتصادی</a></li>
                                <li><a href="javascript:">ویژه گروهی</a></li>
                                <li><a href="javascript:">ویژه بانوان</a></li>
                                <li><a href="javascript:">ویژه اتباع</a></li>
                            </ul>
                        </li>
                        <li class="">
                            <a href="javascript:">مجله گردشگری</a>
                            <ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                <li><a href="javascript:">مدارک سفارتخانه</a></li>
                                <li><a href="javascript:">راهنمای سفر</a></li>
                                <li><a href="javascript:">جهانگردی</a></li>
                                <li><a href="javascript:">ایرانگردی</a></li>
                            </ul>
                        </li>
                        <li class="">
                            <a href="javascript:">درباره ما</a>
                            <ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">معرفی آژانس</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                <li><a href="javascript:">ویدئو آموزشی</a></li>
                                <li><a href="javascript:">اخبار</a></li>
                                <li>
                                    <a href="javascript:">شعب و دفاتر</a>
                                    <ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                        <li><a href="javascript:">شعب استانی</a></li>
                                        <li><a href="javascript:">دفاتر نمایندگی</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="">
                            <a href="javascript:">پشتیبانی</a>
                            <ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="btn-header">
                    <a class="btn-number" href="javascript:">
                        <i class="fa-light fa-phone"></i>
                        <span class="__phone_class__"
                              href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</span>
                    </a>

                    <a class="__login_register_class__ btn-login {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                       href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        <i class="fa-light fa-user"></i>
                        <span>{include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}</span>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}
                    </div>
                </div>
                <div class="nav-toggle"></div>
            </nav>
        </div>
    </div>
</header>