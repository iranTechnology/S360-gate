{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{if $page.files.main_file}
    {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
{/if}

{assign var='status' value=$banners[0]['is_show_banner']}
{*{if $status eq 1}*}
    {include file="../../include/structures-banners/structure-gallery.tpl"}
{*{else}*}
{*    {include file="../../include/structures-banners/structure-searchbox.tpl"}*}
{*{/if}*}

{include file="include_files/banner-slider.tpl" }
