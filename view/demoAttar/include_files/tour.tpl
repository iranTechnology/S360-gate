{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="special_tour_params" value=['type'=>'special','limit'=> '4','dateNow' => $dateNow]}
{assign var='special_tours' value=$obj_main_page->getToursReservation($special_tour_params)}
{assign var='count' value=0}

{if $special_tours}
<section class="special_tour">
    <div class="container">
        <div class="special_tour_main d-flex flex-wrap">
            <div class="title-safiran">
                <div class="text-title-safiran">
                    <h2>تور های ویژه</h2>
                </div>
                <a class="more-title-safiran" href="{$smarty.const.ROOT_ADDRESS}/page/tour">
                    <span>بیشتر</span>
                    <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg">
                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"></path>
                    </svg>
                </a>
            </div>
                <div class="grid-special_tour">
                    {foreach $special_tours as $tour}
                        {if $count<6}
                    <div class="item">
                        <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$tour['id_same']}/{$tour['tour_slug']}">
                            <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$tour['tour_pic']}" alt="{$tour['tour_name']}">
                            <div>
                                <h6>
                                    {$tour['tour_name']}
                                </h6>
                                <span>قیمت
                                    <span>
                                        {$tour['min_price_r']|number_format}
                                    </span>
                                    {if $item['min_price']['is_toman'] == true}
                                        تومان
                                    {else}
                                        ریال
                                    {/if}
                                </span>
                            </div>
                        </a>
                    </div>
                            {assign var="count" value=$count+1}
                        {/if}
                    {/foreach}
                </div>

        </div>
    </div>
</section>
                        {/if}