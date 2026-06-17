{*{assign var='country' value=$obj_main_page->getVisaTypeSpecialCountry()}*}
{*{var_dump($country)}*}
<div class="col-lg-11 col-md-12 col-sm-12 col-12 col_search p-1">
    <div class="">
{*        <i class="fas fa-map-marker-alt fa-lg mr-2"></i>*}
        <select data-placeholder=" جستجوی نام کشور"
                name="visa_destination" id="visa_destination"
                class="select2_in  select2-hidden-accessible active-visa-js border-0"
                tabindex="-1" aria-hidden="true">
            <option value="">جستجوی نام کشور</option>
        </select>
    </div>
</div>