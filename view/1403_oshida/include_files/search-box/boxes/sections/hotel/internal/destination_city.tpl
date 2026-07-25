<div class="col-lg-12 col-xs-12">
    <div class="form-group destination_start select">
        <label for='route_origin_internal'>نام شهر</label>
        <div class="s-u-in-out-wrapper raft raft-change change-bor w-100">
            <input id="autoComplateSearchIN" name="autoComplateSearchIN"
                   class="inputSearchForeign w-100 form-control search-box-inputs" type="text" value=""
                   placeholder='##Selection## ##City##'
                   autocomplete="off"
                   onkeyup="searchCity('hotel')"
                   onclick="openBoxPopular('hotel')">
            <input type='hidden' id='autoComplateSearchIN_hidden' value='' placeholder='##Selection## ##City##'>
            <input type='hidden' id='autoComplateSearchIN_hidden_en' value='' placeholder='##Selection## ##City##'>
            <ul id="listSearchCity" class="ul-inputSearch-externalHotel displayiN"></ul>
        </div>

    </div>
</div>