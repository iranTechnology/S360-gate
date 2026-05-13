{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane {if $client['order_number'] eq '1' || ($smarty.const.GDS_SWITCH eq 'page' && $active_tab eq $client['MainService'])}active{/if}" id="{$client['MainService']}" role="tabpanel"
     aria-labelledby="{$client['MainService']}-tab">
    {include file="./sections/tour/internal/btn_radio_internal_external.tpl"}
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
            <div id="tour_dakheli" class="">
                <form data-action="https://s360online.iran-tech.com/"  class="d_contents" method="post"
                      name="gdsTourLocal" id="gdsTourLocal"  >
                    {include file="./sections/tour/internal/origin_city_tour.tpl"}
                    {include file="./sections/tour/internal/destination_city_tour.tpl"}
                    {include file="./sections/tour/internal/date_teravel.tpl"}
                    <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search">
                        <button onclick="searchInternalTour()" type="button" class="btn theme-btn seub-btn b-0"><span>جستجو</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
            <div id="tour_khareji" class="">
                <form data-action="https://s360online.iran-tech.com/"
                      class="d_contents" method="post" name="gdsPortalLocal" id="gdsPortalLocal" target="_blank">
                    {include file="./sections/tour/international/country_origin.tpl"}
                    {include file="./sections/tour/international/city_origin.tpl"}
                    {include file="./sections/tour/international/country_destination.tpl"}
                    {include file="./sections/tour/international/city_destination.tpl"}
                    {include file="./sections/tour/international/date_travel.tpl"}
                    <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search">
                        <button type="button" onclick="searchInternationalTour()" class="btn theme-btn seub-btn b-0"><span>جستجو</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
            <div id="tour_ziyarati" class="">
                <form data-action="https://s360online.iran-tech.com/"
                      class="d_contents" method="post" name="gdsPortalZiarati" id="gdsPortalZiarati" >
                    {include file="./sections/tour/ziyaraty/country_origin.tpl"}
                    {include file="./sections/tour/ziyaraty/city_origin.tpl"}
                    {include file="./sections/tour/ziyaraty/country_destination.tpl"}
                    {include file="./sections/tour/ziyaraty/city_destination.tpl"}
                    {include file="./sections/tour/ziyaraty/date_travel.tpl"}
                    <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search">
                        <button type="button" onclick="searchZiaratiTour()" class="btn theme-btn seub-btn b-0"><span>جستجو</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
