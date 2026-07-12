{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area {if $smarty.const.GDS_SWITCH neq 'mainPage'} header-page {/if}">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav class="navigation d-flex align-items-center">
                <div class="nav-header">
                    <a class="d-flex align-items-center" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img alt="{$obj->Title_head()}" src="project_files/images/logo.png"/>
                    </a>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
                        <li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">هتل</a></li>
                        <li><a href="https://salamparvaz.com">تور</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">ویزا</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/insurance">بیمه</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/cip">تشریفات فرودگاه</a></li>
                        </li>
{*                        <li>*}
{*                            <a href="javascript:">آژانس ما</a>*}
{*                            <ul class="nav-dropdown">*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">*}
{*                                        تماس با ما*}
{*                                    </a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">*}

{*                                        درباره ما*}

{*                                    </a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/rules">*}

{*                                        قوانین و مقررات*}

{*                                    </a>*}
{*                                </li>*}
{*                                <li>*}
{*                                    <a href="{$smarty.const.ROOT_ADDRESS}/pay">*}

{*                                        درگاه پرداخت*}

{*                                    </a>*}
{*                                </li>*}
{*                            </ul>*}
{*                        </li>*}
                        <li>


                    </ul>
                </div>
                <div class="box_button_header">
                    <a class="button_header d-none d-lg-flex" href="{$smarty.const.ROOT_ADDRESS}/UserTracking"><span>پیگیری خرید</span></a>
                    <a class="button_header" href="tel:{$smarty.const.CLIENT_PHONE}">
                        <span>{$smarty.const.CLIENT_PHONE}</span>
                        <i class="fa-regular fa-phone"></i>
                    </a>

                    <a class="__login_register_class__ button btn-user {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}show-box-nologin-js main-navigation__button1{/if}"
                            {if $obj_main_page->isLogin()}
                                href="javascript:"
                                {*                        {else}*}
                                {*                                {if $smarty.const.SOFTWARE_LANG == 'fa'}*}
                                {*                                href="{$smarty.const.ROOT_ADDRESS}/authenticate"*}
                                {*                                {else}*}
                                {*                                href="{$smarty.const.ROOT_ADDRESS}/loginUser"*}
                                {*                                {/if}*}
                            {/if}
                    >
                        <span>{include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}</span>
                        <i class="far fa-user"></i>
                    </a>

                    {if !$obj_main_page->isLogin()}


                        <div class="main-navigation__sub-menu2 arrow-up show-content-box-nologin-js" style="display: none;">

                            <div class="sup-menu-flex sup-menu-flex-login">

                                <a class="" href="{$smarty.const.ROOT_ADDRESS}/authenticate">
                                    <i>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M144 128a80 80 0 1 1 160 0 80 80 0 1 1 -160 0zm208 0A128 128 0 1 0 96 128a128 128 0 1 0 256 0zM269.7 352c65.7 0 120.1 48.7 129 112H49.3c8.9-63.3 63.3-112 129-112h91.4zm-91.4-48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H224 178.3zM625 177c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-111 111-47-47c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l64 64c9.4 9.4 24.6 9.4 33.9 0L625 177z"/></svg>
                                    </i>
                                    <span>مسافر</span>
                                </a>
                                <a href="{$smarty.const.ROOT_ADDRESS}/authenticate">
                                    <i>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M144 128a80 80 0 1 1 160 0 80 80 0 1 1 -160 0zm208 0A128 128 0 1 0 96 128a128 128 0 1 0 256 0zM269.7 352c65.7 0 120.1 48.7 129 112H49.3c8.9-63.3 63.3-112 129-112h91.4zm-91.4-48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H224 178.3zM504 312c0 13.3 10.7 24 24 24s24-10.7 24-24V248h64c13.3 0 24-10.7 24-24s-10.7-24-24-24H552V136c0-13.3-10.7-24-24-24s-24 10.7-24 24v64H440c-13.3 0-24 10.7-24 24s10.7 24 24 24h64v64z"/></svg>
                                    </i>

                                    <span>کانتر</span>
                                </a>
                                <a href="{$smarty.const.ROOT_ADDRESS}/loginAgency">
                                    <i>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M256 464c7.4 0 27-7.2 47.6-48.4c8.8-17.7 16.4-39.2 22-63.6H186.4c5.6 24.4 13.2 45.9 22 63.6C229 456.8 248.6 464 256 464zM178.5 304h155c1.6-15.3 2.5-31.4 2.5-48s-.9-32.7-2.5-48h-155c-1.6 15.3-2.5 31.4-2.5 48s.9 32.7 2.5 48zm7.9-144H325.6c-5.6-24.4-13.2-45.9-22-63.6C283 55.2 263.4 48 256 48s-27 7.2-47.6 48.4c-8.8 17.7-16.4 39.2-22 63.6zm195.3 48c1.5 15.5 2.2 31.6 2.2 48s-.8 32.5-2.2 48h76.7c3.6-15.4 5.6-31.5 5.6-48s-1.9-32.6-5.6-48H381.8zm58.8-48c-21.4-41.1-56.1-74.1-98.4-93.4c14.1 25.6 25.3 57.5 32.6 93.4h65.9zm-303.3 0c7.3-35.9 18.5-67.7 32.6-93.4c-42.3 19.3-77 52.3-98.4 93.4h65.9zM53.6 208c-3.6 15.4-5.6 31.5-5.6 48s1.9 32.6 5.6 48h76.7c-1.5-15.5-2.2-31.6-2.2-48s.8-32.5 2.2-48H53.6zM342.1 445.4c42.3-19.3 77-52.3 98.4-93.4H374.7c-7.3 35.9-18.5 67.7-32.6 93.4zm-172.2 0c-14.1-25.6-25.3-57.5-32.6-93.4H71.4c21.4 41.1 56.1 74.1 98.4 93.4zM256 512A256 256 0 1 1 256 0a256 256 0 1 1 0 512z"/></svg>                                    </i>

                                    <span>آژانس</span>
                                </a>

                            </div>


                            <div class="triangle-up"></div>

                        </div>









                    {/if}
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="../../include/signIn/topBar.tpl"}
                    </div>
                </div>
                <div class="nav-toggle mr-2">
                    <svg viewbox="0 0 448 512">
                        <path d="M0 80C0 71.16 7.164 64 16 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H16C7.164 96 0 88.84 0 80zM0 240C0 231.2 7.164 224 16 224H432C440.8 224 448 231.2 448 240C448 248.8 440.8 256 432 256H16C7.164 256 0 248.8 0 240zM432 416H16C7.164 416 0 408.8 0 400C0 391.2 7.164 384 16 384H432C440.8 384 448 391.2 448 400C448 408.8 440.8 416 432 416z"></path>
                    </svg>
                </div>
            </nav>
        </div>
    </div>
</header>