{assign var="cities" value=$obj_main_page->getOriginTourCities()}
<div class="col-lg-4 col-md-6 col-sm-6 col-12 col_search p-1">
    <div class="form-group">
        <select data-placeholder="##From##"
                onchange="getArrivalCitiesTour('internal',this)"
                name="internal_origin_tour" id="internal_origin_tour"
                class="select2_in select2-hidden-accessible internal-origin-tour-js"
                tabindex="-1" aria-hidden="true">
            <option value="">Select ...</option>
            {foreach $cities as $city}
                <option value="{$city['id']}">{$city['name_en']}</option>
            {/foreach}
        </select>
    </div>
</div>