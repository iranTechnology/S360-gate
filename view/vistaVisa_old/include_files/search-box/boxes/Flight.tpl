<div class="__box__ tab-pane active" id="Flight_internal">
    <div class="d-flex flex-wrap gap-search-box">
        {include file="./sections/Flight/internal/btn_type_way.tpl"}
        <div id="internal_flight" data-name="internal_flight" class="_internal d_flex visible flight-toggle-js flex-wrap internal-flight-js">
            <form method="post" class="d_contents" target="_blank" id="internal_flight_form" name="internal_flight_form">
                <div class="d-flex flex-wrap">
                    {include file="./sections/Flight/internal/origin_selection.tpl"}
                    {include file="./sections/Flight/internal/destination_selection.tpl"}
                    {include file="./sections/Flight/internal/date_flight.tpl"}
                    {include file="./sections/Flight/internal/passenger_count.tpl"}
                    <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search margin-center p-1">
                        <button type="button" onclick="searchFlight('internal')" class="btn theme-btn seub-btn b-0">
                            <span>جستجو</span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M368 208A160 160 0 1 0 48 208a160 160 0 1 0 320 0zM337.1 371.1C301.7 399.2 256.8 416 208 416C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208c0 48.8-16.8 93.7-44.9 129.1L505 471c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L337.1 371.1z"/></svg>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="__box__ tab-pane" id="Flight_external">
    <div class="d-flex flex-wrap gap-search-box">
        {include file="./sections/Flight/international/btn_type_way.tpl"}
        <div id="international_flight" data-name="international_flight" class="_external d-flex flex-wrap  flight-toggle-js international-flight-js">
            <form data-action="https://s360online.iran-tech.com/" method="post" target="_blank" class="d_contents" id="international_flight_form" name="international_flight_form">
                {include file="./sections/Flight/international/origin_search_box.tpl"}
                {include file="./sections/Flight/international/destination_search_box.tpl"}
                {include file="./sections/Flight/international/date_flight.tpl"}
                {include file="./sections/Flight/international/passenger_count.tpl"}
                <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search margin-center p-1">
                    <button type="button" class="btn theme-btn seub-btn b-0"
                            onclick="searchFlight('international')">
                        <span>جستجو</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M368 208A160 160 0 1 0 48 208a160 160 0 1 0 320 0zM337.1 371.1C301.7 399.2 256.8 416 208 416C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208c0 48.8-16.8 93.7-44.9 129.1L505 471c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L337.1 371.1z"/></svg>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>