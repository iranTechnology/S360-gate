<div class="col-md-12 col-xs-12">
    <div class="form-group origin_start select">
        <span class="destnition_start">
        <label for='route_destination_internal'>مقصد نام شهر یا فرودگاه </label>

        <input type="text"
               onclick="displayCityList('destination')"
               autocomplete='off'
               id="route_destination_internal"
               name="route_destination_internal"
               class="inputSearchForeign form-control route_destination_internal-js search-box-inputs"
               placeholder="مقصد نام شهر یا فرودگاه">
        </span>
        <input id="route_destination_internal"
               class="destination-internal-js"
               type="hidden"
               value=""
               placeholder="مقصد نام شهر یا فرودگاه"
               data-border-red="#route_destination_internal"
               name="route_destination_internal">
        <div id="list_destination_airport_internal"
             class="resultUlInputSearch list-show-result list-destination-airport-internal-js">
        </div>
        <div id="list_destination_popular_internal"
             class="resultUlInputSearch list-show-result list_popular_destination_internal-js">
        </div>
    </div>
</div>