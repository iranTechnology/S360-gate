{assign var="date_tour" value=$obj_main_page->datesTour()}
<div class="col-lg-6 col-md-6 col-sm-6 col-12 col_search">
    <div class="form-group">
        <i class="fal fa-calendar-alt new-icon-data"></i>
        <select data-placeholder="تاریخ مسافرت"
                name="tourDeptDateLocal_ziaraty"
                id="tourDeptDateLocal_ziaraty"
                class="select2_in DeptYearOnChange_js form-control select2-hidden-accessible
                 ziaratiy-date-travel-tour-js"
                tabindex="-1" aria-hidden="true">
            <option value="">انتخاب کنید...</option>

            {foreach $date_tour as $date}
                <option value='{$date['value']}'>{$date['text']}</option>
            {/foreach}

        </select>

    </div>
</div>
