<div class="col-lg-12 col-xs-12">
    <div class="form-group origin_start select">
        <label for='route_origin_internal'>مبدأ نام شهر یا فرودگاه</label>
        <input type="text"
               onclick='displayCityListExternal("origin" , event)'
               name="iata_origin_international"
               id="iata_origin_international"
               autocomplete='off'
               class="form-control  inputSearchForeign search-box-inputs iata-origin-international-js"
               placeholder="مبدأ (شهر,فرودگاه)">
        <input id="origin_international"
               class="origin-international-js"
               type="hidden" value=""
               data-border-red="#iata_origin_international"
               name="iata_origin_international">
        <div id="list_airport_origin_international"
             class="resultUlInputSearch list-show-result list-origin-airport-international-js">
        </div>
        <div id="list_origin_popular_external"
             class="resultUlInputSearch list-show-result list_popular_origin_external-js">
        </div>
    </div>
    <button onclick="reversDestination('international')"
            class="btn btn-block switch_routs"
            type="button" name="button">
        <i class="fas fa-exchange-alt"></i>
    </button>
</div>