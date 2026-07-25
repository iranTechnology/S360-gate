{assign var="info_access_client_to_service" value=$info_access_client_to_service}
{load_presentation_object filename="specialPages" assign="objSpecialPages"}
{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}

<div class="banner">
    <div class='owl-carousel owl-theme owl-banner'>
        {if $banners}
        {foreach $banners as $key => $banner}
          <img alt='{$banner["title"]}'  src='{$banner["pic"]}' />
        {/foreach}
        {/if}
    </div>
    <div class="container">
        <div class="searchs_box">
            {include file="./search-box/tabs-search-box.tpl"}
            {include file="./search-box/boxs-search.tpl"}
        </div>
    </div>
</div>



