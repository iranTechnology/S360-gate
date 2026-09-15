{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container">
            <nav class="navigation" id="navigation1">
                <div class="parent-menu-logo">
                    <div class="nav-header">
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img alt="{$obj->Title_head()}" class="__logo_class__ logo-img" src="project_files/images/logo.png"/>
                            <div class='bg-img-logo'></div>
                        </a>
                    </div>
                    <div class="nav-menus-wrapper">
                        <ul class="nav-menu align-to-right">
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">

                                    پرواز

                                </a>
                            </li>
                            <li>
                                <a href="javascript:">اقامت</a>
                                <ul class="nav-dropdown">
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">

                                            هتل داخلی

                                        </a>
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">

                                            هتل خارجی

                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href='{$smarty.const.ROOT_ADDRESS}/page/package'>پرواز + هتل</a>
                            </li>
                            <li>
                                <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور</a>
                                {if $objResult->ReservationTourCities('=1', 'return') || $objResult->ReservationTourCountries('yes')}
                                <ul class="nav-dropdown">
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور داخلی</a>
                                        {if $objResult->ReservationTourCities('=1', 'return')}
                                        <ul class="nav-dropdown nav-menu_ul">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                            {/foreach}
{*                                            <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-all/all/all/0">همه تورها</a></li>*}
                                        </ul>
                                        {/if}
                                    </li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">تور خارجی</a>
                                        {if $objResult->ReservationTourCountries('yes')}
                                        <ul class="nav-dropdown nav-menu_ul">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                            {/foreach}
                                        </ul>
                                        {/if}
                                    </li>
                                    <li>
                                        <a href='{$smarty.const.ROOT_ADDRESS}/page/tour' class='all-tour-menu'>جستجوی تورها</a>
                                    </li>
                                </ul>
                                {/if}
                            </li>
                            <li>
                                <a class="link-header" href="javascript:">آژانس ما</a>
                                <div class='nav-dropdown  passengers-sub-menu our-agency' style='display: none;left: -327px !important;'>
                                    <ul class="ul-menu-passengers">
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/club">
                                                <i class="parent-icon-sub-menu">
                                                    <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M32 208V384c0 17.7 14.3 32 32 32H224c17.7 0 32-14.3 32-32V208c0-61.9-50.1-112-112-112S32 146.1 32 208zm256 0V384c0 11.7-3.1 22.6-8.6 32H512c17.7 0 32-14.3 32-32V208c0-61.9-50.1-112-112-112H234.5c32.6 26.4 53.5 66.8 53.5 112zM64 448c-35.3 0-64-28.7-64-64V208C0 128.5 64.5 64 144 64H432c79.5 0 144 64.5 144 144V384c0 35.3-28.7 64-64 64H224 64zm48-256h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm224 0h96 56c13.3 0 24 10.7 24 24v80c0 13.3-10.7 24-24 24H440c-13.3 0-24-10.7-24-24V224H336c-8.8 0-16-7.2-16-16s7.2-16 16-16zm112 96h32V224H448v64z"></path>
                                                    </svg>
                                                </i>
                                                <div class="parent-sub-menu-title">
                                                    <h4>باشگاه مسافران</h4>
                                                    <p class="sub-menu-caption">

                                                        در بخش باشگاه مسافران، با پیوستن به جمع ویژه‌ای از مسافران وفادار،
                                                        از تخفیف‌ها و پیشنهادات انحصاری بهره‌مند شوید. با عضویت در این
                                                        باشگاه، از امتیازات و جوایز ویژه‌ای که برای شما در نظر گرفته‌ایم،
                                                        بهره‌مند شوید.

                                                    </p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/pay">
                                                <i class="parent-icon-sub-menu">
                                                    <svg viewbox="0 0 640 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M512 96H64C46.33 96 32 110.3 32 128V384C32 401.7 46.33 416 64 416H338.2L330.2 448H64C28.65 448 0 419.3 0 384V128C0 92.65 28.65 64 64 64H512C547.3 64 576 92.65 576 128V192C565.1 191.7 554.2 193.6 544 197.6V128C544 110.3 529.7 96 512 96V96zM256 304C256 295.2 263.2 288 272 288H368C376.8 288 384 295.2 384 304C384 312.8 376.8 320 368 320H272C263.2 320 256 312.8 256 304zM464 192C472.8 192 480 199.2 480 208C480 216.8 472.8 224 464 224H272C263.2 224 256 216.8 256 208C256 199.2 263.2 192 272 192H464zM143.1 144C152.8 144 159.1 151.2 159.1 160V169.6C165.9 170.6 178.1 173.2 184.1 174.5C192.7 176.8 197.7 185.6 195.5 194.1C193.2 202.7 184.4 207.7 175.9 205.5C171.9 204.4 158.2 201.7 153.8 201C140.9 199 130.1 200.6 122.9 203.9C115.7 207.2 112.1 211.4 112.4 214.1C111.7 219.1 112.3 221.2 112.9 222.4C113.5 223.8 114.8 225.5 117.8 227.5C124.6 232.1 134.9 235.3 148.8 239.5L149.4 239.7C161.7 243.4 177.3 248.1 188.9 256.5C195.1 261.1 200.9 267.1 204.5 275.3C208.1 283.6 208.8 292.8 207.2 302.5C204.1 319.1 192.6 331.9 177.9 338.2C172.3 340.6 166.3 342.2 160 343.1V352C160 360.8 152.8 368 144 368C135.2 368 128 360.8 128 352V342.4C118.6 340.6 104.5 335.8 95.55 332.7C93.79 332.1 92.22 331.6 90.95 331.2C82.56 328.4 78.03 319.3 80.82 310.9C83.61 302.6 92.67 298 101.1 300.8C102.1 301.5 105 302.2 107.2 302.9C116.7 306.1 127.9 309.9 134.3 310.1C147.6 313.1 158.3 311.8 165.3 308.8C171.8 306 174.7 302.1 175.6 297C176.4 292.4 175.8 289.7 175.1 288.1C174.4 286.4 172.9 284.5 170 282.4C163.5 277.6 153.3 274.3 139.6 270.1L137.5 269.5C125.7 265.9 110.9 261.5 99.87 254C93.65 249.8 87.7 244 83.93 236.1C80.1 228 79.2 219 80.85 209.5C83.73 192.8 95.57 181.2 109.7 174.8C115.3 172.2 121.5 170.4 128 169.3V160C128 151.2 135.2 144 144 144H143.1zM537.5 241.4C556.3 222.6 586.7 222.6 605.4 241.4L622.8 258.7C641.5 277.5 641.5 307.9 622.8 326.6L469.1 480.3C462.9 486.5 455.2 490.8 446.8 492.1L371.9 511.7C366.4 513 360.7 511.4 356.7 507.5C352.7 503.5 351.1 497.7 352.5 492.3L371.2 417.4C373.3 408.9 377.7 401.2 383.8 395.1L537.5 241.4zM582.8 264C576.5 257.8 566.4 257.8 560.2 264L535.3 288.8L575.3 328.8L600.2 303.1C606.4 297.7 606.4 287.6 600.2 281.4L582.8 264zM402.2 425.1L389.1 474.2L439 461.9C441.8 461.2 444.4 459.8 446.4 457.7L552.7 351.4L512.7 311.5L406.5 417.7C404.4 419.8 402.9 422.3 402.2 425.1L402.2 425.1z"></path>
                                                    </svg>
                                                </i>
                                                <div class="parent-sub-menu-title">
                                                    <h4>پرداخت آنلاین</h4>
                                                    <p class="sub-menu-caption">

                                                        در بخش پرداخت آنلاین، می‌توانید هزینه‌های سفر خود را به‌صورت امن و
                                                        سریع انجام دهید. با استفاده از این سیستم، رزروهای خود را بدون دغدغه
                                                        و به راحتی مدیریت کنید

                                                    </p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/rules">
                                                <i class="parent-icon-sub-menu">
                                                    <svg viewbox="0 0 640 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M384 64c0 29.8-20.4 54.9-48 62V480H528c8.8 0 16 7.2 16 16s-7.2 16-16 16H320 112c-8.8 0-16-7.2-16-16s7.2-16 16-16H304V126c-27.6-7.1-48-32.2-48-62H112c-8.8 0-16-7.2-16-16s7.2-16 16-16H264.6C275.6 12.9 296.3 0 320 0s44.4 12.9 55.4 32H512c8.8 0 16 7.2 16 16s-7.2 16-16 16H384zm56.7 298.3C457.8 375.1 482.9 384 512 384s54.2-8.9 71.3-21.7C600.4 349.5 608 334.2 608 320H416v-1.6l0 .1V320c0 14.2 7.6 29.5 24.7 42.3zm71.3-215L426.3 288H597.7L512 147.3zM384 320v-1.6c0-14.7 4-29.1 11.7-41.6l92-151.2c5.2-8.5 14.4-13.7 24.3-13.7s19.2 5.2 24.3 13.7l92 151.2c7.6 12.5 11.7 26.9 11.7 41.6V320c0 53-57.3 96-128 96s-128-43-128-96zM32 320c0 14.2 7.6 29.5 24.7 42.3C73.8 375.1 98.9 384 128 384s54.2-8.9 71.3-21.7C216.4 349.5 224 334.2 224 320H32v-1.6l0 .1V320zm10.3-32H213.7L128 147.3 42.3 288zM128 416C57.3 416 0 373 0 320v-1.6c0-14.7 4-29.1 11.7-41.6l92-151.2c5.2-8.5 14.4-13.7 24.3-13.7s19.2 5.2 24.3 13.7l92 151.2c7.6 12.5 11.7 26.9 11.7 41.6V320c0 53-57.3 96-128 96zM320 96a32 32 0 1 0 0-64 32 32 0 1 0 0 64z"></path>
                                                    </svg>
                                                </i>
                                                <div class="parent-sub-menu-title">
                                                    <h4>قوانین و مقررات</h4>
                                                    <p class="sub-menu-caption">

                                                        در بخش قوانین و مقررات، با شرایط و ضوابط استفاده از خدمات ما آشنا
                                                        شوید. مطالعه این بخش به شما کمک می‌کند تا با حقوق و مسئولیت‌های خود
                                                        به‌طور کامل آگاه شده و از تجربه‌ای مطمئن و رضایت‌بخش بهره‌مند شوید

                                                    </p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
                                                <i class="parent-icon-sub-menu">
                                                    <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M480 288h-128c-8.836 0-16 7.164-16 16S343.2 320 352 320h128c8.836 0 16-7.164 16-16S488.8 288 480 288zM192 256c35.35 0 64-28.65 64-64S227.3 128 192 128S128 156.7 128 192S156.7 256 192 256zM192 160c17.64 0 32 14.36 32 32S209.6 224 192 224S160 209.6 160 192S174.4 160 192 160zM224 288H160c-44.18 0-80 35.82-80 80C80 376.8 87.16 384 96 384s16-7.164 16-16C112 341.5 133.5 320 160 320h64c26.51 0 48 21.49 48 48c0 8.836 7.164 16 16 16s16-7.164 16-16C304 323.8 268.2 288 224 288zM512 32H64C28.65 32 0 60.65 0 96v320c0 35.35 28.65 64 64 64h448c35.35 0 64-28.65 64-64V96C576 60.65 547.3 32 512 32zM544 416c0 17.64-14.36 32-32 32H64c-17.64 0-32-14.36-32-32V96c0-17.64 14.36-32 32-32h448c17.64 0 32 14.36 32 32V416zM480 224h-128c-8.836 0-16 7.164-16 16S343.2 256 352 256h128c8.836 0 16-7.164 16-16S488.8 224 480 224zM480 160h-128c-8.836 0-16 7.164-16 16S343.2 192 352 192h128c8.836 0 16-7.164 16-16S488.8 160 480 160z"></path>
                                                    </svg>
                                                </i>
                                                <div class="parent-sub-menu-title">
                                                    <h4>درباره ما</h4>
                                                    <p class="sub-menu-caption">

                                                        در بخش درباره ما، با تاریخچه، اهداف، و تیم حرفه‌ای آژانس گردشگری ما
                                                        آشنا شوید. ما با افتخار به ارائه بهترین خدمات گردشگری و ایجاد
                                                        تجربه‌های فراموش‌نشدنی برای مسافران خود متعهد هستیم

                                                    </p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">
                                                <i class="parent-icon-sub-menu">
                                                    <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M32 256C32 132.3 132.3 32 256 32s224 100.3 224 224V400.1c0 26.5-21.5 48-48 48l-82.7-.1c-6.6-18.6-24.4-32-45.3-32H240c-26.5 0-48 21.5-48 48s21.5 48 48 48h64c20.9 0 38.7-13.4 45.3-32l82.7 .1c44.2 0 80.1-35.8 80.1-80V256C512 114.6 397.4 0 256 0S0 114.6 0 256v48c0 8.8 7.2 16 16 16s16-7.2 16-16V256zM320 464c0 8.8-7.2 16-16 16H240c-8.8 0-16-7.2-16-16s7.2-16 16-16h64c8.8 0 16 7.2 16 16M144 224h16V352H144c-26.5 0-48-21.5-48-48V272c0-26.5 21.5-48 48-48zM64 272v32c0 44.2 35.8 80 80 80h16c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H144c-44.2 0-80 35.8-80 80zm288-48h16c26.5 0 48 21.5 48 48v32c0 26.5-21.5 48-48 48H352V224zm16-32H352c-17.7 0-32 14.3-32 32V352c0 17.7 14.3 32 32 32h16c44.2 0 80-35.8 80-80V272c0-44.2-35.8-80-80-80z"></path>
                                                    </svg>
                                                </i>
                                                <div class="parent-sub-menu-title">
                                                    <h4>تماس با ما</h4>
                                                    <p class="sub-menu-caption">

                                                        در بخش تماس با ما، می‌توانید با تیم پشتیبانی ما در ارتباط باشید. اگر
                                                        سوالی دارید یا نیاز به راهنمایی دارید، از طریق اطلاعات تماس ارائه
                                                        شده با ما در تماس باشید تا به سرعت به شما پاسخ دهیم

                                                    </p>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class='parent-tracking'>
                                        <a href='{$smarty.const.ROOT_ADDRESS}/UserTracking' class=''>
                                            <div class='parent-data-tracking'>
                                                <div class="parent-sub-menu-title">
                                                    <h4>پیگیری خرید</h4>
                                                    <p class="sub-menu-caption">
                                                        در بخش پیگیری خرید شما می‌توانید به راحتی وضعیت رزروها و خریدهای خود را مشاهده و بررسی کنید. این بخش به شما امکان می‌دهد تا اطلاعات مربوط به پرواز، هتل، تور یا سایر خدمات رزرو شده را با استفاده از شماره پیگیری یا اطلاعات کاربری خود مشاهده کنید. هدف ما از این بخش، ایجاد شفافیت و دسترسی آسان به اطلاعات خریدهای شماست تا با خیالی آسوده سفر خود را مدیریت کنید.
                                                    </p>
                                                </div>
                                            </div>
                                            <button>مشاهده</button>
                                        </a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="parent-btn-header">
                    <a class="__phone_class__ button btn-phone"
                       href="tel:{$smarty.const.CLIENT_PHONE}">
                        <span>{$smarty.const.CLIENT_PHONE}</span>
                        <i class="far fa-phone"></i>
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
                        {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}
                    </div>
                </div>
                <div class="nav-toggle"></div>
            </nav>
        </div>
    </div>
</header>