
<div class="tab-pane   {if  $smarty.const.GDS_SWITCH eq 'page'} active {/if} " id="{$client['MainService']}" role="tabpanel" aria-labelledby="{$client['MainService']}-tab">
    <div id="hotel_khareji" class="row flex-wrap international-hotel-js">
        <div class="empty-box"></div>
        <form target="_blank" data-action="https://s360online.iran-tech.com/" class="d_contents"  method="post" id="international_hotel">
            {include file="./sections/hotel/international/destination_city.tpl"}
            {include file="./sections/hotel/international/check_in_date.tpl"}
            {include file="./sections/hotel/international/check_out_date.tpl"}
            {include file="./sections/hotel/international/count_passenger_room.tpl"}

            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search margin-center p-1">
                <input type="hidden" id="nights_hotel" name="nights_hotel" class='nights-hotel-js'>
                <button  type="button" onclick="searchInternationalHotel()"
                         class="btn theme-btn seub-btn b-0">
                    <span class="span-search"> جستجو </span>
                    <span class="icon-search">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                                </span>
                </button>

            </div>
        </form>
    </div>
    <input type='hidden' id="type_section" name="type_section" class="type-section-js" value="internal">
</div>