{assign var="countries" value=$obj_main_page->countryInsurance()}
<div class="__box__ tab-pane {if $active} active {/if}" id="Insurance">
    <div class="d-flex flex-wrap gap-search-box">
        <div class="empty-div"></div>
        <div class="d-flex flex-wrap w-100">
            <form class="d_contents" data-action="://s360online.iran-tech.com/" id="gdsInsurance" method="post" name="gdsInsurance" target="_blank">
                <div class="col-lg-3 col-md-4 col-sm-6 col-12 col_search p-1">
                    <div class="parent-input-search-box">
                        <i class="parent-svg-input-search-box">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path></svg>
                        </i>
                        <div class="caption-input-search-box">مبدأ خود را وارد کنید</div>
                        <select aria-hidden="true" class="select2_in select2-hidden-accessible insurance-destination-country-js" data-placeholder="نام کشور مقصد" id="insurance_destination_country" name="insurance_destination_country" tabindex="-1">
                            <option value="">##ChoseOption##...</option>
                            {foreach $countries as $country}
                                <option value="{$country['abbr']}">{$country['persian_name']}({$country['abbr']})</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6 col-12 col_search p-1">
                    <div class="parent-input-search-box">
                        <i class="parent-svg-input-search-box">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path></svg>
                        </i>
                        <div class="caption-input-search-box">انتخاب مدت سفر</div>
                        <select aria-hidden="true" class="select2_in travel-time-js select2-hidden-accessible" data-placeholder="انتخاب مدت سفر" id="travel_time" name="travel_time" tabindex="-1">
                            <option value="">##ChoseOption##...</option>
                            {assign var="durations" value=['5','7','8','15','23','31','45','62','92','182','186','365']}
                            {foreach $durations as $days}
                                <option value="{$days}">##untill## {$days} ##Day##</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-12 col_search p-1">
                    <div class="parent-input-search-box">
                        <i class="parent-svg-input-search-box">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"></path></svg>
                        </i>
                        <div class="caption-input-search-box">انتخاب تعداد مسافران</div>
                        <select aria-hidden="true" class="select2_in passengers-count-js select2-hidden-accessible number-of-passengers-js" data-placeholder="انتخاب تعداد مسافر" id="number_of_passengers" name="number_of_passengers" tabindex="-1">
                            <option value="">##ChoseOption##...</option>
                            {for $i=1 to 9}
                                <option value="{$i}">{$i} ##People##</option>
                            {/for}
                        </select>
                    </div>
                </div>
                <div class="count-passenger count-passengers-js p-1">
                    <div class="col-lg-2 col-md-4 col-sm-6 col-12 col_search search_col nafarat-bime passenger-age-div-js p-1">
                        <div class="parent-input-search-box">
                            <i class="parent-svg-input-search-box">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
                            </i>
                            <div class="caption-input-search-box">تاریخ تولد مسافران</div>
                            <input autocomplete="off" class=" passengers-age-js shamsiBirthdayCalendar" id="txt_birth_insurance1" name="txt_birth_insurance1" placeholder="تاریخ تولد مسافر 1" type="text"/>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6 col-12 col_search search_btn_insuranc p-1">
                    <button class="btn theme-btn seub-btn b-0" onclick="searchInsurance()" type="button">
<span>
 جستجو
</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
