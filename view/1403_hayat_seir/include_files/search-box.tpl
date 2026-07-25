{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{assign var="obj_main_page" value=$obj_main_page }
{assign var="date_tour" value=$obj_main_page->datesTour()}

<section class="i_modular_banner_gallery banner">
    <div class="banner-owl">
        <div class="owl-banner owl-carousel owl-theme">
            {foreach $banners as $key => $banner}
                <div class="__i_modular_nc_item_class_0 item">
                    <img alt='{$banner["title"]}' class="__image_class__" src='{$banner["pic"]}'/>
                    <div class="text-banner">
                        <h2 class="__title_class__">سفری رویایی را با ما تجربه کنید</h2>
                        <h3 class="__description_class__">تورهای داخلی و خارجی با قیمت‌های استثنایی</h3>
                    </div>
                </div>
            {/foreach}


        </div>
    </div>
    <section class="search_box">
        <div class="container search_box_div">


            {include file="./search-box/tabs-search-box.tpl"}
            {include file="./search-box/boxs-search.tpl"}
        </div>
    </section>
</section>
