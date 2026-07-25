<section class="i_modular_banner_gallery position-relative banner-vista">
    <div class="banner-demo">
        <div class="container-fluid h-100">
            <div id="bg-banner-demo" class=" __banner_tabs__ parent-data-demo">
                <div class="parent-text-banner-demo">
                    <h2 class="__title__ " id="title-banner">{$obj_main_page->nameBoxSearchBox('Flight_internal')}</h2>
                    <p class="__title_class__" id="caption-banner">
                        {$obj_main_page->captionBoxSearchBox('Flight_internal')}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="search_box container">
        <div class="i_modular_searchBox search_box_div">
            <ul class="__search_box_tabs__ nav" id="searchBoxTabs">
                {include file="./search-box/tabs-search-box.tpl"}

            </ul>
            <div class="__search_boxes__ tab-content" id="searchBoxContent">
                {include file="./search-box/boxs-search.tpl"}

            </div>
        </div>
    </div>
</section>
{include file="include_files/banner-slider.tpl"}

<style>
    .banner-slider-display {
        display: none;
    }
</style>