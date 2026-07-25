{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'','limit'=> '5','dateNow' => dateNow, 'country' =>'internal', 'special' => '0']}
{assign var='internalHotels' value=$obj_main_page->getHotelReservation($internal_tour_params)}
{assign var="foregin_hotel_params" value=['limit'=> '5','country' =>'external']}

{assign var='internal_hotels' value=$obj_main_page->getHotelReservation($internal_hotel_params)}
{assign var='foregin_hotels' value=$obj_main_page->getHotelReservation($foregin_hotel_params)}

{if $internal_hotels or $foregin_hotels}

    <section class="hotel">
        <div class="container">
            <div class="parent-hotel">
                <div class="parent-owl-hotel">
                    <div class="owl-carousel owl-theme owl-hotel">
                        {foreach $internal_hotels as $item}
                        <div class="item">
                            <a href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item['id']}/{$item['name']|strip:'-'}" class="hotel-items">
                                <img  src="{$item['logo']}"
                                      alt="{$item['name']}">
                                <div class="text-hotel">
                                    <h3>Hotel {$item['name']}</h3>
                                    <div class="parent-star">
                                        {for $i=1 to $item['star_code']}
                                        <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path></svg>
                                        {/for}

                                    </div>
                                </div>
                            </a>
                        </div>
                        {/foreach}
                    </div>
                </div>
                <div class="parent-title-hotel">
                    <div class="hotel-box-text">
                        <h2>Iran hotels</h2>
                        <h5>Go beyond your imagination</h5>
                        <p>Discover with us the perfect hotel experience in Iran.</p>
                    </div>
                    <div class="hotel-btn-parent">
                        <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
                            <span>Show more</span>
                            <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288 480 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-370.7 0 73.4-73.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-128 128z"></path></svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

{/if}
