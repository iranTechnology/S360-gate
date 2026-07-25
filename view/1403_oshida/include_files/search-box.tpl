{assign var="info_access_client_to_service" value=$info_access_client_to_service}

{if !isset($active_tab)}
    {assign var="active_tab" value=null}
{else}

{/if}
<section class="search_box ">
    <div class="container search_box_div">
    <div class="row">
       {include file="./search-box/tabs-search-box.tpl"}
       {include file="./search-box/boxs-search.tpl"}
    </div>
    </div>
</section>