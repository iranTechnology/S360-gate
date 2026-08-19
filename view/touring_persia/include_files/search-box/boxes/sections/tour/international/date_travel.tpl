{assign var="date_tour" value=$obj_main_page->datesTour()}
<div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">
    <div class="form-group">
        <select placeholder="Travel Date"
                name="tourDeptDateLocal"
                id="tourDeptDateLocal"
                class="select2_in DeptYearOnChange_js select2-hidden-accessible international-date-travel-tour-js"
                tabindex="-1" aria-hidden="true">
            {foreach $date_tour as $date}
                <option value='{$date['value']}'>{$date['text']}</option>
            {/foreach}

        </select>
    </div>
</div>