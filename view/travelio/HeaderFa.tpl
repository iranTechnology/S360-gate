{assign var="pass_hash" value=$obj_main_page->hashPasswordUser()}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
<header class="header_area fixedmenu ">
    <div class="main_header_area">


        <div class=" menus container">
            <nav id="navigation1" class="navigation">
                <!-- Logo Area Start -->
                <div class="nav-header">
                    <a class="flex-row" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}">
                        <div class="logo logoHolder flex-col">
                            <img src="project_files/{$smarty.const.SOFTWARE_LANG}/images/logo.png" alt="{$obj_main_page->pageInfo['title']}">
                        </div>


                    </a>
                    <div class="nav-toggle"></div>
                </div>

                <div class="nav-menus-wrapper">
                    <ul class="nav-menu ">

                        <li id="tours_m" class=""><a class="smoothScrollTo TabScroll " data-target="#flightda-tab"
                                                     href="{$smarty.const.ROOT_ADDRESS}/page/flight">##S360Flight##</a></li>

                        <li><a href="{$smarty.const.ROOT_ADDRESS}/rules"> ##S360Rules## </a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs" >##S360AboutUs##</a></li>
                        <li ><a href="{$smarty.const.ROOT_ADDRESS}/contactUs"> ##S360ContactUs##</a></li>
                        <li ><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="d-sm-none"> ##S360Track##</a></li>

                        <li class="mobileMenu"><a href="/">##Home##</a></li>
{*                        <li class="peigiri_m"><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" >##S360Track##</a></li>*}
                        <li class="mobileMenu"><a href="{$smarty.const.ROOT_ADDRESS}/contactUs"> ##S360ContactUs##</a></li>
                        <li class="mobileMenu"><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs" >##S360AboutUs##</a></li>



                    </ul>
                </div>


            <div class="d-flex login-peigiri">
                <div class="act-buttons act-buttons-mobile">
                    <div class="nav-search">
                        <div class="top__user_menu">
                            <button class="{if $obj_main_page->isLogin()}main-navigation__button2{else}main-navigation__button1{/if} {if $obj_main_page->isLogin() }show-box-login-js{/if}">

                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}

                                <div class="button-chevron-2 ">

                                </div>
                            </button>

                            <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">

                                {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}

                            </div>

                        </div>
                    </div>
                </div>

                <div class="act-buttons peygiri">

                    <div class="peigiri">
                        <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">##S360Track##</a>
                    </div>
                </div>
</div>
              {*  <div class="social_top">

                    <ul>

                        <li><a href="" class="SMInstageram"><i class="fab fa-instagram"></i></a></li>
                        <li><a href="" class="SMTelegram"><i class="fab fa-telegram"></i></a></li>
                        <li><a href="" class="SMWhatsApp"><i class="fab fa-whatsapp"></i></a></li>

                    </ul>

                </div>*}

{*                <div class="lang">*}
{*                    <span>*}
{*                        <img src="project_files/{$smarty.const.SOFTWARE_LANG}/images/language-icon-en.png" alt="">*}
{*                    </span>*}

{*                    <ul class="lang_ul arrow-up">*}

{*                        <li>*}
{*                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/en">*}
{*                                <span>*}
{*                                  <img src="project_files/{$smarty.const.SOFTWARE_LANG}/images/language-icon-en.png" alt="" />*}
{*                                    English*}
{*                              </span>*}
{*                            </a>*}
{*                        </li>*}

{*                        <li>*}
{*                            <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar">*}
{*                                <span>*}
{*                                  <img src="project_files/{$smarty.const.SOFTWARE_LANG}/images/language-icon-ar.png" alt="" />*}
{*                                    العربي*}
{*                              </span>*}
{*                            </a>*}
{*                        </li>*}
{*                    </ul>*}

{*                </div>*}



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
        <a href="{if $telegramHref}{$telegramHref}{else}javascript:;{/if}" target="_blank"><i class="{if $smarty.const.GDS_SWITCH neq 'search-flight' and $smarty.const.GDS_SWITCH neq 'international'} fab {else} fa {/if} fa-telegram"></i>به ما ملحق شو!</a>
    </div>
    <div class="fl-fl float-rs">
        <a href="{if $whatsappHref}{$whatsappHref}{else}javascript:;{/if}" target="_blank"><i class="{if $smarty.const.GDS_SWITCH neq 'search-flight' and $smarty.const.GDS_SWITCH neq 'international'} fab {else} fa {/if} fa-whatsapp"></i>تماس با ما!</a>
    </div>
    <div class="fl-fl float-ig">
        <a href="{if $instagramHref}{$instagramHref}{else}javascript:;{/if}" target="_blank"><i class="{if $smarty.const.GDS_SWITCH neq 'search-flight' and $smarty.const.GDS_SWITCH neq 'international'} fab {else} fa {/if} fa-instagram"></i>ما رو دنبال کن!</a>
    </div>
</div>
