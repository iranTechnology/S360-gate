




<ul class="nav nav-tabs " id="searchBoxTabs" role="tablist">
    <li class="nav-item" role="presentation">
        <a onclick="changeText(` تور های داخلی و خارجی` , 'null')" class="nav-link active" id="Domestic-tour-tab" data-toggle="pill" data-target="#Domestic-tour" type="button" role="tab" aria-controls="Domestic-tour" aria-selected="true">
            <span>
                <i class="fa-light fa-suitcase-rolling"></i>
                <h4>تور داخلی</h4>
            </span>
        </a>
    </li>
    <li class="nav-item" role="presentation">
        <a onclick="changeText(` تور های داخلی و خارجی` , 'null')" class="nav-link" id="Foreign-tour-tab" data-toggle="pill" data-target="#Foreign-tour" type="button" role="tab" aria-controls="Foreign-tour" aria-selected="false">
            <span>
                <i class="fa-light fa-umbrella-beach"></i>
                <h4>تور خارجی</h4>
            </span>
        </a>
    </li>
</ul>


{*    {assign var='tab_counter' value=0}*}

{*    {foreach $info_access_client_to_service as $key=>$client}*}
{*        {if $obj_main_page->newClassTabsSearchBox($client['MainService'])}*}
{*            {if ( $smarty.const.GDS_SWITCH eq 'mainPage' ) || ($active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight' || $active_tab eq $client['MainService'])}*}
{*                {foreach $obj_main_page->newClassTabsSearchBox($client['MainService']) as $tab_id => $icon}*}
{*                    <li class="nav-item">*}
{*                        <a onclick="changeText(`{$obj_main_page->nameBoxSearchBox($tab_id)}` , 'null')"*}
{*                           class="{$client['MainService']}-tab-pic nav-link {if $tab_counter eq 0 }active{/if}"*}
{*                           id="{$tab_id}-tab" data-toggle="tab" href="#{$tab_id}">*}

{*                            {$icon}*}
{*                            <h4>{$obj_main_page->nameTabsSearchBox($tab_id)}</h4>*}

{*                        </a>*}
{*                    </li>*}
{*                    {$tab_counter = $tab_counter + 1}*}
{*                {/foreach}*}
{*            {/if}*}
{*        {/if}*}
{*    {/foreach}*}




