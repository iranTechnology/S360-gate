{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="tour_params_internal" value=['type'=>'','limit'=> '7','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='tour_internal' value=$obj_main_page->getToursReservation($tour_params_internal)}
{if $tour_internal}
    {assign var='check_tour' value=true}
{/if}
{assign var="min_internal" value=0}
{assign var="max_internal" value=7}

{assign var="tour_params_internal" value=['type'=>'','limit'=> '7','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='tour_internal' value=$obj_main_page->getToursReservation($tour_params_internal)}
{if $tour_internal}
    {assign var='check_tour' value=true}
{/if}
{assign var="min_internal" value=0}
{assign var="max_internal" value=7}

{if $check_tour}
    <section class="tour i_modular_tours">
        <div class="container">
            <div class="title">
                <h2>tour</h2>
                <p>

                    A wonderful tourist trip full of adventures and exploration in distinct destinations

                </p>
            </div>
            <div class="__tour__internal__ parent-tour">

                {foreach $tour_internal as $item}
                    {if $min_internal <= $max_internal}

                        <a class="__i_modular_nc_item_class_0 items-tour" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                            <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                            <div class="parent-text-tour">
                                <div class="location-tour">
                                    <h3 class="__title_class__">{$item['tour_name']}</h3>
                                    <div class="location-svg-name">
                                        <svg viewbox="0 0 384 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"></path></svg>
                                        <span class="__city_class__">{$item['destination_city_name']}</span>
                                    </div>
                                </div>
                                <div class="price-tour">
                                    <span>Starting price</span>
                                    <h3 class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</h3>
                                </div>
                            </div>
                        </a>

                        {$min_internal = $min_internal + 1}
                    {/if}
                {/foreach}








            </div>
            <div class="__tour__internal__ owl-carousel owl-theme owl-tour">

                {foreach $tour_internal as $item}
                    {if $min_internal <= $max_internal}

                        <div class="__i_modular_nc_item_class_0 item">
                            <a class="items-tour" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                                <div class="parent-text-tour">
                                    <div class="location-tour">
                                        <h3 class="__title_class__">{$item['tour_name']}</h3>
                                        <div class="location-svg-name">
                                            <svg viewbox="0 0 384 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"></path></svg>
                                            <span class="__city_class__">{$item['destination_city_name']}</span>
                                        </div>
                                    </div>
                                    <div class="price-tour">
                                        <span>Starting price</span>
                                        <h3 class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</h3>
                                    </div>
                                </div>
                            </a>
                        </div>

                        {$min_internal = $min_internal + 1}
                    {/if}
                {/foreach}








            </div>
        </div>
    </section>
{/if}