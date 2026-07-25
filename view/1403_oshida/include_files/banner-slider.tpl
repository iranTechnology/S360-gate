{assign var="type_data" value=['is_active'=>1 , 'limit' =>5]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}

<div class="OWL_slider_banner owl-carousel owl-theme">
    {foreach $banners as $key => $banner}
        {if $banner['type']=='pic'}
            <div class="item">
                <img src="{$banner['pic']}" alt="{$banner['title']}">
                <div class="text-banner container">
                    <h2>{$banner['description']}</h2>
                </div>
            </div>
        {else}
            <div class="item">
                <video src="{$banner['pic']}"
                       width="100%"
                       height="100%"
                       type="video/mp4"
                       autoplay="autoplay"
                       loop
                       muted>
                </video>
                <div class="text-banner container">
                    <h2>{$banner['description']}</h2>
                </div>
            </div>
        {/if}
    {/foreach}
</div>