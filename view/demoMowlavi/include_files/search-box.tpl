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

<section class="i_modular_banner_gallery banner-safiran">

    {*    <div class="banner">*}
    {*        <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">*}
    {*            {foreach $banners as $key => $banner}*}
    {*            <div data-src="{$banner["pic"]}" data-thumb="{$banner["pic"]}">*}
    {*                <div class="title-banner">*}

    {*                    <h3>{$banner["title"]}</h3>*}
    {*                    <p class="__title_class__">{$banner["description"]}</p>*}
    {*                </div>*}
    {*            </div>*}
    {*            {/foreach}*}
    {*        </div>*}

    {*    </div>*}

    {*                اگر این تم رو برای یه مشتری واقعی گداشتید کد های بالا رو از کامنتی در بیارید و کد های زیر رو کامنت کنید*}

    <div class="banner">
        <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
            <div data-src="project_files/images/1.jpg" data-thumb="project_files/images/1.jpg">
                <div class="title-banner">

                    <h3>سفر 360</h3>
                    <p class="__title_class__">خرید آنلاین خدمات گردشگری</p>
                </div>
            </div>
            <div data-src="project_files/images/2.jpg" data-thumb="project_files/images/2.jpg">
                <div class="title-banner">

                    <h3>سفر 360</h3>
                    <p class="__title_class__">خرید آنلاین خدمات گردشگری</p>
                </div>
            </div>
            <div data-src="project_files/images/3.jpg" data-thumb="project_files/images/3.jpg">
                <div class="title-banner">

                    <h3>سفر 360</h3>
                    <p class="__title_class__">خرید آنلاین خدمات گردشگری</p>
                </div>
            </div>
        </div>

    </div>

    <div class="title-banner title-banner-res">
        <h1>{$banner[0]["title"]}</h1>
        <p class="__title_class__">{$banner[0]["description"]}</p>
    </div>
    <div class="i_modular_searchBox search_box">
        <div class="container position-relative">
            <div class="search_box_div">
                <ul class="__search_box_tabs__ nav"
                    id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>
                <div class="__search_boxes__ tab-content  {if $smarty.const.GDS_SWITCH eq 'page'} tab-content-page {/if}"
                     id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>
            </div>
        </div>
    </div>
</section>
