{*{assign var="info_access_client_to_service" value=$info_access_client_to_service}*}
{*{load_presentation_object filename="specialPages" assign="objSpecialPages"}*}

{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{if $page.files.main_file}
    {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
{/if}
{*<section class="search_box">*}
{*    <div class='container'>*}
{*        <div class='demo-ticket-old'>*}
{*            <p>ما به‌روز شدیم! برای دیدن وب‌سایت جدید، لطفاً <a href='https://safar360.com/'>[این لینک]</a> را دنبال کنید.</p>*}
{*        </div>*}
{*    </div>*}
{*    <div class="container search_box_div">*}
{*        {if  $smarty.const.GDS_SWITCH eq 'mainPage'}*}
{*           <h2 id="titr_searchBox">##Reservation## <em></em> <span id="text_search"> ##foreingIranFlightsTickets## </span></h2>*}
{*        {/if}*}
{*        <ul id="searchBoxTabs" class="nav">*}
{*            {include file="./search-box/tabs-search-box.tpl"}*}
{*        </ul>*}
{*        <div id="searchBoxContent" class="tab-content">*}
{*            {include file="./search-box/boxs-search.tpl"}*}
{*        </div>*}
{*    </div>*}
{*</section>*}
{*{include file="include_files/banner-slider.tpl" }*}


{assign var='status' value=$banners[0]['is_show_banner']}
{if $status eq 1}
    {include file="../../include/structures-banners/structure-gallery.tpl"}
{else}
    {include file="../../include/structures-banners/structure-searchbox.tpl"}
{/if}
{include file="include_files/banner-slider.tpl" }





