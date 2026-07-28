{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_hotel_params" value=['Count'=> '4', 'type' =>'internal']}
{assign var="external_hotel_params" value=['Count'=> '4']}


{assign var='foregin_hotels' value=$obj_main_page->getExternalHotelCity($external_hotel_params)}
{assign var='internal_hotels' value=$obj_main_page->getHotelWebservice($internal_hotel_params)}
{assign var='count' value=0}
{assign var='countX' value=0}

{if $foregin_hotels or $internal_hotels}
    <section class="hotel">
        <div class="container">
            <div class="title">
                <div class="title-safiran">
                    <div class="text-title-safiran">
                        <h2>هتل های ویژه</h2>
                    </div>
                    <a class="more-title-safiran" href="{$smarty.const.ROOT_ADDRESS}/page/hotel-attar">
                        <span>بیشتر</span>
                        <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg">
                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                            <path d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"></path>
                        </svg>
                    </a>
                </div>
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="hotel_external_tab" data-toggle="pill" data-target="#hotel_external" type="button" role="tab" aria-controls="hotel_external" aria-selected="false">خارجی</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="hotel_internal_tab" data-toggle="pill" data-target="#hotel_internal" type="button" role="tab" aria-controls="hotel_internal" aria-selected="true">داخلی</button>
                    </li>
                </ul>
            </div>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade" id="hotel_internal" role="tabpanel" aria-labelledby="hotel_internal_tab">
                    <div class="hotel_grid">
                        {foreach $internal_hotels as $item}
                            {if $count<4}
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}" class="hotel_link">
                                <img src="{$item['Picture']}" alt="img-hotel">
                                <div class="hotel_text">
                                    <div class="hotel_rate">
                                        {foreach $item['StarCode'] as $star}
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>
                                        {/foreach}
                                    </div>
                                    <span class="hotel_city">{$item['City']}</span>
                                    <h6 class="hotel_title">{$item['Name']}</h6>
                                    <p class="hotel_address">آدرس : {$item['Address']}</p>
                                </div>
                            </a>
                                {assign var="count" value=$count+1}
                            {/if}
                        {/foreach}
                    </div>
                    <div class="d-flex justify-content-center mt-5">
                        <a class="button" href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
                            <span>بیشتر</span>
                        </a>
                    </div>
                </div>
                <div class="tab-pane fade show active" id="hotel_external" role="tabpanel" aria-labelledby="hotel_external_tab">
                    <div class="hotel_grid">
                        {foreach $foregin_hotels as $item}
                            {if $countX<4}
                            <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0" class="hotel_link">
                                <img src="assets/images/hotel/{$item['DepartureCode']}.jpg" alt="{$item['DepartureCityFa']}">
                                <div class="hotel_text">
                                    <span class="hotel_city">{$item['CountryFa']}</span>
                                    <h6 class="hotel_title">{$item['DepartureCityFa']}</h6>
                                </div>
                            </a>
                                {assign var="countX" value=$countX+1}
                            {/if}
                        {/foreach}
                    </div>
                    <div class="d-flex justify-content-center mt-5">
                        <a class="button" href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
                            <span>بیشتر</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
{/if}

