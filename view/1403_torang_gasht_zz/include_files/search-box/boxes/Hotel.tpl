
<div class="tab-pane {if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Hotel' && $client['MainService'] eq 'Hotel'} active {/if} " id="Hotel"  role="tabpanel" aria-labelledby="hotel-tab">

    <div id="internal_hotel" class="internal-hotel-js">
        <form data-action="s360online.iran-tech.com/" name="gdsHotelLocal"
              target="_blank" id="internal_hotel_form" class="d_contents" method="post">
            {include file="./sections/hotel/internal/destination_city.tpl"}
            {include file="./sections/hotel/internal/check_in_date.tpl"}
            {include file="./sections/hotel/internal/check_out_date.tpl"}
            {include file="./sections/hotel/internal/count_passenger_room.tpl"}
            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search">
                <input type="hidden" id="nights_hotel" name="nights_hotel" value="" placeholder='تاریخ خروج' class='nights-hotel-js'>

                <button type="button" onclick="searchInternalHotel()"
                        class="button height_C w-100"><span>جستجو</span></button>
            </div>
        </form>
    </div>
    <input type='hidden' id="type_section" name="type_section" class="type-section-js" value="internal">
</div>