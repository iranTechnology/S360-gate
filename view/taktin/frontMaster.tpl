{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}

<!DOCTYPE html>

<html class="no-js" lang="en">
    
<head>
<meta name="description" content="{$obj->Title_head()}">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, user-scalable=0">
    <base href="{$smarty.const.CLIENT_DOMAIN}" />
  <!-- Main CSS files -->
  <link rel="stylesheet" href="project_files/css/baseFa.css"> 
  <!-- Animation CSS file -->
  <link rel="stylesheet" href="project_files/css/animate.css">
  <!-- custom CSS file -->
  <link rel="stylesheet" href="project_files/css/custom.css">
    <!-- plugin css file -->
  <link rel="stylesheet" href="project_files/css/plugin.css" >
  <link rel="stylesheet" href="project_files/css/responsive.css"> 
  <link rel="stylesheet" href="project_files/css/all.css">
  <!-- jQuery Library files -->
  <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png" />

  <script src="project_files/js/jquery-2.1.4.min.js"></script>
 	{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
    <title>{$obj->Title_head()}</title>
</head>
<body>
<div class="blackContainer "></div>

<div class="body-wrapper ">

{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
<div class="top-wrapper">

<header>
<div class="container">
    <div class="top_bar d-none d-sm-block">
        <div class="row">
            <div class="col d-flex flex-row">
                <div class="phone"> تماس باما :
                    <a class="SMFooterPhone" href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>

                </div>
                <div class="social--">
                    <ul class="social_list--">
                        <li class="social_list_item"><a href="#" target="_blank" class="SMGoogle">
                            </a>
                        </li>
                        <li class="social_list_item"><a href="http://telegram.me/@taktintravel" target="_blank" class="SMTelegram"><i
                                        class="fab fa-telegram " aria-hidden="true"></i></a>
                        </li>
                        <li class="social_list_item"><a href="http://instagram.com/tak_tinsafar" target="_blank" class="SMInstageram"><i
                                        class="fab fa-instagram " aria-hidden="true"></i></a>
                        </li>
                        <li class="social_list_item"><a
                                    href="https://api.whatsapp.com/send?phone=989329504778"
                                    target="_blank" class=""><i
                                        class="fab fa-whatsapp " aria-hidden="true"></i></a>
                        </li>
                        <li class="social_list_item"><a href="viber://chat?number=+989329504778"
                                                        target="_blank" class=""><i
                                        class="fab fa-viber " aria-hidden="true"></i></a>
                        </li>

                    </ul>
                </div>
                <div class="social--">
                    <div class="link_salamat_top">

                        <a class="link-salamat-a-top" href="http://www.taktinmedical.org/">گردشگری سلامت</a>

                    </div>
                </div>
                <div class="user_box mr-auto">
                    {if $objSession->IsLogin()}
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
            
                                {if $smarty.session.typeUser eq 'counter'}
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/tourRegistration">
                                            <i class="fa fa-suitcase margin-left-10 font-i"></i>ثبت تور</a>
                                    </li>
            
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/tourList">
                                            <i class="fa fa-th-list margin-left-10 font-i"></i>لیست تورها</a>
                                    </li>
                                {/if}
            
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
            	</ul>
                {else}
                    <div class="user_box_login user_box_link"><i class="fas fa-unlock-alt" aria-hidden="true"></i><a href="{$smarty.const.ROOT_ADDRESS}/loginUser">ورود</a>
                    </div>
                    <div class="user_box_register user_box_link"><i class="fas fa-user" aria-hidden="true"></i><a  href="{$smarty.const.ROOT_ADDRESS}/registerUser">عضویت</a>
                    </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
  <a class="logo-title" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
      <div class="logo" ><img src="project_files/images/logo.png" alt="logo"></div>

    </a>

<div class="top-menu">
<a  class="mobMenu"></a>

 	<div class="mainMenuContainer yekan">
     	<span class="close-menu"></span>
         <ul class="mainMenu">
            <li class="resp-home-menu"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">صفحه اصلی</a></li>
            <li class="has-sub"><a  href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1">تور های داخلی</a></li>
           	<li class="has-sub"><a  href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour&level=1">تور های خارجی </a></li>
    		<li ><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">قوانین و مقررات</a></li>
            <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
            <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus">درباره ما</a></li>
            <li ><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس با ما</a></li>
        </ul>
  	</div>
</div>



</div>

<!-- menu-->

</header>
</div>
{/if}
<!-- end top wrapper -->







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







<div class="before-footer"></div>
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
  <!--Footer-->
    <footer style="padding-top: 0; overflow: inherit">

        <div class="social ">
            <div class="link-salamat">

                <a class="link-salamat-a" href="http://www.taktinmedical.org/" title="گردشگری سلامت"> </a>

            </div>
            <a href="viber://chat?number=+989329504778" target="_blank" class=" facebook wow fadeInDown" data-wow-delay=".3s"><img
                        src="project_files/images/viber-logo.png" alt="social"></a>
            <a href="https://api.whatsapp.com/send?phone=989329504778" target="_blank" class=" facebook wow fadeInDown" data-wow-delay=".3s"><img
                        src="project_files/images/whatsapp-logo.png" alt="social"></a>
            <a target="_blank" class="SMTelegram telegram wow fadeInDown" data-wow-delay=".3s"><img
                        src="project_files/images/telegram.png" alt="social"></a>
            <a target="_blank" class="SMInstageram instagram wow fadeInDown" data-wow-delay=".3s"><img
                        src="project_files/images/instagram.png" alt="social"></a>
            <a href="http://sapp.ir/tak_tin20" target="_blank" class=" telegram wow fadeInDown"
               data-wow-delay=".3s"><img
                        src="project_files/images/soroush_icon.png" class="_w34" alt="social"></a>



        </div>


        <div class="clear"></div>

        <!-- social icons -->


        <!--CopyRight-->
        <div class="copyright ">
            <div class="container">
                <div class="col-lg-8 col-md-8 col-xs-12 company ">
                    <p class="txt14 yekan txtEEE">کلیه حقوق وب سایت متعلق به <a href="<?php echo $homeLink; ?>">آژانس
                            تک تین سفر آریا</a> می باشد.</p>
                </div>
                <div class="col-lg-4 col-md-4 col-xs-12 irantech ">
                    <p class="txt14 yekan txtEEE"><a class="it-link" href="http://iran-tech.com/" target="_blank">طراحی
                            سایت آژانس مسافرتی</a>: ایران تکنولوژی</p>
                </div>
            </div>
        </div>
    </footer>
    <a href="tel:02188991992">
        <div class="_fix_b_r">02188991992</div>
    </a>

    {/if}
</div>
  
  
    <!--BACK TO TOP BUTTON-->
    <div class="backToTop"></div>

{literal}   

<!--Google Map-->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>

<script>
    // position we will use later ,
    var lat = 35.72266;
    var lon = 51.4075493;
    // initialize map
    map = L.map('g-map').setView([lat, lon], 15);
    // set map tiles source
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
        maxZoom: 20,
    }).addTo(map);
    // add marker to the map
    marker = L.marker([lat, lon]).addTo(map);
    // add popup to the marker
    marker.bindPopup("تهران - خیابان ولیعصر ، پایین تر از مطهری ، خیابان نوروزی ، پلاک 26 ، طبقه 3 ، واحد 5").openPopup();
</script>


<script type="text/javascript" src="project_files/js/wow.js"></script>

    <script src="project_files/js/script.js"></script>
{/literal}
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}

</body>
</html>