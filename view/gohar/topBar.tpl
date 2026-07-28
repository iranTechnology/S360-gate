<div class="header-top">
    <div class="container">
        <div class="header-top-inner  {if $objSession->IsLogin() } logined {/if}">


            <div class="user-box">

                {if $objSession->IsLogin() }
                    <a target="_parent" class="userProfile-name" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                        <span>{$objSession->getNameUser()} عزیز خوش آمدید</span>
                        {assign var="typeMember" value=$objFunctions->TypeUser($objSession->getUserId())}
                        {if $typeMember eq 'Counter'}
                            <span class="CreditHide">(اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
                                ریال)</span>
                        {elseif $typeMember eq 'Ponline'}
                            {assign var="infoMember" value=$objFunctions->infoMember($objSession->getUserId())}
                            {if $infoMember.is_member eq '1' && $infoMember.fk_counter_type_id eq '5'}
                                <span class="CreditHide">(اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
                                    ریال)</span>
                            {/if}
                        {/if}
                    </a>
                    <div class="act-buttons">
                        <a target="_parent"  onclick="signout()" class="btn register"><i
                                    class="fa fa-sign-in"></i>خروج</a>
                        <a target="_parent" class="btn register " href="{$smarty.const.ROOT_ADDRESS}/registerUser"><i
                                    class="fa fa-plus"></i>پروفایل کاربری</a>
                        {*<a data-toggle="tooltip" data-placement="bottom" class="ar" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php"><i*}
                                    {*class="flat_iraq"></i></a>*}

                    </div>
                {else}

                {/if}


            </div>

            <div class="info-head-box">

                <a target="_parent" class="lang" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php">

                    Ar
                </a>

                </a>
                {if $objSession->IsLogin() }
                {else}
                    <div class="act-buttons">
                        <a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/loginUser" class="btn register"><i
                                    class="fa fa-sign-in"></i>ورود</a>
                        <a target="_parent" class="btn register " href="{$smarty.const.ROOT_ADDRESS}/registerUser"><i
                                    class="fa fa-plus"></i> ثبت نام </a>
                        {*<a data-toggle="tooltip" data-placement="bottom" class="ar" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php"><i*}
                                    {*class="flat_iraq"></i></a>*}

                    </div>
                {/if}

            </div>
        </div>
    </div>
</div>


