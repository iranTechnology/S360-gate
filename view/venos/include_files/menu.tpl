<header class="header_area {if $smarty.const.GDS_SWITCH neq 'mainPage'}position-static{/if}">
    <div class="main_header_area animated" id="navbar">
        <div class="container-fluid">
            <nav id="navigation1" class="navigation">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                        <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                        <!--                        <div class="logo-caption">-->
                        <!--                            <h1>-->
                        <!--                                <span class="top-span"> ونـوس </span>-->
                        <!--                                <span class="sum-span">آژانس مسافرتی</span>-->
                        <!--                            </h1>-->
                        <!--                        </div>-->
                    </a>
                </div>
                <div class="nav-menus-wrapper ">
                    <ul class="nav-menu align-to-right">
                        <li>
                            <a href="javascript:">بلیط</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/flight">پرواز های خارجی</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">تور</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li> <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-all/all/all">تور های داخلی</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/all-all/all/all">تور های خارجی</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/all-all/all/3">مقاصد پر طرفدار</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all/1">محبوب ترین تورها</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">خدمات سفر</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/insurance">بیمه مسافرتی</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">ویزای سفر</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">آژانس ما</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">درباره ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">مجله ونوس</a></li>
                                <li><a href="javascript:">دریافت اپلیکیشن</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="https://ravis.venustour.ir/" target="_blank">چارترهای ونوس</a>
                        </li>
                        <li class='position-relative'>
                            <a {if $obj_main_page->isLogin()} href="{$smarty.const.ROOT_ADDRESS}/club" {else} href="{$smarty.const.ROOT_ADDRESS}/authenticate" {/if}>باشگاه مشتریان</a>
                        </li>
                    </ul>
                </div>
                <div class="parent-btn-header">
                    <a class="button  btn-phone btn-style" href="tel:{$smarty.const.CLIENT_PHONE}">
                        <span class="font-16">{$smarty.const.CLIENT_PHONE}</span>
                        <i class="fa-light fa-phone my-phone"></i>
                    </a>
{*                    <a class="main-navigation__button2  button  btn-user btn-style" href="javascript:">*}
{*                        <span>{include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}</span>*}
{*                        <i class="fa-light fa-user my-user"></i>*}
{*                    </a>*}
                    <a class="__login_register_class__ btnheader2 {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if} btn-style"
                       href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                        <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                        <i class="fa-light fa-user my-user"></i>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                        {include file="../../include/signIn/topBar.tpl"}
                    </div>
                    <a class="button btn-buy btn-style" href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
                        پیگیری خرید
                        <i class="fa-light fa-memo-circle-check"></i>
                    </a>
                </div>
                <div class="nav-toggle "></div>
            </nav>
        </div>
    </div>
</header>
