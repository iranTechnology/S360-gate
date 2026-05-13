{assign var="params" value=['limit'=>'6']}
{assign var="cities" value=$obj_main_page->dataFastSearchInternalFlight($params)}

<div class="card">
    <div class="card-header" id="headingOne2">
        <h5 class="mb-0 parent-accordion">
            <i class="fa-regular fa-plane"></i>
            <button class="btn btn-link collapsed w-100" data-toggle="collapse" data-target="#collapseOne2" aria-expanded="false" aria-controls="collapseOne" autocomplete="off">
                پروازهای پرتردد داخلی
                <i class="far fa-angle-down mr-auto"></i>
            </button>
        </h5>
    </div>
    <div id="collapseOne2" class="collapse" aria-labelledby="headingOne2" data-parent="#accordion2" style="">
        <div class="card-body">
            <div class="row">
                {foreach $cities['cities_flight'] as $key => $city}
                    <div class="col-md-4 col-sm-6">
                        <a class="flightlocallink" data-target="#calenderBox" data-toggle="modal"
                           onclick="calenderFlightSearch('{$city['Departure_Code']}','{$city['Arrival_Code']}')">
                            <p>
                                بلیط هواپیما {$city['Departure_City']} به {$city['Arrival_City']}
                            </p>
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>