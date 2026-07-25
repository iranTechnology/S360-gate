{assign var="routes_departure_flight_internal" value=$obj_main_page->cityDepartureFlightInternal(false)}{*if use customer's database argument is true*}

<div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search col_with_route">
    <div class="form-group">
        <div class="form-group origin_start">
            <input
                    onclick="displayCityList('origin')"
                    type="text" name="route_origin_internal"
                    id="route_origin_internal"
                    autocomplete='off'
                    class="form-control inputSearchLocal route_origin_internal-js"
                    placeholder="مبدأ ( شهر )">
            <input id="route_origin_internal"
                   class="origin-internal-js"
                   type="hidden"
                   placeholder="مبدأ"
                   data-border-red="#route_origin_internal"
                   value=""
                   name="route_origin_internal">
            <div id="list_airport_origin_internal"
                 class="resultUlInputSearch list-show-result list-origin-airport-internal-js">
            </div>
            <div id="list_origin_popular_internal"
                 class="resultUlInputSearch list-show-result list_popular_origin_internal-js">
            </div>
        </div>
    </div>
    <button onclick="reversRouteFlight('internal')"
            class="switch_routs"
            type="button"
            name="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
            <path d="M488 344H79.24l74.29-79.63C162.6 254.7 162.1 239.5 152.4 230.5C142.7 221.4 127.5 221.9 118.5 231.6l-112 120c-8.625 9.219-8.625 23.53 0 32.75l112 120C123.2 509.4 129.6 512 136 512c5.875 0 11.75-2.125 16.38-6.469c9.688-9.031 10.22-24.22 1.156-33.91L79.24 392H488c13.25 0 24-10.75 24-24S501.3 344 488 344zM24 168h408.8l-74.29 79.63c-9.062 9.688-8.531 24.88 1.156 33.91c9.656 9.094 24.88 8.562 33.91-1.156l112-120c8.625-9.219 8.625-23.53 0-32.75l-112-120C388.8 2.562 382.4 0 376 0c-5.875 0-11.75 2.125-16.38 6.469c-9.688 9.031-10.22 24.22-1.156 33.91L432.8 120H24C10.75 120 0 130.8 0 144S10.75 168 24 168z"/>
        </svg>
    </button>
</div>