{assign var="obj_main_page" value=$obj_main_page }

<div class="tab-pane active" id="{$client['MainService']}">
    <div id="flight-international" class=" international-flight-js tab-pane active show"
         role="tabpanel"
         aria-labelledby="flight-international-tab">
        <form data-action="https://s360online.iran-tech.com/" method="post" target="_blank"
              class="d_contents" id="internal_international_flight_form" name="internal_international_flight_form">
            {include file="./sections/flight/international/btn_type_way.tpl"}
            {include file="./sections/flight/international/origin_search_box.tpl"}
            {include file="./sections/flight/international/destination_search_box.tpl"}
            {include file="./sections/flight/international/date_flight.tpl"}
            {include file="./sections/flight/international/passenger_count.tpl"}

            <div class="col-lg-2 col-md-6 col-sm-12 col-12 btn_s col_search">
                <input type='hidden' name='avaCountry' id='avaCountry' value='internal'>
                <button type="button" class="button_searchBox w-100"
                        onclick="searchFlight('international')"><span>##Search##</span></button>
            </div>
        </form>
    </div>
</div>



