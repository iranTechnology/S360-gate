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
		<link rel="stylesheet" href="project_files/css/animate.css" />
		<!-- Animation CSS file -->



		<!-- plugin css file -->
		<link rel="stylesheet" href="project_files/css/plugin.css" >

		<link rel="stylesheet" href="project_files/css/custom.css">
		<link rel="stylesheet" href="project_files/css/responsive.css">
		<!-- jQuery Library files -->

		<script src="project_files/js/jquery-2.1.4.min.js"></script>
		{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
		
	</head>
	<body>
		<div class="blackContainer"></div>
		<div class="body-wrapper">
		{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket}
			<div class="top-wrapper  temp-top-wrapper">

				<header class="float-panel navbar navbar-fixed-top">
					<div class=" top-navbar-wrapper">

						<div class="container">
							<div class=" left-link">
								<div class="nav-top-left-text dirL ">
									<i class=" "><a  target="_blank" class="fa fa-facebook SMFaceBook"></a></i>
									<i class=""><a  target="_blank" class="fa fa-linkedin  SMLinkedin"></a></i>
									<i class=""><a  target="_blank" class="fa fa-instagram  SMInstageram "></a></i>
									<i class=""><a  target="_blank" class="fa fa-google-plus SMGoogle"></a></i>
									<i class=" "><a  target="_blank" class="fa fa-send SMTelegram"></a></i>
								</div>
							</div>
							<div class=" middle-link">

							</div>
							<div class=" right-link">
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
								<div class="nav-top-right-text dirR ">
									<i class="fa fa-sign-in">
									</i>
									<a class="" href="{$smarty.const.ROOT_ADDRESS}/loginUser">
										ورود
									</a>
								</div>
								<div class="nav-top-right-text dirR  ">
									<i class="fa fa-user">
									</i>
									<a class="" href="{$smarty.const.ROOT_ADDRESS}/registerUser">
										ثبت نام
									</a>
								</div>
								{/if}
							</div>
							<div class="clear">
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
                                    <h1>
                                        {$smarty.const.CLIENT_NAME}
                                    </h1>
									<h2>
										شرکت خدمات مسافرتی و جهانگردی
									</h2>
								</div>
							</div>
							<div class="main-menu">

								<nav>
									<div class="menu-toggle">

										<button type="button" id="menu-btn">
											<span class="icon-bar">
											</span>
											<span class="icon-bar">
											</span>
											<span class="icon-bar">
											</span>
										</button>
									</div>

										<ul id="respMenu" class="ace-responsive-menu" data-menu-style="horizontal">
										<li>
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
												<span class="title">صفحه اصلی</span>
											</a>
										</li>
										<li>
											<a href="javascript:;">
												<span class="title">تورها</span>
											</a>
											<ul>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1">تور داخلی</a>
												</li>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour">تور خارجی</a>
												
												</li>
												<li id="other-tour">
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=alltours" class="SMAllTours">تورها در یک نگاه</a>
												</li>
											</ul>
										</li>
										
										<li>
											<a href="javascript:;">اطلاعات گردشگری</a>
											<ul>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutcountry">معرفی کشورها</a>
												</li>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutiran">معرفی ایران</a>
												</li>
											</ul>
										</li>
										<li>
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacountry">ویزا</a>
										</li>
										<li>
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=news">اخبار</a>
										</li>
										<li>
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">قوانین خرید</a>

										</li>
										<li>
											<a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a>
										</li>
										<li>
											<a href="javascript:;">باراندازان</a>
											<ul>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus">درباره ما</a>
												</li>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس با ما</a>
												</li>
												<li>
													<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq">سوالات متداول</a>
												</li>

											</ul>
										</li>



									</ul>
								</nav>
							</div>
						</div>
					</div>

				</header>

			</div>
			{/if}
			<div class="clear"></div>
            <div class="container temp">
                <div class="temp-content">
                    <div class="temp-wrapper">
                        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
                    </div>
                </div>
            </div>

			<div class="clear"></div>
			{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket}
			<!--Footer-->
			<footer>

				<div class="footer " >
					<div class="container">
						<div class="row">
		
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
								<h4 class="footerTitle">
									<span>دسترسی سریع</span>
								</h4>
										<ul class="footer-list-menu">

									<li class="items">
										<span>
											<i class="fa  fa-angle-left   "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq">سوالات متداول</a>
										</span>
									</li>
									<li class="items">
										<span>
											<i class="fa fa-angle-left  "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">قوانین خرید</a>
										</span>
									</li>
									<li class="items">
										<span>
											<i class="fa fa-angle-left  "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutiran">معرفی ایران</a>
										</span>
									</li>
									<li class="items">
										<span>
											<i class="fa fa-angle-left  "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutcountry">معرفی کشورها</a>
										</span>
									</li>
								</ul>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
								<h4 class="footerTitle">
									<span>دسترسی سریع</span>
								</h4>
								<ul class="footer-list-menu">

									<li class="items">
										<span>
											<i class="fa fa-angle-left   "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=irantourcity&level=1">تور های داخلی</a>
										</span>
									</li>
									<li class="items">
										<span>
											<i class="fa fa-angle-left  "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=countrytour">تور های خارجی</a>
										</span>
									</li>
									<li class="items">
										<span>
											<i class="fa fa-angle-left  "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=alltours">تور ها در یک نگاه</a>
										</span>
									</li>
									<li class="items">
										<span>
											<i class="fa fa-angle-left  "></i>
										</span>
										<span >
											<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=visacountry">اطلاعات ویزا</a>
										</span>
									</li>
								</ul>

							</div>

							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								<div class="footer-logo">
									<div class="logo">
										<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/" >
											<img src="project_files/images/logo-footer.png" alt="logo">
										</a>
										<div class="title">
											<h1>
												{$smarty.const.CLIENT_NAME}
											</h1>
											<h2>
												شرکت خدمات مسافرتی و جهانگردی
											</h2>
										</div>
									</div>
								</div>
								<ul class="footer-list-menu">

						<div class="contact-details dark social">

										<span>
											<i class="fa fa-paper-plane addressIconSocial ">
												<a  target="_blank" class="SMTelegram ">
												</a>
											</i>
										</span>
										<span>
											<i class="fa fa-instagram addressIconSocial ">
												<a  target="_blank" class="SMInstageram ">
												</a>
											</i>
										</span>
										<span>
											<i class="fa fa-facebook addressIconSocial ">
												<a  target="_blank" class="SMFaceBook ">
												</a>
											</i>
										</span>
										<span>
											<i class="fa fa-twitter addressIconSocial ">
												<a  target="_blank" class="SMTwitter">
												</a>
											</i>
										</span>

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
							<p class="txt14 yekan txtAAA">
								 کلیه حقوق وب سایت متعلق به <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">{$smarty.const.CLIENT_NAME}</a>می باشد.
							</p>
						</div>
						<div class="col-lg-5 col-md-12 col-xs-12 irantech " >
							<p class="txt14 yekan txtAAA">
								طراحی وب سایت:
								<a class="it-link" href="http://iran-tech.com/" target="_blank">ایران تکنولوژی</a>
							</p>
						</div>
					</div>
				</div>
			</footer>
			{/if}
		</div>


		<!--BACK TO TOP BUTTON-->
		<div class="backToTop"></div>
		{literal}
		
		<script src="project_files/js/ace-responsive-menu.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function ()
				{
					$("#respMenu").aceResponsiveMenu(
						{
							resizeWidth: '768',
							animationSpeed: 'fast',
							accoridonExpAll: false
						});
				});
		</script>

		<script src="project_files/js/script.js"></script>
		{/literal}

        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
	</body>
</html>