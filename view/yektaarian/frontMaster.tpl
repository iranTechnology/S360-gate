{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}
<!DOCTYPE html>

<html class="no-js" lang="en">

<head>
    <!-- Required meta tags -->
    <title>{$obj->Title_head()}</title>
    <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png"/>
    <meta name="description" content="{$obj->Title_head()}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    <!-- Main CSS files -->

    <!-- Animation CSS file -->
    <link rel="stylesheet" href="project_files/css/animate.css">
    <!-- custom CSS file -->
    <link rel="stylesheet" href="project_files/css/custom.css">
    <!-- plugin css file -->
    <link rel="stylesheet" href="project_files/css/plugin.css" >
    <link rel="stylesheet" href="project_files/css/responsive.css">
    <!-- jQuery Library files -->

    <script src="project_files/js/jquery.js"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}


</head>
<body>
<div class="blackContainer "></div>









<div class="body-wrapper ">


    <div class="top-wrapper">


        <header>


            <div class="top_menu_1">

                <div class="container">

                    <div class="row">

                        <div class="col-md-6 col-sm-6 hidden-xs-down">

                            <div class="social ">
                                <a href="" target="_blank" class="SMTelegram telegram wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/telegram.png" alt="social"></a>
                                <a href="" target="_blank" class="SMInstagram instagram wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/instagram.png" alt="social"></a>
                                <a href="" target="_blank" class="SMFacebook facebook wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/facebook.png" alt="social"></a>
                                <a href="" target="_blank" class="SMTwittwe facebook wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/twitter.png" alt="social"></a>

                            </div>

                        </div>
                        <div class="col-md-6  col-sm-6  col-xs-12">

                            <div class="top__user_menu">

                                <div class="main-navigation__item support margin-vl-2">
                                    <button aria-label="Support" type="button" class="main-navigation__button2 support-icon">
                                        <svg width="20px" height="20px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="mx-1 mx-2-md"><g><path d="M12,10.5 C14.6233526,10.5 16.75,8.37335256 16.75,5.75 C16.75,3.12664744 14.6233526,1 12,1 C9.37664744,1 7.25,3.12664744 7.25,5.75 C7.25,8.37335256 9.37664744,10.5 12,10.5 Z M12,11.5 C8.82436269,11.5 6.25,8.92563731 6.25,5.75 C6.25,2.57436269 8.82436269,0 12,0 C15.1756373,0 17.75,2.57436269 17.75,5.75 C17.75,8.92563731 15.1756373,11.5 12,11.5 Z M22,24 C22,18.4771525 17.5228475,14 12,14 C6.4771525,14 2,18.4771525 2,24 L1,24 C1,17.9248678 5.92486775,13 12,13 C18.0751322,13 23,17.9248678 23,24 L22.5,24 L22,24 Z"></path></g></svg>

                                        <div class="button-text-wrapper">
                                            <strong class="ltr long-text">
                                                {include file="`$smarty.const.FRONT_THEMES_DIR`yektaarian/topBarName.tpl"}
                                            </strong>
                                        </div>

                                        <div class="button-chevron-2">
                                            <svg fill="#626262" width="12" height="12" xmlns="http://www.w3.org/2000/svg"
                                                 viewBox="0 0 12 12" class="v-middle">
                                                <g fill-rule="evenodd">
                                                    <polygon fill-rule="nonzero"
                                                             points="10.466 3.06 11.173 3.767 6.002 8.939 .83 3.767 1.537 3.06 6.002 7.524"></polygon>
                                                </g>
                                            </svg>
                                        </div>
                                    </button>
                                    <div class="main-navigation__sub-menu2 arrow-up">

                                        {include file="`$smarty.const.FRONT_THEMES_DIR`yektaarian/topBar.tpl"}

                                    </div>


                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

            <div class="container menus">
                <div class="row px-3">

                <a class="logo-title" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                    <div class="logo" ><img src="project_files/images/logo.png" alt="logo"></div>

                </a>

                <div class="top-menu">
                    <a href="javascript:;" class="mobMenu"></a>

                    <div class="mainMenuContainer yekan">
                        <span class="close-menu"></span>

                        <ul class="mainMenu">
                            <li class="resp-home-menu"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه اصلی</a></li>
                            <li ><a  href="javascript:;">تور ها</a>
                                <ul class="subMenu">
                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1">تور داخلی</a>

                                    </li>

                                    <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour&level=1">تور خارجی</a>

                                    </li>

                                    <li><a href="javascript:;">تور ویژه</a>
                                        <ul>
                                            <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1&special=1" >داخلی</a></li>
                                            <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour&level=1&special=1" >خارجی</a></li>
                                        </ul>
                                    </li>
                                    <li><a class="other-tour " href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=alltours">تورها در یک نگاه</a></li>

                                </ul>
                            </li>

                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacountry" class="SMVisa">ویزا</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" >پیگیری خرید</a></li>
                            <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=product3" >خدمات گردشگری</a></li>
                            <li class="menu-sep"></li>

                            <li><a class="SMRules" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">قوانین و مقررات</a></li>
                            <li><a  href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus">درباره ما</a></li>
                            <li><a  href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس با ما</a></li>


                            <li>

                                <div class="top__user_menu">


                                </div>

                            </li>



                        </ul>
                    </div>
                </div>

                </div>


            </div>

            <!-- menu-->


        </header>



    </div>
    <!-- end top wrapper -->







    <!-- temp -->
    <div class="container temp">
        <div class="temp-content">


            <div class="clear"></div>
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}      </div>
        </div>

    </div>
    <!-- end temp -->







    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

    <!--Footer-->

