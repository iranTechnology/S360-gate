<div class="col-lg-6 col-sm-6 col-12 col_search search_col col_with_route p-sm-3 p-1">
    <div class="form-group origin_start">
        <input
                type="text"
                onclick='displayCityListExternal("origin" , event)'
                name="iata_origin_international"
                id="iata_origin_international"
                autocomplete="off"
                class="form-control inputSearchForeign iata-origin-international-js"
                placeholder="مبدأ (شهر,فرودگاه)"
        />
        <input
                id="origin_international"
                class="origin-international-js"
                type="hidden"
                value=""
                data-border-red="#iata_origin_international"
                name="iata_origin_international"
        />
        <div
                id="list_airport_origin_international"
                class="resultUlInputSearch list-show-result list-origin-airport-international-js"
        ></div>
        <div
                id="list_origin_popular_external"
                class="resultUlInputSearch list-show-result list_popular_origin_external-js"
        ></div>
    </div>
    <button
            onclick="reversDestination('international')"
            class="switch_routs"
            type="button"
            name="button"
    >
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
            <!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. -->
            <path d="M244 7c-11.7-9.3-28.3-9.3-40 0L44 135c-13.8 11-16 31.2-5 45s31.2 16 45 5L224 73 364 185c13.8 11 33.9 8.8 45-5s8.8-33.9-5-45L244 7zM404 377c13.8-11 16-31.2 5-45s-31.2-16-45-5L224 439 84 327c-13.8-11-33.9-8.8-45 5s-8.8 33.9 5 45L204 505c11.7 9.3 28.3 9.3 40 0L404 377z" />
        </svg>
    </button>
</div>