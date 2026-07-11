{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav class="navigation" id="navigation1">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img alt="{$obj->Title_head()}" class="__logo_class__" src="project_files/images/logo.png"/>
                    </a>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور داخلی</a>
                            {if $objResult->ReservationTourCities('=1', 'return')}
                                <ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                    {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                            </a></li>
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور خارجی</a>
                            {if $objResult->ReservationTourCountries('yes')}
                                <ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
                                    {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                            </a></li>
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                    </ul>
                </div>
                <div class="btn-header">
                    <a class="btn-number" href="tel:{$smarty.const.CLIENT_PHONE}">
                        <i class="fa-regular fa-phone"></i>
                        <span>{$smarty.const.CLIENT_PHONE}</span>
                    </a>

                    <a class="__login_register_class__ btn-login {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                       href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        <i class="fa-regular fa-user"></i>
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