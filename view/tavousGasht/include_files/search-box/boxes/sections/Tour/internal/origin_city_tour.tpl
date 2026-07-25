<div class="col-lg-6 col-md-4 col-sm-6 col-12 col_search p-sm-3 p-1">
    <div class="form-group">
        <select data-placeholder="مبدأ ( شهر )"
                onchange="getArrivalCitiesTour('internal',this)"
                name="internal_origin_tour" id="internal_origin_tour"
                class="select2_in select2-hidden-accessible internal-origin-tour-js"
                tabindex="-1" aria-hidden="true">
            {assign var="cities" value=$obj_main_page->getOriginTourCities()}
            <option value="">انتخاب کنید...</option>
            {foreach $cities as $city}
                <option value="{$city['id']}">{$city['name']}</option>
            {/foreach}
        </select>
    </div>
</div>
