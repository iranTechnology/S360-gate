{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
                            {assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
                            {if $page.files.main_file}
                                {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
                            {/if}
                            <style>
                                .banner-slider-display {
                                    display: none !important;
                                }
                                .banner-kanoun .banner-site{
                               background:  url({$banners[0]['pic']}) no-repeat center !important;
                                }
                            </style>

<section class="i_modular_banner_gallery container">
<div class="banner-kanoun">
<div class="banner-site"></div>
<div class="parent-text-banner-demo">
<h2 id="title-banner"> نرم افزار سفر360 | مرجع تخصصی تامین خدمات گردشگری </h2>
<p id="caption-banner">

                    بلیط هواپیما، هتل، تور و بیمه مسافرتی با بهترین قیمت

                </p>
</div>
</div>
</section>


{assign var="services_array_json" value= '{"Train": "Train","Flight": "Flight", "Hotel": "Hotel", "Bus": "Bus", "Insurance": "Insurance", "Tour": "Tour", "Visa": "Visa"}'}
{assign var="services_array" value=$services_array_json|json_decode}
<section class="i_modular_banner_gallery banner-demo">

    <div class="container">

            <div class="search_box">
                <div class="i_modular_searchBox search_box_div">
                    <ul class="__search_box_tabs__ nav" id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>
                    <div class="__search_boxes__ tab-content" id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>
                </div>
            </div>
    </div>
</section>
