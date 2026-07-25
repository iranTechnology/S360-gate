
<div class="header-top">
    <div class="container">
        <div class="header-top-inner  {if $objSession->IsLogin() } logined {/if}">


            <div class="user-box">

                {if $objSession->IsLogin() }
                    <a target="_parent" class="userProfile-name" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                        <span>{$objSession->getNameUser()} أهلا وسهلا بك </span>
                        {assign var="typeMember" value=$objFunctions->TypeUser($objSession->getUserId())}
                        {if $typeMember eq 'Counter'}
                            <span class="CreditHide">(وكالة الاعتماد الخاصة بك {$objFunctions->CalculateCredit($objSession->getUserId())}
                                ریال)</span>
                        {elseif $typeMember eq 'Ponline'}
                            {assign var="infoMember" value=$objFunctions->infoMember($objSession->getUserId())}
                            {if $infoMember.is_member eq '1' && $infoMember.fk_counter_type_id eq '5'}
                                <span class="CreditHide">(وكالة الاعتماد الخاصة بك {$objFunctions->CalculateCredit($objSession->getUserId())}
                                    ریال)</span>
                            {/if}
                        {/if}
                    </a>
                    <div class="act-buttons">
                        <a target="_parent"  onclick="signout()" class="btn register"><i
                                    class="fa fa-sign-in"></i>خروج</a>
                        <a target="_parent" class="btn register " href="{$smarty.const.ROOT_ADDRESS}/registerUser"><i
                                    class="fa fa-plus"></i>ملف تعريف المستخدم</a>
                        {*<a data-toggle="tooltip" data-placement="bottom" class="ar" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php"><i*}
                                    {*class="flat_iraq"></i></a>*}

                    </div>
                {else}

                {/if}


            </div>

            <div class="info-head-box">
                <a target="_parent" class="lang" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/home.php">

                    Fa
                </a>
                {if $objSession->IsLogin() }
                {else}

                    <div class="act-buttons">
                        <a target="_parent" href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/loginUser" class="btn register"><i
                                    class="fa fa-sign-in"></i>تسجيل الدخول</a>
                        <a target="_parent" class="btn register " href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/ar/registerUser"><i
                                    class="fa fa-plus"></i> التسجيل </a>
                        {*<a data-toggle="tooltip" data-placement="bottom" class="ar" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php"><i*}
                                    {*class="flat_iraq"></i></a>*}

                    </div>
                {/if}

            </div>
        </div>
    </div>
</div>


