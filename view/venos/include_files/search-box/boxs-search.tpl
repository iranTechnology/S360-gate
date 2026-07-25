{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-content" id="myTabContent">
{*    {$info_access_client_to_service|var_dump}*}
    {foreach $info_access_client_to_service as $key=>$client}
        {if $client['MainService'] eq 'Flight' or $client['MainService'] eq 'Insurance' or $client['MainService'] eq 'Visa'}
            {include file="./boxes/{$client['MainService']}.tpl" client=$client}
        {/if}
    {/foreach}
</div>



