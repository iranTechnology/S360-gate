{assign var="type_data" value=['is_active'=>1 , 'limit' =>1]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}

{foreach $banners as $key => $banner}
<section class="i_modular_banner_gallery banner">
    <img class="__image_class__" src="{$banner["pic"]}" alt="{$banner["title"]}">
    <div class="container">
        <div class="banner-text">
            <h2 class="__title__">{$banner["title"]}</h2>
            <h6 class="__image_class__">{$banner["description"]}</h6>
        </div>
    </div>
</section>
{/foreach}
<section class="search-box">
    <div class="container">
        <div class="i_modular_searchBox parent-search-box">
            <ul class="__search_box_tabs__ nav nav-tabs" id="myTab" role="tablist">

                {include file="./search-box/tabs-search-box.tpl"}
            </ul>
            <div class="__search_boxes__ tab-content" id="myTabContent">
                {include file="./search-box/boxs-search.tpl"}

            </div>
        </div>
    </div>
</section>