{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane {if $client['order_number'] eq '1'}active{/if}" id="Tour">
                {include file="./sections/tour/internal/btn_radio_internal_external.tpl"}
    <div id="internal_tour" class="  internal-tour-js">
        <form data-action="https://s360online.iran-tech.com/" class="d_contents w-100" method="post" name="gdsTourLocal" id="gdsTourLocal" target="_blank">
                {include file="./sections/tour/internal/origin_city_tour.tpl"}
                {include file="./sections/tour/internal/destination_city_tour.tpl"}
                {include file="./sections/tour/internal/date_teravel.tpl"}

            <div class="col-md-12 col-xs-12">
                <div class="search_btn_div">
                    <button type="button" class="button  search_button" onclick="searchInternalTour()">جستجوی تور
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div id="international_tour" class="  international-tour-js" style="display: none;">
        <form data-action="https://s360online.iran-tech.com/" class="d_contents w-100" method="post"
              name="gdsPortalLocal" id="gdsPortalLocal" target="_blank">
            {include file="./sections/tour/international/country_origin.tpl"}
            {include file="./sections/tour/international/city_origin.tpl"}
            {include file="./sections/tour/international/country_destination.tpl"}
            {include file="./sections/tour/international/city_destination.tpl"}
            {include file="./sections/tour/international/date_travel.tpl"}

            <div class="col-md-12 col-xs-12">
                <div class="search_btn_div">
                    <button type="button" class="button  search_button" onclick="searchInternationalTour()">جستجوی تور
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>