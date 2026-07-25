{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav id="navigation1" class="navigation">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_DOMAIN}">
                        <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                        <div>
                            <h1>آتیه گشت سبز</h1>
                            <span>شرکت خدمات مسافرتی</span>
                        </div>
                    </a>
                </div>
                <div class="nav-menus-wrapper  mx-auto">
                    <ul class="nav-menu align-to-right">
                        <li><a href="javascript:">قطار</a></li>
                        <li><a href="javascript:">تور</a>
                            <ul class="nav-dropdown">
                                <li><a href="javascript:">تور داخلی</a>
                                    {if $objResult->ReservationTourCities('=1', 'return')}
                                        <ul class="nav-dropdown nav-menu_ul" style="display: block;">
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
                                <li><a href="javascript:">تور خارجی</a>
                                    {if $objResult->ReservationTourCountries('yes')}
                                        <ul class="nav-dropdown nav-menu_ul" style="display: none;">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>
                                                </li>
                                            {/foreach}
                                            {* <li><a class="a_header_active" href="javascript:">نمایش همه</a></li>*}
                                        </ul>
                                    {/if}
                                </li>
                            </ul>
                        </li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" target="_blank">پیگیری خرید</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a></li>
                        <li><a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                <li><a href="javascript:">عضویت در خبرنامه</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <a class="button {if $obj_main_page->isLogin()}show-box-login-js{/if}" {if $obj_main_page->isLogin()} href="javascript:" {else} href="{$smarty.const.ROOT_ADDRESS}/authenticate"{/if}>
                    <span>

                        <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                    </span>
                    <i class="far fa-user"></i>
                </a>
                <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                    {include file="../../include/signIn/topBar.tpl"}
                </div>
                <div class="nav-toggle"></div>

            </nav>
        </div>
    </div>
</header>