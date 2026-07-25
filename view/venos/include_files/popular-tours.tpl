{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'special','limit'=> '9','dateNow' => $dateNow, 'country' =>'internal']}
{assign var="foreging_tour_params" value=['type'=>'special','limit'=> '9','dateNow' => $dateNow, 'country' =>'external']}

{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}

{if !empty($internalTours) || !empty($foreginTours)}
<section class="tab-tour">
    <div class="container">
        <div class="title">
            <h2>محبوبترین تورها</h2>
            <p>
                برگزاری تورهای داخلی و خارجی با بهترین کیفیت و امکانات
            </p>
        </div>
        <ul class="nav nav-pills d-flex align-items-center justify-content-center" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="tab-tour-khareji" data-toggle="pill" data-target="#tour-khareji"
                        type="button" role="tab" aria-controls="tour-khareji" aria-selected="false"> خارجی
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link " id="tab-tour-dakheli" data-toggle="pill" data-target="#tour-dakheli"
                        type="button" role="tab" aria-controls="tour-dakheli" aria-selected="true"> داخلی
                </button>
            </li>
        </ul>
        <div class="parent-tab-tour">
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade " id="tour-dakheli" role="tabpanel" aria-labelledby="tab-tour-dakheli">
                    <div class="parent-tour">
                        {assign var="count" value="1"}
                        {foreach $internalTours as $item}
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}" class="{if $count > 4}display-none-mobile{/if} tour-item-link">
                                <div class="parent-img-tour">
                                    <img  src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}" >
                                </div>
                                <div class="parent-text-tour">
                                    <h3>{$item['tour_name']}</h3>
                                    <div class="price-tour">
                                        <h5>
                                            {$min_price_t = $item['min_price_r']/10}
                                            {$min_price_t = $min_price_t|number_format}
                                            {$min_price_t}
                                            تومان </h5>
                                        <span>/ هر نفر</span>
                                    </div>
                                    <div class="clock-tour">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                            <path d="M240 112C240 103.2 247.2 96 256 96C264.8 96 272 103.2 272 112V247.4L360.9 306.7C368.2 311.6 370.2 321.5 365.3 328.9C360.4 336.2 350.5 338.2 343.1 333.3L247.1 269.3C242.7 266.3 239.1 261.3 239.1 256L240 112zM256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0zM32 256C32 379.7 132.3 480 256 480C379.7 480 480 379.7 480 256C480 132.3 379.7 32 256 32C132.3 32 32 132.3 32 256z"></path>
                                        </svg>
                                        <span>{$item['night']}شب </span>
                                    </div>
                                    <div class="data-tour">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                            <path d="M112 0C120.8 0 128 7.164 128 16V64H320V16C320 7.164 327.2 0 336 0C344.8 0 352 7.164 352 16V64H384C419.3 64 448 92.65 448 128V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V128C0 92.65 28.65 64 64 64H96V16C96 7.164 103.2 0 112 0zM416 192H312V264H416V192zM416 296H312V376H416V296zM416 408H312V480H384C401.7 480 416 465.7 416 448V408zM280 376V296H168V376H280zM168 480H280V408H168V480zM136 376V296H32V376H136zM32 408V448C32 465.7 46.33 480 64 480H136V408H32zM32 264H136V192H32V264zM168 264H280V192H168V264zM384 96H64C46.33 96 32 110.3 32 128V160H416V128C416 110.3 401.7 96 384 96z"></path>
                                        </svg>
                                        <span>
                                            {assign var="year" value=substr($item['start_date'], 0, 4)}
                                            {assign var="month" value=substr($item['start_date'], 4, 2)}
                                            {assign var="day" value=substr($item['start_date'], 6)}
                                            {$year}/{$month}/{$day}
                                        </span>
                                    </div>
                                    <div class="airline-tour">
                                        <div class="box-airline-img-tour">
                                            <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/airline/{$obj_main_page->getTypeVehicle($item['id'])}" alt="airline-img-tour">
                                        </div>
                                        <div class="box-airline-tour">
                                            <span>{$item['airline_name']}</span>
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                <path d="M482.3 192c34.2 0 93.7 29 93.7 64c0 36-59.5 64-93.7 64l-116.6 0L265.2 495.9c-5.7 10-16.3 16.1-27.8 16.1l-56.2 0c-10.6 0-18.3-10.2-15.4-20.4l49-171.6L112 320 68.8 377.6c-3 4-7.8 6.4-12.8 6.4l-42 0c-7.8 0-14-6.3-14-14c0-1.3 .2-2.6 .5-3.9L32 256 .5 145.9c-.4-1.3-.5-2.6-.5-3.9c0-7.8 6.3-14 14-14l42 0c5 0 9.8 2.4 12.8 6.4L112 192l102.9 0-49-171.6C162.9 10.2 170.6 0 181.2 0l56.2 0c11.5 0 22.1 6.2 27.8 16.1L365.7 192l116.6 0z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            {$count = $count + 1}
                        {/foreach}

                    </div>
                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/all-all/{$objDate->jdate("Y-m-d", '', '', '', 'en')}/all/1" class="btn-more">
                        نمایش تمام تورها
                        <i class="fa-solid fa-arrow-left"></i>
                    </a>

                </div>
                <div class="tab-pane fade show active" id="tour-khareji" role="tabpanel"
                     aria-labelledby="tab-tour-khareji">
                    <div class="parent-tour">
                        {assign var="count" value="1"}
                        {foreach $foreginTours as $item}
                            {assign var='vehicle' value=$obj_main_page->getVehicleType($item['id'])}
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}" class="{if $count > 4}display-none-mobile{/if} tour-item-link">
                                <div class="parent-img-tour">
                                    <img  src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                                </div>
                                <div class="parent-text-tour">
                                    <h3>{$item['tour_name']}</h3>
                                    <div class="price-tour">
                                        <h5>
                                            {$min_price_t = $item['min_price_r']/10}
                                            {$min_price_t = $min_price_t|number_format}
                                            {$min_price_t}
                                            تومان
                                        </h5>
                                        <span>/ هر نفر</span>
                                    </div>
                                    <div class="clock-tour">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                            <path d="M240 112C240 103.2 247.2 96 256 96C264.8 96 272 103.2 272 112V247.4L360.9 306.7C368.2 311.6 370.2 321.5 365.3 328.9C360.4 336.2 350.5 338.2 343.1 333.3L247.1 269.3C242.7 266.3 239.1 261.3 239.1 256L240 112zM256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0zM32 256C32 379.7 132.3 480 256 480C379.7 480 480 379.7 480 256C480 132.3 379.7 32 256 32C132.3 32 32 132.3 32 256z"></path>
                                        </svg>
                                        <span>{$item['night']}شب </span>
                                    </div>
                                    <div class="data-tour">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                            <path d="M112 0C120.8 0 128 7.164 128 16V64H320V16C320 7.164 327.2 0 336 0C344.8 0 352 7.164 352 16V64H384C419.3 64 448 92.65 448 128V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V128C0 92.65 28.65 64 64 64H96V16C96 7.164 103.2 0 112 0zM416 192H312V264H416V192zM416 296H312V376H416V296zM416 408H312V480H384C401.7 480 416 465.7 416 448V408zM280 376V296H168V376H280zM168 480H280V408H168V480zM136 376V296H32V376H136zM32 408V448C32 465.7 46.33 480 64 480H136V408H32zM32 264H136V192H32V264zM168 264H280V192H168V264zM384 96H64C46.33 96 32 110.3 32 128V160H416V128C416 110.3 401.7 96 384 96z"></path>
                                        </svg>
                                        <span>
                                            {assign var="year" value=substr($item['start_date'], 0, 4)}
                                            {assign var="month" value=substr($item['start_date'], 4, 2)}
                                            {assign var="day" value=substr($item['start_date'], 6)}
                                            {$year}/{$month}/{$day}
                                        </span>
                                    </div>
                                    <div class="airline-tour">
                                        <div class="box-airline-img-tour">
                                            {if isset($vehicle['dept']['vehicle']['fk_id_type_of_vehicle'])}
                                                <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$vehicle['dept']['vehicle']['pic']}" alt="airline-img-tour">
                                            {else}
                                            <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/airline/{$vehicle['dept']['vehicle']['photo']}" alt="airline-img-tour">
                                            {/if}
                                        </div>
                                        <div class="box-airline-tour">
                                            <span>{$item['airline_name']}</span>
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                                <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                <path d="M482.3 192c34.2 0 93.7 29 93.7 64c0 36-59.5 64-93.7 64l-116.6 0L265.2 495.9c-5.7 10-16.3 16.1-27.8 16.1l-56.2 0c-10.6 0-18.3-10.2-15.4-20.4l49-171.6L112 320 68.8 377.6c-3 4-7.8 6.4-12.8 6.4l-42 0c-7.8 0-14-6.3-14-14c0-1.3 .2-2.6 .5-3.9L32 256 .5 145.9c-.4-1.3-.5-2.6-.5-3.9c0-7.8 6.3-14 14-14l42 0c5 0 9.8 2.4 12.8 6.4L112 192l102.9 0-49-171.6C162.9 10.2 170.6 0 181.2 0l56.2 0c11.5 0 22.1 6.2 27.8 16.1L365.7 192l116.6 0z"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            {$count = $count + 1}
                        {/foreach}
                    </div>
                    <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all/1" class="btn-more">
                        نمایش تمام تورها
                        <i class="fa-solid fa-arrow-left"></i>
                    </a>

                </div>
            </div>
        </div>
    </div>
</section>
{/if}
