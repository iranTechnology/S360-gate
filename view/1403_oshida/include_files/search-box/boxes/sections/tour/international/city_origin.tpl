{assign var="params" value=['type'=>'international']}
{assign var="cities" value=$obj_main_page->getOriginTourCities($params)}
<div class="col-lg-12 col-xs-12">
    <div class="form-group select">
        <select data-placeholder=" شهر مبدا"
                name="tourOriginCityPortal"
                id="tourOriginCityPortal"
                onchange="getArrivalCitiesTour('international',this)"
                class="select2_in search-box-inputs select2-hidden-accessible international-tour-origin-city-js"
                tabindex="-1"
                aria-hidden="true">
            <option value="">انتخاب کنید...</option>
            {foreach $cities as $city}
                <option value="{$city['id']}">{$city['name']}</option>
            {/foreach}
        </select>
    </div>
</div>