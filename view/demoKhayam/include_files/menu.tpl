{assign var="pass_hash" value=$obj_main_page->hashPasswordUser()}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}

<header class="header_area " id="header">
    <div class="main_header_area animated">
        <div class="container-fluid">
            <nav id="navigation1" class="navigation">
                <div class="nav-header">
                    <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                        <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
                    </a>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu align-to-right">
                        <li class="li-tour-menu li-tour-internal-menu">
                            <a class="tour-menu" href="javascript:">تور داخلی</a>
                            <ul class="nav-dropdown nav-submenu nav-dropdown-full">
                                <div class="parent-li-tour-menu parent-li-tour-menu2">
                                    <div class="col-3">
                                        <p class="title-cat">
                                            <span>
                                            <i class="fa-light fa-suitcase-rolling"></i>
                                            </span>
                                            تور های گروهی
                                        </p>
                                        <div class="parent-internal--new">
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return' ,false , 17 , 'like')}
                                                {assign var="year" value=substr($item_tour['start_date'], 0, 4)}
                                                {assign var="month" value=substr($item_tour['start_date'], 4, 2)}
                                                {assign var="day" value=substr($item_tour['start_date'], 6)}
                                                <li>

                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/17" class="country-name">
                                                        تور {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                    </a>

                                                </li>
                                            {/foreach}
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <p class="title-cat">
                                            <span>
                                            <i class="fa-light fa-suitcase-rolling"></i>
                                            </span>
                                            تور های بوم گردی
                                        </p>
                                        <div class="parent-earth--new">
                                            {assign var="type" value="6"}
                                            {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries(false, false  , $type)}
                                                {assign var="year" value=substr($item_tour['start_date'], 0, 4)}
                                                {assign var="month" value=substr($item_tour['start_date'], 4, 2)}
                                                {assign var="day" value=substr($item_tour['start_date'], 6)}
                                                {foreach $item_tour['city_list'] as $city }
                                                    {assign var="year" value=substr($city['start_date'], 0, 4)}
                                                    {assign var="month" value=substr($city['start_date'], 4, 2)}
                                                    {assign var="day" value=substr($city['start_date'], 6)}
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/{$type}">
                                                            تور {$city['name']}
                                                        </a>

                                                    </li>
                                                {/foreach}
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                            </ul>
                        </li>
                        <li class="li-tour-menu-mobile">
                            <a href="javascript:">تور داخلی</a>
                            <ul class="nav-dropdown nav-submenu">
                                <li>
                                    <a href="javascript:">تور داخلی</a>
                                    <ul class="nav-dropdown my-dropdown nav-submenu">
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCities('=1', 'return' ,false , 17 , 'like')}
                                            {assign var="year" value=substr($item_tour['start_date'], 0, 4)}
                                            {assign var="month" value=substr($item_tour['start_date'], 4, 2)}
                                            {assign var="day" value=substr($item_tour['start_date'], 6)}
                                            <li>

                                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/1-{$item_tour.id}/all/17" class="country-name">
                                                    تور {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:">تور زمینی</a>
                                    <ul class="nav-dropdown my-dropdown nav-submenu">
                                        {assign var="type" value="6"}
                                        {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries(false, false  , $type)}
                                            {assign var="year" value=substr($item_tour['start_date'], 0, 4)}
                                            {assign var="month" value=substr($item_tour['start_date'], 4, 2)}
                                            {assign var="day" value=substr($item_tour['start_date'], 6)}
                                            {foreach $item_tour['city_list'] as $city }
                                                {assign var="year" value=substr($city['start_date'], 0, 4)}
                                                {assign var="month" value=substr($city['start_date'], 4, 2)}
                                                {assign var="day" value=substr($city['start_date'], 6)}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/{$type}">
                                                        تور {$city['name']}
                                                    </a>

                                                </li>
                                            {/foreach}
                                        {/foreach}
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="li-tour-menu-mobile">
                            <a href="javascript:">تور خارجی</a>
                            <ul class="nav-dropdown">

                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes' , false)}
                                    <li class="">
                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                        </a>
                                        {if $item_tour['city_list']}
                                            <ul class="nav-dropdown my-dropdown">
                                                {foreach $item_tour['city_list'] as $city }
                                                    {if $city.vehicle_ids2 eq 1}
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">
                                                                تور {$city['name']}-{$item_tour.type_vehicle_id}
                                                            </a>
                                                        </li>
                                                    {/if}
                                                {/foreach}
                                            </ul>
                                        {/if}
                                    </li>
                                {/foreach}
                                {*                                <li class="other-tour">*}
                                {*                                    <a href="javascript:">*}
                                {*                                        همه تورها*}
                                {*                                    </a>*}
                                {*                                </li>*}
                            </ul>
                        </li>
                        <li class="li-tour-menu">
                            <a class="tour-menu" href="javascript:">تور خارجی</a>
                            {assign var="tourCountries" value=$objResult->ReservationTourCountries('yes' , false)}
                            <ul class="nav-dropdown nav-submenu nav-dropdown-full  {if !$tourCountries}d-none{/if}">
                                <div class=" parent-li-tour-menu">

                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountries('yes' , false)}
                                    <li >

                                        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all"  class="country-name">
                                                <span>
                                                    <i class="fa-light fa-earth-americas"></i>
                                                </span>
                                            {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                        </a>
                                        {if $item_tour['city_list']}

                                            {foreach $item_tour['city_list'] as $city }
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">
                                                        تور {$city['name']}
                                                    </a>
                                            {/foreach}
                                        {/if}
                                    </li>
                                {/foreach}



                </div>
                </ul>
                </li>

                        <li>
                            <a href="javascript:">بلیط</a>
                            <ul class="nav-dropdown">
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/InternalFlight">هواپیما</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/train">قطار</a>
                                </li>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/bus">اتوبوس</a>
                                </li>
                            </ul>
                        </li>

                <li>
                    <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel-khayam">هتل</a>
                </li>

                <li>
                    <a href="javascript:"> ویزا </a>
                    <ul class="nav-dropdown ">
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">اخذ ویزا</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/embassy-appointment">وقت سفارت</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa-pickup">پیکاپ ویزا</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/obtaining-residence">اخذ اقامت</a></li>
                        <li><a href="{$smarty.const.ROOT_ADDRESS}/page/study-visa">پذیرش و ویزای تحصیلی</a></li>
                    </ul>
                </li>
                        <li>
                            <a href="javascript:">بیشتر</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/insurance">بیمه</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/visa">ویزا</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/entertainment">تفریحات</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/rentCar">اجاره خودرو</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">مسافران</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/authenticate">باشگاه مسافران</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/recommendation">سفرنامه</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/vote">نظرسنجی</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">انتقاد و پیشنهاد</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/pay">پرداخت آنلاین</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/faq">پرسش و پاسخ</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:">دانستنیها</a>
                            <ul class="nav-dropdown">
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/mag">وبلاگ</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/introductCountry">معرفی کشورها</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/introductIran">معرفی ایران</a></li>
                                {*            <li><a href="{$smarty.const.ROOT_ADDRESS}/embassies">سفارت</a></li>*}
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/weather">هواشناسی</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/clock">ساعت کشورها</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/convertDate">تبدیل تاریخ</a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/page/currency">نرخ ارز</a></li>
                                {*            <li><a href="{$smarty.const.ROOT_ADDRESS}/page/gallery">گالری جهان</a></li>*}
                            </ul>
                        </li>
                </ul>


        </div>
                <a class="__login_register_class__ button btn-user btn-style {if $obj_main_page->isLogin()}show-box-login-js main-navigation__button2{else}main-navigation__button1{/if}"
                   href="{if $obj_main_page->isLogin()}javascript:{else}{$smarty.const.ROOT_ADDRESS}/authenticate{/if}">
                    <span>{include file="../../include/signIn/topBarName.tpl"}</span>
                    <i class="fa-regular fa-user my-user"></i>
                </a>
                <div class="main-navigation__sub-menu2 arrow-up show-content-box-login-js" style="display: none">
                    {include file="../../include/signIn/topBar.tpl"}
                </div>
                <div class="nav-search">
            <a href="tel:{$smarty.const.CLIENT_PHONE}" class="phone-number-parent">
                <span class="phone-number">{$smarty.const.CLIENT_PHONE}</span>
                <i class="far fa-phone" id="icon-phone"></i>
            </a>
        </div>
        <div class="nav-toggle"></div>
        </nav>
    </div>
    </div>
</header>
