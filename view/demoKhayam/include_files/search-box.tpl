
{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{if $page.files.main_file}
    {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
{/if}

{*<section class="banner-demo">*}

{*</section>*}

{*    <div class="i_modular_searchBox search_box">*}
{*        <div class="container">*}
{*            <div class="search_box_div">*}
{*                <ul class="__search_box_tabs__ nav"*}
{*                    id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>*}
{*                <div class="__search_boxes__ tab-content"*}
{*                     id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>*}
{*            </div>*}
{*        </div>*}
{*    </div>*}
{assign var='status' value=$banners[0]['is_show_banner']}
{if $status eq 1}
    {include file="../../include/structures-banners/structure-gallery.tpl"}
{else}
    {include file="../../include/structures-banners/structure-searchbox.tpl"}
{/if}
{include file="include_files/banner.tpl" }

<style>
    .banner-slider-display {
        display: none;
    }
</style>