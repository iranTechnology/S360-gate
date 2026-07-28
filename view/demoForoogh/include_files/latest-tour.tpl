{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow, 'country' =>'internal']}
{assign var="foreging_tour_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow, 'country' =>'external']}
{assign var="installment_tour_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow, 'category' =>'17']}
{assign var="earth_tours_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow,'category' => '3']}
{assign var="summer_tours_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow,'category' => '14']}
{assign var="recent_tours_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow,  'category' => '6']}

{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}
{assign var='installmentTours' value=$obj_main_page->getToursReservation($installment_tour_params)}
{assign var='earthTours' value=$obj_main_page->getToursReservation($earth_tours_params)}
{assign var='summerTours' value=$obj_main_page->getToursReservation($summer_tours_params)}
{assign var='recentTours' value=$obj_main_page->getToursReservation($recent_tours_params)}




<section class="latest-tour">
    <div class="container">
        <div class="title">
            <div class="box-right">
                <div class="text-title">
                    <h5>جدیدترین تورها</h5>
                    <span>  تورهای ویژه با برنامه‌های منحصر به فرد و خدمات اختصاصی، تجربه‌ای متمایز و به‌یادماندنی را برای مسافران فراهم می‌کنند.   </span>
                </div>
            </div>
            <a class="more-title" href="{$smarty.const.ROOT_ADDRESS}/page/tour">

                مشاهده بیشتر

                <i class="fa-solid fa-arrow-left"></i>
            </a>
        </div>
        <div class="parent-latest-tour">
            <div class="tabs-latest-tour">
                <ul class="nav nav-pills ul-latest-tour" id="pills-tab-latest-tour" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button aria-controls="domestic-content" aria-selected="true" class="nav-link active" data-target="#domestic-content" data-toggle="pill" id="domestic-tab" role="tab" type="button">داخلی</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button aria-controls="foreign-content" aria-selected="false" class="nav-link" data-target="#foreign-content" data-toggle="pill" id="foreign-tab" role="tab" type="button">خارجی</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button aria-controls="earthly-content" aria-selected="false" class="nav-link" data-target="#earthly-content" data-toggle="pill" id="earthly-tab" role="tab" type="button">زمینی</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button aria-controls="installments-content" aria-selected="false" class="nav-link" data-target="#installments-content" data-toggle="pill" id="installments-tab" role="tab" type="button">اقساطی</button>
                    </li>


                </ul>
            </div>
            <div class="description-latest-tour">
                <div class="tab-content" id="pills-tabContent-latest-tour">
                    <div aria-labelledby="domestic-tab" class="tab-pane fade show active" id="domestic-content" role="tabpanel">
                        <div class="parent-grid-latest-tour">
                            {foreach $internalTours as $item}
                            {assign var="tour_type_id" value=$item['tour_type_id']}

                            <a class="parent-link-domestic" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
                                <div class="parent-data-latest-tour">
                                    <h4>{$item['tour_name']}</h4>
                                    <h5 data-placement="top" data-toggle="tooltip" title="تاریخ حرکت">
                                        {assign var="year" value=substr($item['start_date'], 0, 4)}
                                        {assign var="month" value=substr($item['start_date'], 4, 2)}
                                        {assign var="day" value=substr($item['start_date'], 6)}
                                        {$year}/{$month}/{$day}
                                    </h5>
                                    <h5 data-placement="top" data-toggle="tooltip" title="مدت اقامت">{if $item['night'] eq '0'}بدون اقامت{else}{$item['night']} شب {/if}</h5>
                                    <img alt="{$item['airline_name']}" data-placement="top" data-toggle="tooltip" src="{$item['logo_transport']}" title="ترانسفر"/>
                                </div>
                                <div class="parent-price-latest-tour">
                                    <div class="price-latest-tour">
                                        <h3 data-placement="top" data-toggle="tooltip" title="قیمت">
                                            {$item['min_price_r']|number_format}
                                        </h3>
                                        <span>
                                        {if $item['min_price']['is_toman'] == true}
                                            تومان
                                        {else}
                                            ریال
                                        {/if}
                                        </span>
                                    </div>
                                </div>
                            </a>

                            {/foreach}


                        </div>
                    </div>
                    <div aria-labelledby="foreign-tab" class="tab-pane fade" id="foreign-content" role="tabpanel">
                        <div class="parent-grid-latest-tour">
                            {foreach $foreginTours as $item}

                            <a class="parent-link-foreign" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
                                <div class="parent-data-latest-tour">
                                    <h4>{$item['tour_name']}</h4>
                                    <h5 data-placement="top" data-toggle="tooltip" title="تاریخ حرکت">     {assign var="year" value=substr($item['start_date'], 0, 4)}
                                        {assign var="month" value=substr($item['start_date'], 4, 2)}
                                        {assign var="day" value=substr($item['start_date'], 6)}
                                        {$year}/{$month}/{$day}</h5>
                                    <h5 data-placement="top" data-toggle="tooltip" title="مدت اقامت">{if $item['night'] eq '0'}بدون اقامت{else}{$item['night']} شب {/if}</h5>
                                    <img alt="{$item['airline_name']}" data-placement="top" data-toggle="tooltip" src="{$item['logo_transport']}" title="ترانسفر"/>
                                </div>
                                <div class="parent-price-latest-tour">
                                    <div class="price-latest-tour">
                                        <h3 data-placement="top" data-toggle="tooltip" title="قیمت">{$item['min_price_r']|number_format}</h3>

                                        <span>
                                        {if $item['min_price']['is_toman'] == true}
                                            تومان
                                        {else}
                                            ریال
                                        {/if}
                                        </span>
                                    </div>
                                </div>
                            </a>

                            {/foreach}
                        </div>
                    </div>
                    <div aria-labelledby="earthly-tab" class="tab-pane fade" id="earthly-content" role="tabpanel">
                        <div class="parent-grid-latest-tour">
                            {foreach $earthTours as $item}
                            <a class="parent-link-earthly" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                <div class="parent-data-latest-tour">
                                    <h4>{$item['tour_name']}</h4>
                                    <h5 data-placement="top" data-toggle="tooltip" title="تاریخ حرکت">      {assign var="year" value=substr($item['start_date'], 0, 4)}
                                        {assign var="month" value=substr($item['start_date'], 4, 2)}
                                        {assign var="day" value=substr($item['start_date'], 6)}
                                        {$year}/{$month}/{$day}</h5>
                                    <h5 data-placement="top" data-toggle="tooltip" title="مدت اقامت">{if $item['night'] eq '0'}بدون اقامت{else}{$item['night']} شب {/if}</h5>
                                    <img alt="{$item['airline_name']}" data-placement="top" data-toggle="tooltip" src="{$item['logo_transport']}" title="ترانسفر"/>
                                </div>
                                <div class="parent-price-latest-tour">
                                    <div class="price-latest-tour">
                                        <h3 data-placement="top" data-toggle="tooltip" title="قیمت">
                                            {$item['min_price_r']|number_format}
                                        </h3>

                                        <span>
                                        {if $item['min_price']['is_toman'] == true}
                                            تومان
                                        {else}
                                            ریال
                                        {/if}
                                        </span>
                                    </div>
                                </div>
                            </a>
                            {/foreach}

                        </div>
                    </div>
                    <div aria-labelledby="installments-tab" class="tab-pane fade" id="installments-content" role="tabpanel">
                        <div class="parent-grid-latest-tour">
                            {foreach $installmentTours as $item}
                                {assign var="tour_type_id" value=$item['tour_type_id']}
                                {assign var="isInstallment" value=strpos($tour_type_id, '"17"')}
                            <a class="parent-link-installments" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                <div class="parent-data-latest-tour">
                                    <h4>{$item['tour_name']}</h4>
                                    <h5 data-placement="top" data-toggle="tooltip" title="تاریخ حرکت">      {assign var="year" value=substr($item['start_date'], 0, 4)}
                                        {assign var="month" value=substr($item['start_date'], 4, 2)}
                                        {assign var="day" value=substr($item['start_date'], 6)}
                                        {$year}/{$month}/{$day}</h5>
                                    <h5 data-placement="top" data-toggle="tooltip" title="مدت اقامت">{if $item['night'] eq '0'}بدون اقامت{else}{$item['night']} شب {/if}</h5>
                                    <img alt="{$item['airline_name']}" data-placement="top" data-toggle="tooltip" src="{$item['logo_transport']}" title="ترانسفر"/>
                                </div>
                                <div class="parent-price-latest-tour">
                                    <div class="price-latest-tour">
                                        <h3 data-placement="top" data-toggle="tooltip" title="قیمت">
                                            {$item['min_price_r']|number_format}
                                        </h3>

                                        <span>
                                        {if $item['min_price']['is_toman'] == true}
                                            تومان
                                        {else}
                                            ریال
                                        {/if}
                                        </span>
                                    </div>
                                </div>
                            </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
