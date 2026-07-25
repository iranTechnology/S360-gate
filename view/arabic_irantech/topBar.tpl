<div class="top_bar">

    <div class="container">

        <div class="row">
            <div class="header-top-inner  {if $objSession->IsLogin() } logined {/if}">
            <div class="regin">
                <div class="user-box">

                    {if $objSession->IsLogin() }
                    <a target="_parent" class="userProfile-name" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                        <span>{$objSession->getNameUser()} عزیز خوش آمدید</span>
                        {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                            <span class="CreditHide">(اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
                                ریال)</span>
                        {/if}
                    </a>
                    <div class="logined-links">
                        <div class="user_box_profile">
                            <a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/userProfile">پروفایل کاربری</a>
                        </div>
                        <div class="user_box_logout">
                            <a style=" cursor: pointer " class="no-border" target="_parent" onclick="signout()">خروج</a>
                        </div>
                    </div>
                    {else}
                <ul>

                    <li><a href="{$smarty.const.ROOT_ADDRESS}/loginUser"><i class="fas fa-sign-in-alt"></i>تسجيل الدخول </a></li>
                    <li><a href="{$smarty.const.ROOT_ADDRESS}/registerUser"><i class="fa fa-user"></i> تسجيل </a></li>

                </ul>
{/if}
            </div>
            </div>
            </div>
            <div class="contact">


                <a href="tel:{$smarty.const.CLIENT_PHONE}" class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</a>
            </div>

        </div>

    </div>

</div>