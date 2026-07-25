{assign var="date_tour" value=$obj_main_page->datesTour()}
<div class="col-lg-12 col-xs-12">
    <div class="form-group select">
        <select data-placeholder="تاریخ مسافرت" name="tourDeptDateLocal"
                id="tourDeptDateLocal"
                class="select2_in DeptYearOnChange_js w-100 search-box-inputs select2-hidden-accessible internal-date-travel-tour-js"
                tabindex="-1" aria-hidden="true">
            <option value="">انتخاب کنید...</option>

            {foreach $date_tour as $date}
                <option value='{$date['value']}'>{$date['text']}</option>
            {/foreach}

        </select>
    </div>
</div>