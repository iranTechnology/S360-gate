<header class="header_area  {if $smarty.const.GDS_SWITCH neq 'mainPage'} header_2 {/if}">
    <div class="main_header_area">
        <div class="container">
            <nav class="navigation d-flex align-items-center position-relative flex-column">
                <div class="d-flex justify-content-between align-items-center w-100 mt-4">
                    <div class="nav-header">
                        <a class="d-flex" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                            <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                        </a>
                    </div>
                    <div class="box_button_header">
                        <a class="main-navigation__button2 show-box-login-js button_header logIn d-flex d-lg-none" href="javascript:"><i>
                                <svg viewBox="0 0 448 512">
                                    <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM224 32c52.94 0 96 43.06 96 96c0 52.93-43.06 96-96 96S128 180.9 128 128C128 75.06 171.1 32 224 32zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM413.3 480H34.66C33.2 480 32 478.8 32 477.3C32 399.4 95.4 336 173.3 336h101.3C352.6 336 416 399.4 416 477.3C416 478.8 414.8 480 413.3 480z"/>
                                </svg>
                            </i>
                            <span>
                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}
                            </span>
                        </a>
                        <a class="button_header_phone d-none d-lg-flex" href="tel:{$smarty.const.CLIENT_MOBILE}">
                            <span>{$smarty.const.CLIENT_MOBILE}</span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M342.5 303.6l-54.24-23.25c-6.391-2.766-13.9-.9062-18.24 4.484l-22.02 26.91c-34.63-17-62.77-45.14-79.77-79.75l26.91-22.05c5.375-4.391 7.211-11.83 4.492-18.22L176.4 137.5C173.4 130.5 165.8 126.7 158.5 128.4L108.1 140c-7.125 1.625-12.11 7.891-12.11 15.22c0 126.1 102.6 228.8 228.7 228.8c7.336 0 13.6-4.984 15.24-12.11l11.62-50.39C353.3 314.2 349.5 306.6 342.5 303.6zM384 32H64C28.65 32 0 60.66 0 96v320c0 35.34 28.65 64 64 64h320c35.35 0 64-28.66 64-64V96C448 60.66 419.3 32 384 32zM400 416c0 8.82-7.178 16-16 16H64c-8.822 0-16-7.18-16-16V96c0-8.82 7.178-16 16-16h320c8.822 0 16 7.18 16 16V416z"/></svg>
                        </a>
                        <a href="https://ecocrs.com/">
                            <img src="project_files/images/language-icon-ar.png" alt="language-icon-fa">
                        </a>
                    </div>
                    <div class="nav-toggle mr-3">
                        <svg viewBox="0 0 448 512">
                            <path d="M0 80C0 71.16 7.164 64 16 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H16C7.164 96 0 88.84 0 80zM0 240C0 231.2 7.164 224 16 224H432C440.8 224 448 231.2 448 240C448 248.8 440.8 256 432 256H16C7.164 256 0 248.8 0 240zM432 416H16C7.164 416 0 408.8 0 400C0 391.2 7.164 384 16 384H432C440.8 384 448 391.2 448 400C448 408.8 440.8 416 432 416z"/>
                        </svg>
                    </div>
                </div>
                <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                    {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار سایت</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutIran">معرفی ايران</a></li>
                        <li><a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                                <li><a href="">فایل های راهنما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">پرداخت آنلاین</a></li>
                            </ul>
                        </li>
                        <li class="d-none d-lg-flex">
                            <a class='main-navigation__button2 show-box-login-js ' href="javascript:">
                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}
                            </a>
                        </li>
                    </ul>
                </div>

            </nav>

        </div>
    </div>
</header>