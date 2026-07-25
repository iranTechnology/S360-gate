{assign var="pass_hash" value=$obj_main_page->hashPasswordUser()}

{include file="`$smarty.const.FRONT_THEMES_DIR`oshida/topBar.tpl"}

<header class="header_area">
    <div class="main_header_area animated">
        <div class="container">
            <nav id="navigation1" class="navigation">
                <!-- Logo Area Start -->
                <div class="nav-header ">
                    <a class="nav-brand " href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                        <div class="logoHolder">
                            <img src="project_files/images/logo.jpg" alt="{$obj->Title_head()}">
                        </div>
                        <div class="textholder center flex-column">
                            <div class="logoText">{$smarty.const.CLIENT_NAME}</div>
                            <div class="logoSubtext">به راحتی سفر کنید</div>
                        </div>

                    </a>
                </div>


                <div class="nav-menus-wrapper">
                    <ul class="nav-menu align-to-right">
                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه اصلی</a></li>
                        <li class=""><a href="javascript:;">تور</a>
                            <ul class="nav-dropdown first_child_menu  fadeIn animated">
                                <li><a href="javascript:;"> تور داخلی </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">
                                        {foreach key=key_tour item=item_tour from=$obj_main_page->getReservationTourCities('=1', 'return')}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}


                                    </ul>
                                </li>
                                <li><a href="javascript:;"> تور خارجی </a>
                                    <ul class="nav-dropdown submenu-child fadeIn animated">
                                        {foreach key=key_tour item=item_tour from=$obj_main_page->getReservationTourCountries()}
                                            <li>
                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/{$item_tour.id}-all/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all">
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>

                            </ul>
                        </li>


                        <li><a href="javascript:;"> دانستنی ها </a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutIran"> معرفي ایران </a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutCountry"> معرفی كشورها </a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/mag"> اطلاعات مفید </a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/embassies"> سفارت </a></li>


                            </ul>
                        </li>

{*                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacountry">ویزا </a></li>*}
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید </a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">ثبت شکایات </a></li>
                        <li><a href="javascript:;"> درباره ما </a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs"> درباره ما </a></li>

                                <li><a href="{$smarty.const.ROOT_ADDRESS}/news"> اخبار سایت </a></li>
                                <li><a class="bg-light disabled"> پرسشهاي متداول </a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/rules"> قوانین و مقررات </a></li>

                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/how-to-reserve"> راهنمای رزرو آنلاین </a></li>


                            </ul>
                        </li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs"> تماس با ما </a></li>

                    </ul>

                </div>
                {if !$objSession->IsLogin() }
                    {*<div _ngcontent-c1="" class="loginRegButton flex-row al-center jus-between ng-tns-c1-0">*}
                    {*<div _ngcontent-c1="" class="ORWrapp initial flex-row center"><div _ngcontent-c1="" class="circle1"></div></div>*}
                    {*<div _ngcontent-c1="" class="logBtn flex-row center"><a href="{$smarty.const.ROOT_ADDRESS}/loginUser">ورود</a></div>*}
                    {*<div _ngcontent-c1="" class="ORWrapp flex-row center"><div _ngcontent-c1="" class="circle1"></div></div>*}
                    {*<div _ngcontent-c1="" class="regBtn flex-row center"><a  href="{$smarty.const.ROOT_ADDRESS}/registerUser">ثبت نام</a></div>*}
                    {*<div _ngcontent-c1="" class="ORWrapp flex-row jus-center al-center"><div _ngcontent-c1="" class="circle1"></div></div>*}
                    {*</div>*}
                {/if}

                <div class="nav-toggle"></div>
            </nav>
        </div>
    </div>
</header>