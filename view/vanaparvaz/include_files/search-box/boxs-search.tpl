{*{assign var="obj_main_page" value=$obj_main_page }*}
{*                        {foreach $info_access_client_to_service as $key=>$client}*}
{*                            {if $obj_main_page->newClassTabsSearchBox($client['MainService'])}*}
{*                                {if  $smarty.const.GDS_SWITCH eq 'mainPage'}*}
{*                                    {include file="./boxes/{$client['MainService']}.tpl" client=$client}*}
{*                                 {else}*}
{*                                    {if $active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight' || $active_tab eq $client['MainService']}*}
{*                                        {include file="./boxes/{$client['MainService']}.tpl" client=$client active=true}*}
{*                                    {/if}*}
{*                                {/if}*}
{*                            {/if}*}
{*                        {/foreach}*}
{*                        *}
{*                        *}
{**}
    <div class="__box__ tab-pane active" id="Tour">
        {include file="./boxes/sections/Tour/internal/btn_radio_internal_external.tpl"}

        <div id="internal_tour" class="_internal internal-tour-js">
            <div class="col-12">
                <div class="row">
                    <form data-action="https://s360online.iran-tech.com/" class="d_contents" method="post"
                          name="gdsTourLocal" id="gdsTourLocal" target="_blank">
                        {include file="./boxes/sections/Tour/internal/origin_city_tour.tpl"}
                        {include file="./boxes/sections/Tour/internal/destination_city_tour.tpl"}
                        {include file="./boxes/sections/Tour/internal/date_teravel.tpl"}
                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search p-1">
                            <button type="button" onclick="searchInternalTour()" class="btn theme-btn seub-btn b-0">
                                <span>جستجو</span></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="international_tour" class="_external international-tour-js">
            <div class="col-12">
                <div class='row'>
                    <form data-action="https://s360online.iran-tech.com/" class="d_contents" method="post"
                          name="gdsPortalLocal" id="gdsPortalLocal" target="_blank">
                        {include file="./boxes/sections/Tour/international/country_origin.tpl"}
                        {include file="./boxes/sections/Tour/international/city_origin.tpl"}
                        {include file="./boxes/sections/Tour/international/country_destination.tpl"}
                        {include file="./boxes/sections/Tour/international/city_destination.tpl"}
                        {include file="./boxes/sections/Tour/international/date_travel.tpl"}
                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search p-1">
                            <button type="button" onclick="searchInternationalTour()" class="btn theme-btn seub-btn b-0">
                                <span>جستجو</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="__box__ tab-pane" id="Bus">
        <div class="col-md-12 col-12">
            <div class="row">
                <form data-action="https://s360online.iran-tech.com/" method="post" target="_blank" class="d_contents" id="gds_local_bus" name="gds_local_bus">
                    {include file="./boxes/sections/Bus/origin_selection.tpl"}
                    {include file="./boxes/sections/Bus/destination_selection.tpl"}
                    {include file="./boxes/sections/Bus/date_bus.tpl"}

                    <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search p-1">
                        <button type="button" class="btn theme-btn seub-btn b-0 "
                                onclick="searchBus()"><span>جستجو</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--                           <div class="__box__ tab-pane" id="Hotel">-->
    <!--&lt;!&ndash;                               <div class="radios switches">&ndash;&gt;-->
    <!--&lt;!&ndash;                                   <div class="switch">&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <input autocomplete="off" type="radio" class="switch-input switch-input-hotel-js"  name="btn_switch_Hotel" value="0" id="btn_switch_Hotel_international">&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <label for="btn_switch_Hotel_international" class="switch-label switch-label-on">خارجی</label>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <input checked="" autocomplete="off" type="radio" class="switch-input switch-input-hotel-js" name="btn_switch_Hotel" value="1" id="btn_switch_Hotel_internal">&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <label for="btn_switch_Hotel_internal"  class="switch-label switch-label-off">داخلی</label>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <span class="switch-selection"></span>&ndash;&gt;-->
    <!--&lt;!&ndash;                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                               <div id="internal_hotel" class="d_flex flex-wrap internal-hotel-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                   <form data-action="s360online.iran-tech.com/" name="gdsHotelLocal"&ndash;&gt;-->
    <!--&lt;!&ndash;                                         target="_blank" id="internal_hotel_form" class="d_contents" method="post">&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group destination_start">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <div class="s-u-in-out-wrapper raft raft-change change-bor w-100">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <input id="autoComplateSearchIN" name="autoComplateSearchIN"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                          class="inputSearchForeign w-100 form-control" type="text" value=""&ndash;&gt;-->
    <!--&lt;!&ndash;                                                          placeholder='انتخاب شهر'&ndash;&gt;-->
    <!--&lt;!&ndash;                                                          autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                          onkeyup="searchCity('hotel')"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                          onclick="openBoxPopular('hotel')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <input type='hidden' id='autoComplateSearchIN_hidden' value='' placeholder='انتخاب شهر'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <input type='hidden' id='autoComplateSearchIN_hidden_en' value='' placeholder='انتخاب شهر'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <ul id="listSearchCity" class="ul-inputSearch-externalHotel displayiN"></ul>&ndash;&gt;-->
    <!--&lt;!&ndash;                                               </div>&ndash;&gt;-->

    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <input type="text"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      class="init-shamsi-datepicker form-control check-in-date-js"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      name="startDateForHotelLocal"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      id="startDateForHotelLocal"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      placeholder="تاریخ ورود"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      data-type='internal'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <input type="text"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      class="init-shamsi-return-datepicker form-control check-out-date-internal-js"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      name="endDateForHotelLocal"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      id="endDateForHotelLocal"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      placeholder="تاریخ خروج"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      data-type='internal'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <div class="hotel_passenger_picker internal-hotel-passenger-picker-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <ul onclick="openCountPassenger('internal')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <li><em class="number_adult internal-number-adult-js">2</em> بزرگسال ،</li>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <li class="li_number_baby"><em class="number_baby internal-number-child-js">0</em> کودک ،</li>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <li><em class="number_room_po internal-number-room-js">1</em>اتاق</li>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   </ul>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <div class="myhotels-rooms internal-my-hotels-rooms-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <div class="hotel_select_room internal-hotel-select-room-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           <div class="myroom-hotel-item internal-my-room-hotel-item-js" data-roomnumber="1" >&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <div class="myroom-hotel-item-title internal-my-room-hotel-item-title-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                <span class="close d-none" onclick="itemsRoom($(this),'internal')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                    <i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">&lt;!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;&gt;<path d="M144 400C144 408.8 136.8 416 128 416C119.2 416 112 408.8 112 400V176C112 167.2 119.2 160 128 160C136.8 160 144 167.2 144 176V400zM240 400C240 408.8 232.8 416 224 416C215.2 416 208 408.8 208 400V176C208 167.2 215.2 160 224 160C232.8 160 240 167.2 240 176V400zM336 400C336 408.8 328.8 416 320 416C311.2 416 304 408.8 304 400V176C304 167.2 311.2 160 320 160C328.8 160 336 167.2 336 176V400zM310.1 22.56L336.9 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H416V432C416 476.2 380.2 512 336 512H112C67.82 512 32 476.2 32 432V96H16C7.164 96 0 88.84 0 80C0 71.16 7.164 64 16 64H111.1L137 22.56C145.8 8.526 161.2 0 177.7 0H270.3C286.8 0 302.2 8.526 310.1 22.56V22.56zM148.9 64H299.1L283.8 39.52C280.9 34.84 275.8 32 270.3 32H177.7C172.2 32 167.1 34.84 164.2 39.52L148.9 64zM64 432C64 458.5 85.49 480 112 480H336C362.5 480 384 458.5 384 432V96H64V432z"></path></svg>&ndash;&gt;-->
    <!--&lt;!&ndash;                                    </i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                </span>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   اتاق اول&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <div class="myroom-hotel-item-info internal-my-room-hotel-item-info-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">&ndash;&gt;-->

    <!--&lt;!&ndash;                                                                       <h6>بزرگسال</h6>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       (بزرگتر از ۱۲ سال)&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       <div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i class="addParent internal-add-number-adult-js hotelroom-minus plus-hotelroom-bozorgsal" onclick="addNumberAdult('internal',this)">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">&lt;!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;&gt;<path d="M432 256C432 269.3 421.3 280 408 280h-160v160c0 13.25-10.75 24.01-24 24.01S200 453.3 200 440v-160h-160c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h160v-160c0-13.25 10.75-23.99 24-23.99S248 58.75 248 72v160h160C421.3 232 432 242.8 432 256z"></path></svg>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           </i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <input readonly="" autocomplete="off" class="countParent internal-count-parent-js" min="0" value="2" max="5" type="number" name="adult1" id="adult1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i class="minusParent internal-minus-number-adult-js hotelroom-minus minus-hotelroom-bozorgsal" onclick="minusNumberAdult('internal',this)">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">&lt;!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;&gt;<path d="M432 256C432 269.3 421.3 280 408 280H40c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h368C421.3 232 432 242.8 432 256z"></path></svg>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           </i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       <h6>کودک</h6>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       (کوچکتر از ۱۲ سال)&ndash;&gt;-->

    <!--&lt;!&ndash;                                                                       <div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i class="addChild internal-add-number-child-js hotelroom-minus plus-hotelroom-koodak" onclick="addNumberChild('internal',this)">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">&lt;!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;&gt;<path d="M432 256C432 269.3 421.3 280 408 280h-160v160c0 13.25-10.75 24.01-24 24.01S200 453.3 200 440v-160h-160c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h160v-160c0-13.25 10.75-23.99 24-23.99S248 58.75 248 72v160h160C421.3 232 432 242.8 432 256z"></path></svg>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           </i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <input readonly="" class="countChild internal-count-child-js" autocomplete="off" min="0" value="0" max="5" type="number" name="child1" id="child1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i class="minusChild internal-minus-number-child-js hotelroom-minus minus-hotelroom-koodak" onclick="minusNumberChild('internal',this)">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">&lt;!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;&gt;<path d="M432 256C432 269.3 421.3 280 408 280H40c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h368C421.3 232 432 242.8 432 256z"></path></svg>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           </i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   <div class="tarikh-tavalods internal-birth-days-js"></div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <div class="btn_group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           <div class="btn_add_room internal-btn-add-room-js" onclick="addRoom('internal')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <i class="fal fa-plus"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               افزودن اتاق&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           <div class="close_room btn_close_box internal-close-room-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <i class="fal fa-check"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               تایید&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       </div>&ndash;&gt;-->

    <!--&lt;!&ndash;                                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->

    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-2 col-md-3 col-sm-6 col-12 btn_s col_search margin-center p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <button type="button" onclick="searchInternalHotel()"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                   </form>&ndash;&gt;-->
    <!--&lt;!&ndash;                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                               <div id="international_hotel" class="flex-wrap international-hotel-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                   <form target="_blank" data-action="https://s360online.iran-tech.com/" class="d_contents"  method="post" id="international_hotel_form">&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group destination_start">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <div class="inputSearchForeign-box inputSearchForeign-pad_Fhotel w-100">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <div class="s-u-in-out-wrapper raft raft-change change-bor">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <input id="autoComplateSearchIN_2" name="autoComplateSearchIN"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                              class="inputSearchForeign w-100 form-control" type="text" value=""&ndash;&gt;-->
    <!--&lt;!&ndash;                                                              placeholder='انتخاب شهر'&ndash;&gt;-->
    <!--&lt;!&ndash;                                                              autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                              onkeyup="searchCity('externalHotel')"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                              onclick="openBoxPopular('externalHotel')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <input id="destination_country" name="destination_country"type="hidden" value="" placeholder='انتخاب شهر'>&ndash;&gt;-->

    <!--&lt;!&ndash;                                                       <input class="destination-country-js" name="destination-country-js"type="hidden" value="" placeholder='انتخاب شهر'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <input class="destination-city-js" name="destination-city-js"type="hidden" value="" placeholder='انتخاب شهر'>&ndash;&gt;-->

    <!--&lt;!&ndash;                                                       <input id="destination_city_foreign" name="destination_city_foreign"type="hidden" value="" placeholder='انتخاب شهر'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <input id="destination_city" name="destination_city"type="hidden" value="" placeholder='انتخاب شهر'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <ul id="listSearchCity_2" class="ul-inputSearch-externalHotel displayiN"></ul>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <input readonly="" type="text"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      class="init-shamsi-datepicker form-control check-in-date-international-js"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      name="startDateForHotelInternational" id="startDateForExternalHotelInternational"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      placeholder="تاریخ ورود"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      data-type='international'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <input readonly="" type="text"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      class="init-shamsi-return-datepicker form-control check-out-date-international-js"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      name="endDateForExternalHotelInternational"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      id="endDateForExternalHotelInternational"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      placeholder="تاریخ خروج"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                      data-type='international'>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <div class="form-group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                               <div class="hotel_passenger_picker international-hotel-passenger-picker-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <ul onclick="openCountPassenger('international')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <li><em class="number_adult international-number-adult-js">2</em> بزرگسال ،</li>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <li class="li_number_baby"><em class="number_baby international-number-child-js">0</em> کودک ،</li>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <li><em class="number_room_po international-number-room-js">1</em>اتاق</li>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   </ul>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                   <div class="myhotels-rooms international-my-hotels-rooms-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <i class="close_room international-close-room-js"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <div class="hotel_select_room international-hotel-select-room-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           <div class="myroom-hotel-item international-my-room-hotel-item-js" data-roomnumber="1" >&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <div class="myroom-hotel-item-title international-my-room-hotel-item-title-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                <span class="close d-none" onclick="itemsRoom('international')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                    <i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">&lt;!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;&gt;<path d="M144 400C144 408.8 136.8 416 128 416C119.2 416 112 408.8 112 400V176C112 167.2 119.2 160 128 160C136.8 160 144 167.2 144 176V400zM240 400C240 408.8 232.8 416 224 416C215.2 416 208 408.8 208 400V176C208 167.2 215.2 160 224 160C232.8 160 240 167.2 240 176V400zM336 400C336 408.8 328.8 416 320 416C311.2 416 304 408.8 304 400V176C304 167.2 311.2 160 320 160C328.8 160 336 167.2 336 176V400zM310.1 22.56L336.9 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H416V432C416 476.2 380.2 512 336 512H112C67.82 512 32 476.2 32 432V96H16C7.164 96 0 88.84 0 80C0 71.16 7.164 64 16 64H111.1L137 22.56C145.8 8.526 161.2 0 177.7 0H270.3C286.8 0 302.2 8.526 310.1 22.56V22.56zM148.9 64H299.1L283.8 39.52C280.9 34.84 275.8 32 270.3 32H177.7C172.2 32 167.1 34.84 164.2 39.52L148.9 64zM64 432C64 458.5 85.49 480 112 480H336C362.5 480 384 458.5 384 432V96H64V432z"></path></svg>&ndash;&gt;-->
    <!--&lt;!&ndash;                                    </i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                </span>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   اتاق اول&ndash;&gt;-->

    <!--&lt;!&ndash;                                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <div class="myroom-hotel-item-info international-my-room-hotel-item-info-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">&ndash;&gt;-->

    <!--&lt;!&ndash;                                                                       <h6>بزرگسال</h6>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       (بزرگتر از ۱۲ سال)&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       <div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i class="addParent international-add-number-adult-js hotelroom-minus plus-hotelroom-bozorgsal fas fa-plus" onclick="addNumberAdult('international',this)"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <input readonly="" autocomplete="off" class="countParent international-count-parent-js"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                                  min="0" value="2"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                                  max="5" type="number" name="adult1" id="adult1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                                   class="minusParent international-minus-number-adult-js hotelroom-minus minus-hotelroom-bozorgsal fas fa-minus" onclick="minusNumberAdult('international',this)"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       <h6>کودک</h6>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       (کوچکتر از ۱۲ سال)&ndash;&gt;-->

    <!--&lt;!&ndash;                                                                       <div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <i class="addChild international-add-number-child-js hotelroom-minus plus-hotelroom-koodak fas fa-plus" onclick="addNumberChild('international',this)"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                           <input readonly="" class="countChild international-count-child-js" autocomplete="off"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                                  min="0" value="0" max="5"&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                                  type="number" name="child1" id="child1"><i&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                               class="minusChild international-minus-number-child-js hotelroom-minus minus-hotelroom-koodak fas fa-minus" onclick="minusNumberChild('international',this)"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                                   <div class="tarikh-tavalods international-birth-days-js"></div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       <div class="btn_group">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           <div class="btn_add_room international-btn-add-room-js" onclick="addRoom('international')">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <i class="fal fa-plus"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               افزودن اتاق&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           <div class="close_room btn_close_box international-close-room-js">&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               <i class="fal fa-check"></i>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                               تایید&ndash;&gt;-->
    <!--&lt;!&ndash;                                                           </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                                       </div>&ndash;&gt;-->

    <!--&lt;!&ndash;                                                   </div>&ndash;&gt;-->


    <!--&lt;!&ndash;                                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                           </div>&ndash;&gt;-->

    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       <div class="col-lg-2 col-md-3 col-sm-6 col-12 btn_s col_search margin-center p-1">&ndash;&gt;-->
    <!--&lt;!&ndash;                                           <input type="hidden" id="nights_hotel" name="nights_hotel" value="" placeholder='تاریخ خروج' class='nights-hotel-js'>&ndash;&gt;-->

    <!--&lt;!&ndash;                                           <button onclick="searchInternationalHotel()" type="button"  class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>&ndash;&gt;-->
    <!--&lt;!&ndash;                                       </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                                   </form>&ndash;&gt;-->
    <!--&lt;!&ndash;                               </div>&ndash;&gt;-->
    <!--&lt;!&ndash;                               <input type='hidden' id="type_section" name="type_section" class="type-section-js" value="internal">&ndash;&gt;-->
    <!--                           </div>-->
{*{include file="./boxes/sections/Bus/date_bus.tpl"}*}

    <div class="__box__ tab-pane" id="Insurance">
        <div class="col-md-12 col-12">
            <div class="row  ">
                <form data-action="https://s360online.iran-tech.com/" method="post" target="_blank"
                      name="gdsInsurance" id="gdsInsurance" class="d_contents">
                    {include file="./boxes/sections/Insurance/country_destination.tpl"}
                    {include file="./boxes/sections/Insurance/travel_duration.tpl"}
                    {include file="./boxes/sections/Insurance/number_of_passengers.tpl"}
                    {include file="./boxes/sections/Insurance/date_of_birth.tpl"}
                    <div class="col-lg-2 col-md-4 col-sm-6 col-12 col_search search_btn_insuranc p-1">
                        <button type="button" onclick="searchInsurance()"
                                class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--                           <div class="__box__ tab-pane" id="Visa">-->
    <!--                               <div class="col-md-12 col-12">-->
    <!--                                   <div class="row">-->
    <!--                                       <form data-action="https://s360online.iran-tech.com/" method="post" name="gdsVisa"-->
    <!--                                             id="gdsVisa" target="_blank" class="d_contents">-->
    <!--                                           <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search p-1">-->
    <!--                                               <div class="form-group">-->
    <!--                                                   <select data-placeholder=" قاره" name="visa_continent"-->
    <!--                                                           id="visa_continent"-->
    <!--                                                           class="select2_in  select2-hidden-accessible continent-visa-js"-->
    <!--                                                           onchange="fillComboByContinent(this)" tabindex="-1"-->
    <!--                                                           aria-hidden="true">-->
    <!--                                                       <option selected="selected" value="">انتخاب کنید...</option>-->
    <!--                                                   </select></div>-->
    <!--                                           </div>-->
    <!--                                           <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search p-1">-->
    <!--                                               <div class="form-group">-->
    <!--                                                   <select data-placeholder=" مقصد" onchange="getVisaTypeSpecialCountry(this)"-->
    <!--                                                           name="visa_destination" id="visa_destination"-->
    <!--                                                           class="select2_in  select2-hidden-accessible country-visa-js"-->
    <!--                                                           tabindex="-1" aria-hidden="true">-->
    <!--                                                       <option value="">انتخاب کنید...</option>-->
    <!--                                                   </select>-->
    <!--                                               </div>-->
    <!--                                           </div>-->
    <!--                                           <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
    <!--                                               <div class="form-group">-->
    <!--                                                   <select data-placeholder=" نوع ویزا" name="visa_type"-->
    <!--                                                           id="visa_type"-->
    <!--                                                           class="select2_in  select2-hidden-accessible visa-type-js"-->
    <!--                                                           tabindex="-1" aria-hidden="true">-->
    <!--                                                       <option selected="selected" value="">نوع ویزا</option>-->
    <!--                                                   </select>-->
    <!--                                               </div>-->
    <!--                                           </div>-->
    <!--                                           <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
    <!--                                               <div class="select inp-s-num adt box-of-count-passenger box-of-count-passenger-js">-->
    <!--                                                   <input type="hidden" class="adult-visa-js"-->
    <!--                                                          name="count_adult_internal"-->
    <!--                                                          id="count_adult_internal" value="1">-->

    <!--                                                   <div class="box-of-count-passenger-boxes box-of-count-passenger-boxes-js">-->
    <!--                                                       <span class="text-count-passenger text-count-passenger-js">1 مسافر </span>-->
    <!--                                                       <span class="fas fa-caret-down down-count-passenger"></span>-->
    <!--                                                   </div>-->
    <!--                                                   <div class="cbox-count-passenger cbox-count-passenger-js">-->
    <!--                                                       <div class="col-xs-12 cbox-count-passenger-ch adult-number-js">-->
    <!--                                                           <div class="row">-->
    <!--                                                               <div class="col-xs-12 col-sm-6 col-6">-->
    <!--                                                                   <div class="type-of-count-passenger"><h6> مسافر </h6>-->
    <!--                                                                   </div>-->
    <!--                                                               </div>-->
    <!--                                                               <div class="col-xs-12 col-sm-6 col-6">-->
    <!--                                                                   <div class="num-of-count-passenger">-->
    <!--                                                                       <i class="fa fa-plus counting-of-count-passenger add-to-count-passenger-js" data-visa="yes"></i>-->
    <!--                                                                       <i class="number-count-js number-count counting-of-count-passenger" data-number="1" data-min="1" data-value="internal-adult" data-type="adult">1</i>-->
    <!--                                                                       <i class="fa fa-minus counting-of-count-passenger minus-to-count-passenger-js " data-visa="yes"></i>-->
    <!--                                                                   </div>-->
    <!--                                                               </div>-->
    <!--                                                           </div>-->
    <!--                                                       </div>-->
    <!--                                                       <div class="div_btn"><span class="btn btn-close ">تأیید</span></div>-->
    <!--                                                   </div>-->
    <!--                                               </div>-->
    <!--                                           </div>-->
    <!--                                           <div class="col-lg-2 col-md-4 col-sm-6 col-12 btn_s col_search margin-center p-1">-->
    <!--                                               <button type="button" onclick="searchVisa()" class="btn theme-btn seub-btn b-0">-->
    <!--                                                   <span>جستجو</span></button>-->
    <!--                                           </div>-->
    <!--                                       </form>-->
    <!--                                   </div>-->
    <!--                               </div>-->
    <!--                           </div>-->
