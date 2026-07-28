<ul style='display:none' class="nav" id="searchBoxTabs">
    {foreach $info_access_client_to_service as $key=>$client}
        <li class="nav-item">
            <a onclick="changeText(`{$client['Title']}` , 'null')" class="nav-link {if $key eq '0'}active{/if}"
               id="{$client['MainService']}-tab" data-toggle="tab" href="#{$client['MainService']}">
                <span>
                    <i class="{$obj_main_page->classTabsSearchBox($client['MainService'])}"></i>
                    <h4>{$client['Title']}</h4>
                </span>
            </a>
        </li>
    {/foreach}
</ul>