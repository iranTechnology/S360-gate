{if $objSession->IsLogin() }
    <span class="logined-name"
    style="font-size: 13px;
	width: 150px;
	color: #0ac80a;
	white-space: nowrap;
	overflow: hidden;">{$objSession->getNameUser()}</span>
    {else}
    <span class="logined-vorood"
    style="font-size: 13px;
	width: 150px;
	white-space: nowrap;
	overflow: hidden;">ورود/ثبت نام</span>
{/if}