</div>

<footer>

    <div class="top-footer" ">
    <div class="container">
        <div class="row">
        <div class="col-lg-3 col-md-6 col col-12 f-c-item p-1" >
            <p class="min_height_footer f-item wow bounceIn" data-wow-delay=".15s" dir="rtl">
                <span class="f-address"></span>
                <span class="SMFooterAddress footer-txt"><a class="" href="http://maps.google.com/?q=تهران خیابان مطهری"></a>{$smarty.const.CLIENT_ADDRESS}</span>
            </p>
        </div>
        <div class="col-lg-3 col-md-6 col col-12 f-c-item p-1" >
            <p class="min_height_footer f-item wow bounceIn" data-wow-delay=".25s" dir="ltr">
                <span class="f-tel"></span>
                <span  class="ltr SMFooterPhone footer-txt"><a class=" yekan" href="tel:02188866609" ></a>{$smarty.const.CLIENT_PHONE}</span>
            </p>
        </div>
        <div class="col-lg-3 col-md-6 col col-12 f-c-item p-1" >
            <p class="min_height_footer f-item wow bounceIn" data-wow-delay=".35s" dir="rtl">
                <span class="f-fax"></span>
                <span class=" SMFooterFax  footer-txt ltr"><a class="yekan"  href="tel:02188866609" ></a>{$smarty.const.CLIENT_PHONE}</span>
            </p>
        </div>
        <div class="col-lg-3 col-md-6 col col-12 f-c-item p-1" >
            <p class="min_height_footer f-item wow bounceIn" data-wow-delay=".45s" >
                <span class="f-email"></span>
                <span class="footer-txt"><a href="mailto:info@iran-tech.com?Subject=Contact" class=" txt16 txtFFF tdNU padr15 SMFooterEmail"> </a>{$smarty.const.CLIENT_EMAIL}</span>
            </p>
        </div>
        </div>
        <div class="clear"></div>

        <!-- social icons -->
        <div class="social ">
            <a href="" target="_blank" class="SMTelegram telegram wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/telegram.png" alt="social"></a>
            <a href="" target="_blank" class="SMInstagram instagram wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/instagram.png" alt="social"></a>
            <a href="" target="_blank" class="SMFacebook facebook wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/facebook.png" alt="social"></a>
            <a href="" target="_blank" class="SMTwittwe facebook wow fadeInDown" data-wow-delay=".3s"><img src="project_files/images/twitter.png" alt="social"></a>

        </div>


        {* <div id="g-map"></div>*}

    </div>

<!--CopyRight-->
<div class="copyright " >
    <div class="container">
        <div class="row">
        <div class="col-lg-8 col-md-8 col-xs-12 company " >
            <p class="txt14 yekan txtEEE">کلیه حقوق وب سایت متعلق به <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">یکتا آرین کیش</a> می باشد.</p>
        </div>
        <div class="col-lg-4 col-md-4 col-xs-12 irantech " >
            <p class="txt14 yekan txtEEE">طراحی وب سایت: <a class="it-link" href="https://www.iran-tech.com/" target="_blank">ایران تکنولوژی</a></p>
        </div>
        </div>
    </div>
</div>

</footer>
{/if}
<!--BACK TO TOP BUTTON-->
<div class="backToTop"></div>

{literal}

    <script>
        $('a.mobMenu').click (function(){
            $('.mainMenuContainer').animate({
                right:0
            },1000);
        });
        $('.close-menu').click (function(){
            $('.mainMenuContainer').animate({
                right:-550
            },1000);
        });

        $('.sp-inner h5').click(function(){
            $(this).parent().find('.sp-box').slideToggle();
        });

        $('.main-navigation__button').click(function () {

            $('.main-navigation__sub-menu').fadeToggle();
            $(this).find('.button-chevron').toggleClass('rotate');
            $('.main-navigation__sub-menu2').hide();
            $('.button-chevron-2').removeClass('rotate');
        });

    </script>

    <script src="project_files/js/bootstrap.min.js"></script>
    <script src="project_files/js/script.js"></script>
{/literal}
{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>
</html>

