{assign var="type_data" value=['is_active'=>1 , 'limit' =>10 , 'order' => 'ASC']}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}

{*{if $banners}*}

<section class="i_modular_banner_gallery banner-gallery">
    <div class="owl-carousel owl-banner owl-theme">
{*        {foreach $banners as $key => $banner}*}

{*        <div class="item">*}
{*            <img src="{$banner['pic']}" alt="{$banner['title']}">            <div class="container">*}
{*                <div class="textBanner">*}
{*                    <h2>رزرو هتل</h2>*}
{*                    <p>{$banner['title']}</p>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*        {/foreach}*}

        <div class="item">
            <img src="project_files/images/ad3.jpg" alt="foroogh">            <div class="container">
                <div class="textBanner">
{*                    <p>دمو فروغ</p>*}
                </div>
            </div>
        </div>

    </div>

{*{/if}*}