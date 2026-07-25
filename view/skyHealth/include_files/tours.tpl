{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="tour_params_external" value=['type'=>'special','limit'=> '6','dateNow' => $dateNow, 'country' =>'external','city' => null]}
{assign var='tour_external_special' value=$obj_main_page->getToursReservation($tour_params_external)}
{if $tour_external_special}
    {assign var='check_general' value=true}
{/if}
{assign var="min_external_external" value=0}
{assign var="max_external_external" value=5}

{if $check_general}
    <section class="tour_ttitr container mt-4 mb-3">
        <div>تور های ویژه خارجی
        </div>
    </section>
    <section class="i_modular_tours tour container mb-4 mt-3">
        <div class="tour_main">
            <div class="__tour__external__special__ tours owl-carousel owl-theme">

                {foreach $tour_external_special as $item}
                    {if $min_external_external <= $max_external_external}
                        <div class="__i_modular_nc_item_class_0 item">
                            <a class="d-flex align-items-center justify-content-between flex-column"
                               href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                <div>
                                    <img alt="{$item['tour_name']}" class="__image_class__"
                                         src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" />
                                </div>
                                <div>
                                    <h6 class="__title_class__">{$item['tour_name']}</h6>
                                    <div class="money">

                                        شروع قیمت از :

                                        <span class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</span>

                                        تومان

                                    </div>
                                    <div class="clock">
                                        <span>
                                        <i class="far fa-clock ml-1"></i> مدت تور :

                                        </span>
                                        <span class="__night_class__">{$item['night']}</span>

                                        شب

                                    </div>
                                    <div class="calculator">
                                        <span>
                                        <i class="far fa-calendar ml-1"></i> تاریخ حرکت :

                                            </span>
                                        <span class="__date_class__">{assign var="year" value=substr($item['start_date'], 0, 4)}
                                            {assign var="month" value=substr($item['start_date'], 4, 2)}
                                            {assign var="day" value=substr($item['start_date'], 6)}
                                            {$year}/{$month}/{$day}
                                        </span>
                                    </div>
                                    <button>مشاهده تور</button>
                                </div>
                            </a>
                        </div>
                        {$min_external_external = $min_external_external + 1}
                    {/if}
                {/foreach}


            </div>
        </div>
    </section>
{/if}