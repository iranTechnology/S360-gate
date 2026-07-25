<ul class="nav nav-tabs"  role="tablist" id="myTab">

    {foreach $info_access_client_to_service as $key=>$client}

        {if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight'
        || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Insurance' && $client['MainService'] eq 'Insurance'
        || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Hotel' && $client['MainService'] eq 'Hotel'
        || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Visa' && $client['MainService'] eq 'Visa'
         || $smarty.const.GDS_SWITCH eq 'mainPage'}
        <li class="nav-item">
            <a class="nav-link {if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight'
                                || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Insurance' && $client['MainService'] eq 'Insurance'
                                || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Hotel' && $client['MainService'] eq 'Hotel'
                                || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Visa' && $client['MainService'] eq 'Visa'
                                || $smarty.const.GDS_SWITCH eq 'mainPage' && $client['MainService'] eq 'Flight' }active{/if}"
                               id="{$client['tab_id']}" data-toggle="tab" href="#{$client['tab']}"  aria-controls="{$client['tab']}" aria-selected="true">
                    <div>
                        <i>
                            {$obj_main_page->classTabsSearchBox($client['MainService'])}
                        </i>
                        <h4>{$client['Title']}</h4>
                    </div>
            </a>
        </li>
        {/if}
    {/foreach}
</ul>