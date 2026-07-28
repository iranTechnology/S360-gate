<div class="tab-pane {if $client['order_number'] eq '1' || ($smarty.const.GDS_SWITCH eq 'page' && $active_tab eq $client['MainService'])}active{/if}"
     id="{$client['MainService']}" role="tabpanel" aria-labelledby="{$client['MainService']}-tab">
    {include file="./sections/hotel/international/btn_radio_internal_external.tpl"}

    <div id="internal_hotel" class="internal-hotel-js">
        <form data-action="s360online.iran-tech.com/" name="gdsHotelLocal"  id="internal_hotel_form" class="d_contents" method="post">
            {include file="./sections/hotel/internal/destination_city.tpl"}
            {include file="./sections/hotel/internal/check_in_date.tpl"}
            {include file="./sections/hotel/internal/check_out_date.tpl"}
            {include file="./sections/hotel/internal/count_passenger_room.tpl"}
            <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search">
                <button type="button" onclick="searchInternalHotel()"
                        class="btn button w-100 h-100 seub-btn b-0">
                    <span>جستجو</span>
                </button>
            </div>
        </form>
    </div>
    <div id="international_hotel" class="international-hotel-js">
        <form data-action="https://s360online.iran-tech.com/" class="d_contents"  method="post" id="international_hotel_form">
            {include file="./sections/hotel/international/destination_city.tpl"}
            {include file="./sections/hotel/international/check_in_date.tpl"}
            {include file="./sections/hotel/international/check_out_date.tpl"}
            {include file="./sections/hotel/international/count_passenger_room.tpl"}
            <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search">
                <input type="hidden" id="nights_hotel" name="nights_hotel" value="" placeholder='تاریخ خروج' class='nights-hotel-js'>
                <button onclick="searchInternationalHotel()" type="button"
                        class="btn button w-100 h-100 seub-btn b-0">
                    <span>جستجو</span>
                </button>
            </div>
        </form>
        <input type='hidden' id="type_section" name="type_section" class="type-section-js" value="internal">

    </div>
</div>
