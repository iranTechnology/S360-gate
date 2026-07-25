{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_hotel_params" value=['Count'=> '4', 'type' =>'internal']}
{assign var="external_hotel_params" value=['Count'=> '4']}


{assign var='foregin_hotels' value=$obj_main_page->getExternalHotelCity($external_hotel_params)}
{assign var='internal_hotels' value=$obj_main_page->getHotelWebservice($internal_hotel_params)}
{*{$internal_hotels|var_dump}*}

{if $foregin_hotels or $internal_hotels}
    <section class="hotels">
        <div class="container">
            <div class="title">
                <h5>هتل های داخلی و خارجی</h5>
            </div>
            <div class="parent-box">
                <div class="parent-data-hotel-tab-demo">
                    <ul class="nav nav-pills" id="pills-tab2" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button aria-controls="hotel-dakheli-demo" aria-selected="true" class="nav-link active" data-target="#hotel-dakheli-demo" data-toggle="pill" id="tab-hotel-dakheli-demo" role="tab" type="button"> داخلی

                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button aria-controls="hotel-khareji-demo" aria-selected="false" class="nav-link" data-target="#hotel-khareji-demo" data-toggle="pill" id="tab-hotel-khareji-demo" role="tab" type="button"> خارجی

                            </button>
                        </li>
                    </ul>
                    <div class="parent-tab-tour">
                        <div class="tab-content" id="pills-tabContent2">
                            <div aria-labelledby="tab-hotel-dakheli-demo" class="tab-pane fade show active" id="hotel-dakheli-demo" role="tabpanel">
                                <div class="owl-carousel owl-theme owl-hotels">
                                    {foreach $internal_hotels as $item}
                                    <div class="item">
                                        <a class="hotel-card" href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}">
                                            <img alt="{$item['City']}" src="{$item['Picture']}"/>
                                            <div class="star-hotel-demo">
                                                <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg">
                                                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                    <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>
                                                </svg>
                                                <span>{$item['StarCode']} ستاره </span>
                                            </div>
                                            <div class="data-hotels">
                                                <h3>{$item['Name']}</h3>
                                                <div class="city-hotel">
                                                    <svg viewbox="0 0 384 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path>
                                                    </svg>
                                                    <span class="__city_class__">{$item['City']}</span>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                               {/foreach}
                                </div>
                            </div>
                            <div aria-labelledby="tab-hotel-khareji-demo" class="tab-pane fade" id="hotel-khareji-demo" role="tabpanel">
                                <div class="owl-carousel owl-theme owl-hotels">
                                                                         {foreach $foregin_hotels as $item}

                                    <div class="item">
                                        <a class="hotel-card" href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0">
                                            <img alt="{$item['DepartureCityFa']}" src="assets/images/hotel/{$item['DepartureCode']}.jpg"/>
{*                                            <div class="star-hotel-demo">*}
{*                                                <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg">*}
{*                                                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->*}
{*                                                    <path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path>*}
{*                                                </svg>*}
{*                                                <span>{$item['StarCode']} ستاره </span>*}
{*                                            </div>*}
                                            <div class="data-hotels">
                                                <h3>{$item['DepartureCityFa']}</h3>
                                                <div class="city-hotel">
                                                    <svg viewbox="0 0 384 512" xmlns="http://www.w3.org/2000/svg">
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path>
                                                    </svg>
                                                    <span class="__city_class__">{$item['CountryFa']}</span>
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
            </div>
        </div>
    </section>

{/if}