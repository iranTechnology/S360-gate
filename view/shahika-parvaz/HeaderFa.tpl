{assign var="pass_hash" value=$obj_main_page->hashPasswordUser()}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="header_area fixedmenu ">
    <div class="main_header_area">


        <div class=" menus container">
            <nav id="navigation1" class="navigation">
                <div class="nav-header">
                    <a class="flex-row" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                         <img src="project_files/images/logo.png" alt="{$obj_main_page->pageInfo['title']}">
                        <div class="logo-caption">
                            <h2>
                                <span class="top-span">شاهیکا پرواز </span>
                                <span class="sum-span">آژانس مسافرتی</span>
                            </h2>
                        </div>
                    </a>
                </div>

                <div class="nav-menus-wrapper">
                    <ul class="nav-menu ">
                        <li>
                            <a href="javascript:;"> تور داخلی </a>
                            <ul class="nav-dropdown submenu-child fadeIn animated">
                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return')}
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                        </a>
                                    </li>
                                {/foreach}

                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/tour"> جست و جوی تور </a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;"> تور خارجی </a>
                            <ul class="nav-dropdown submenu-child fadeIn animated">
                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes')}
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                        </a>
                                    </li>
                                {/foreach}
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/tour"> جست و جوی تور </a></li>
                            </ul>
                        </li>
                        <li class="">
                            <a href="{$smarty.const.ROOT_ADDRESS}/mag">##S360Blog##</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/contactUs"> ##S360ContactUs##</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">##S360AboutUs##</a>
                        </li>
                    </ul>
                </div>


                <div class="act-buttons act-buttons-mobile">
                    <div class="nav-search">
                        <div class="top__user_menu">
                            <a class="__login_register_class__ button_header logIn
{if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                               href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}"
                            >
                                <i>
                                    <svg viewbox="0 0 448 512">
                                        <path d="M224 256c70.7 0 128-57.31 128-128s-57.3-128-128-128C153.3 0 96 57.31 96 128S153.3 256 224 256zM224 32c52.94 0 96 43.06 96 96c0 52.93-43.06 96-96 96S128 180.9 128 128C128 75.06 171.1 32 224 32zM274.7 304H173.3C77.61 304 0 381.6 0 477.3c0 19.14 15.52 34.67 34.66 34.67h378.7C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM413.3 480H34.66C33.2 480 32 478.8 32 477.3C32 399.4 95.4 336 173.3 336h101.3C352.6 336 416 399.4 416 477.3C416 478.8 414.8 480 413.3 480z"></path>
                                    </svg>
                                </i>
                                <span>{include file="../include/signIn/topBarName.tpl"}</span>
                            </a>
                                <div class="button-chevron-2 ">

                                </div>
                            </button>

                            <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js"
                                 style="display: none">

                                {include file="../include/signIn/topBar.tpl"}

                            </div>

                        </div>
                    </div>
                </div>

                <div class="act-buttons peygiri">

                    <div class="peigiri">
                        <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">##S360Track##</a>
                    </div>
                </div>
                <div class="nav-toggle"></div>
            </nav>
        </div>
    </div>


</header>
{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{assign var="socialLinks"  value=$about['social_links']|json_decode:true}
{assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref', 'aparat' => 'aparatHref']}

{foreach $socialLinks as $key => $val}
    {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
{/foreach}
<div class="float-sm">
    <div class="fl-fl float-gp">
        <a href="{if $telegramHref}{$telegramHref}{else}javascript:;{/if}" target="_blank"><i
                    class="{if $smarty.const.GDS_SWITCH neq 'search-flight' and $smarty.const.GDS_SWITCH neq 'international'} fab {else} fa {/if} fa-telegram"></i>به
            ما ملحق شو!</a>
    </div>
    <div class="fl-fl float-rs">
        <a href="{if $whatsappHref}{$whatsappHref}{else}javascript:;{/if}" target="_blank"><i
                    class="{if $smarty.const.GDS_SWITCH neq 'search-flight' and $smarty.const.GDS_SWITCH neq 'international'} fab {else} fa {/if} fa-whatsapp"></i>تماس
            با ما!</a>
    </div>
    <div class="fl-fl float-ig">
        <a href="{if $instagramHref}{$instagramHref}{else}javascript:;{/if}" target="_blank"><i
                    class="{if $smarty.const.GDS_SWITCH neq 'search-flight' and $smarty.const.GDS_SWITCH neq 'international'} fab {else} fa {/if} fa-instagram"></i>ما
            رو دنبال کن!</a>
    </div>
</div>
<div class="left_text_">
    <div class="contact_popup">
        <div style="direction:rtl" class="popup_content">
            <div class="phone">
                دموی نرم افزار شرکت ایران تکنولوژی می باشد و
                هیچ گونه استفاده تجاری ندارد.
            </div>
        </div>
    </div>
    <div class="tejari">
        استفاده غیر تجاری
    </div>
</div>
