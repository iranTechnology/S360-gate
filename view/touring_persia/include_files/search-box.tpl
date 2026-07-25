{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
<section class="banner">
    {if $banners[0]['iframe_code']}
        <iframe width="100%" height='100%' src="{$banners[0]['iframe_code']}" style='margin: 0 auto;'></iframe>
    {else}
        {if $banners[0]['type'] == 'pic'}
            {*            <video autoplay="" class="video-banner" loop="loop" muted="" src="project_files/video/vid.mp4" type="project_files/video/mp4"></video>*}
        {else}
             <video src="{$banners[0]['pic']}"
                       width="100%"
                       height="100%"
                       type="video/mp4"
                       autoplay="true" class="video-banner"
                       loop
                       muted="false"
                       style="object-fit: cover;">
                </video>
        {/if}
    {/if}

    {*    <video autoplay="" class="video-banner" loop="loop" muted="" src="project_files/video/vid.mp4" type="project_files/video/mp4"></video>*}
    <div {if  $smarty.const.GDS_SWITCH eq 'mainPage'} style='display: none;' {/if}class="container search_box_div">
        {if  $smarty.const.GDS_SWITCH neq 'mainPage'}
{*            {include file="./search-box/tabs-search-box.tpl"}*}
            {include file="./search-box/boxs-search.tpl"}
        {/if}
    </div>
</section>


