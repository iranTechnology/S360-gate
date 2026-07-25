{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'special','limit'=> '10','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var="foreging_tour_params" value=['type'=>'special','limit'=> '10','dateNow' => $dateNow, 'country' =>'external']}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}
{if !empty($internalTours) || $foreginTours}
    {*{$internalTours}*}

<section class="tours">
    <div class="container">
        <div class="title">
            <div class="title-text">
                <!--                        <h3>دوکاتور</h3>-->
                <!--                    <h6>Choose your place</h6>-->
                <h2>تورهای محبوب</h2>
            </div>
            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour" class="read-more">
                <span>بیشتر</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M297 239c9.4 9.4 9.4 24.6 0 33.9L105 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L71 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L297 239z"/></svg>
            </a>
        </div>
        <div class="box-tabs-parent">
            <ul class="nav nav-pills ul-tabs" id="tours-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="tour-dakheli-tab" data-toggle="pill" data-target="#pills-tour-dakheli" type="button" role="tab" aria-controls="pills-tour-dakheli" aria-selected="true">داخلی</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tour-khareji-tab" data-toggle="pill" data-target="#pills-tour-khareji" type="button" role="tab" aria-controls="pills-tour-khareji" aria-selected="false">خارجی</button>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-tour-dakheli" role="tabpanel" aria-labelledby="tour-dakheli-tab">
                    <div class="owl-carousel owl-theme owl-tours owl-rtl owl-loaded owl-drag">
                        {foreach $internalTours as $item}
                            <div class="square-flip">
                                <div class="tour-view">
                                    <img   src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                    <span class="category">{$item['destination_city_name']}</span>
                                    <div class="square-container2">
                                        <div class="box-title">
                                            <h4>تور {$item['tour_name']}</h4>
                                            <h6>{$item['min_price_r']|number_format} ریال </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="tour-back-white">
                                    <div class="square-container">
                                        <h4>تور {$item['tour_name']}</h4>
                                        <h6>{$item['min_price_r']|number_format} ریال </h6>
                                      
                                        <div class="tour-list">
                                            <div class="tour-list-item">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/></svg>
                                                <span> {$item['night'] + 1} روز</span>
                                            </div>
                                            <div class="tour-list-item">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"/></svg>
                                                <span>{$item['destination_city_name']}</span>
                                            </div>
                                        </div>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="tour-details">جزییات تور</a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-tour-khareji" role="tabpanel" aria-labelledby="tour-khareji-tab">
                    <div class="owl-carousel owl-theme owl-tours owl-rtl owl-loaded owl-drag">
                        {foreach $foreginTours as $item}
                            <div class="square-flip">
                                <div class="tour-view">
                                    <img  src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                    <span class="category">{$item['destination_city_name']}</span>
                                    <div class="square-container2">
                                        <div class="box-title">
                                            <h4> تور {$item['tour_name']}</h4>
                                            <h6>{$item['min_price_r']|number_format} ریال</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="tour-back-white">
                                    <div class="square-container">
                                        <h4>{$item['tour_name']} تور</h4>
                                        <h6>{$item['min_price_r']|number_format} ریال </h6>

                                        <div class="tour-list">
                                            <div class="tour-list-item">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/></svg>
                                                <span> {$item['night'] + 1} روز</span>
                                            </div>
                                            <div class="tour-list-item">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"/></svg>
                                                <span>{$item['destination_city_name']}</span>
                                            </div>
                                        </div>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="tour-details">جزییات تور</a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/if}
