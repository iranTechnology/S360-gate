{if $objSession->IsLogin() }
{*    <span class="logined-name">{$objSession->getNameUser()}</span>*}
    <span class="logined-name">welcome</span>
    {else}
    <span class="logined-name">login / register</span>
{/if}
