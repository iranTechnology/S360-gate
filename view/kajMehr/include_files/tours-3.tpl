{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="tour_params_luxury" value=['limit'=> '12','dateNow' => $dateNow , 'category' => '21']}
{assign var='tour_luxury' value=$obj_main_page->getToursReservation($tour_params_luxury)}
{if $tour_luxury}
    {assign var='check_tour' value=true}
{/if}
{assign var="min_luxury" value=0}
{assign var="max_luxury" value=4}

{if $check_tour}
    <section class="i_modular_tours tour-demo">
        <div class="container">
            <div class="title-demo">
                <div class="text-title-demo">
                    <h2>تورهای لوکس</h2>
                    <p>
                        تجربه‌ای متفاوت از سفر، تورهای لوکس و اختصاصی برای کشف زیبایی‌های ناب جهان
                    </p>
                </div>
                <a class="more-title-demo" href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/21">
                    <span>تورهای بیشتر</span>
                    <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"></path></svg>
                </a>
            </div>
            <div class="parent-tab-tour">
                        <div class="tour-owl-parent">
                            <div class="owl-carousel owl-theme tour-owl">

                                {foreach $tour_luxury as $item}
                                    {*                                    {var_dump($item)}*}
                                    {if $min_luxury <= $max_luxury}

                                        <div class="__i_modular_nc_item_class_0 item">
                                            <a class="parent-link-tour" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                                <div class="parent-img-tour">
                                                    <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                                                </div>
                                                <div class="parent-text-tour">
                                                    <span class="__city_class__ city-tour">{$item['destination_country_name']}</span>
                                                    <h4 class="__title_class__">{$item['tour_name']}</h4>
                                                    <div class="night-tour">
                                                        <i class="fa-sharp fa-solid fa-clock"></i>
                                                        <span class="__day_class__">{$item['night'] + 1}</span> روز و <span class="__night_class__">{$item['night']}</span> شب

                                                    </div>
                                                    <div class="price-tour">
                                                        <div class="start-price">
                                                            <span>شروع قیمت</span>
                                                            <span class="number-price"><span class="___price_class__">
                                        {if $item['min_price_r'] != 0}
                                            {$item['min_price_r']|number_format}
                                            {if $item['min_price']['is_toman'] == true}
                                                تومان
                                            {else}
                                                ریال
                                            {/if}
                                        {/if}
                                                                    {if  $item['min_price_r'] != 0 && $item['min_price_a'] != 0 &&  $item['min_price_a'] } + {/if}
                                                                    {if $item['min_price_a'] && $item['min_price_a'] != 0}

                                                                        {$item['min_price_a']|number_format} {$item['currency_type']}
                                                                    {/if}
                                                                    <span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>

                                                {if $item['["type_vehicle_na'] eq 'اتوبوس'}
                                                    {$type_vehicle_image = 'project_files/images/cric1.png'}
                                                {elseif $item['type_vehicle_name'] eq 'هواپیما'}
                                                    {$type_vehicle_image = 'project_files/images/cric3.png'}
                                                {elseif $item['type_vehicle_name'] eq 'قطار'}
                                                    {$type_vehicle_image = 'project_files/images/cric2.png'}
                                                {elseif $item['type_vehicle_name'] eq 'کشتی'}
                                                    {$type_vehicle_image = 'project_files/images/cric4.png'}
                                                {else}
                                                    {$type_vehicle_image = 'project_files/images/cric1.png'}
                                                {/if}
                                                <img alt="img-tour" class="circle-tour" src="{$type_vehicle_image}"/>
                                            </a>
                                        </div>

                                        {$min_luxury = $min_luxury + 1}
                                    {/if}
                                {/foreach}





                            </div>
                        </div>
            </div>
        </div>
    </section>
{/if}