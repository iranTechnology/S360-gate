{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    {literal}
        <script src="https://search.arakcharter.com/fa/user/js/jquery-3.4.1.min.js"></script>
    {/literal}

    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/style.css">
        <link rel="stylesheet" type="text/css" href="https://search.arakcharter.com/fa/user/GlobalFile/css/register.css">

    {/if}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>

<body>
{if $smarty.session.layout neq 'pwa' }

<header>
    <div class="header container">


        <div class="m-2">
            <a href="https://arakcharter.com/" style="position: center">
                <div>
                    <span><img src="project_files/images/logo.png" width="65" style="background-color: white;border-radius: 30px;padding: 5px"></span>
                </div>
            </a>
        </div>
        <div class="Url-text" style="text-align: center"><h2 class="mt-3 mb-3" style="font-weight: bold">ArakCharter.com</h2></div>
        <div class="header_login_btn menu-login">


            <a class="main-navigation__button2">
                {include file="`$smarty.const.FRONT_THEMES_DIR`tarlan/topBarName.tpl"}
                <div class="button-chevron-2 ">
                </div>
            </a>
            <div class="main-navigation__sub-menu2 arrow-up">
                {include file="`$smarty.const.FRONT_THEMES_DIR`tarlan/topBar.tpl"}
            </div>
        </div>
    </div>
</header>
{/if}

{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <div class="content_tech" style="margin-top: 50px;" >
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}

{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
{*        <footer>*}
{*        <div class="container">*}
{*            <div class="row m-2">*}


{*                <div class="row align-self-center" style="text-align: center;margin-top: 35px" id="about_us">*}
{*                    <div style="padding: 25px;color: white">پروازاراک_عسلویه مجددا راه اندازی شد*}
{*                        تماس جهت رزرو*}
{*                        ۰۸۶۳۳۱۳۲۰۳۵</div>*}
{*                </div>*}
{*                <div class="row align-self-center" style="text-align: center;margin-bottom: 50px" id="contact_us">*}
{*                    <div class="col"></div>*}
{*                    <div class="col-2"><a href=""><img src="project_files/images/telegram_white.png" width="50px"></a></div>*}
{*                    <div class="col-2"><a href="https://www.instagram.com/invites/contact/?i=160mv78dm9tyx&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;utm_content=1flmlin‎‏"><img src="project_files/images/instagram_white.png" width="50px"></a></div>*}
{*                    <div class="col-2"><a href="https://chat.whatsapp.com/KA1zse004BM3CkV7rIMdZa"><img src="project_files/images/whatsapp_white.png" width="50px"> </a></div>*}
{*                    <div class="col"></div>*}
{*                </div>*}
{*            </div>*}
{*        </div>*}
{*    </footer>*}
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}

{literal}
    <script src="project_files/js/bootstrap.min.js"></script>
    <script src="project_files/js/popper.min.js"></script>
    <script src="project_files/js/script.js"></script>
{/literal}
{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}
</body>
</html>