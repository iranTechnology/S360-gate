{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')} 
<!DOCTYPE html>

<html class="no-js" lang="en">

<head>
    <title>{$obj->Title_head()}</title>
    <link rel="shortcut icon" type="image/x-icon" href="project_files/project_files/images/Logo.png" />
    <meta name="description" content="{$obj->Title_head()}">
    <meta charset="UTF-8">
    <base href="{$smarty.const.CLIENT_DOMAIN}" />
    <!-- Main CSS files -->
    <link rel="stylesheet" href="project_files/css/baseFa.css">
    <link rel="stylesheet" type="text/css" href="project_files/css/camera.css">
    <!-- Animation CSS file -->
    <link rel="stylesheet" href="project_files/css/animate.css">
    <!-- custom CSS file -->
    <!-- <link rel="stylesheet" href="project_files/css/jquery.scrollbar.css"> -->
    <link rel="stylesheet" href="project_files/css/images-grid.css">
    <link rel="stylesheet" href="project_files/css/custom.css">
    <!-- plugin css file -->
    <link rel="stylesheet" href="project_files/css/plugin.css" >
    <link rel="stylesheet" href="project_files/css/responsive.css">
    <!-- jQuery Library files -->
    <script src="project_files/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="project_files/js/modernizr.js"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}


</head>
<body>


<div class="body-wrapper ">

    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}

    <div class="top-wrapper temp-top-wrapper">

        <header>

            <div class="gt_top3_wrap default_width ">




                <div class="gt_hdr_3_ui_element col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul>
                        <li class=" enabled"><i class="fa  fa-phone-square SMFooterPhone">{$smarty.const.CLIENT_PHONE}</i></li>
                        <li class=" "><a href="javascript:;"></a><i class="fa  fa-envelope-square SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</i></li>
                        <div class="reg-div">
                            {if $objSession->IsLogin()}
                                <ul>
                                    <li>
                                        <div class="dashboard_menu">
                                            <button><i class="fa dashboard" aria-hidden="true">داشبورد</i></button>
                                            <ul id="dropdown-list">

                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                                        <i class="fa fa-user margin-left-10 font-i"></i>اطلاعات
                                                        کاربری</a>
                                                </li>
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/UserBuy">
                                                        <i class="fa fa-shopping-cart margin-left-10 font-i"></i>مشاهده
                                                        خرید / استرداد </a>
                                                </li>
                                                <li>
                                                    <a href="{$smarty.const.ROOT_ADDRESS}/TrackingCancelTicket">
                                                        <i class="fa fa-ban  margin-left-10 font-i"></i> سوابق کنسلی</a>
                                                </li>

                                                {if $smarty.const.IS_ENABLE_CLUB eq 1}
                                                    <li>
                                                        <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/login.php?clubID={$hashedPass}">
                                                            <i class="fa fa-users  margin-left-10 font-i"></i> ورود به
                                                            باشگاه</a>
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
                                                        <i class="fa fa-key margin-left-10 font-i"></i>تغییر کلمه
                                                        عبور</a>
                                                </li>
                                                <li>
                                                    <a class="icon icon-study" href="javascript:;" onclick="signout()">
                                                        <i class="fa fa-sign-out margin-left-10 font-i"></i>خروج</a>
                                                </li>
                                            </ul>
                                        </div>

                                        <a class="userProfile-name user-profile" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                            <span>دوست عزیز {$objSession->getNameUser()} خوش آمدید</span>
                                            {assign var="typeMember" value=$objFunctions->TypeUser($objSession->getUserId())}
                                            {if $typeMember eq 'Counter'}
                                                <span class="CreditHide yekanB">اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
                                                    ریال می باشد </span>
                                            {elseif $typeMember eq 'Ponline'}
                                                {assign var="infoMember" value=$objFunctions->infoMember($objSession->getUserId())}
                                                {if $infoMember.is_member eq '1' && $infoMember.fk_counter_type_id eq '5'}
                                                    <span class="CreditHide yekanB">اعتبار شما {$objFunctions->getOnlineMemberCredit()|number_format}
                                                        ریال می باشد </span>
                                                {/if}
                                            {/if}
                                        </a>

                                    </li>
                                </ul>
                            {else}

                                <ul>
                                    <li><a class="_primary_color_text" href="{$smarty.const.ROOT_ADDRESS}/loginUser"> ورود <i class="glyphicon glyphicon-log-in"> </i> </a></li>
                                    <li><a class="_primary_color_text" href="{$smarty.const.ROOT_ADDRESS}/registerUser"> ثبت نام <i class="glyphicon glyphicon-user"> </i> </a></li>
                                    <li><a class="_primary_color_text" href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید<i class="glyphicon glyphicon-bell"></i> </a></li>

                                </ul>
                            {/if}

                        </div>
                        {*<li class=" "><a class="yekan" href="http://online.<?php echo str_replace('www.', '', $_SERVER["HTTP_HOST"]); ?>/gds/loginUser">ورود</a><i class="fa  fa-sign-in "></i></li>*}
                        {*<li class=" "><a class="yekan" href="http://online.<?php echo str_replace('www.', '', $_SERVER["HTTP_HOST"]); ?>/gds/registerUser">ثبت نام</a><i class="fa  fa-user "></i></li>*}

                    </ul>
                </div>


            </div>

            <div class="container">
                <div class="logo-title">
                    <a class="logo" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/"><img src="project_files/images/logofv.png" alt="بهسفر سالار گشت"></a>
                    <div class="title">
                        <h1><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">بهسفر سالار گشت</a></h1>
                        <h2>شرکت خدمات مسافرتی </h2>
                    </div>
                </div>

                <div class="top-menu">
                    <a href="javascript:;" class="mobMenu"></a>

                    <div class="mainMenuContainer yekan">
                        <span class="close-menu"></span>
                        <ul class="mainMenu">
                            <li class="active"><a  href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه اصلی</a></li>
                            <li ><a class="hvr-underline-from-center " href="javascript:;">تور ها</a>
                                <ul class="subMenu">
                                    <li><a href="javascript:;" class="m-h-out ">تورهای خارجی</a>
                                        <ul class="subMenu">
                                            <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour&level=1" class="m-h-out SMTourPortal">همه تورها</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:;" class="m-h-out ">تورهای داخلی</a>
                                        <ul class="subMenu">
                                            <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1" class="m-h-out SMTourLocal ">همه تورها</a></li>
                                        </ul>

                                    </li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=alltours" class="m-h-out All-tours SMAllTours">تور در یک نگاه</a></li>
                                </ul>
                            </li>
                            <li ><a class="hvr-underline-from-center " href="javascript:;">هتل ها</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=hotelcountry" class="m-h-out SMHotelPortal">هتل ها خارجی</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=iranhotelcity" class="m-h-out SMHotelLocal">هتل ها داخلی</a></li>
                                </ul>
                            </li>
                            <li ><a class="hvr-underline-from-center " href="javascript:;">تور های ویژه</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=tour&level=1&sptour=1" class="m-h-out SMTourPortalSp"> خارجی</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantour&level=1&sptour=1" class="m-h-out SMTourLocalSp"> داخلی</a></li>
                                </ul>
                            </li>
                            <li><a class="hvr-underline-from-center " href="javascript:;">اطلاعات گردشگری</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutiran" class="m-h-out SMAboutIran">معرفی ایران</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutcountry" class="m-h-out SMAboutCountry">معرفی کشورهای جهان</a></li>
                                </ul>
                            </li>
                            <li><a class="hvr-underline-from-center SMVisa" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacountry">اطلاعات ویزا</a> </li>
                            <li><a class="hvr-underline-from-center " href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید</a> </li>
                            <li><a class="hvr-underline-from-center " href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=1012&id=2">  قوانین و مقررات</a> </li>
                            <li><a class="hvr-underline-from-center " href="javascript:;">ارتباط با ما</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus" class="SMAbout" >درباره ما </a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus" class="SMContactUs" >تماس با ما</a></li>
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/temp.php?irantech_parvaz=packageregister" class="SMPackageRegister" >عضویت همکار</a></li>
                                </ul>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
    </div>
    
    {/if}


    <!-- end top wrapper -->
    <div class="clear"></div>





    <!-- temp -->
    <div class="container temp">
        <div class="temp-content">
            <div class="clear"></div>
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>

    </div>
    <!-- end temp -->











    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

    <!--Footer-->
    <footer>




        <div class="down-footer">
            <div class="container padl0 padr0">
                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 f-about">

                    <h4 class="f-title txtBlackGrey">آژانس  بهسفر سالار گشت</h4>
                    <p class="txtGrey">
                        شرکت خدمات مسافرت هوایی و گردشگری و جهانگردی بهسفر سالار گشت با سرلوحه قرادادن راهنمایی ها و نظرات مشتریان خود توانسته است با افتخار به عنوان یکی از دفاتر خدمات مسافرتی فعال در زمینه گردشگری در ایران ایفای نقش کند. اصلی ترین آرمان و آرزوی ما در برآورده کردن نیازهای مشتریان با بالاترین استاندارهای جهانی در کیفیت مناسب قیمت تمام شده می باشد. مدیران وپرسنل بهسفر خود را در برابر یکایک مشتریان مسئول و موظف به ارائه بهترین و با کیفیت ترین خدمات به آنها می باشد.
                    </p>

                    <div class="contact-details dark social">

                        {*<span><i class="fa fa-paper-plane addressIconSocial "><a href="" target="_blank" class="SMTelegram "></a></i></span>*}
                        {*<span><i class="fa fa-instagram addressIconSocial "><a href="" target="_blank" class="SMInstageram "></a></i></span>*}
                        {*<span><i class="fa fa-facebook addressIconSocial "><a href="" target="_blank" class="SMFaceBook "></a></i></span>*}
                        {*<span><i class="fa fa-twitter addressIconSocial "><a href="" target="_blank" class="SMTwitter"></a></i></span>*}

                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 f-about">
                    <h4 class="f-title txtBlackGrey">خدمات ما</h4>
                    <ul class="bottom-list-menu">
                        <li class="items">
                            <span><i class="fa fa-map-marker addressIcon"></i></span>
                            <span class="SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</span>
                        </li>

                        <li class="items">
                            <span><i class="fa fa-volume-control-phone  addressIcon "></i></span>
                            <span  class="ltr SMFooterPhone">{$smarty.const.CLIENT_PHONE}</span>
                        </li>
                        <li class="items">
                            <span><i class="fa fa-envelope addressIcon"></i></span>
                            <a href="mailto:{$smarty.const.CLIENT_EMAIL}" class="SMFooterEmail txt16  txtWhite  tdNU ">{$smarty.const.CLIENT_EMAIL}</a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>

        <div class="copyright " >
            <div class="container">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 company " >
                    <p class="txt13 yekan txtFFF">کلیه حقوق وب سایت متعلق به <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">بهسفر سالار گشت</a> می باشد.</p>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 irantech " >
                    <p class="txt13 yekan txtFFF">طراحی وب سایت:
                        <a class="it-logo" href="http://iran-tech.com/" target="_blank">ایران تکنولوژی</a>
                        <a href="http://www.safarbank.ir/tour/" target="_blank" class="cheapTour">تور ارزان</a>
                    </p>
                </div>
            </div>
        </div>






        <!--CopyRight-->

    </footer>

    {/if}

</div>


<!--BACK TO TOP BUTTON-->
<div class="backToTop"></div>

{literal}

<script type='text/javascript' src='project_files/js/jquery.easing.1.3.js'></script>


<script type='text/javascript' src='project_files/js/camera.min.js'></script>
<script>
    jQuery(function(){


        $('a.mobMenu').click (function(){
            $('.mainMenuContainer').animate({
                right:0
            },700);
        });
        $('.close-menu').click (function(){
            $('.mainMenuContainer').animate({
                right:-545
            },700);
        });

        $('.sp-inner h5').click(function(){
            $(this).parent().find('.sp-box').slideToggle();
        })
    });
</script>
<script src="project_files/js/jquery.babylongrid.js"></script>




<script src="project_files/js/script.js"></script>
{/literal}


{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}

</body>
</html>
