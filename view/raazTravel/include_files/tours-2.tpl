{* fixed this *}
{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}

{assign var="internal_hotel_params" value=['limit'=> '5', 'country' =>'internal']}
{assign var='hotel_internal' value=$obj_main_page->getHotelReservation($internal_hotel_params)}
{if $hotel_internal}
    {assign var='check_general' value=true}
{/if}
{assign var="min_internal" value=0}
{assign var="max_internal" value=5}


{assign var="external_hotel_params" value=['limit'=> '5', 'country' =>'external']}
{assign var='hotel_external' value=$obj_main_page->getHotelReservation($external_hotel_params)}
{if $hotel_external}
    {assign var='check_general' value=true}
{/if}
{assign var="min_external" value=0}
{assign var="max_external" value=5}

{if $check_general}
    <section class="i_modular_tours tour-demo" id="raaz_residential_complexes">
        <div class="container">
            <div class="title-demo">
                <div class="text-title-demo">
                    <h2>مجموعه‌های اقامتی راز</h2>
                </div>
                <a class="more-title-demo" href="{$smarty.const.ROOT_ADDRESS}/page/hotelRaaz">
                    <span>بیشتر</span>
                    <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"></path></svg>
                </a>
            </div>
{*            <div class="parent-ul-tour col-lg-12 col-md-12 col-12">*}
{*                <ul class="nav nav-pills d-flex align-items-center justify-content-center" id="pills-tab" role="tablist">*}
{*                    <li class="nav-item" role="presentation">*}
{*                        <button aria-controls="tour-dakheli" aria-selected="true" class="nav-link active" data-target="#tour-dakheli" data-toggle="pill" id="tab-tour-dakheli" role="tab" type="button"> داخلی*}

{*                        </button>*}
{*                    </li>*}
{*                    <li class="nav-item" role="presentation">*}
{*                        <button aria-controls="tour-khareji" aria-selected="false" class="nav-link" data-target="#tour-khareji" data-toggle="pill" id="tab-tour-khareji" role="tab" type="button"> خارجی*}

{*                        </button>*}
{*                    </li>*}
{*                </ul>*}
{*            </div>*}
            <div class="parent-tab-tour">
                <div class="tab-content" id="pills-tabContent">
                    <div aria-labelledby="tab-tour-dakheli" class="__tour__internal__ tab-pane fade show active" id="tour-dakheli" role="tabpanel">
                        <div class="tour-grid-parent">
                                {foreach $hotel_internal as $item}
                                    {if $min_internal <= $max_internal}

                                        <div class="__i_modular_nc_item_class_0 item">
                                            <a class="parent-link-tour"
                                               href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item['id']}/{$item['name_en']|strip:'-'}">
                                                <div class="parent-img-tour">
                                                    <img alt="{$item['City']}" class="__image_class__"
                                                         src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$item['logo']}"/>
                                                </div>
                                                <div class="parent-text-tour">
                                                    <span class="city-tour">{$item['city_name']}</span>
                                                    <h4 class="__title_class__">{$item['name']}</h4>
                                                </div>
                                            </a>
                                        </div>

                                        {$min_internal = $min_internal + 1}
                                    {/if}
                                {/foreach}





                        </div>
                    </div>
{*                    <div aria-labelledby="tab-tour-khareji" class="__tour__external__ tab-pane fade" id="tour-khareji" role="tabpanel">*}
{*                        <div class="tour-owl-parent">*}
{*                            <div class="owl-carousel owl-theme tour-owl">*}

{*                                {foreach $hotel_external as $item}*}
{*                                    {if $min_external <= $max_external}*}

{*                                        <div class="__i_modular_nc_item_class_0 item">*}
{*                                            <a class="parent-link-tour" href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item['id']}/{$item['name_en']|strip:'-'}">*}
{*                                                <div class="parent-img-tour">*}
{*                                                    <img alt="{$item['City']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>*}
{*                                                </div>*}
{*                                                <div class="parent-text-tour">*}
{*                                                    <h4 class="__title_class__">{$item['city_name']}</h4>*}
{*                                                </div>*}
{*                                            </a>*}
{*                                        </div>*}

{*                                        {$min_external = $min_external + 1}*}
{*                                    {/if}*}
{*                                {/foreach}*}





{*                            </div>*}
{*                        </div>*}
{*                    </div>*}
                </div>
            </div>
        </div>
    </section>
{/if}