<ul class="nav nav-tabs" id="myTab" role="tablist">
    {foreach $info_access_client_to_service as $key=>$client}
        {assign var="tab_detail" value=$obj_main_page->classTabsSearchBoxDetail($client['MainService'])}
{*        {$tab_detail|var_dump}*}
{*        {$active_tab|var_dump}*}
        {if $tab_detail}
            {if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'internationalFlight' && $tab_detail['tab_href'] eq 'Flight'
            || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Insurance' && $tab_detail['tab_href'] eq 'Insurance'
            || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Visa' && $tab_detail['tab_href'] eq 'Visa'
            || $smarty.const.GDS_SWITCH eq 'mainPage' && $tab_detail['tab_href'] neq 'Visa' }
                <li class="nav-item">
                    <a class="nav-link
                    {if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'internationalFlight' && $tab_detail['tab_href'] eq 'Flight'
                    || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Insurance' && $tab_detail['tab_href'] eq 'Insurance'
                    || $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Visa' && $tab_detail['tab_href'] eq 'Visa'
                    || $smarty.const.GDS_SWITCH eq 'mainPage'  && $tab_detail['tab_href'] eq 'Flight'} active show {/if}"
                       id="{$client['MainService']}-tab" data-toggle="tab" href="#{$tab_detail['tab_href']}" aria-controls="{$tab_detail['tab_href']}" aria-selected="false">
                            <span>
                                {$tab_detail['tab_icon']}
                                <h4>{$tab_detail['tab_name']}</h4>
                            </span>
                    </a>
                </li>
            {/if}
        {/if}
    {/foreach}
</ul>


