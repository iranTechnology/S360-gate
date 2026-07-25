<div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col col_with_route">
    <div class="form-group origin_start">
        <input type="text"
               onclick='displayCityListExternal("origin" , event)'
               name="iata_origin_international"
               id="iata_origin_international"
               autocomplete='off'
               class="form-control  inputSearchForeign iata-origin-international-js"
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
            class="switch_routs"
            type="button" name="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M488 344H79.24l74.29-79.63C162.6 254.7 162.1 239.5 152.4 230.5C142.7 221.4 127.5 221.9 118.5 231.6l-112 120c-8.625 9.219-8.625 23.53 0 32.75l112 120C123.2 509.4 129.6 512 136 512c5.875 0 11.75-2.125 16.38-6.469c9.688-9.031 10.22-24.22 1.156-33.91L79.24 392H488c13.25 0 24-10.75 24-24S501.3 344 488 344zM24 168h408.8l-74.29 79.63c-9.062 9.688-8.531 24.88 1.156 33.91c9.656 9.094 24.88 8.562 33.91-1.156l112-120c8.625-9.219 8.625-23.53 0-32.75l-112-120C388.8 2.562 382.4 0 376 0c-5.875 0-11.75 2.125-16.38 6.469c-9.688 9.031-10.22 24.22-1.156 33.91L432.8 120H24C10.75 120 0 130.8 0 144S10.75 168 24 168z"/></svg>
    </button>
</div>