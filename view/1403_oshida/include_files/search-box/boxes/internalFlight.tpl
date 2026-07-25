{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane {if $client['order_number'] eq '1' || $active_tab eq $client['MainService']}active{/if}" id="{$client['MainService']}"
     role="tabpanel" aria-labelledby="{$client['MainService']}-tab">
    <div id="internal_flight" class="  internal-flight-js">
        <form method="post" class="d_contents" target="_blank" id="internal_flight_form" name="internal_flight_form">
            {include file="./sections/flight/internal/btn_type_way.tpl"}
            {include file="./sections/flight/internal/origin_selection.tpl"}
            {include file="./sections/flight/internal/destination_selection.tpl"}
            {include file="./sections/flight/internal/date_flight.tpl"}
            {include file="./sections/flight/internal/passenger_count.tpl"}


            <div class="col-md-12 col-xs-12">
                <div class="search_btn_div">
                    <button type="button" class="button  search_button" onclick="searchFlight('internal')">جستجوی پرواز
                    </button>
                </div>
            </div>


        </form>
    </div>
</div>