{assign var="cities" value=$obj_main_page->getOriginTourCities(['get_origin' =>true])}
<div class="col-lg-6 col-md-6 col-sm-6 col-12 col_search margin-bottom">
    <div class="form-group">
        <select data-placeholder="نام شهر مبدأ"
                onchange="getArrivalCitiesTour('internal',this)"
                name="internal_origin_tour" id="internal_origin_tour"
                class="select2_in select2-hidden-accessible internal-origin-tour-js"
                tabindex="-1" aria-hidden="true">
            <option value="">انتخاب کنید...</option>
            {foreach $cities as $city}
                <option value="{$city['id']}">{$city['name']}</option>
            {/foreach}
        </select>
    </div>
</div>
