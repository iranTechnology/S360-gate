{assign var="params" value=['limit'=>'9','is_group'=>true]}
{assign var="cities" value=$obj_main_page->dataFastSearchInternalFlight($params)}

<div class="section_special_flight">
    <div class="container">
        <div class="titr">جستجوی سریع پرواز</div>
        <div class="row">
            <div class="owl-carousel owl_4">
                {foreach $cities['cities_flight'] as $city}
                <div class="item">
                    <div class="col_card  {$city['Departure_Code']}"><h3 class="title">بلیط هواپیما از مبدأ <i>{$city['main']['Departure_CityFa']}</i> به </h3>
                        <section class="container_flights">
                            {foreach $city['sub_cities'] as $sub_city}
                                <div class="flightSearchBox" data-target="#calenderBox" data-toggle="modal"
                                     onclick="calenderFlightSearch('{$city['main']['Departure_Code']}','{$sub_city['Departure_Code']}')">
                                    <span class="list-item">
                                        <a>
                                            {$sub_city['Departure_CityFa']}
                                        </a>
                                    </span>
                                </div>
                            {/foreach}
                        </section>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>