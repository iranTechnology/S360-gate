{assign var="obj_main_page" value=$obj_main_page }
{assign var="tab_detail" value=$obj_main_page->classTabsSearchBoxDetail($client['MainService'])}
<div class="tab-pane {if {$tab_detail['tab_href']} eq 'Flight'}active{/if}" id="Flight">
    <div id="international_flight" class="d-flex flex-wrap international-flight-js">
        <form data-action="https://s360online.iran-tech.com/" method="post" target="_blank"
              class="d_contents" id="international_flight_form" name="international_flight_form">
            {include file="./sections/flight/international/btn_type_way.tpl"}
            {include file="./sections/flight/international/origin_search_box.tpl"}
            {include file="./sections/flight/international/destination_search_box.tpl"}
            {include file="./sections/flight/international/date_flight.tpl"}
            {include file="./sections/flight/international/passenger_count.tpl"}

            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search p-1 margin-center">
                <button type="button" class="btn theme-btn seub-btn b-0 d-flex align-items-center justify-content-center"
                        onclick="searchFlight('international')">
                    <span>جستجو</span>
                    <i class="fa-light fa-magnifying-glass mr-1"></i>
                </button>
            </div>
        </form>
    </div>
</div>

