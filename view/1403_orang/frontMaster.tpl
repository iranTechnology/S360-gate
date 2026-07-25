{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')} 
<!DOCTYPE html>

<html class="no-js" lang="fa_IR">
    <head>
        <meta charset="utf-8">
        <title>{$obj->Title_head()}</title>
        <meta name="description" content="{$obj->Title_head()}">
        <base href="{$smarty.const.CLIENT_DOMAIN}" />
        <link rel="shortcut icon" type="image/x-icon" href="project_files/images/logo.png" />
        <link rel="stylesheet" href="project_files/css/plugin2.css">
        <link rel="stylesheet" href="project_files/css/custom.css">
        <link rel="stylesheet" href="project_files/css/responsive.css">
        <script src="project_files/js/jquery-3.4.1.min.js"></script>
        <script src="project_files/js/modernizr.js"></script>
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
    </head>
    <body class="temp--">
        {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
            <div class="top-wrapper">
                <header class="float-panel navbar navbar-fixed-top">
                    <div class=" top-navbar-wrapper">
                        <div class="container">
                            <div class=" right-link">
                                {if $objSession->IsLogin()}
                                    <ul>
                                        <li>
                                            <div class="dashboard_menu">
                                                <button><i class=" dashboard" aria-hidden="true">داشبورد</i></button>
                                                <ul id="dropdown-list">
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/userProfile"><i class="fa fa-user margin-left-10 font-i"></i>اطلاعات کاربری</a>
                                                    </li>
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/UserBuy"><i class="fa fa-shopping-cart margin-left-10 font-i"></i>مشاهده خرید / استرداد </a>
                                                    </li>
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/TrackingCancelTicket"><i class="fa fa-ban  margin-left-10 font-i"></i> سوابق کنسلی</a>
                                                    </li>

                                                    {if $smarty.const.IS_ENABLE_CLUB eq 1}
                                                        <li>
                                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/login.php?clubID={$hashedPass}"><i class="fa fa-users  margin-left-10 font-i"></i> ورود به باشگاه</a>
                                                        </li>
                                                    {/if}
                                                    {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS}/Emerald"><i class="fa fa-diamond margin-left-10 font-i"></i>زمرد</a>
                                                        </li>
                                                        <li>
                                                            <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/Emerald/rahnamaye_zomorod_360.pdf"><i class="fa fa-book margin-left-10 font-i"></i>راهنمای دریافت زمرد</a>
                                                        </li>
                                                    {/if}
                                                    <li>
                                                        <a href="{$smarty.const.ROOT_ADDRESS}/UserPass"><i class="fa fa-key margin-left-10 font-i"></i>تغییر کلمه عبور</a>
                                                    </li>
                                                    <li>
                                                        <a class="icon icon-study" href="javascript:" onclick="signout()"><i class="fa fa-sign-out margin-left-10 font-i"></i>خروج</a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <a class="userProfile-name user-profile" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                                <span>دوست عزیز {$objSession->getNameUser()} خوش آمدید</span>
                                                {assign var="typeMember" value=$objFunctions->TypeUser($objSession->getUserId())}
                                                {if $typeMember eq 'Counter'}
                                                    <span class="CreditHide etebr-- yekanB">اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
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

                                    <ul class="_z2">
                                        <li class='_right _mr_2'><a class="_w_color_text " href="{$smarty.const.ROOT_ADDRESS}/registerUser"> ثبت نام <i class="fa fa-user"> </i> </a></li>
                                        <li class='_right _mr_2'><a class="_w_color_text " href="{$smarty.const.ROOT_ADDRESS}/loginUser"> ورود <i class="fa fa-sign-in"> </i> </a></li>
                                    </ul>
                                {/if}
                                <div class="nav-top-text  peigiri dirR ">

                                    <a style="color: #d70100 !important;" href="https://tollpayment.sadadpsp.ir/" class="blink_me "
                                       target="_blank">
                                        پرداخت عوارض خروجی
                                    </a>
                                </div>
                                <div class="nav-top-text peigiri dirR ">
                                    <a style="color: #d70100 !important;" href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="blink_me "> پیگیری خرید </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=" container">
                        <div class="row">
                            <div class="middle-link">
                                <div class="logo">
                                    <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                                        <img src="project_files/images/logo-txt.png" alt="logo">
                                    </a>
                                </div>
                            </div>
                            <div class="menu-container">
                                <div class="main-site-menu">
                                    <ul class="clearfix">
                                        <li>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/" class="">صفحه اصلی</a>
                                        </li>
                                        <li>
                                            <a style="cursor: pointer">اطلاعات گردشگری <i class="fa fa-angle-down"></i></a>
                                            <ul class="normal-sub" style="display: none;">
                                                <li>
                                                    <a class="SMBlog" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=blog">سفرنامه</a>
                                                </li>
                                                <li>
                                                    <a class="SMWeather" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=weather">هواشناسی</a>
                                                </li>
                                                <li>
                                                    <a class="SMEmbassy" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=embassy">سفارتخانه</a>
                                                </li>
                                                <li>
                                                    <a class="SMChange" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=change">نرخ ارز</a>
                                                </li>
                                                <li>
                                                    <a class="" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=sitelink&id=3">راهنمای رزرو آنلاین</a>
                                                </li>
                                                <li>
                                                    <a  class="SMWorldClock" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=worldclock"> ساعت کشورها </a>
                                                </li>
                                                <li>
                                                    <a class="SMLink" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=cat">اطلاعات مفید</a>
                                                </li>
                                                <li>
                                                    <a class="SMAboutCountry" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutcountry"> معرفي كشورها</a>
                                                </li>
                                                <li>
                                                    <a class="SMAboutIran" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutiran"> معرفي ايران</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a class="SMVisa" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacountry" >ویزا </a>
                                        </li>
                                        <li>
                                            <a class="SMOrder" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=order" >درخواست خدمات</a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/cancellationFee"> درصدهای کنسلی  </a>
                                        </li>
                                        <li>
                                            <a class="_w_color_text " href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید </a>
                                        </li>
                                        <li>
                                            <a class="_w_color_text " href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=complaints">  فرم شکایات </a>
                                        </li>
                                        <li>
                                            <a class="_w_color_text " href="https://orang360.ir/"> تور </a>
                                        </li>
                                        <li>
                                            <a style="cursor: pointer" href="javascript:;">درباره ما <i class="fa fa-angle-down"></i></a>

                                            <ul class="normal-sub" style="display: none;">
                                                <li>
                                                    <a class="SMNews" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=news">اخبار سایت</a>
                                                </li>
                                                <li>
                                                    <a class="SMFaq" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq">پرسش های
                                                        متداول </a>
                                                </li>
                                                <li>
                                                    <a class="SMRules" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules"> قوانین و مقررات </a>
                                                </li>
                                                <li>
                                                    <a class="SMAgent" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=agent">درخواست نمایندگی</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus" class="SMContactUs">ارتباط با ما</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </header>
            </div>
            <!-- end tabs -->
        {/if}
        <div class="main-temp">
            <div class="container">
                <div class="main-temp-content">
                    <div>
                        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
                    </div>
                </div>
            </div>
        </div>
        {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
            <footer>
                <div class="footer ">
                    <div class="footer-row1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-5 col-md-4 col-sm-6 col-xs-12">
                                    <h4>آدرس :</h4>
                                    <div class="dt-sc-ico">
                                        <span class="fa fa-map-marker"></span>
                                        <h5 class="SMFooterAddress"><span class="SMFooterAddress"> {$smarty.const.CLIENT_ADDRESS}</span></h5>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <h4>ایمیل :</h4>
                                    <div class="dt-sc-ico">
                                        <span class="fa fa-envelope"></span>
                                        <h5 class=""><a href="mailto:{$smarty.const.CLIENT_EMAIL}" class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a></h5>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <h4>تلفن :</h4>
                                    <div class="dt-sc-ico">
                                        <span class="fa fa-phone"></span>
                                        <h5 class=""><a href="tel:{$smarty.const.CLIENT_PHONE}" class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer-row2">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 ">
                                    <h4 class="footerTitle"><span>دسترسی سریع</span></h4>
                                    <ul class="footer-list-menu">
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize "></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=cat" class="SMLink">اطلاعات مفید</a>
                                            </span>
                                        </li>
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize"></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=blog" class="SMBlog">سفرنامه</a>
                                            </span>
                                        </li>
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize"></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutiran" class="SMAboutIran">معرفی ایران</a>
                                            </span>
                                        </li>
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize"></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutcountry" class="SMAboutCountry">معرفی کشورها</a>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                    <ul class="footer-list-menu">
                                        <h4 class="footerTitle"><span>دسترسی سریع</span></h4>
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize "></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=order" class="SMOrder">درخواست خدمات</a>
                                            </span>
                                        </li>
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize"></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq" class="SMFaq">پرسشهای متداول</a>
                                            </span>
                                        </li>
                                        <li class="items_link">
                                            <span>
                                                <i class="fa fa-angle-left addressIcon addressIconSize"></i>
                                            </span>
                                            <span>
                                                <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules" class="SMRules">قوانین و مقررات</a>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                    <div class="row">
                                        <div class="footerlogos">
                                            <div class="">
                                                <a target="_blank" href="https://www.cao.ir/paxrights"><img src="project_files/images/paxright.png" alt=""></a>
                                            </div>
                                            <div class="">
                                                <img src="project_files/images/simorgh.png" alt="">
                                            </div>
                                        </div></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 _left">
                                    <div class="logo">
                                        <a href="<?php echo $homeLink; ?>">
                                            <img src="project_files/images/logo.png" alt="logo">
                                        </a>
                                        <div class="title">
                                            <a href="#">
                                                <h2> شرکت خدمات مسافرتی و جهانگردی اورنگ </h2>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="arzan-flight-15 arzan-flight-btn">
                    <span class="close-flight-15"></span>
                    <img src="project_files/images/load.gif"  id="loadbox">
                    <div id="ShowCalenderFlight"></div>
                </div>
            </footer>
            <div class="copyright ">
                <div class="container d-flex flex-wrap">
                    <div class="col-lg-7 col-md-12 col-xs-12 company ">
                        <p class="txt14 yekan txtEEE">کلیه حقوق وب سایت متعلق به
                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/"> اورنگ</a> می باشد.
                        </p>
                    </div>
                    <div class="col-lg-5 col-md-12 col-xs-12 irantech ">
                        <p class="txt14 yekan txtEEE">
                            طراحی وب سایت:
                            <a class="it-link" href="https://iran-tech.com/" target="_blank">ایران تکنولوژی
                            </a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="backToTop"></div>
        {/if}
        {literal} 
            <script type="text/javascript" src="project_files/js/tabs.js"></script>
            <script type='text/javascript' src='project_files/js/jquery.easing.1.3.js'></script>
            <script src="project_files/js/ace-responsive-menu.js" type="text/javascript"></script>
            <script type="text/javascript">
                $(document).ready(function () {

                    $("#downClick").click(function () {
                        $('html, body').animate({
                            scrollTop: $(".cover").offset().top
                        }, 2500);
                    });

                    $('#number_of_passengers').on('change', function (e) {
                        var itemInsu = $("#number_of_passengers").val();

                        itemInsu++;
                        var HtmlCode = "";
                        $(".nafarat-bime").remove();

                        var i = 1;
                        while (i < itemInsu) {

                            HtmlCode += "<div class='form-item form-item-date nafarat-bime'><span class='fa-stack fa-lg calendar-icon'><i class='fa fa-calendar fa-stack-1x'></i></span><div class='input'><input type='text' placeholder='تاریخ تولد نفر " + i + "'  class='search_input shamsiBirthdayCalendar' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "'></div></div>";
                            i++;
                        }

                        $(".nafaratbime").append(HtmlCode);
                    });
                });

            </script>
            <script type="text/javascript">

                $(document).scroll(function () {
                    ss = $(window).scrollTop();

                    if (ss > 1400) {

                        $('.img-midd ').css('transform', 'translateY(0px)')

                    } else {
                        $('.img-midd ').css('transform', 'translateY(400px)')
                    }
                });

                $(document).ready(function () {


                    $(".news-image").mouseover(function () {
                        var imgUrl = $(this).data("newstitle");
                        $(this).parents(".newsBoxTitle").siblings(".newsBoxImg").find("img").attr('src', imgUrl);
                    });

                });
            </script>


            <script src="project_files/js/carouseller.js"></script>
            <script>
                $(function () {
                    $('#first').carouseller({
                        scrollSpeed: 2000,
                        autoScrollDelay: 1000,
                        easing: 'linear'
                    });
                });

            </script>
            <script src="project_files/js/liquo.min.js"></script>
            <script>
                $("#gallery").liquo({
                    menu: "#gallery-menu",
                    random: true
                });
            </script>
        {/literal}
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
    </body>
</html>