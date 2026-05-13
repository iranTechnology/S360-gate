{assign var="data_search_tour" value=['type'=>'special', 'limit' =>7, 'dateNow' =>$objDate->jtoday('')]}
{assign var='tours' value=$obj_main_page->getToursReservation($data_search_tour)}

<div class="col-lg-5 col-md-12 col-sm-12 col-12">
    <div class="owl-tab">
        <h2>تورهای لحظه آخری</h2>
        <div class="parent-owl-carousel">
            <div class="owl-carousel owl-theme owl-baner">
                {foreach $tours as $key => $tour}

                    {assign var='inputDate' value=$tour['start_date']}
                    {$year = substr($inputDate, 0, 4)}
                    {$month = substr($inputDate, 4, 2)}
                    {$day = substr($inputDate, 6, 2)}

                    {$formattedDate = "{$year}-{$month}-{$day}"}
                    <div class="item">
                    <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/detailTour/{$tour['id_same']}/{$tour['name_en']}" class="child-item">
                        <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$tour['tour_pic']}" alt="{$tour['night']}">
                        <div class="night-calendar">
                            <i class="fa-light fa-calendar-days"></i>
                            <span> {$tour['night']}  شب </span>
                        </div>
                        <h3>{$tour['tour_name']}</h3>
                        <div class="money-calendar">
                            <span class="calendar-tour">    {$formattedDate} </span>
                            <span class="money-tour">{$tour['min_price']['minPriceR']|number_format} ریال  </span>
                        </div>
                    </a>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>
