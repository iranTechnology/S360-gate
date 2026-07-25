{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="tour_params_internal" value=['type'=>'','limit'=> '2','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='tour_internal' value=$obj_main_page->getToursReservation($tour_params_internal)}
{if $tour_internal}
    {assign var='check_tour' value=true}
{/if}
{assign var="min_internal" value=0}
{assign var="max_internal" value=2}

{assign var="tour_params_external" value=['type'=>'','limit'=> '2','dateNow' => $dateNow, 'country' =>'external']}
{assign var='tour_external' value=$obj_main_page->getToursReservation($tour_params_external)}
{if $tour_external}
    {assign var='check_tour' value=true}
{/if}
{assign var="min_external" value=0}
{assign var="max_external" value=2}

{if $check_tour}
    <section class="i_modular_tours tour">
        <div class="container">
            <h3 class="title">تور های حیات سیر پاژ</h3>
            <ul class="nav nav-tabs" id="tabsTour" role="tablist">
                <li class="nav-item">
                    <a aria-controls="tourl" aria-selected="true" class="nav-link active show" data-toggle="tab" href="#tourl" id="tourl-tab" role="tab">داخلی</a>
                </li>
                <li class="nav-item">
                    <a aria-controls="tourf" aria-selected="false" class="nav-link" data-toggle="tab" href="#tourf" id="tourf-tab" role="tab">خارجی</a>
                </li>
            </ul>
            <div class="tab-content" id="tabsTourContent">
                <div aria-labelledby="tourl-tab" class="__tour__internal__ tab-pane show active" id="tourl" role="tabpanel">
                    <div class="tour_box">

                        {foreach $tour_internal as $item}
                            {if $min_internal <= $max_internal}

                                <a class="__i_modular_nc_item_class_0" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                    <div class="img">
                                        <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                                        <div class="hover_img">
                                            <div><span class="__night_class__">{$item['night']}</span> شب</div>
                                            <div class="__date_class__ text">{assign var="year" value=substr($item['start_date'], 0, 4)}
                                                {assign var="month" value=substr($item['start_date'], 4, 2)}
                                                {assign var="day" value=substr($item['start_date'], 6)}
                                                {$year}/{$month}/{$day}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text">
                                        <h4 class="__title_class__">{$item['tour_name']}</h4>
                                        <p class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</p>
                                    </div>
                                </a>

                                {$min_internal = $min_internal + 1}
                            {/if}
                        {/foreach}



                    </div>
                    <div class="d-flex justify-content-center mt-5"><a class="button" href="{$smarty.const.ROOT_ADDRESS}/page/tour">همه تورها</a></div>
                </div>
                <div aria-labelledby="tourf-tab" class="__tour__external__ tab-pane" id="tourf" role="tabpanel">
                    <div class="tour_box">

                        {foreach $tour_external as $item}
                            {if $min_external <= $max_external}

                                <a class="__i_modular_nc_item_class_0" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                    <div class="img">
                                        <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                                        <div class="hover_img">
                                            <div><span class="__night_class__">{$item['night']}</span> شب</div>
                                            <div class="__date_class__">{assign var="year" value=substr($item['start_date'], 0, 4)}
                                                {assign var="month" value=substr($item['start_date'], 4, 2)}
                                                {assign var="day" value=substr($item['start_date'], 6)}
                                                {$year}/{$month}/{$day}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text">
                                        <h4 class="__title_class__">{$item['tour_name']}</h4>
                                        <p class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</p>
                                    </div>
                                </a>

                                {$min_external = $min_external + 1}
                            {/if}
                        {/foreach}



                    </div>
                    <div class="d-flex justify-content-center mt-5"><a class="button" href="{$smarty.const.ROOT_ADDRESS}/page/tour">همه تورها</a></div>
                </div>
            </div>
        </div>
    </section>
{/if}