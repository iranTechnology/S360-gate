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
                    <ul class="nav-menu align-to-right">

                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs" target="_blank">درباره ما</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/rules" target="_blank">قوانین و مقررات</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/contactUs" target="_blank">تماس با ما</a>
                        </li>

                    
                    </ul>
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