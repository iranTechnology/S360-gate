{*{assign var='country' value=$obj_main_page->getVisaTypeSpecialCountry()}*}
{*{var_dump($country)}*}
<div class="col-lg-10 col-md-10 col-sm-8 col-12 col_search p-1">
    <div class="parent-input-search-box">
        <select data-placeholder=" ##Destination## ( ##Country## )"
                name="visa_destination" id="visa_destination"
                class="select2_in  select2-hidden-accessible active-visa-js"
                tabindex="-1" aria-hidden="true">
            <option value="">##ChoseOption##...</option>
        </select>
    </div>
</div>