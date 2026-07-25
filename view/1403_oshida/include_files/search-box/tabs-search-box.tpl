<ul class="nav nav-tabs" id="myTabSearchBox" role="tablist">

    {foreach $info_access_client_to_service as $key=>$client}

        {if $client['MainService'] neq 'Flight' && $client['MainService'] neq 'Hotel'}
            {if $client['MainService'] eq 'Insurance'}
                {assign var="tab_link" value=$obj_main_page->getInfoAuthClient()}
            {else}
                {assign var="tab_link" value=$obj_main_page->getInfoAuthClient()}
            {/if}

            {if $active_tab}
                {if $client['MainService'] eq $active_tab}
                    <li class="nav-item">
                        <a class="nav-link {if $active_tab eq $client['MainService'] && $active_tab}active {else} {if !$active_tab && $key eq '0'}active{/if} {/if}"
                           href="#{$client['MainService']}"
                                 id="{$client['MainService']}-tab" data-toggle="tab" role="tab" aria-controls="{$client['MainService']}" aria-selected="false">
                            <i class="{$obj_main_page->classTabsSearchBox($client['MainService'])}"></i>
                            {$client['Title']}
                        </a>
                    </li>
                {/if}
            {else}
                <li class="nav-item">
                    <a class="nav-link {if  $key eq '0'} active{/if}" href="#{$client['MainService']}"
                             id="{$client['MainService']}-tab" data-toggle="tab" role="tab" aria-controls="{$client['MainService']}" aria-selected="false">

                        <i class="{$obj_main_page->classTabsSearchBox($client['MainService'])}"></i>

                        {$client['Title']}

                    </a>
                </li>
            {/if}

        {/if}

    {/foreach}
</ul>
