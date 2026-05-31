<div class="col-lg-6 col-md-4 col-sm-6 col-12 col_search p-sm-3 p-1">
<div class="form-group">
  <select data-placeholder="مبدأ ( شهر )"
          name="tourOriginCityPortal"
          id="tourOriginCityPortal"
          onchange="getArrivalCitiesTour('international',this)"
          class="select2_in select2-hidden-accessible international-tour-origin-city-js"
          tabindex="-1"
          aria-hidden="true">
   {assign var="params" value=['type'=>'international']}
   {assign var="cities_international" value=$obj_main_page->getOriginTourCities($params)}
   <option value="">انتخاب کنید...</option>
   {foreach $cities_international as $city}
    <option value="{$city['id']}">{$city['name']}</option>
   {/foreach}
  </select>
 </div>
</div>
