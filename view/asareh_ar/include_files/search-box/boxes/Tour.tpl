{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane  {if  $smarty.const.GDS_SWITCH eq 'page'} active {/if}" id="{$client['MainService']}" role="tabpanel" aria-labelledby="{$client['MainService']}-tab">
                {include file="./sections/tour/internal/btn_radio_internal_external.tpl"}
    <div id="tour_dakheli" class=" row internal-tour-js">
        <form data-action="https://s360online.iran-tech.com/" class="d_contents" method="post"
              name="gdsTourLocal" id="gdsTourLocal" target="_blank">
            {include file="./sections/tour/internal/origin_city_tour.tpl"}
            {include file="./sections/tour/internal/destination_city_tour.tpl"}
            {include file="./sections/tour/internal/date_teravel.tpl"}
            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search">
                <button type="button" onclick="searchInternalTour()" class="btn theme-btn seub-btn b-0">
                    <span class="span-search">{$obj_main_page->nameButtonSearchBox($client['MainService'])}</span>
                    <span class="icon-search">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                    </span>
                </button>
            </div>
        </form>
    </div>
    <div id="tour_khareji" class="row international-tour-js">
         <form data-action="https://s360online.iran-tech.com/" class="d_contents" method="post"
                      name="gdsPortalLocal" id="gdsPortalLocal" target="_blank">
            {include file="./sections/tour/international/country_origin.tpl"}
            {include file="./sections/tour/international/city_origin.tpl"}
            {include file="./sections/tour/international/country_destination.tpl"}
            {include file="./sections/tour/international/city_destination.tpl"}
            {include file="./sections/tour/international/date_travel.tpl"}
             <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search">
                 <button type="button" onclick="searchInternationalTour()" class="btn theme-btn seub-btn b-0">
                 <span class="span-search">{$obj_main_page->nameButtonSearchBox($client['MainService'])}</span>
                     <span class="icon-search">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                    </span>
                 </button>
             </div>
        </form>
    </div>
</div>