{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane  show active" id="{$client['MainService']}" role="tabpanel"
     aria-labelledby="{$client['MainService']}-tab" >
    <div id="flight_khareji" class="flex-wrap international-flight-js row">
        <form data-action="https://s360online.iran-tech.com/" method="post" target="_blank"
              class="d_contents" id="international_flight_form" name="international_flight_form">
            {include file="./sections/flight/international/btn_type_way.tpl"}
            {include file="./sections/flight/international/origin_search_box.tpl"}
            {include file="./sections/flight/international/destination_search_box.tpl"}
            {include file="./sections/flight/international/date_flight.tpl"}
            {include file="./sections/flight/international/passenger_count.tpl"}

            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search margin-center">
                <button type="button" class="btn theme-btn seub-btn b-0" onclick="searchFlight('international')">
                    <span class="span-search">{$obj_main_page->nameButtonSearchBox($client['MainService'])} </span>
                    <span class="icon-search">
                         <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                    </span>
                </button>
            </div>
        </form>
    </div>
</div>
