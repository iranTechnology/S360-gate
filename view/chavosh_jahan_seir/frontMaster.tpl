{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}<!D<!DOCTYPE html>

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
    <!-- plugin css file -->
    <link rel="stylesheet" href="project_files/css/plugin.css" >
    <!-- Animation CSS file -->
    <link rel="stylesheet" href="project_files/css/animate.css">
    <!-- custom CSS file -->
    <link rel="stylesheet" href="project_files/css/custom.css">
    <link rel="stylesheet" href="project_files/css/responsive.css">
    <!-- jQuery Library files -->
    <script type="text/javascript" src="project_files/js/modernizr.js"></script>
    <script src="project_files/js/jquery-2.1.4.min.js"></script>

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

    <script src="//code.tidio.co/t9uz8ycazbky7uwve13dsyz7u6mabexs.js"></script>



</head>


<body>

<!-- header -->
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
<header>
    <div class="container">
        <div class="top-header">

            <div class="social-container ">
                <div class="social">
                    <ul>
                        <li><a class="SMFaceBook  hvr-float-shadow" target="_blank"> <img alt="social"  src="project_files/images/facebook3.png"></a></li>
                        <li><a class="SMTwitter  hvr-float-shadow" target="_blank"> <img alt="social"  src="project_files/images/twitter3.png"> </a></li>
                        <li><a class="SMGoogle  hvr-float-shadow" target="_blank"><img alt="social" src="project_files/images/google-plus3.png"> </a></li>
                        <li><a class="SMInstageram  hvr-float-shadow" target="_blank"> <img alt="social"  src="project_files/images/instagram3.png"> </a></li>
                        <li><a class="SMTelegram  hvr-float-shadow" target="_blank"> <img alt="social"  src="project_files/images/telegram.png"> </a></li>
                    </ul>
                </div>
            </div>

            <div class=" top-tel">
                <a>{$smarty.const.CLIENT_PHONE}</a>
            </div>
        </div>
        <div class="top-header loginreg">
            {if $objSession->IsLogin() }
            <ul>
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
                    <span >دوست عزیز {$objSession->getNameUser()} خوش آمدید</span>
                    {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                        <span class="CreditHide yekanB">اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}ریال می باشد </span>
                    {/if}
                </a>
            </li>
            </ul>
            {else}
            <i class="fa fa-user"> </i><a href="{$smarty.const.ROOT_ADDRESS}/loginUser"> ورودکاربران </a>/<a href="{$smarty.const.ROOT_ADDRESS}/registerUser"> عضویت </a>
            {/if}
        </div>
        <div class="top-logo">
            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/"><img alt="{$smarty.const.CLIENT_NAME}" src="project_files/images/logo.png"> </a>
{*            <div class="top-ttl">*}
{*                <a href="home.php"> <h1>{$smarty.const.CLIENT_NAME}</h1></a>*}
{*                <h3>آژانس مسافرتی و گردشگری</h3>*}
{*            </div>*}
        </div>
    </div>
    <div class="clear"></div>
    <!-- menu-->

    <div class="mainMenuContainer yekan">
        <div class="container">

            <a  class="mobMenu">منوی سایت</a>
            <ul class="mainMenu">

                <li class="active"><a class="home" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه اصلی</a></li>


                <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour&level=1" class="has-menu t2">تورهای خارجی</a></li>
                <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1" class="has-menu t1" >تور های داخلی</a></li>
                <li><a class="has-menu  t3"> تورهای لحظه آخری</a>
                    <ul class="subMenu">
                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantour&level=1&sptour=1" class="SMTourLocalSp">لحظه آخری داخلی</a></li>
                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=tour&level=1&sptour=1" class="SMTourPortalSp">لحظه آخری خارجی</a></li>
                    </ul>
                </li>
                <li><a class="SMVisa visa"> ویزا</a></li>
                <li><a class="m-tracking" href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
                <li><a class=" visa has-menu"> ارتباط با ما </a>
                    <ul class="subMenu">
                        <li><a class="SMAbout about">درباره ما</a></li>
                        <li><a class="SMContactUs contact">تماس با ما</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

