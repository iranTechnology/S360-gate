{if $objSession->IsLogin() }
    <span class="logined-name"
    style="font-size: 13px;
	width: 150px !important;
	color: #fff;
	text-align: right;
	white-space: nowrap;
	overflow: hidden;">{$objSession->getNameUser()}</span>
    {else}
    <span class="logined-vorood"
    style="font-size: 13px;
    font-family: Yekan;
	width: 90px;
	white-space: nowrap;
	color: #000;
	overflow: hidden;">ورود/ثبت نام</span>
{/if}
