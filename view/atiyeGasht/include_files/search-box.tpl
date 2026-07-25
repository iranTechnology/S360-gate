<article>
    <section class="search">
        <div class="main_search w-100">
            {assign var="type_data" value=['is_active'=>1 , 'limit' =>5 , 'order' => 'ASC']}
            {assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
            <div class="OWL_slider_banner owl-carousel owl-theme">
                {foreach $banners as $key => $banner}
                <div class="item">
                    <img src="{$banner['pic']}" alt="{$banner['title']}">
                </div>
                {/foreach}
            </div>
{*            <div class='container'>*}
{*            <div class='txt-search-box'>*}
{*                <h5>هنگام صدور بلیط برای مسافرین ایرانی و اتباع خارجی مسیر تهران-وان</h5>*}
{*                <ul>*}
{*                    <li>لطفا در محل باکس "نام و نام خانوادگی"، نام و نام خانوادگی را به لاتین وارد نمائید</li>*}
{*                    <li>*}
{*                        در محل "کد ملی"، کد ملی مسافرین ایرانی را وارد نمایید.*}
{*                        <br>*}
{*                        (در صورتی که مسافر اتباع خارجی باشد بجای کد ملی شماره پاسپورت ایشان بدون احتساب حروف یا خط فاصله وارد گردد)*}
{*                    </li>*}
{*                </ul>*}
{*            </div>*}
{*            </div>*}
            <div class="search_box">
                <div class="i_modular_searchBox container search_box_div">
                    <ul class="__search_box_tabs__ nav" id="searchBoxTabs">
                        {include file="./search-box/tabs-search-box.tpl"}
                    </ul>
                    <div class="__search_boxes__ tab-content" id="searchBoxContent">
                        {include file="./search-box/boxs-search.tpl"}

                    </div>
                </div>
            </div>
        </div>
    </section>
</article>