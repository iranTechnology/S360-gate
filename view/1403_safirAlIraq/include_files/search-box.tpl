{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{if $page.files.main_file}
    {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
{/if}
<style>
    .banner-slider-display {
        display: none !important;
    }
</style>

<section class="i_modular_banner_gallery __banner_tabs__ banner-kanoun">
    <div class="img-banner"></div>
    <div class="container">
        <div class="parent-banner">
            <div class="parent-img-banner">
                <img alt="plan-img" src="project_files/images/flight-banner.png" />
            </div>
            <div class="parent-text-banner">
                <h2>Safeer Aliraq</h2>
                <p class="__title__">A sky full of dreams, a journey to a world</p>
            </div>
        </div>
    </div>
    <div class="search_box">
        <div class="container">
            <div class="i_modular_searchBox search_box_div">
                <ul class="__search_box_tabs__ nav"
                    id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>
                <div class="__search_boxes__ tab-content"
                     id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>
            </div>
        </div>
    </div>
</section>
