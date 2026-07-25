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

  <!-- custom CSS file -->

  <link rel="stylesheet" href="project_files/css/custom.css">
    <!-- plugin css file -->
 
  <link rel="stylesheet" href="project_files/css/plugin.css" >
  <link rel="stylesheet" href="project_files/css/responsive.css"> 
  <!-- jQuery Library files -->

  <script src="project_files/js/jquery-2.1.4.min.js"></script>
   {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
        
</head>
<body>

<div class="blackContainer"></div>
<div class="body-wrapper">
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel &&
$smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket &&
$smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationZarvan &&
$smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
  <div class="top-wrapper temp-top-wrapper">

  <header class="float-panel navbar navbar-fixed-top">
    <div class=" top-navbar-wrapper">
      <div class="container">
        <div class="row">
           <div class=" left-link">
              <div class="nav-top-text "><i class="fa fa-phone "></i>
                <a class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</a>
              </div>

              <div class="nav-top-text marl10">
                  <i class="fa fa-envelope-o"></i>
                  <a class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a>
              </div>
          </div>
           
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
                                            <span style="color: #fff !important;" >دوست عزیز {$objSession->getNameUser()} خوش آمدید</span>
                                            {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                                                <span class="CreditHide yekanB">اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}ریال می باشد </span>
                                            {/if}
                                        </a>

                                    </li>
                                    </ul>
                                            {else}
          <div class=" right-link">
              <div class="nav-top-text dirR ">
                <i class="fa fa-user-plus "></i>
                  <a  href="{$smarty.const.ROOT_ADDRESS}/registerUser" style="padding: 0 0 0 10px;">ثبت نام </a>
              </div>
              <div class="nav-top-text dirR marl10">
                <i class="fa fa-sign-in"></i>
                  <a href="{$smarty.const.ROOT_ADDRESS}/loginUser" style="padding: 0 0 0 10px;">ورود </a>
             </div>
          </div>
          {/if}
          <div class="clear"></div>
        </div>
      </div>
    </div>

    <div class=" container">
      <div class="row">
        <div class="logo">
          <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/" >
            <img src="project_files/images/logo.png" alt="{$smarty.const.CLIENT_NAME}">
          </a>
          <div class="title">
            <!-- <h2>شرکت خدمات مسافرتی و توریستی تاسیس 1348 </h2> -->
          </div>
        </div>

        <div class="main-menu">

          <nav class="site-nav">
              <div class="menu-toggle">
                <div class="hamburger"></div>
              </div>

              <ul class="open desktop">
                  <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/"><i class=" site-nav--icon m-homepage"></i>صفحه اصلی</a></li>
                  <li><a href="https://hotelinja.com/"><i class=" site-nav--icon m-airplane"></i>رزرواسیون آنلاین</a></li>
                  <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"><i class=" site-nav--icon m-in-hotel"></i>پیگیری خرید</a></li>
                  <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules"><i class=" site-nav--icon m-out-hotel"></i>قوانین خرید</a></li>
                  <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=link"><i class=" site-nav--icon m-news"></i>مجله گردشگری</a></li>
                  <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus"><i class=" site-nav--icon m-aboutus"></i>درباره ما</a></li>
                  <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus"><i class=" site-nav--icon m-contactus"></i>ارتباط با ما</a></li>
              </ul>
          </nav>
      </div>
    </div>
  </div>
    
</header>

</div>
{/if}


 <div class="clear"></div> 
<div class= "temp-background">
<div class="container temp">
   <div class="temp-content">
    	{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
    </div>

    </div>
</div>
<div class="clear"></div>




    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel &&
    $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket &&
    $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationZarvan &&
    $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
  <!--Footer-->
  <footer>

    <div class="footer footer-temp">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12 ">
            <h4 class="footerTitle"><span> تماس باما</span></h4>
            <ul class="footer-list-menu">
              <li class="items">
                 <span><i class="fa fa-map-marker addressIcon"></i></span>
                <span class="SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</span>
              </li>

              <li class="items">
                  <span><i class="fa fa-volume-control-phone  addressIcon "></i></span>
                  <span class="ltr">
                    <a class="SMFooterPhone ">{$smarty.const.CLIENT_PHONE} </a>
                  </span>
              </li>
              <li class="items">
                  <span><i class="fa fa-envelope addressIcon txt13"></i></span>
                  <a    class="SMFooterEmail  ">{$smarty.const.CLIENT_EMAIL} </a>
              </li>
            </ul>
              
          </div>

          <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <h4 class="footerTitle"><span>دسترسی سریع</span></h4>
            <ul class="footer-list-menu">

            <li class="item">
               
                <span > <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس با ما </a></span>
            </li>
            <li class="item">
                
                <span > <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus">درباره ما </a></span>
            </li>
            <li class="item">
                
                <span > <a class=" " href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">راهنمای رزرو آنلاین</a></span>
            </li>
          </ul>
          </div>



          <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
            <ul class="footer-list-menu">
              <img src="project_files/images/enamad.png" id="emanad">
              <div class="contact-details dark social">
                
                <span><i class="fa fa-paper-plane addressIconSocial "><a  target="_blank" class="SMTelegram "></a></i></span>
                <span><i class="fa fa-instagram addressIconSocial "><a  target="_blank" class="SMInstageram "></a></i></span>
                <span><i class="fa fa-facebook addressIconSocial "><a  target="_blank" class="SMFaceBook "></a></i></span>
                <span><i class="fa fa-twitter addressIconSocial "><a  target="_blank" class="SMTwitter"></a></i></span>
                
               </div>
            </ul>
          </div>
        </div>
      </div>
    </div>

        <!--CopyRight-->    
          <div class="copyright " >
            <div class="container">
              <div class="col-lg-7 col-md-12 col-xs-12 company " >
                <p class="txt14 yekan txtDDD">کلیه حقوق وب سایت متعلق به 
                  <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">شرکت خدمات گردشگری آرین پرواز مشرق زمین  </a> می باشد.
                </p>
              </div>
              <div class="col-lg-5 col-md-12 col-xs-12 irantech " >
                <p class="txt14 yekan txtDDD">طراحی وب سایت: <a class="it-link" href="http://iran-tech.com/" target="_blank">ایران تکنولوژی</a></p>
              </div>
            </div>
          </div>
  </footer>
  {/if}
</div> 

    <!--BACK TO TOP BUTTON-->
    <div class="backToTop"></div>
    </div>

{literal}


  <script src="project_files/js/index.js"></script>

  <script src="project_files/js/script.js"></script>

<script type="text/javascript">
      $(document).scroll(function () {
      var y = $(window).scrollTop();
      if (y > 300) {
        $('.backToTop').fadeIn('slow');
      } else {
        $('.backToTop').fadeOut('slow');
      }
    });

    $(".backToTop").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('.LoginLnk').click(function (e) {
            e.preventDefault();
            $(".black").fadeIn('slow');
            $(".LoginBox").fadeIn('slow');
        });

        // Hiding Box when Click on Close Button
        $(".closeBtn").click(function () {
            $(".black").fadeOut('slow');
            $(".LoginBox").fadeOut('fast');

        });
        // Hiding Box when Click on Black Area
        $(".black").click(function () {
            $(".black").fadeOut('slow');
            $(".LoginBox").fadeOut('fast');
        });
        $('.mob-menu').click(function(){
            $('#menus .menu').slideToggle();

        })

        if ($(window).width() <768 ){
            $('.has-menu').click(function(){
                $(this).find('>ul').slideToggle();

            });
        }


    });
</script>
 	{/literal}
	
	{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>
</html>