{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'special','limit'=> '5','dateNow' => $dateNow, 'country' =>'internal']}
{assign var="foregin_tour_params" value=['type'=>'special','limit'=> '5','dateNow' => $dateNow, 'country' =>'external']}
{assign var="lsat_second_tour_params" value=['type'=>'special','limit'=> '5','dateNow' => $dateNow, 'country' =>'external']}

{assign var='internal_tours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var='foregin_tours' value=$obj_main_page->getToursReservation($foregin_tour_params)}

<div class='section1'>

    <div class='container-fluid'>
        <div class="row titr_row  ">

            <div class="col-md-12 col-12">
                <div class="">
                    <h3 class="">بهترین تورهای ما </h3>
                    <a class="button button-secondary button-nina" href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/{$objDate->jtoday()}/all">مشاهده همه تورها</a>
                </div>

                <hr class="divider divider-decorate">
            </div>

        </div>



        <div class="section_special_tour section_tours">
            <div class=" ">
                <div class="w-100">

                    <div class="d-flex justify-content-center mb-4">
                        <ul class="nav nav-tabs p-0 m-0 d-flex border-0" id="tabsTour1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active"
                                   id="domestic_tour_tab1"
                                   data-toggle="tab"
                                   href="#domestic_tour1"
                                   role="tab"
                                   aria-controls="tourl1"
                                   aria-selected="false">
                                    تور داخلی
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"
                                   id="foreign_tour_tab1"
                                   data-toggle="tab"
                                   href="#foreign_tour1"
                                   role="tab"
                                   aria-controls="tourf1"
                                   aria-selected="true">
                                    تور خارجی
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="tab-content w-100" id="tabsTourContent1">
                        <div class="tab-pane fade active show"
                             id="domestic_tour1"
                             role="tabpanel"
                             aria-labelledby="domestic_tour1">
                            <div class=" owl_4">
                                <div class="row">
                                    {foreach $internal_tours as $item}
                                        <div class="col-md-6 col-xl-4">
                                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_name_en']}" class="special_tour_main_a">
                                                <div class="special_tour_main_img"><img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}"></div>
                                                <div class="special_tour_main_div"><h2>{$item['tour_name']}</h2>
                                                    <div class="special_tour_main_footer"><h5> قیمت {$item['min_price_r']} تومان</h5>
                                                        <button>جزئیات تور</button>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    {/foreach}
                                </div>


                            </div>
                        </div>
                        <div class="tab-pane fade"
                             id="foreign_tour1"
                             role="tabpanel"
                             aria-labelledby="foreign_tour1">
                            <div class=" owl_4">
                                <div class="row">
                                    {foreach $foregin_tours as $item}
                                        <div class="col-md-4 col-xl-4">
                                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_name_en']}" class="special_tour_main_a">
                                                <div class="special_tour_main_img"><img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}"></div>
                                                <div class="special_tour_main_div"><h2>{$item['tour_name']}</h2>
                                                    <div class="special_tour_main_footer"><h5> قیمت {$item['min_price_r']} تومان</h5>
                                                        <button>جزئیات تور</button>
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

    </div>
</div>
