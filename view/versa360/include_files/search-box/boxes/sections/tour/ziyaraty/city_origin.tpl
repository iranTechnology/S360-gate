{assign var="params" value=['type'=>'international' , 'category_id'=>'5' , 'like_category'=>'no']}
{assign var="cities" value=$obj_main_page->getOriginTourCities($params)}
<div class="col-lg-6 col-md-6 col-sm-6 col-12 col_search margin-bottom">
    <div class="form-group">
        <select data-placeholder=" شهر مبدا"
                name="tourOriginCityPortal_ziaraty"
                id="tourOriginCityPortal_ziaraty"
                onchange="getArrivalCitiesTour('ziaraty',this)"
                class="select2_in select2-hidden-accessible ziaraty-tour-origin-city-js"
                tabindex="-1"
                aria-hidden="true">
            <option value="">انتخاب کنید...</option>
            {foreach $cities as $city}
                <option value="{$city['id']}">{$city['name']}</option>
            {/foreach}
        </select>
        <input type="hidden" class="ziaraty" name="category_id" id="category_id" value="5">
    </div>
</div>
