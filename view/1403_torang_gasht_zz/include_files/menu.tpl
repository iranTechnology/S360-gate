<header class="header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container-fluid">
            <nav class="navigation d-flex align-items-center">
                <div class="nav-header"><a class="d-flex" href="https://{$smarty.const.CLIENT_DOMAIN}"><img src="project_files/images/logo.png"
                                                                                  alt="{$obj->Title_head()}">
                        <div>
                            <h1>ترنج گشت</h1>
                            <span>شرکت خدمات مسافرت هوایی و گردشگری</span>
                        </div>
                    </a></div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
                        <li><a href="https://{$smarty.const.CLIENT_DOMAIN}">صفحه اصلی</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">هتل</a></li>
                        <li><a href="javascript:">تور</a>
                            <ul class="nav-dropdown">
                                <li><a href="javascript:">داخلی</a>
                                    <ul class="nav-dropdown dropdown_tour">
                                        <div>
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">
                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </div>
                                    </ul>
                                </li>
                                <li><a href="javascript:">خارجی</a>
                                    <ul class="nav-dropdown dropdown_tour">
                                        <div>
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </div>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class=""><a href="javascript:;">ویزا</a>
                            <ul class="nav-dropdown first_child_menu fadeIn animated">

                                {foreach key=key_continent item=item_continent from=$obj_main_page->continentsHaveVisa()}
                                    <li>
                                        <a href="javascript:;">
                                            {$item_continent.titleFa}
                                        </a>
                                        <ul class="nav-dropdown submenu-child fadeIn animated">
                                            {foreach key=key_country item=item_country from=$obj_main_page->countriesHaveVisa($item_continent.id)}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultVisa/{$item_country.code}/all/1-0-0">{$item_country.title}</a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </li>
                                {/foreach}
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">جست و جوی ویزا</a></li>
                            </ul>
                        </li>

                        <li><a href="javascript:">دانستنیها</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a></li>
                            </ul>
                        </li>
                        <li class="d-flex d-md-none"><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                        <li><a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">درگاه پرداخت</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="box_button_header">
                    <a class="box_button_header_phone" href="tel:{$smarty.const.CLIENT_PHONE}">
                        <span>{$smarty.const.CLIENT_PHONE}</span>
                        <i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M345.1 107.1c-10.22-8.344-25.34-6.905-33.78 3.343c-8.406 10.25-6.906 25.37 3.344 33.78c33.88 27.78 53.31 68.19 53.31 110.9s-19.44 83.09-53.31 110.9c-10.25 8.404-11.75 23.53-3.344 33.78c4.75 5.781 11.62 8.781 18.56 8.781c5.375 0 10.75-1.781 15.22-5.438C390.2 367.1 416 313.1 416 255.1C416 198.9 390.2 144.9 345.1 107.1zM406.4 33.15c-10.22-8.342-25.34-6.873-33.78 3.344c-8.406 10.25-6.906 25.38 3.344 33.78C431.9 116.1 464 183.8 464 255.1c0 72.18-32.09 139.9-88.06 185.7c-10.25 8.406-11.75 23.53-3.344 33.78c4.75 5.779 11.62 8.781 18.56 8.781c5.375 0 10.75-1.781 15.22-5.438C473.5 423.8 512 342.6 512 255.1C512 169.4 473.5 88.14 406.4 33.15zM158.8 205.1c20.56 2.344 39.78-9.562 47.31-28.5l30.66-76.46c8.188-20.59 .4687-44.06-18.31-55.78L157.2 7.018C139-4.326 115.7-1.732 100.5 13.45C35.72 78.13 0 164.3 0 255.1c0 91.73 35.69 177.9 100.5 242.6C109.4 507.4 121.1 512 132.9 512c8.344 0 16.78-2.312 24.31-7l61.22-38.21c18.75-11.69 26.5-35.12 18.34-55.93l-30.66-76.53C198.5 315.6 179.4 303.9 159 305.9L130.4 308.7c-8.562-34.56-8.562-71.01 0-105.6L158.8 205.1zM90.31 342.4c3.594 10.53 13.59 17.28 25.09 16.09l46.16-6.186L193 426l-58.56 38.53C78.69 408.9 48 334.9 48 255.1c0-78.34 30.28-151.9 85.25-207.4l58.94 34.62L163.8 158.2L115.4 153.4c-11.31-1.109-21.47 5.594-25.09 16.11C71.25 225.3 71.28 286.6 90.31 342.4zM284.6 181.9c-10.28-8.344-25.41-6.875-33.75 3.406C242.4 195.6 243.9 210.7 254.2 219.1c11.31 9.25 17.81 22.69 17.81 36.87c0 14.19-6.5 27.62-17.81 36.87C243.9 301.3 242.4 316.4 250.8 326.6c4.719 5.812 11.62 8.812 18.56 8.812c5.344 0 10.75-1.781 15.19-5.406c22.53-18.44 35.44-45.4 35.44-74.05C319.1 227.3 307.1 200.4 284.6 181.9z"/></svg>
                        </i>
                    </a>
                    <div class="position-relative">

{*                            <i>*}
{*                                <svg viewBox="0 0 448 512">*}
{*                                    <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM224 32c52.94 0 96 43.06 96 96c0 52.93-43.06 96-96 96S128 180.9 128 128C128 75.06 171.1 32 224 32zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM413.3 480H34.66C33.2 480 32 478.8 32 477.3C32 399.4 95.4 336 173.3 336h101.3C352.6 336 416 399.4 416 477.3C416 478.8 414.8 480 413.3 480z"/>*}
{*                                </svg>*}
{*                            </i>*}
                        <a class="__login_register_class__ button_header logIn
{if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                           href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}"
                        >
                            <i>
                                <svg viewbox="0 0 448 512">
                                    <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM224 32c52.94 0 96 43.06 96 96c0 52.93-43.06 96-96 96S128 180.9 128 128C128 75.06 171.1 32 224 32zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM413.3 480H34.66C33.2 480 32 478.8 32 477.3C32 399.4 95.4 336 173.3 336h101.3C352.6 336 416 399.4 416 477.3C416 478.8 414.8 480 413.3 480z"></path>
                                </svg>
                            </i>
                            <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                        </a>
                            <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                                {include file="../../include/signIn/topBar.tpl"}
                            </div>
                    </div>
                    <a class="button_header d-none d-md-flex" href="{$smarty.const.ROOT_ADDRESS}/UserTracking"><span>پیگیری خرید</span></a>
                </div>
                <div class="nav-toggle mr-3">
                    <svg viewBox="0 0 448 512">
                        <path d="M0 80C0 71.16 7.164 64 16 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H16C7.164 96 0 88.84 0 80zM0 240C0 231.2 7.164 224 16 224H432C440.8 224 448 231.2 448 240C448 248.8 440.8 256 432 256H16C7.164 256 0 248.8 0 240zM432 416H16C7.164 416 0 408.8 0 400C0 391.2 7.164 384 16 384H432C440.8 384 448 391.2 448 400C448 408.8 440.8 416 432 416z"/>
                    </svg>
                </div>
            </nav>
        </div>
    </div>
</header>