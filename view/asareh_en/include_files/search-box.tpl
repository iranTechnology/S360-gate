
{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
<style>
    .banner-slider-display {
        display: none !important;
    }
</style>
<section class="banner-me">
    <div class="owl-carousel owl-theme owl-banner">
        {if $page.files.main_file}
            <div class=" item">
                <img alt='page' class="__image_class__" src='{$page.files.main_file.src}'/>
            </div>
        {else}
            {foreach $banners as $key => $banner}
                <div class=" item">
                    <img alt='{$banner["title"]}' class="__image_class__" src='{$banner["pic"]}'/>
                </div>
            {/foreach}
        {/if}

    </div>
    <div class="container h-100">
        <div class="parent-banner">
            <div class="text-banner">
                <h3>Dukatour</h3>
                <h2>EXPLORE THE WORLD</h2>
                <h2>WITH Dukatour</h2>
            </div>
            <div class="searchs_box">
                {include file="include_files/search-box/tabs-search-box.tpl"}
                {include file="include_files/search-box/boxs-search.tpl"}
            </div>
        </div>
    </div>
</section>



