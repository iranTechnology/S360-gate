{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{if $page.files.main_file}
    {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
{/if}

<section class="i_modular_banner_gallery banner-demo-1" style="background-image:none !important;">
    <div class="banner">
        <div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
            {foreach $banners as $key => $banner}
                <div data-src="{$banner["pic"]}" data-thumb="{$banner["pic"]}">
                    <div class="title-banner text-center">

                        <h3>{$banner["title"]}</h3>
                        <p class="__title_class__">{$banner["description"]}</p>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
    <div class="height-line-brack"></div>
    <div class="container position-absolute" style="right:0;left:0;">
                <div class="search_box">
                    <div class="i_modular_searchBox search_box_div">
                        <ul class="__search_box_tabs__ nav" id="searchBoxTabs">
                            {assign var='tab_counter' value=0}
                            {foreach $info_access_client_to_service as $key=>$client}
                                {if $obj_main_page->newClassTabsSearchBox($client['MainService'])}
                                    {if ( $smarty.const.GDS_SWITCH eq 'mainPage' ) || ($active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight' || $active_tab eq $client['MainService'])}
                                        {foreach $obj_main_page->newClassTabsSearchBox($client['MainService']) as $tab_id => $icon}
                                            <li class="nav-item">
                                                <a onclick="changeText(`{$obj_main_page->nameBoxSearchBox($tab_id)}` , 'null')"
                                                   class="{$client['MainService']}-tab-pic nav-link {if $tab_counter eq 0 }active{/if}"
                                                   id="{$tab_id}-tab" data-toggle="tab" href="#{$tab_id}">

                                                    <div>
                                                        {$icon}
                                                        <h4>{$obj_main_page->nameTabsSearchBox($tab_id)}</h4>
                                                    </div>

                                                </a>
                                            </li>
                                            {$tab_counter = $tab_counter + 1}
                                        {/foreach}
                                    {/if}
                                {/if}
                            {/foreach}
                        </ul>
                        <div class="__search_boxes__ tab-content" id="searchBoxContent">
                            {assign var="obj_main_page" value=$obj_main_page }
                            {foreach $info_access_client_to_service as $key=>$client}
                                {if $obj_main_page->newClassTabsSearchBox($client['MainService'])}
                                    {if  $smarty.const.GDS_SWITCH eq 'mainPage'}
                                        {include file="../searchBox/{$client['MainService']}.tpl"}
                                    {else}
                                        {if $active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight' || $active_tab eq $client['MainService']}
                                            {include file="../searchBox/{$client['MainService']}.tpl"}
                                        {/if}
                                    {/if}
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
    <svg version="1.1" id="circle_banner" fill="#FFFFFFF" class="d-none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 250" enable-background="new 0 0 500 250" xml:space="preserve" preserveAspectRatio="none"><path fill="#FFFFFF" d="M250,246.5c-97.85,0-186.344-40.044-250-104.633V250h500V141.867C436.344,206.456,347.85,246.5,250,246.5z"></path></svg>

</section>

