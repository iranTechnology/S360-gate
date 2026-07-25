<div class="col-md-12 col-xs-12">
    <div class="form-group mb-0">
        <div class="form-group origin_start select">
            <label for='route_origin_internal'>مبدأ نام شهر یا فرودگاه</label>
            <input
                   onclick="displayCityList('origin')"
                   type="text" name="route_origin_internal"
                   id="route_origin_internal"
                   autocomplete='off'
                   class="form-control inputSearchLocal search-box-inputs route_origin_internal-js"
                   placeholder="مبدا نام شهر یا فرودگاه">
            <input id="route_origin_internal"
                   class="origin-internal-js"
                   type="hidden"
                   placeholder="مبدا نام شهر یا فرودگاه"
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
            class="btn btn-block switch_routs"
            type="button"
            name="button">
        <i class="fas fa-exchange-alt"></i>
    </button>
</div>