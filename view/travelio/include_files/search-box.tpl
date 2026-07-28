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

<section class="banner i_modular_banner_gallery">
    <div class="img-banner"></div>
    <div class="container d-none d-sm-block">
        <div class="parent-banner">
            <div class="parent-img-banner">
                <img alt="plan-img" src="project_files/fa/images/main-slider-three-img-1.png" />
            </div>
            <div class="parent-text-banner">
                <h2>آژانس مسافرتی تراولیو</h2>
                <p class="__title__">آسمانی پر از رویاها، تورهای بی‌نظیر </p>
            </div>
        </div>
    </div>
    <div class="i_modular_searchBox search_box">
        <div class="container">
            <div class="search_box_div">
                <ul class="__search_box_tabs__ nav"
                    id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>
                <div class="__search_boxes__ tab-content"
                     id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>
            </div>
        </div>
    </div>
    <svg version="1.1" id="circle_banner" fill="#FFFFFFF" class="d-none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 250" enable-background="new 0 0 500 250" xml:space="preserve" preserveAspectRatio="none"><path fill="#FFFFFF" d="M250,246.5c-97.85,0-186.344-40.044-250-104.633V250h500V141.867C436.344,206.456,347.85,246.5,250,246.5z"></path></svg>
</section>
