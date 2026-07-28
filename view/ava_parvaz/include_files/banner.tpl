{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}


<section class="banner">
    <div class="OWL_slider_banner owl-carousel owl-theme">
        {foreach $banners as $key => $banner}
            <div class="item">
                <img src="{$banner['pic']}" alt="{$banner['title']}">
            </div>
        {/foreach}
    </div>
    <div class="context_banner">
        <div class="textBox_banner">
            <div class="container">
                <span>آوا پرواز ایرانیان</span>
                <h2>بلیط هواپیمای داخلی و خارجی</h2>
            </div>
        </div>
        {include file="include_files/search-box.tpl"}
    </div>
</section>