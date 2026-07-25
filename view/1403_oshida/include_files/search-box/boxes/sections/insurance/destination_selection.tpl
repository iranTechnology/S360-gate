<div class="col-lg-12 col-xs-12 p-0">
    <div class="form-group select">
        <label for='insurance_destination_country'>نام کشور مقصد</label>
        <select data-placeholder="نام کشور مقصد"
                name="insurance_destination_country"
                id="insurance_destination_country"
                class="default-select2 select2-hidden-accessible search-box-inputs insurance-destination-country-js">
            <option value="">انتخاب کنید...</option>
            {foreach $countries as $country}
                <option value="{$country['abbr']}">{$country['persian_name']}({$country['abbr']})</option>
            {/foreach}
        </select>
    </div>
</div>