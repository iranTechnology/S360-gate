<div class="tab-pane {if $client['order_number'] eq '1' || $active_tab eq $client['MainService']}active{/if}" id="{$client['MainService']}"
     role="tabpanel" aria-labelledby="{$client['MainService']}-tab">
    <div id="international_flight" class="   ">
        <form method="post" target="_blank" class="d_contents" id="international_flight_form" name="international_flight_form">
            {include file="./sections/flight/international/btn_type_way.tpl"}
            {include file="./sections/flight/international/origin_search_box.tpl"}
            {include file="./sections/flight/international/destination_search_box.tpl"}
            {include file="./sections/flight/international/date_flight.tpl"}
            {include file="./sections/flight/international/passenger_count.tpl"}


            <div class="col-md-12 col-xs-12">
                <div class="search_btn_div">
                    <button type="button" class="button  search_button" onclick="searchFlight('international')">جستجوی پرواز
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>