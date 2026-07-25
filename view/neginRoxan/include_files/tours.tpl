{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'special','limit'=> '10','dateNow' => $dateNow, 'country' =>'internal']}
{assign var="foreging_tour_params" value=['type'=>'special','limit'=> '10','dateNow' => $dateNow, 'country' =>'external']}

{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}
{*{$foreginTours|json_encode}*}
{*{$internalTours|var_dump}*}

{if !empty($internalTours) || !empty($foreginTours)}
<section class="i_modular_tours tab-tour">
    <div class="container">
        <div class="title">
            <h2>محبوبترین تورها</h2>
        </div>
        <div class="parent-ul-tour col-lg-5 col-md-5 col-12">
            <ul class="nav nav-pills d-flex align-items-center justify-content-center" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="tab-tour-dakheli" data-toggle="pill" data-target="#tour-dakheli"
                            type="button" role="tab" aria-controls="tour-dakheli" aria-selected="true"> داخلی
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link " id="tab-tour-khareji" data-toggle="pill" data-target="#tour-khareji"
                            type="button" role="tab" aria-controls="tour-khareji" aria-selected="false"> خارجی
                    </button>
                </li>
            </ul>
        </div>
        <div class="parent-tab-tour">
            <div class="tab-content" id="pills-tabContent">
                <div class="__tour__internal__ tab-pane fade show active" id="tour-dakheli" role="tabpanel" aria-labelledby="tab-tour-dakheli">
                    <div class="parent-tour">
                        {foreach $internalTours as $item}
                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="tour-item">
                            <div class="parent-img-tour">
                                <img class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                <div class="location-tour">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    <span class="__city_class__">{$item['destination_city_name']}</span>
                                </div>
                            </div>
                            <div class="parent-text-tour">
                                <h2 class="__title_class__">{$item['tour_name']}</h2>
{*                                <div class="parent-score">*}
{*                                    <div class="excellent">*}
{*                                        <span c>4.8/8</span>*}
{*                                        <span>عالی</span>*}
{*                                    </div>*}
{*                                    <div class="__rate_count_class__ votes">*}
{*                                        ( آرا 1245 )*}
{*                                    </div>*}
{*                                </div>*}
                                <div class="parent-price">
                                    <h6>شروع از قیمت :</h6>
                                    <div class="parent-money">
                                        <h3 class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format} </h3>
                                        <span> ریال</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                        {/foreach}
                    </div>
                    <div class="__tour__internal__ owl-carousel owl-theme owl-tour">

                        {foreach $internalTours as $item}
                        <div class="__i_modular_nc_item_class_0 item">
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="tour-item">
                                <div class="parent-img-tour">
                                    <img class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                    <div class="location-tour">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                        <span class="__city_class__">{$item['destination_city_name']}</span>
                                    </div>
                                </div>
                                <div class="parent-text-tour">
                                    <h2 class="__title_class__">{$item['tour_name']}</h2>
{*                                    <div class="parent-score">*}
{*                                        <div class="excellent">*}
{*                                            <span c>4.8/8</span>*}
{*                                            <span>عالی</span>*}
{*                                        </div>*}
{*                                        <div class="__rate_count_class__ votes">*}
{*                                            ( آرا 1245 )*}
{*                                        </div>*}
{*                                    </div>*}
                                    <div class="parent-price">
                                        <h6>شروع از قیمت :</h6>
                                        <div class="parent-money">
                                            <h3 class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}  </h3>
                                            <span> ریال</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        {/foreach}

                    </div>
                </div>
                <div class="__tour__external__ tab-pane fade " id="tour-khareji" role="tabpanel" aria-labelledby="tab-tour-khareji">
                    <div class="parent-tour">
                        {foreach $foreginTours as $item}
                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="tour-item">
                            <div class="parent-img-tour">
                                <img  class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                <div class="location-tour">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    <span class="__city_class__">{$item['destination_city_name']}</span>
                                </div>
                            </div>
                            <div class="parent-text-tour">
                                <h2 class="__title_class__">{$item['tour_name']}</h2>
{*                                <div class="parent-score">*}
{*                                    <div class="excellent">*}
{*                                        <span>4.8/8</span>*}
{*                                        <span>بد</span>*}
{*                                    </div>*}
{*                                    <div class="__rate_count_class__ votes">*}
{*                                        ( آرا 1425 )*}
{*                                    </div>*}
{*                                </div>*}
                                <div class="parent-price">
                                    <h6>شروع از قیمت</h6>
                                    <div class="parent-money">
                                        <h3 class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format} </h3>
                                        <span> ریال </span>
                                    </div>
                                </div>
                            </div>
                        </a>
                        {/foreach}
                    </div>
                    <div class="__tour__external__ owl-carousel owl-theme owl-tour">
                        {foreach $foreginTours as $item}
                        <div class="item">
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="tour-item">
                                <div class="parent-img-tour">
                                    <img  class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                    <div class="location-tour">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                        <span class="__city_class__">{$item['destination_city_name']}</span>
                                    </div>
                                </div>
                                <div class="parent-text-tour">
                                    <h2 class="__title_class__">{$item['tour_name']}</h2>
{*                                    <div class="parent-score">*}
{*                                        <div class="excellent">*}
{*                                            <span>4.8/8</span>*}
{*                                            <span>عالی</span>*}
{*                                        </div>*}
{*                                        <div class="__rate_count_class__ votes">*}
{*                                            ( آرا 1245 )*}
{*                                        </div>*}
{*                                    </div>*}
                                    <div class=" parent-price">
                                        <h6>شروع از قیمت</h6>
                                        <div class="parent-money">
                                            <h3 class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}  </h3>
                                            <span> ریال</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/if}