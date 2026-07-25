{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}


<section class="banner">
    <div class="OWL_slider_banner owl-carousel owl-theme">
        {foreach $banners as $key => $banner}
            <div class="item">
                <img class='search_box' src="{$banner['pic']}" alt="{$banner['title']}">
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
        {assign var="info_access_client_to_service" value=$info_access_client_to_service}
        <div class="search_box searchBox_banner">
            <div class="container search_box_div">
                <div class="searchs_box">
                    <div>
                        {include file="./search-box/tabs-search-box.tpl"}
                        {include file="./search-box/boxs-search.tpl"}
                    </div>
                </div>
            </div>
        </div>
</section>

