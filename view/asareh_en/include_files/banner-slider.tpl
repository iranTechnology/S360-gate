
{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
<section class="banner-me">
    <div class="owl-carousel owl-theme owl-banner">
        {foreach $banners as $key => $banner}
        <div class="item">
            <img src="{$banner['pic']}" alt="{$banner['title']}">
        </div>
        {/foreach}
    </div>
    {include file="include_files/search-box.tpl"}

</section>