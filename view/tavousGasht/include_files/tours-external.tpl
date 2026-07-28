{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{assign var="foreging_tour_params" value=['type'=>'','limit'=> '6','dateNow' => $dateNow, 'country' =>'external']}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}

{*{if $objResult->ReservationTourCountriesForAll('yes' , false , 3, 'notLike')}*}
<section class="ftour">
    <div class="container">
        <div class="title-safiran">
            <div class="text-title-safiran">
                <h2>تور های خارجی</h2>
            </div>

            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/all-all/all/all/0" class="more-title-safiran">
                <span>بیشتر</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                    <path
                            d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                    />
                </svg>
            </a>

        </div>
{*{$objResult->ReservationTourCountriesForAll('yes' , false , 3, 'notLike')|var_dump}*}

        <div class="row">
            <div class="col-lg-8 col-12">
                <div class="bg-ftour">
                    <div class="parent-ftour">
                        <div class="col-ftour">
                            <div class="list-ftour">
                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountriesForAll('yes' , false , 3, 'notLike')}

                                    {if $key_tour%3 ==  0}
                                        <div class="item-ftour">
                                            <div class="country-ftour">
                                                {if $item_tour.pic}
                                                    <img src="/gds/pic/country/{$smarty.const.CLIENT_ID}/{$item_tour.pic}"/>
                                                {elseif $item_tour.abbreviation}
                                                    <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/flags/{$item_tour.abbreviation}.png" />
                                                {else}
                                                    <img src="project_files/images/nophoto.png">
                                                {/if}
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                            </div>
                                            <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    viewBox="0 0 320 512">
                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                <path
                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                ></path>
                                            </svg>
                                            <div class="item-cnt-ftour item-cnt-ftour1">
                                                <div class="back-ftour">
                                                    <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            viewBox="0 0 320 512"
                                                    >
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path
                                                                d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                        ></path>
                                                    </svg>
                                                    بازگشت
                                                </div>
                                                <div class="title">
                                                    {if $item_tour.abbreviation}
                                                        <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/flags/{$item_tour.abbreviation}.png" />
                                                    {else}
                                                        <img src="project_files/images/nophoto.png">
                                                    {/if}
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </div>
                                                {if $item_tour['city_list']}
                                                    {foreach $item_tour['city_list'] as $city }
                                                        <a class="city-ftour"
                                                           href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">
                                                            {$city['name']}
                                                            <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    viewBox="0 0 320 512"
                                                            >
                                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                                <path
                                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                                ></path>
                                                            </svg>
                                                        </a>
                                                    {/foreach}
                                                    <a class="all-tours"
                                                       href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                        همه
                                                        <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 320 512"
                                                        >
                                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                            <path
                                                                    d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                            ></path>
                                                        </svg>
                                                    </a>
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}

                            </div>
                        </div>
                        <div class="col-ftour">
                            <div class="list-ftour">
                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountriesForAll('yes' , false , 3, 'notLike')}
                                    {if $key_tour%3 ==  1}
                                        <div class="item-ftour">
                                            <div class="country-ftour">
                                                {if $item_tour.pic}
                                                    <img src="/gds/pic/country/{$smarty.const.CLIENT_ID}/{$item_tour.pic}"/>
                                                {elseif $item_tour.abbreviation}
                                                    <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/flags/{$item_tour.abbreviation}.png" />
                                                {else}
                                                    <img src="project_files/images/nophoto.png">
                                                {/if}
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                            </div>
                                            <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    viewBox="0 0 320 512"
                                            >
                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                <path
                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                ></path>
                                            </svg>
                                            <div class="item-cnt-ftour item-cnt-ftour1">
                                                <div class="back-ftour">
                                                    <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            viewBox="0 0 320 512"
                                                    >
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path
                                                                d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                        ></path>
                                                    </svg>
                                                    بازگشت
                                                </div>
                                                <div class="title">
                                                    {if $item_tour.abbreviation}
                                                        <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/flags/{$item_tour.abbreviation}.png" />
                                                    {else}
                                                        <img src="project_files/images/nophoto.png">
                                                    {/if}
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </div>
                                                {if $item_tour['city_list']}
                                                    {foreach $item_tour['city_list'] as $city }
                                                        <a class="city-ftour"
                                                           href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">
                                                            {$city['name']}
                                                            <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    viewBox="0 0 320 512"
                                                            >
                                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                                <path
                                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                                ></path>
                                                            </svg>
                                                        </a>
                                                    {/foreach}
                                                    <a class="all-tours"
                                                       href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                        همه
                                                        <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 320 512"
                                                        >
                                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                            <path
                                                                    d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                            ></path>
                                                        </svg>
                                                    </a>
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}

                            </div>
                        </div>
                        <div class="col-ftour">
                            <div class="list-ftour">
                                {foreach key=key_tour item=item_tour from=$objResult->ReservationTourCountriesForAll('yes' , false , 3, 'notLike')}
                                    {if $key_tour%3 ==  2}
                                        <div class="item-ftour">
                                            <div class="country-ftour">
                                                {if $item_tour.pic}
                                                    <img src="/gds/pic/country/{$smarty.const.CLIENT_ID}/{$item_tour.pic}"/>
                                                {elseif $item_tour.abbreviation}
                                                    <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/flags/{$item_tour.abbreviation}.png" />
                                                {else}
                                                    <img src="project_files/images/nophoto.png">
                                                {/if}
                                                {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                            </div>
                                            <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    viewBox="0 0 320 512"
                                            >
                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                <path
                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                ></path>
                                            </svg>
                                            <div class="item-cnt-ftour item-cnt-ftour1">
                                                <div class="back-ftour">
                                                    <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            viewBox="0 0 320 512"
                                                    >
                                                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                        <path
                                                                d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                        ></path>
                                                    </svg>
                                                    بازگشت
                                                </div>
                                                <div class="title">
                                                    {if $item_tour.abbreviation}
                                                        <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/flags/{$item_tour.abbreviation}.png" />
                                                    {else}
                                                        <img src="project_files/images/nophoto.png">
                                                    {/if}
                                                    {($smarty.const.SOFTWARE_LANG == 'fa') ? $item_tour.name : $item_tour.name_en}
                                                </div>
                                                {if $item_tour['city_list']}
                                                    {foreach $item_tour['city_list'] as $city }
                                                        <a class="city-ftour"
                                                           href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-{$city['id']}/all/all">
                                                            {$city['name']}
                                                            <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    viewBox="0 0 320 512"
                                                            >
                                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                                <path
                                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                                ></path>
                                                            </svg>
                                                        </a>
                                                    {/foreach}
                                                    <a class="all-tours"
                                                       href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$item_tour.id}-all/all/all">
                                                        همه
                                                        <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 320 512"
                                                        >
                                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                            <path
                                                                    d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                            ></path>
                                                        </svg>
                                                    </a>
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-12">
                <div class="i_modular_tours tour-salam">
                    <div class="">
                        <div class="">
                            <div class="__tour__external__ owl-carousel owl-theme owl-tour-gisoo">
                                {foreach $foreginTours as $item}
                                    <div class="__i_modular_nc_item_class_0 item">
                                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}"
                                           class="link-parent">
                                            <div class="parent-img-tour">
                                                <img class="__image_class__"
                                                        src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"
                                                        alt="{$item['tour_name']}"  />
                                            </div>
                                            <div class="parent-text-owl">
                                                <!--                                            <div class="rating-stars">-->
                                                <!--                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">&lt;!&ndash;! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. &ndash;&gt;<path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path></svg>-->
                                                <!--                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">&lt;!&ndash;! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. &ndash;&gt;<path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path></svg>-->
                                                <!--                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">&lt;!&ndash;! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. &ndash;&gt;<path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path></svg>-->
                                                <!--                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">&lt;!&ndash;! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. &ndash;&gt;<path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"></path></svg>-->
                                                <!--                                            </div>-->
                                                <h2 class="__title_class__ title-tour-tab">
                                                    {$item['tour_name']}
                                                </h2>
                                                <div class="money-tour">
                                                    شروع از قیمت
                                                    <span class="___price_class__">
                                                        {$item['min_price']['discountedMinPriceR']|number_format}
                                                    </span>
                                                    ریال
                                                </div>
                                                <div class="parent-btn-tour">
                                                    <button class="btn-tour-tab">
                                                        <svg
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 512 512"
                                                        >
                                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                            <path
                                                                    d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l370.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128z"
                                                            />
                                                        </svg>
                                                    </button>
                                                    <img src="{$item['logo_transport']}" alt="{$item['airline_name']}" />
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
{*{/if}*}