
{assign var="type_data" value=['is_active'=>1 , 'limit' =>30 , 'order' =>'ASC']}
{assign var='listTypeCar' value=$obj_main_page->getTypeCar($type_data)}
{*{$listTypeCar|var_dump}*}
<div class="col-lg-6 col-md-6 col-sm-6 col-12 col_search p-sm-3 p-1">
    <div class="form-group">
        <select data-placeholder="##TypeCar##"
                name="type_rent_car"
                id="type_rent_car"
                class="select2_in  select2-hidden-accessible type_rent_car-js"
                tabindex="-1" aria-hidden="true">
            <option value="">##ChoseOption##...</option>
            {foreach $listTypeCar as $car}
                <option value="{$car['id']}">{$car['title']}</option>
            {/foreach}
        </select>
    </div>
</div>