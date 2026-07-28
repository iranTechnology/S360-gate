{assign var="params" value=['use_customer_db'=>true,'origin_city'=>'IKA','destination_city'=>['IKA','DXB','IST','CDG','YYZ','NJF','BER']]}
{assign var="cities" value=$obj_main_page->dataFastSearchInternationalFlight($params)}


<div class="card">
    <div class="card-header" id="headingTwo2">
        <h5 class="mb-0 parent-accordion">
            <i class="fa-regular fa-plane"></i>
            <button class="btn btn-link collapsed w-100" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo" autocomplete="off">
                پروازهای پرتردد خارجی
                <i class="far fa-angle-down mr-auto"></i>
            </button>
        </h5>
    </div>
    <div id="collapseTwo2" class="collapse" aria-labelledby="headingTwo2" data-parent="#accordion2" style="">
        <div class="card-body">
            <div class="row">
                {foreach $cities['sub_cities'] as $sub_city}
                    <div class="col-md-4 col-sm-6">
                        <a  onclick="calenderFlightSearch('{$cities['main']['DepartureCode']}','{$sub_city['DepartureCode']}')"
                            data-target="#calenderBox" data-toggle="modal" class="flightlocallink">
                            <p>
                                بلیط هواپیما از مبدأ <i>{$cities['main']['DepartureCityFa']}</i> به<i>{$sub_city['DepartureCityFa']}  </i>
                            </p>
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>