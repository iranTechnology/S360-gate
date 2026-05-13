{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_hotel_params" value=['Count'=> '5', 'type' =>'internal' , 'star_code' => ['5']]}


{assign var='internal_hotels' value=$obj_main_page->getHotelWebservice($internal_hotel_params)}
{assign var='foregin_hotels' value=$obj_main_page->getExternalHotelCity()}

<section class="hotel">
    <div class="container">
        <ul class="nav nav-pills mb-3 d-flex align-items-center justify-content-center" id="hotel-ul" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="hotel-dakheli" data-toggle="pill" data-target="#hotel-dakheli-tab" type="button" role="tab" aria-controls="hotel-dakheli-tab" aria-selected="true">هتل داخلی</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="hotel-khareji" data-toggle="pill" data-target="#hotel-khareji-tab" type="button" role="tab" aria-controls="hotel-khareji-tab" aria-selected="false">هتل خارجی</button>
            </li>
        </ul>
        <div class="tab-content" id="hotel-items">
            <div class="tab-pane fade show active" id="hotel-dakheli-tab" role="tabpanel" aria-labelledby="hotel-dakheli-tab">
                <div class="owl-carousel owl-theme owl-tab-tour">
                    {foreach $internal_hotels as $item}

                        {if $item['HotelIndex'] neq '13588'}
                            <div class="item" >
                                <a href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}" class="link-parent-hotel">
                                    <img src="{$item['Picture']}"
                                         alt="{$item['City']}">
                                    <div class="hotel-name">
                                        <h4>
                                            {$item['Name']}
                                        </h4>
                                    </div>
                                </a>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
            <div class="tab-pane fade" id="hotel-khareji-tab" role="tabpanel" aria-labelledby="hotel-khareji-tab">
                <div class="owl-carousel owl-theme owl-tab-tour">
                    {foreach $foregin_hotels as $item}
                        <div class="item">
                            <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0" class="link-parent-hotel">
                                <img src="assets/images/hotel/{$item['DepartureCode']}.jpg"
                                     alt="{$item['DepartureCityFa']}">
                                <div class="hotel-name">
                                    <h4>
                                        {$item['DepartureCityFa']}
                                    </h4>
                                </div>
                            </a>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</section>
