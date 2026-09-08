{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'','limit'=> '5','dateNow' => dateNow, 'country' =>'internal', 'special' => '0']}
{assign var='internalHotels' value=$obj_main_page->getHotelReservation($internal_tour_params)}
{assign var="foregin_hotel_params" value=['limit'=> '5','country' =>'external']}

{assign var='internal_hotels' value=$obj_main_page->getHotelReservation($internal_hotel_params)}
{assign var='foregin_hotels' value=$obj_main_page->getHotelReservation($foregin_hotel_params)}

{if $internal_hotels or $foregin_hotels}
<section class="hotel">
    <div class="container">
        <div class="title">
            <div class="title-text">
                <h3>Dukatour</h3>
                <h2>POPULAR HOTEL</h2>
            </div>
            <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/en/page/hotel" class="read-more">
                <span>View more</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M297 239c9.4 9.4 9.4 24.6 0 33.9L105 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L71 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L297 239z"/></svg>
            </a>
        </div>
        <div class="box-tab-hotel">
            <ul class="nav nav-pills ul-tabs" id="pills-tab-hotel" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="tab-hotel1" data-toggle="pill" data-target="#hotels1" type="button" role="tab" aria-controls="hotels1" aria-selected="true">Internal</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tab-hotel2" data-toggle="pill" data-target="#hotels2" type="button" role="tab" aria-controls="hotels2" aria-selected="false">Foreign</button>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent-hotel">
                <div class="tab-pane fade show active" id="hotels1" role="tabpanel" aria-labelledby="tab-hotel1">
                    <div class="owl-carousel owl-theme owl-hotels">
                        {foreach $internal_hotels as $item}
                            <div class="item">
                                <a href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item['id']}/{$item['name_en']|strip:'-'}" class="box-ture">
                                    <div class="box-hotel-img">
                                        <img src="{$item['logo']}"
                                             alt="{$item['name_en']}" class="w-me het-me">
                                    </div>
                                    {$type_hotel = $obj_main_page->hotel_types_names({$item['type_code']})}
                                    {if $type_hotel}
                                        <span class="category-hotel">
                                            {$obj_main_page->hotel_types_names({$item['type_code']})}
                                            </span>
                                    {/if}
                                    <div class="box-hotel-text">
                                        <div class="title-hotel">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M24 0C10.7 0 0 10.7 0 24S10.7 48 24 48h8V464H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H488c13.3 0 24-10.7 24-24s-10.7-24-24-24h-8V48h8c13.3 0 24-10.7 24-24s-10.7-24-24-24H24zM432 48V464H304V384h32c8.8 0 16.1-7.2 14.7-15.9C343.1 322.6 303.6 288 256 288s-87.1 34.6-94.7 80.1c-1.5 8.7 5.8 15.9 14.7 15.9h32v80H80V48H432zM144 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H144zm80 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H240c-8.8 0-16 7.2-16 16zM336 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H336zM128 208v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H144c-8.8 0-16 7.2-16 16zm112-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H240zm80 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/></svg>
                                            <h3>
                                                {$item['name_en']}
                                            </h3>
                                        </div>
                                        <div class="line"></div>
                                        <div class="box-hover">
                                            <div class="col-md-12 p-0">
                                                <ul>
                                                    <li>
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path></svg>
                                                        <span>{$item['city_name']}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating">
                                                            {for $i=1 to $item['star_code']}
                                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg>
                                                            {/for}
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        {/foreach}

                    </div>
                </div>
                <div class="tab-pane fade" id="hotels2" role="tabpanel" aria-labelledby="tab-hotel2">
                    <div class="owl-carousel owl-theme owl-hotels">
                        {foreach $foregin_hotels as $item}
                            <div class="item">
                                <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/roomHotelLocal/reservation/{$item['id']}/{$item['name_en']|strip:'-'}" class="box-ture">
                                    <div class="box-hotel-img">
                                        <img  src="{$smarty.const.ROOT_ADDRESS}/pic/{$item['logo']}"
                                              alt="{$item['name']}" class="w-me het-me">
                                    </div>
                                    {$type_hotel = $obj_main_page->hotel_types_names({$item['type_code']})}
                                    {if $type_hotel}
                                        <span class="category-hotel">
                                            {$obj_main_page->hotel_types_names({$item['type_code']})}
                                            </span>
                                    {/if}
                                    <div class="box-hotel-text">
                                        <div class="title-hotel">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M24 0C10.7 0 0 10.7 0 24S10.7 48 24 48h8V464H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H488c13.3 0 24-10.7 24-24s-10.7-24-24-24h-8V48h8c13.3 0 24-10.7 24-24s-10.7-24-24-24H24zM432 48V464H304V384h32c8.8 0 16.1-7.2 14.7-15.9C343.1 322.6 303.6 288 256 288s-87.1 34.6-94.7 80.1c-1.5 8.7 5.8 15.9 14.7 15.9h32v80H80V48H432zM144 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H144zm80 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H240c-8.8 0-16 7.2-16 16zM336 96c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V112c0-8.8-7.2-16-16-16H336zM128 208v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H144c-8.8 0-16 7.2-16 16zm112-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H240zm80 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V208c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/></svg>
                                            <h3>
                                                {$item['name_en']}
                                            </h3>
                                        </div>
                                        <div class="line"></div>
                                        <div class="box-hover">
                                            <div class="col-md-12 p-0">
                                                <ul>
                                                    <li>
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path></svg>
                                                        <span>{$item['city_name']}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating">
                                                            {for $i=1 to $item['star_code']}
                                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg>
                                                            {/for}
                                                        </div>
                                                    </li>
                                                </ul>
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