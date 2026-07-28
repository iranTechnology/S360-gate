{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="i_modular_menu header_area {if $smarty.const.GDS_SWITCH neq 'mainPage'} header_area_page {/if} ">
<div class="main_header_area animated" id="navbar">
<div class="container-fluid">
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
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">

                                    پرواز

                                </a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">

                                    هتل</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/bus">

                                    اتوبوس</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/entertainment">

                                    تفریحات

                                </a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/insurance">

                                    بیمه

                                </a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">

                                    ویزا

                                </a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/page/rentCar">

                                    اجاره خودرو

                                </a></li>
</ul>
</li>
<li>
<a href="javascript:">تور داخلی</a>
    {if $objResult->ReservationTourCities('=1', 'return')}
<ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
    {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}

        <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/all">
                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
            </a></li>

    {/foreach}
</ul>
    {/if}
</li>
<li>
<a href="javascript:">تور خارجی</a>
    {if $objResult->ReservationTourCountries('yes')}

    <ul class="nav-dropdown {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}

<li> <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
        {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
    </a></li>

        {/foreach}
    </ul>
    {/if}
</li>
<li class="">
<a href="javascript:">مسافران</a>
<ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
<li><a href="{$smarty.const.ROOT_ADDRESS}/vote">نظرسنجی</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/lastMinute">دقیقه نود</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/faq">پرسش و پاسخ</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">انتقادات و پیشنهادات</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/gallery">گالری جهان</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/recommendation">سفرنامه</a></li>
</ul>
</li>
<li class="">
<a href="javascript:">دانستنیها</a>
<ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
<li><a href="{$smarty.const.ROOT_ADDRESS}/aboutCountry">معرفی کشورها</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/weather">هواشناسی</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/convertDate">تبدیل تاریخ</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/aboutIran">معرفی ایران</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/clock">ساعت کشورها</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/currency">نرخ ارز</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/embassies">سفارت</a></li>
</ul>
</li>
<li class="">
<a href="javascript:">آژانس ما</a>
<ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
<li><a href="{$smarty.const.ROOT_ADDRESS}/authenticate">باشگاه مشتریان</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/news">اخبار</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/orderServices">درخواست خدمات</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
</ul>
</li>
<li class="">
<a href="javascript:">پشتیبانی 24/7</a>
<ul class="nav-dropdown nav-submenu nav-menu_ul {if  $smarty.const.GDS_SWITCH eq 'page'} nav-dropdown-page {/if}">
<li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/faq">سوالات متداول</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a></li>
<li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
</ul>
</li>
</ul>
</div>
<div class="btn-header">
<a class="btn-number" href="javascript:">
<i class="fa-light fa-phone"></i>
<span class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</span>
</a>

<a class="__login_register_class__ btn-login {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}" href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
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