</header>
<!-- end header -->
{/if}

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


<div class="clear"></div>


{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
<!--Footer-->
<footer>
    <div class="top-footer">
        <div class="container">
            <a class="SMTelegram  hvr-float-shadow" target="_blank">ما را در تلگرام دنبال کنید</a>
        </div>
    </div>
    <div class="container ">



        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 contact wow fadeInUp " >
            <h2 class="main-title"><span>اطلاعات تماس</span></h2>
            <p class=" txtRight txt111 lh24 padr10 " dir="rtl"><a ><img src="project_files/images/nav2.png" alt="Location" class="mapNav"></a><span class="SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</span></p>
            <p class="txtRight lh24 padr10" dir="rtl"><span class="txt333 txt14">تلفن:</span><span class="SMFooterPhone txt14 txt111 yekan padr15" dir="ltr">{$smarty.const.CLIENT_PHONE}</span></p>
            <p class="txtRight lh24 padr10 " dir="rtl"><span class="txt333 txt14">ایمیل:</span><a href="mailto:info@chavoshtravel.com?Subject=Contact" class="SMFooterEmail txt16 txt111 tdNU padr15">{$smarty.const.CLIENT_EMAIL}</a></p>
        </div>





        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 newsletter wow fadeInUp " >
            <div id="g-map"></div>
        </div>









    </div>

    <!--CopyRight-->
    <div class="copyright " >
        <div class="container">
            <div class="col-lg-6 company " >
                <div class="stat"><script type="text/javascript" language="javascript" src="http://www.webgozar.ir/c.aspx?Code=3672405&t=counter" ></script></div>
                <p class="txt14 yekan">کلیه حقوق وب سایت متعلق به آژانس مسافرتی <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">{$smarty.const.CLIENT_NAME}</a> می باشد.</p>
            </div>
            <div class="col-lg-6 irantech " >
                <p class="txt14 yekan">طراحی وب سایت: <a href="http://iran-tech.com/" target="_blank">ایران تکنولوژی</a><a href="http://www.safarbank.ir/tour/" target="_blank" class="cheapTour">تور ارزان</a></p>
            </div>
        </div>
    </div>

</footer>
{/if}

<!--BACK TO TOP BUTTON-->
<div class="backToTop"></div>
{literal}
<!-- jQuery Site Scipts -->
<script src="project_files/js/script.js"></script>



<!--Google Map-->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtZ3tGybs75zk_7ic_Fij2QbqyFyG7wRU"></script>
<script type="text/javascript">
    // When the window has finished loading create our google map below
    google.maps.event.addDomListener(window, 'load', init);
    function init() {
        // Basic options for a simple Google Map
        var mapOptions = {
            zoom: 16,
            scrollwheel: false,
            center: new google.maps.LatLng(35.736195, 51.331343),
            mapTypeControlOptions: {
                mapTypeIds: [google.maps.MapTypeId.TERRAIN]
            },
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            // changing colors style goes her
            styles: [{"featureType":"landscape","stylers":[{"hue":"#FFBB00"},{"saturation":43.400000000000006},{"lightness":37.599999999999994},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#FFC200"},{"saturation":-61.8},{"lightness":45.599999999999994},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":51.19999999999999},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#FF0300"},{"saturation":-100},{"lightness":52},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#0078FF"},{"saturation":-13.200000000000003},{"lightness":2.4000000000000057},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#00FF6A"},{"saturation":-1.0989010989011234},{"lightness":11.200000000000017},{"gamma":1}] }]
        };
        var mapElement = document.getElementById('g-map');
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(35.736195, 51.331343),
            map: map,
            title: 'چاوش جهان سیر',
            icon: 'project_files/images/nav.png'
        });
        var infowindow = new google.maps.InfoWindow({
            content:'<div class="googleLabel">اشرفی اصفهانی به سمت جنوب ، نرسیده به مرزداران ، پیامبر شرقی ، گلستان 25 ، پلاک 1</div>'
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
        });

//            infowindow.open(map,marker);
    }
</script>


{/literal}
{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>
</html>





