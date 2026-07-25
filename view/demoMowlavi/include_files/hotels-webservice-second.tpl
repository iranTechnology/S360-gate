{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}

{assign var="hotel_params_external" value=['Count'=> '3', 'type' =>'external']}
{assign var='hotel_external' value=$obj_main_page->getHotelWebservice($hotel_params_external)}
{if $hotel_external}
    {assign var='check_general' value=true}
{/if}
{assign var="min_external" value=0}
{assign var="max_external" value=2}

{if $check_general}
    <div class="i_modular_hotels_webservice mt-3">
        <div class="__hotel__external__ owl-carousel owl-theme parent-hotel-reservetion-owl">

            {foreach $hotel_external as $item}
                {if $min_external <= $max_external}
                    <div class="__i_modular_nc_item_class_0 item">
                        <a class="link-parent"
                           href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}">
                            <div class="img-hotel">
                                <img alt="{$item['City']}" class="__image_class__" src="{$item['Picture']}" />
                            </div>
                            <div class="text-hotel owl-text-hotel">
                                <div class="parent-hotel-reservetion-loq">
                                    <h3 class="__title_class__">{$item['Name']}</h3>
                                    <span class="__city_class__">{$item['City']}</span>
                                </div>
                                <div class="star-hotel">
                                    {for $i = 0; $i < count($item['StarCode']); $i++}
                                        <i class="__star_class_light__1 fa-solid fa-star"></i>
                                    {/for}


                                </div>
                            </div>
                        </a>
                    </div>
                    {$min_external = $min_external + 1}
                {/if}
            {/foreach}


        </div>
    </div>
{/if}