<div class="col-lg-12 col-xs-12 p-0">
    <div class="form-group select">
        <label for='number_of_passengers'>انتخاب تعداد مسافر</label>
        <select  name="number_of_passengers"
                 id="number_of_passengers"
                data-placeholder="انتخاب تعداد مسافر"
                 class="select2_in passengers-count-js  select2-hidden-accessible number-of-passengers-js number_2-of-passengers-js"
                 tabindex="-1" aria-hidden="true">
            <option value="">انتخاب کنید...</option>
            {for $i=1 to 9}
                <option value="{$i}">{$i} نفر</option>
            {/for}
        </select>
    </div>
</div>
<div class=" count-passenger count-passengers-js mt-3">
    <div class="col-lg-12 col-xs-12 col_search search_col p-0 nafarat-bime passenger-age-div-js">
        <div class="form-group select">
            <input type="text"
                   class="form-control passengers-age-js shamsiBirthdayCalendar search-box-inputs"
                   name="txt_birth_insurance1" autocomplete="off"
                   id="txt_birth_insurance1"
                   placeholder="تاریخ تولد مسافر 1">
        </div>
    </div>
</div>