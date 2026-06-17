<div class="__box__ tab-pane {if $active} active {/if}" id="Hotel">

    <div class="parent-head-search-box">
        <div class="head-search-box-detail">
          <div class="w-100 mr-2">
              <div class="d-flex gap-2 align-items-center" style="gap:5px">
                  <i class="fa-light fa-hotel head-search-box-icon"></i>
                  <span class="head-search-box-title">هتل</span>
              </div>
              <p class="mt-2 mb-0">رزرو هتل در ایران و سراسر جهان</p>
          </div>
            <div class="head-search-box-parent-img">
                <img class="head-search-box-img" src="project_files/images/hotel-vector.png" alt="">
            </div>
        </div>
    {include file="./sections/Hotel/international/btn_radio_internal_external.tpl"}
    <div id="internal_hotel" class="d_flex flex-wrap internal-hotel-js  mt-2 mt-lg-0">
        <form data-action="s360online.iran-tech.com/" name="gdsHotelLocal"
              target="_blank" id="internal_hotel_form" class="d_contents" method="post">
            {include file="./sections/Hotel/internal/destination_city.tpl"}
            {include file="./sections/Hotel/internal/check_in_date.tpl"}
            {include file="./sections/Hotel/internal/check_out_date.tpl"}
            {include file="./sections/Hotel/internal/count_passenger_room.tpl"}
            <div class="col-lg-1 col-md-3 col-sm-6 col-12 btn_s col_search margin-center p-1">
                <button type="button" onclick="searchInternalHotel()"
                        class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>
            </div>
        </form>
    </div>
    <div id="international_hotel" class="flex-wrap international-hotel-js  mt-2 mt-lg-0">
        <form target="_blank" data-action="https://s360online.iran-tech.com/" class="d_contents"  method="post" id="international_hotel_form">
            {include file="./sections/Hotel/international/destination_city.tpl"}
            {include file="./sections/Hotel/international/check_in_date.tpl"}
            {include file="./sections/Hotel/international/check_out_date.tpl"}
            {include file="./sections/Hotel/international/count_passenger_room.tpl"}
            <div class="col-lg-1 col-md-3 col-sm-6 col-12 btn_s col_search margin-center p-1">
                <input type="hidden" id="nights_hotel" name="nights_hotel" value="" placeholder='تاریخ خروج' class='nights-hotel-js'>

                <button onclick="searchInternationalHotel()" type="button"  class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>
            </div>
        </form>
    </div>
    <input type='hidden' id="type_section" name="type_section" class="type-section-js" value="internal">
    </div>
</div>