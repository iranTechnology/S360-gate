
<div class="col-lg-6 col-sm-6 col-12 col_search col_with_route p-sm-3 p-1">
    <div class="form-group">
        <div class="form-group origin_start">

            <input autocomplete="off" class="form-control inputSearchLocal route_origin_internal-js" id="route_origin_internal" name="route_origin_internal" onclick="displayCityList('origin')" placeholder="مبدأ ( شهر )" type="text"/>
            <input class="origin-internal-js" data-border-red="#route_origin_internal" id="route_origin_internal" name="route_origin_internal" placeholder="مبدأ" type="hidden" value=""/>
            <div class="resultUlInputSearch list-show-result list-origin-airport-internal-js" id="list_airport_origin_internal">
            </div>
            <div class="resultUlInputSearch list-show-result list_popular_origin_internal-js" id="list_origin_popular_internal">
            </div>
        </div>
    </div>
    <button
            onclick="reversRouteFlight('internal')"
            class="switch_routs"
            type="button"
            name="button"
    >
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
            <!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. -->
            <path d="M244 7c-11.7-9.3-28.3-9.3-40 0L44 135c-13.8 11-16 31.2-5 45s31.2 16 45 5L224 73 364 185c13.8 11 33.9 8.8 45-5s8.8-33.9-5-45L244 7zM404 377c13.8-11 16-31.2 5-45s-31.2-16-45-5L224 439 84 327c-13.8-11-33.9-8.8-45 5s-8.8 33.9 5 45L204 505c11.7 9.3 28.3 9.3 40 0L404 377z"/>
        </svg>
    </button>
</div>