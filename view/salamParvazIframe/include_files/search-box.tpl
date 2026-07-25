<section class="i_modular_searchBox search_box mt-5 ">
    <div class="container">
        <div class="search_box_div">
            <ul class="__search_box_tabs__ nav" id="searchBoxTabs" >
                {include file="./search-box/tabs-search-box.tpl"}
                <li class="nav-item {if $smarty.const.GDS_SWITCH_PAGE eq 'visa' && $smarty.const.GDS_SWITCH eq 'page'} d-none {/if}">
                    <a
                            href="https://salamparvaz.com/tours"
                       class="{$tab_id}-tab-pic nav-link"
                            target="_blank"
                      >

                        <div>
                            <i class="fa-light fa-suitcase-rolling"></i>
                            <h4>تور</h4>
                        </div>

                    </a>
                </li>
            </ul>
            <div class="__search_boxes__ tab-content" id="searchBoxContent" style="background:rgba(255,255,255,0.6);margin-top:3px">
                {include file="./search-box/boxs-search.tpl"}
            </div>
        </div>
    </div>
</section>


<style>
    .banner-slider-display {
        display: none;
    }
</style>