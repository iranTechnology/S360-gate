{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{assign var="internal_tour_params" value=['type'=>'','limit'=> '6','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{*{if $objResult->ReservationTourCountries('yes' , false , 4, 'notLike')}*}
{assign var="internal_tour_params" value=['limit'=> '10', 'type' =>'internal']}
{assign var='cityWithTours' value=$obj_main_page->citiesWithTour($internal_tour_params)}
{*{$cityWithTours|var_dump}*}
<section class="itour">
    <div class="container">
        <div class="title-safiran">
            <div class="text-title-safiran">
                <h2>تور های داخلی</h2>
            </div>
            <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/1-all/all/all/4" class="more-title-safiran">
                <span>بیشتر</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                    <path
                            d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                    />
                </svg>
            </a>
        </div>
        <div class="row">
            <div class="col-lg-8 col-12">
                <div class="bg-ftour">
                    <div class="parent-ftour">
                        <div class="col-ftour">
                            <div class="itour-category">
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/5/all">
                                    <img src="project_files/images/jonoob.jpg">
                                    تور جنوب
                                </a>
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/6/all">
                                    <img src="project_files/images/shomal.jpg">
                                    تور شمال
                                </a>
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/7/all">
                                    <img src="project_files/images/shahr.jpg">
                                    شهرگردی
                                </a>
                                <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/8/all">
                                    <img src="project_files/images/rafting.jpg">
                                    تور رفتینگ
                                </a>
                                <a class="dnone"
                                   href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/9/all">
                                    <img src="project_files/images/kavir.jpg">
                                    تور کویر
                                </a>
                                <a class="dnone"
                                   href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/10/all">
                                    <img src="project_files/images/afrod.jpg">
                                    تور آفرود
                                </a>
                                <a class="dnone"
                                   href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/11/all">
                                    <img src="project_files/images/tabiat.jpg">
                                    تور طبیعت
                                </a>
                                <a class="dnone"
                                   href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/12/all">
                                    <img src="project_files/images/tehran.jpg">
                                    تهرانگردی
                                </a>
                            </div>
                        </div>
                        <div class="col-ftour">
                            <div class="list-ftour">
                                {foreach $cityWithTours as $key => $city}
                                    {if $key%2 ==  0}
                                        <div class="item-ftour">
                                            <div class="country-ftour">
                                                {$city['city']['name']}
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
                                                    {$city['city']['name']}
                                                </div>
                                                {if $city['tour_list']}
                                                    {foreach $city['tour_list'] as $tour }
                                                        <a class="city-ftour"
                                                           href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$tour['id_same']}/{$tour['tour_slug']}">
                                                            {$tour['tour_name']}
                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                 viewBox="0 0 320 512">
                                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                                <path
                                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                                                                ></path>
                                                            </svg>
                                                        </a>
                                                    {/foreach}
                                                    <a class="all-tours"
                                                       href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$city['city']['id']}-{$tour['id_same']}-all/all/all">
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
                                {foreach $cityWithTours as $key => $city}
                                    {if $key%2 == 1}
                                        <div class="item-ftour">
                                            <div class="country-ftour">
                                                {$city['city']['name']}
                                            </div>
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                <path
                                                        d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"></path>
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
                                                    {$city['city']['name']}
                                                </div>
                                                {if $city['tour_list']}
                                                    {foreach $city['tour_list'] as $tour }
                                                        <a class="city-ftour"
                                                           href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$tour['id_same']}/{$tour['tour_slug']}">
                                                            {$tour['tour_name']}
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
                                                       href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/{$city['city']['id']}-all/all/all">
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
                            <div class="__tour__internal__ owl-carousel owl-theme owl-tour-gisoo">
                                {foreach $internalTours as $item}
                                    <div class="__i_modular_nc_item_class_0 item">
                                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="link-parent">
                                            <div class="parent-img-tour">
                                                <img class="__image_class__"
                                                     src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"
                                                     alt="{$item['tour_name']}"  />                                            </div>
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
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                                viewBox="0 0 512 512" >
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