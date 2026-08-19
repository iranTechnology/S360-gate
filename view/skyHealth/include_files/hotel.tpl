{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}

{assign var="hotel_params_internal" value=['Count'=> '5', 'type' =>'internal']}
{assign var='hotel_internal' value=$obj_main_page->getHotelWebservice($hotel_params_internal)}
{if $hotel_internal}
    {assign var='check_general' value=true}
{/if}
{assign var="min_internal" value=0}
{assign var="max_internal" value=4}


{assign var="hotel_params_external" value=['Count'=> '5', 'type' =>'external']}
{assign var='hotel_external' value=$obj_main_page->getExternalHotelCity()}
{if $hotel_external}
    {assign var='check_general' value=true}
{/if}
{assign var="min_external" value=0}
{assign var="max_external" value=4}

{if $check_general}
<section class="i_modular_hotels_webservice hotel-ghods">
    <div class="container">
        <div data-aos="fade-up" >
            <div class="parent-ul-hotel col-lg-12 col-md-12 col-12">
                <ul class="nav nav-pills d-flex align-items-center justify-content-center" id="pills-tab-hotel" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active"
                                id="tab-hotel-dakheli"
                                data-toggle="pill"
                                data-target="#hotel-dakheli"
                                type="button"
                                role="tab"
                                aria-controls="tour-dakheli"
                                aria-selected="true">داخلی
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link "
                                id="tab-hotel-khareji"
                                data-toggle="pill"
                                data-target="#hotel-khareji"
                                type="button"
                                role="tab"
                                aria-controls="tour-khareji"
                                aria-selected="false">خارجی
                        </button>
                    </li>
                </ul>
            </div>
            <div class="parent-tab-hotel">
                <div class="tab-content" id="pills-tabContent-hotel">
                    <div class="tab-pane fade show active" id="hotel-dakheli" role="tabpanel" aria-labelledby="tab-hotel-dakheli">
                        <div class="__hotel__internal__ owl-carousel owl-theme owl-hotel-ghods">
                            {foreach $hotel_internal as $item}
                            {if $min_internal <= $max_internal}
                            <div class="__i_modular_nc_item_class_0 item">
                                <a href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}" class="link-parent">
                                    <img alt="{$item['City']}" class="__image_class__" src="{$item['Picture']}" />
                                    <div class="text-hotel">
                                        <h3 class="__title_class__">{$item['Name']}</h3>
                                        <span class="__city_class__">{$item['City']}</span>
                                        <div class="star-hotel">
                                            {for $i = 0; $i < count($item['StarCode']); $i++}
                                                <i class="__star_class_light__1 fa-solid fa-star"></i>
                                            {/for}
                                        </div>
                                    </div>
                                </a>
                            </div>
                                {$min_internal = $min_internal + 1}
                            {/if}
                            {/foreach}
                        </div>
                    </div>
                    <div class="tab-pane fade " id="hotel-khareji" role="tabpanel" aria-labelledby="tab-hotel-khareji">
                        <div class="__hotel__external__ owl-carousel owl-them owl-hotel-ghods">

                            {foreach $hotel_external as $item}
                            {if $min_external <= $max_external}
                                <div class="__i_modular_nc_item_class_0 item">
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0" class="link-parent">
                                    <img class="__image_class__" src="assets/images/hotel/{$item['DepartureCode']}.jpg" alt="img-hotel">
                                    <div class="text-hotel">
                                        <h3 class="__city_class__">{$item['DepartureCityFa']}</h3>
                                    </div>
                                </a>
                            </div>
                            <div class="__i_modular_nc_item_class_1 item">
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/{$item['CountryEn']}/{$item['DepartureCityEn']}/{$objDate->daysAfterToday('7')}/{$objDate->daysAfterToday('8')}/1/R:2-0-0" class="link-parent">
                                    <img alt="{$item['City']}" class="__image_class__" src="assets/images/hotel/{$item['DepartureCode']}.jpg"/>
                                    <div class="text-hotel">
                                        <h3 class="__city_class__">{$item['DepartureCityFa']}</h3>
                                    </div>
                                </a>
                            </div>
                                {$min_external = $min_external + 1}
                            {/if}
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/if}