<div class="col-lg-6 col-md-4 col-sm-6 col-12 col_search p-sm-3 p-1">
<div class="form-group">
        <select data-placeholder="تاریخ مسافرت"
                name="tourDeptDateInternational"
                id="tourDeptDateInternational"
                class="select2_in DeptYearOnChange_js select2-hidden-accessible international-date-travel-tour-js"
                tabindex="-1" aria-hidden="true">
         {assign var="date_tour" value=$obj_main_page->datesTour()}
         {foreach $date_tour as $date}
          <option value="{$date['value']}">{$date['text']}</option>
         {/foreach}
        </select>
    </div>
</div>
