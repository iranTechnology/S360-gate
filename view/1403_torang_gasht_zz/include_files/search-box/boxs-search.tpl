{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-content" id="myTabContent">
    {foreach $info_access_client_to_service as $key=>$client}
        {if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight'
        || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Insurance' && $client['MainService'] eq 'Insurance'
        || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Hotel' && $client['MainService'] eq 'Hotel'
        || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Visa' && $client['MainService'] eq 'Visa'
        || $smarty.const.GDS_SWITCH eq 'mainPage'}
            {include file="./boxes/{$client['MainService']}.tpl" client=$client}
        {/if}
    {/foreach}
</div>

