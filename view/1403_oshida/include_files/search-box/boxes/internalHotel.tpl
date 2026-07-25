<div class="tab-pane {if $client['order_number'] eq '1'}active{/if}" id="internalHotel">

    <div id="internal_hotel" class="d_flex flex-wrap internal-hotel-js">
        <form data-action="s360online.iran-tech.com/" name="gdsHotelLocal" target="_blank" id="internal_hotel_form" class="d_contents" method="post">
            {include file="./sections/hotel/internal/destination_city.tpl"}
            {include file="./sections/hotel/internal/check_in_date.tpl"}
            {include file="./sections/hotel/internal/check_out_date.tpl"}
            {include file="./sections/hotel/internal/count_passenger_room.tpl"}

            <div class="col-md-12 col-xs-12">
                <div class="search_btn_div">
                    <input type="hidden" id="nights_hotel" name="nights_hotel" value="" placeholder='تاریخ خروج' class='nights-hotel-js'>
                    <button type="button" class="button  search_button" onclick="searchInternalHotel()">جستجوی هتل
                    </button>
                </div>
            </div>

        </form>
    </div>

    <input type='hidden' id="type_section" name="type_section" class="type-section-js" value="internal">
</div>