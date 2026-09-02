{assign var="info_access_client_to_service" value=$info_access_client_to_service}
{load_presentation_object filename="specialPages" assign="objSpecialPages"}

<ul class="nav nav-tabs" id="myTab" role="tablist">
    {foreach $info_access_client_to_service as $key=>$client}
        {if  $smarty.const.GDS_SWITCH eq 'mainPage'}
            <li class="nav-item">
                <a class="nav-link
                    {if $client['MainService'] eq 'Flight' }active{/if}"
                   id="{$client['MainService']}-tab" data-toggle="tab" href="#{$client['MainService']}">

                                    {$obj_main_page->classTabsSearchBox($client['MainService'])}
                                    <h4>{$obj_main_page->nameButtonSearchBox($client['MainService'])}</h4>

                </a>
            </li>
        {else}
            {if $active_tab eq 'internalFlight' && $client['MainService'] eq 'Flight' || $active_tab eq $client['MainService']}
                <li class="nav-item">
                    <a  class="nav-link active"
                       id="{$client['MainService']}-tab" data-toggle="tab" href="#{$client['MainService']}">

                                        {$obj_main_page->classTabsSearchBox($client['MainService'])}
                                    <h4>{$obj_main_page->nameButtonSearchBox($client['MainService'])}</h4>

                    </a>
                </li>
            {/if}
        {/if}
    {/foreach}
</ul>