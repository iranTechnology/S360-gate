{assign var="cities" value=$obj_main_page->getOriginTourCities()}
<div class="col-lg-12 col-xs-12">
    <div class="form-group select">
        <select data-placeholder="نام شهر مبدأ" onchange="getArrivalCitiesTour('internal',this)" name="internal_origin_tour" id="internal_origin_tour" class="select2_in search-box-inputs select2-hidden-accessible internal-origin-tour-js" tabindex="-1" aria-hidden="true">
            <option value="">انتخاب کنید...</option>
            {foreach $cities as $city}
                <option value="{$city['id']}">{$city['name']}</option>
            {/foreach}
        </select>
    </div>
</div>