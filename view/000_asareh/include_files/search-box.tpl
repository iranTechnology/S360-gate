{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
<style>
    .banner-slider-display {
        display: none;
    }
</style>
<section class="banner-me">
    <div class="owl-carousel owl-theme owl-banner">

        {if $page.files.main_file}
            <div class=" item">
                <img alt='page' src='{$page.files.main_file.src}'/>

            </div>
        {else}


            {foreach $banners as $key => $banner}
                <div class=" item">
                    <img alt='{$banner["title"]}' src='{$banner["pic"]}'/>
                    <div class="text-banner">
                        <!--                        <h3>دوکاتور</h3>-->
                        <h2>جهان را جست و جو کنید</h2>
                        <h2>با دوکاتور</h2>
                                <a href='{if $banner['url']}{$banner['url']}{else}/#{/if}' class='more-btn-banner'>
                                    <span>مشاهده بیشتر</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288 480 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-370.7 0 73.4-73.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-128 128z"/></svg>
                                </a>
                    </div>
                </div>
            {/foreach}
        {/if}
    </div>
    <div class="container h-100">
        <div class="parent-banner">
            <div class="searchs_box">
                {include file="include_files/search-box/tabs-search-box.tpl"}
                {include file="include_files/search-box/boxs-search.tpl"}
            </div>
        </div>
    </div>
</section>


