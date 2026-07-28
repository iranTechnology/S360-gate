{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}




<section class="banner">
    <div class="i_modular_banner_gallery OWL_slider_banner owl-carousel owl-theme">
        {if $page.files.main_file}
             <div class="__i_modular_nc_item_class_0 item">
                <img alt='page' class="__image_class__" src='{$page.files.main_file.src}'/>
            </div>
        {else}
            {foreach $banners as $key => $banner}
                <div class="__i_modular_nc_item_class_0 item">
                    <img alt='{$banner["title"]}' class="__image_class__" src='{$banner["pic"]}'/>
                </div>
            {/foreach}
        {/if}

    </div>
    <div class="context_banner">
        <div class="textBox_banner">
            <div class="container">
                <span>صوت الطيران الايراني</span>
                <h2>تذاكر الطيران المحلية والدولية</h2>
            </div>
        </div>
        <div class="searchBox_banner">
            <div class="container">
                <div class="searchs_box">
                    {include file="./search-box/tabs-search-box.tpl"}
                    {include file="./search-box/boxs-search.tpl"}
                </div>
            </div>
        </div>
    </div>
</section>
