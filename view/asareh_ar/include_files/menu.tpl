{assign var="dubai_tour_params" value=['type'=>'','limit'=> '5','dateNow' => $dateNow, 'country' =>'2' ,'city' => 167]}
{assign var='dubaiTours' value=$obj_main_page->getToursReservation($dubai_tour_params)}
{assign var="dubai_hotel_params" value=['limit'=> '5','country' =>'2','city' => 167]}
{assign var='dubai_hotels' value=$obj_main_page->getHotelReservation($dubai_hotel_params)}
<header class="header_area">
    <div class="main_header_area animated" id="navbar">
        <div class="container-fluid">
            <nav id="navigation1" class="navigation">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_DOMAIN}/{$smarty.const.SOFTWARE_LANG}">
                        <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                        <div class="logo-caption">
                            <h1>
                                <span class="top-span"> دوكاتور  </span>
                                <span class="sum-span">وكالة سفر</span>
                            </h1>
                        </div>
                    </a>
                </div>
                <div class="nav-menus-wrapper ">
                    <ul class="nav-menu align-to-right">
                        <li>
                            <a class="link-header" href="https://{$smarty.const.CLIENT_DOMAIN}/{$smarty.const.SOFTWARE_LANG}">الصفحة الرئيسة</a>
                        </li>
                        <li>
                            <a href="javascript:">جولة دبي</a>
                            <ul class="nav-dropdown nav-submenu ">
                                {foreach $dubaiTours as $item}
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/detailTour/{$item['id']}/{$item['tour_slug']}">{$item['tour_name_en']}</a>
                                    </li>
                                {/foreach}

                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">فندق دبي</a>
                            <ul class="nav-dropdown nav-submenu ">
                                {foreach $dubai_hotels as $item}
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item['id']}/{$item['name_en']|strip:'-'}">{$item['name_en']}</a>
                                    </li>
                                {/foreach}

                            </ul>
                        </li>
                        <li>
                                <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/resultEntertainment/all/all/all&is_request=1">الخدمات السياحية</a>
                        </li>
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/mag">مدونة</a>
                        </li>
                        <li>
                            <a href="javascript:">  وكالتنا</a>
                            <ul class="nav-dropdown nav-submenu ">
                                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/page/documents">المستندات والنماذج</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/UserTracking">ترتیب المسار</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/aboutUs">معلومات عنا</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/contactUs">اتصل بنا</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/faq">الأسئلة الشائعة</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="parent-btn-header">
                    <a class="main-navigation__button2 button  btn-user " href="javascript:">
                        <span>
                            {include file="`$smarty.const.FRONT_THEMES_DIR`asareh_ar/topBarName.tpl"}
                        </span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                    </a>
                    <div class="main-navigation__sub-menu2 arrow-up p-0">

                        {include file="`$smarty.const.FRONT_THEMES_DIR`asareh_ar/topBar.tpl"}

                    </div>

                    <div class="lang">
                    <span>
                        <img style='border-radius: 50%' src="project_files/images/1.png" alt="img">
                    </span>

                        <ul class="lang_ul">

                            <li>
                                <a href="https://dukatour.ae/ar">
                                <span>
                                  <img style='border-radius: 50%' src="project_files/images/1.png" alt="img">
                                    ar
                              </span>
                                </a>
                            </li>

                            <li>
                                <a href="https://dukatour.com/en">
                                <span>
                                  <img src="project_files/images/language-icon-en.png" alt="img">
                                    en
                              </span>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
                <div class="nav-toggle "></div>
            </nav>
        </div>
    </div>
</header>