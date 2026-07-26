{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_hotel_params" value=['Count'=> '8', 'type' =>'internal']}
{assign var="external_hotel_params" value=['Count'=> '8']}


{assign var='foregin_hotels' value=$obj_main_page->getExternalHotelCity($external_hotel_params)}
{assign var='internal_hotels' value=$obj_main_page->getHotelWebservice($internal_hotel_params)}
{*{$internal_hotels|var_dump}*}

{if $foregin_hotels or $internal_hotels}
<section class="i_modular_hotels_webservice hotel-demo">
    <div class="container">
        <div class="title-demo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M16 0C7.2 0 0 7.2 0 16s7.2 16 16 16H32V480H16c-8.8 0-16 7.2-16 16s7.2 16 16 16H240h32H496c8.8 0 16-7.2 16-16s-7.2-16-16-16H480V32h16c8.8 0 16-7.2 16-16s-7.2-16-16-16H16zM272 432v48H240V432c0-8.8 7.2-16 16-16s16 7.2 16 16zm32 0c0-26.5-21.5-48-48-48s-48 21.5-48 48v48H64V32H448V480H304V432zM320 96v32c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V96c0-17.7-14.3-32-32-32H352c-17.7 0-32 14.3-32 32zm64 0v32H352V96h32zM240 64c-17.7 0-32 14.3-32 32v32c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V96c0-17.7-14.3-32-32-32H240zm0 32h32v32H240V96zM208 224v32c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H240c-17.7 0-32 14.3-32 32zm64 0v32H240V224h32zm80-32c-17.7 0-32 14.3-32 32v32c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H352zm0 32h32v32H352V224zM96 96v32c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V96c0-17.7-14.3-32-32-32H128c-17.7 0-32 14.3-32 32zm64 0v32H128V96h32zm-32 96c-17.7 0-32 14.3-32 32v32c0 17.7 14.3 32 32 32h32c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H128zm0 32h32v32H128V224zm68.4 154.7C211 362.3 232.3 352 256 352s45 10.3 59.6 26.7c5.9 6.6 16 7.1 22.6 1.3s7.1-16 1.3-22.6C319 334.4 289.2 320 256 320s-63 14.4-83.5 37.3c-5.9 6.6-5.3 16.7 1.3 22.6s16.7 5.3 22.6-1.3z"/></svg>
            <div class="parent-title-flex">
                <p>
                    رزرو هتل
                </p>
                <h2>
                    <span>هتل های داخلی و خارجی</span>
                </h2>
            </div>
            <a class="__all_link_href__" href="{$smarty.const.ROOT_ADDRESS}/page/Hotel">
                        <span>
                            مشاهده همه
                        </span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M7 239c-9.4 9.4-9.4 24.6 0 33.9L167 433c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9L57.9 256 201 113c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z"></path></svg>
            </a>
        </div>
        <div class="hotel-internal-external">
            <div class="parent-data-hotel-tab-demo">
                <ul class="nav nav-pills" id="pills-tab-hotel" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="tab-hotel-dakheli-demo" data-toggle="pill" data-target="#hotel-dakheli-demo"
                                type="button" role="tab" aria-controls="tour-dakheli-demo" aria-selected="true"> داخلی
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link " id="tab-hotel-khareji-demo" data-toggle="pill" data-target="#hotel-khareji-demo"
                                type="button" role="tab" aria-controls="tour-khareji-demo" aria-selected="false"> خارجی
                        </button>
                    </li>
                </ul>
                <div class="parent-tab-tour">
                    <div class="tab-content" id="pills-tabContent-hotel">
                        <div class="tab-pane fade show active" id="hotel-dakheli-demo" role="tabpanel" aria-labelledby="tab-hotel-dakheli-demo">
                            <div class="__hotel__internal__ parent-hotel-demo">
                                {foreach $internal_hotels as $item}
                                <a href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}" class="__i_modular_nc_item_class_0">
                                    <div class="parent-img">
                                        <img alt="{$item['City']}" class="__image_class__"
                                             src="{$item['Picture']}" />
                                        <div class="star-hotel-demo">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg>
                                            <span>{$item['StarCode']} ستاره </span>
                                        </div>
                                    </div>
                                    <div class="text-hotel">
                                        <div class="city-hotel">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"/></svg>
                                            <span class="__city_class__">{$item['City']}</span>
                                        </div>
                                        <div class="parent-price-hotel-demo">
                                            <h4 class="__title_class__">
                                                {$item['Name']}
                                            </h4>
                                            <button>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM231 127c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-71 71L376 232c13.3 0 24 10.7 24 24s-10.7 24-24 24l-182.1 0 71 71c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L119 273c-9.4-9.4-9.4-24.6 0-33.9L231 127z"></path></svg>
                                            </button>
                                        </div>
                                    </div>
                                </a>
                                {/foreach}
                            </div>
                            <div class="__hotel__internal__ owl-carousel owl-theme owl-hotel-demo">
                                {foreach $internal_hotels as $item}
                                <div class="__i_modular_nc_item_class_0 item">
                                    <a href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}" class="__i_modular_nc_item_class_0">
                                        <div class="parent-img">
                                            <img alt="{$item['City']}" class="__image_class__"
                                                 src="{$item['Picture']}" />
                                            <div class="star-hotel-demo">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg>
                                                <span>{$item['StarCode']} ستاره </span>
                                            </div>
                                        </div>
                                        <div class="text-hotel">
                                            <div class="city-hotel">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"/></svg>
                                                <span class="__city_class__">{$item['City']}</span>
                                            </div>
                                            <div class="parent-price-hotel-demo">
                                                <h4 class="__title_class__">
                                                    {$item['Name']}
                                                </h4>
                                                <button>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM231 127c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-71 71L376 232c13.3 0 24 10.7 24 24s-10.7 24-24 24l-182.1 0 71 71c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L119 273c-9.4-9.4-9.4-24.6 0-33.9L231 127z"></path></svg>
                                                </button>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                {/foreach}
                            </div>
                        </div>
                        <div class="tab-pane fade " id="hotel-khareji-demo" role="tabpanel" aria-labelledby="tab-hotel-khareji-demo">
                            <div class="__hotel__external__ parent-hotel-demo">
                                {foreach $foregin_hotels as $item}
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0" class="__i_modular_nc_item_class_0">
                                    <div class="parent-img">
                                        <img  src="assets/images/hotel/{$item['DepartureCode']}.jpg"
                                              alt="{$item['DepartureCityFa']}" />
                                    </div>
                                    <div class="text-hotel">
                                        <div class="city-hotel">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"/></svg>
                                            <span class="__city_class__">{$item['CountryFa']}</span>
                                        </div>
                                        <div class="parent-price-hotel-demo">
                                            <h4 class="__title_class__">
                                                {$item['DepartureCityFa']}
                                            </h4>
                                            <button>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM231 127c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-71 71L376 232c13.3 0 24 10.7 24 24s-10.7 24-24 24l-182.1 0 71 71c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L119 273c-9.4-9.4-9.4-24.6 0-33.9L231 127z"></path></svg>
                                            </button>
                                        </div>
                                    </div>
                                </a>
                                {/foreach}
                            </div>
                            <div class="__hotel__external__ owl-carousel owl-theme owl-hotel-demo">
                                {foreach $foregin_hotels as $item}
                                <div class="__i_modular_nc_item_class_0 item">
                                    <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0" class="__i_modular_nc_item_class_0">
                                        <div class="parent-img">
                                            <img  src="assets/images/hotel/{$item['DepartureCode']}.jpg"
                                                  alt="{$item['DepartureCityFa']}" />
                                        </div>
                                        <div class="text-hotel">
                                            <div class="city-hotel">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"/></svg>
                                                <span class="__city_class__">{$item['CountryFa']}</span>
                                            </div>
                                            <div class="parent-price-hotel-demo">
                                                <h4 class="__title_class__">
                                                    {$item['DepartureCityFa']}
                                                </h4>
                                                <button>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM231 127c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-71 71L376 232c13.3 0 24 10.7 24 24s-10.7 24-24 24l-182.1 0 71 71c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L119 273c-9.4-9.4-9.4-24.6 0-33.9L231 127z"></path></svg>
                                                </button>
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