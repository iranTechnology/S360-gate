{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <title>{$obj->Title_head()}</title>
        <meta name="description" content="{$obj->Title_head()}">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, user-scalable=0">
        <base href="{$smarty.const.CLIENT_DOMAIN}" />
        
        <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.ico" />
		<link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png" />

        <!-- Main CSS files -->
        <link rel="stylesheet" href="project_files/css/baseFa.css"> 

        <!-- Animation CSS file -->
        <link rel="stylesheet" href="project_files/css/animate.css">
        <link rel="stylesheet" href="project_files/css/custom.css">

        <!-- plugin css file --> 
        <link rel="stylesheet" href="project_files/css/plugin.css" >
        <link rel="stylesheet" href="project_files/css/responsive.css">            


        <!-- jQuery Library files -->
        <script type="text/javascript" src="project_files/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="project_files/js/modernizr.js"></script>

        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

    </head>
    <body class="tempBg">

        <div class="blackContainer"></div>
        <div class="body-wrapper scrollbar-dynamic">
            {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintEuropcar &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationZarvan &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicketReservation
            }
                <div class="top-wrapper temp-top-wrapper top-wrapper-temp">


                    <header class="float-panel">

                        <div class="sfm-headerBar">
                            <div class="container">
                                

                                <div class="sfm-headerBar-social col-lg-7 col-md-7 col-sm-12 col-xs-12 ">
                                    <div class="topLogin">
                                        <ul>
                                        {if $objSession->IsLogin()}

                                            <li>
                                                <div class="dashboard_menu">
                                                    <button><i class="fa fa-user" aria-hidden="true"></i></button>
                                                    <ul id="dropdown-list">

                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                                                <i class="fa fa-user margin-left-10 font-i"></i>اطلاعات کاربری</a>
                                                        </li>
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/UserBuy">
                                                                <i class="fa fa-shopping-cart margin-left-10 font-i"></i>مشاهده خرید / استرداد </a>
                                                        </li>
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/TrackingCancelTicket">
                                                                <i class="fa fa-ban  margin-left-10 font-i"></i> سوابق کنسلی</a>
                                                        </li>

                                                        {if $smarty.const.IS_ENABLE_CLUB eq 1}
                                                            <li>
                                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/login.php?clubID={$hashedPass}">
                                                                    <i class="fa fa-users  margin-left-10 font-i"></i> ورود به باشگاه</a>
                                                            </li>
                                                        {/if}
                                                        {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                                                            <li>
                                                                <a href="{$smarty.const.ROOT_ADDRESS}/Emerald">
                                                                    <i class="fa fa-diamond margin-left-10 font-i"></i>زمرد</a>
                                                            </li>
                                                            <li>
                                                                <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/Emerald/rahnamaye_zomorod_360.pdf">
                                                                    <i class="fa fa-book margin-left-10 font-i"></i>راهنمای دریافت زمرد</a>
                                                            </li>
                                                        {/if}
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/UserPass">
                                                                <i class="fa fa-key margin-left-10 font-i"></i>تغییر کلمه عبور</a>
                                                        </li>
                                                        <li>
                                                            <a class="icon icon-study" onclick="signout()">
                                                                <i class="fa fa-sign-out margin-left-10 font-i"></i>خروج</a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <a class="userProfile-name" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                                    <span>دوست عزیز {$objSession->getNameUser()} خوش آمدید</span>
                                                    {assign var="typeMember" value=$objFunctions->TypeUser($objSession->getUserId())}
                                                    {if $typeMember eq 'Counter'}
                                                        <span class="CreditHide yekanB">اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}ریال می باشد </span>
                                                    {elseif $typeMember eq 'Ponline'}
                                                        {assign var="infoMember" value=$objFunctions->infoMember($objSession->getUserId())}
                                                        {if $infoMember.is_member eq '1' && $infoMember.fk_counter_type_id eq '5'}
                                                            <span class="CreditHide yekanB">اعتبار شما {$objFunctions->getOnlineMemberCredit()|number_format}ریال می باشد </span>
                                                        {/if}
                                                    {/if}
                                                </a>

                                            </li>

                                        {else}
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/registerUser">
                                                    <i class="fa fa-user " aria-hidden="true"></i>
                                                    <span> ثبت نام </span></a>
                                                </li>

                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/loginUser">
                                                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                                                    <span>ورود</span></a>
                                                </li>
                                        {/if}
                                        </ul>

                                    </div>
                                </div>

                                <div class="sfm-headerBar-menu col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                    <div class="sfm-headerBar-mail fa fa-envelope-o"><a class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a></div>
                                    <div class="sfm-headerBar-phone fa fa-phone"><span class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</span></div>
                                </div>

                                <div class="clear"></div>

                            </div>
                        </div>

                        <div class="content-area container">

                            <div class="logo">
                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/" >
                                    <img src="project_files/images/logo.png" alt="{$smarty.const.CLIENT_NAME}">
                                </a>
                            </div>

                            <div class="top-menu">
                                <a class="mobMenu"></a>

                                <div class="mainMenuContainer">
                                    <span class="close-menu"></span>

                                    <ul class="mainMenu">
                                        <li class= "active">
                                            <i class="mdi mdi-home"></i>
                                            <a  href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه اصلی</a>
                                        </li>

                                        <li class="">
                                            <i class="mdi mdi-book-multiple"></i>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">قوانین خرید</a>
                                        </li>
                                        
                                        <li class="">
                                            <i class="mdi mdi-phone-in-talk"></i>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a>
                                        </li>

                                        <li class="">
                                            <i class="mdi mdi-help-circle "></i>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq">سوالات متداول</a>
                                        </li>
										<li class="">
                                            <i class="mdi mdi-comment "></i>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=complaints">ثبت شکایت</a>
                                        </li>

                                        <li class="">
                                            <i class="mdi mdi-information-outline "></i>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus">درباره ما</a>
                                        </li>

                                        <li class="">
                                            <i class="mdi mdi-contacts "></i>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس با ما</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- menu-->

                    </header>

                </div>
            {/if}
            <!-- end menu -->

            <div class="clear"></div>

            <!-- temp -->
            <div class="container">
                <div class="temp-content">
                    <div class="temp-wrapper" id="public_load">

                        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}

                    </div>
                </div>
            </div>

            <!-- end temp -->
            {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintEuropcar &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationZarvan &&
                $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicketReservation}

                <footer>
                    <div class="top-footer ">
                        <div class="container">

                            <div class="wrapper">

                                <div class="mag-footer-cell col-xs-12 col-sm-12 col-md-12 col-lg-7 marb10"> 
                                    <div class="mag-footer-title">ارتباط با ما</div>
                                    <div class="mag-footer-content">

                                        <p class="footerAddress"><span class="fa fa-map-marker"></span><span class="padr10 SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</span></p>
                                        <p class="footerAddress" ><span class="fa fa-phone"></span><span  class="ltr"><a class="SMFooterPhone txt18 txtFFF yekan padr10 SMFooterPhone">{$smarty.const.CLIENT_PHONE}</a></span></p>
                                        <p class="footerAddress" ><span class="fa fa-envelope-o"></span><a  class="SMFooterEmail txt14 txtFFF tdNU padr15 SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a></p>

                                        <div class="social mart15 padb10">
                                            <ul>
                                                <li><i class="fa fa-facebook" aria-hidden="true">
                                                        <a target="_blank" class="SMFaceBook"></a>
                                                    </i></li>
                                                <li><i class="fa fa-twitter" aria-hidden="true">
                                                        <a target="_blank" class="SMTwitter"></a>
                                                    </i></li>
                                                <li><i class="fa fa-linkedin" aria-hidden="true">
                                                        <a target="_blank" class="SMLinkedin"></a>
                                                    </i></li>
                                                <li><i class="fa fa-google-plus" aria-hidden="true">
                                                        <a target="_blank" class="SMGoogle"></a>
                                                    </i></li>
                                                <li><i class="fa fa-youtube" aria-hidden="true">
                                                        <a target="_blank" class="SMYouTube"></a>
                                                    </i></li>
                                                <li><i class="fa fa-instagram" aria-hidden="true">
                                                        <a target="_blank" class="SMInstageram"></a>
                                                    </i></li>
                                                <li><i class="fa fa-paper-plane-o" aria-hidden="true">
                                                        <a target="_blank" class="SMTelegram"></a>
                                                    </i></li>
                                            </ul>
                                        </div>

                                    </div> 
                                </div>
                                <div class="mag-footer-cell col-xs-12 col-sm-12 col-md-12 col-lg-5 marb10"> 

                                    <div id="g-map"> </div> 
                                </div>
                                <div class="clear"></div>
                            </div>

                        </div>


                    </div>
                    <!--CopyRight-->    
                    <div class="copyright " >
                        <div class="container">
                            <div class="col-lg-6 col-md-7 col-xs-12 company " >
                                <p class="txt14 yekan txtDDD">کلیه حقوق وب سایت متعلق به <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">{$smarty.const.TITLE_SITE}</a> می باشد.</p>
                            </div>
                            <div class="col-lg-6 col-md-5 col-xs-12 irantech " >
                                <p class="txt14 yekan txtDDD">طراحی وب سایت: <a class="it-link" href="http://iran-tech.com/" target="_blank">ایران تکنولوژی</a><a href="http://www.safarbank.ir/tour/" target="_blank" class="cheapTour">تور ارزان</a></p>
                            </div>
                        </div>
                    </div>
                </footer>
            {/if}
        </div>

        <!--BACK TO TOP BUTTON-->
        <div class="backToTop"></div>

        <!--Google Map-->


        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}

    </body>
</html>
