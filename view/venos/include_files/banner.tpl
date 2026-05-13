{assign var="type_data" value=['is_active'=>1 , 'limit' =>1]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{assign var="banner" value=$banners[0]}
<section class="banner">
    <img  src="{$banner['pic']}" alt="{$banner['title']}">
    <div class="container">
        <div class="text-banner">
            <h2>آژانس مسافرتی ونوس</h2>
            <p>رزرو بلیط پروازهای خارجی و تورهای داخلی و خارجی</p>
        </div>
        {include file="include_files/search-box.tpl" }
    </div>
</section>
