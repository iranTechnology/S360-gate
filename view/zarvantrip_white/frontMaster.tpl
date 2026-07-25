{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}
<!doctype html>
<html lang="fa">

<head>
	<!-- Required meta tags -->
	<title>{$obj->Title_head()}</title>
	<meta name="description" content="{$obj->Title_head()}">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, user-scalable=0">
	<base href="{$smarty.const.CLIENT_DOMAIN}" />

	<link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.ico"/>
	<link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png"/>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="project_files/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="project_files/owlcarousel/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="project_files/owlcarousel/owl.theme.default.min.css">

	<link rel="stylesheet" type="text/css" href="project_files/css/style.css">
	<link rel="stylesheet" type="text/css" href="project_files/css/style-responsive.css">
    <script type="text/javascript" src="project_files/js/jquery-2.1.4.min.js"></script>
	{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>

<body>
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}

<div class="background-modal-box"></div>
<header>
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-12 header-top-inner">
					{if $objSession->IsLogin()}
					<ul>
						<li>
							<div class="dashboard_menu">
								<button>داشبورد</button>
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

							<a class="userProfile-name user-profile " href="{$smarty.const.ROOT_ADDRESS}/userProfile">
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
						<div class="login-register">
							<a class="header-login" href="{$smarty.const.ROOT_ADDRESS}/loginUser">ورود</a>
							<a class="header-register" href="{$smarty.const.ROOT_ADDRESS}/registerUser">ثبت نام</a>
						</div>
					{/if}
					<div class="header-call">
						<div class="header-tell">{$smarty.const.CLIENT_PHONE}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-bot">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="header-bot-inner">
						<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
						<div class="logo">

							<img src="project_files/images/logo.png" alt="{$smarty.const.CLIENT_NAME}">
							<h1>{$smarty.const.CLIENT_NAME}</h1>
						</div>
						</a>
                        <div class="menu-icon">
                            <span></span>
                        </div>
						   <nav>
							<ul>
								<li class="menu-ghavanin-kharid"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=rules">قوانین خرید</a></li>
								<li class="menu-peygiri-kharid"><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a></li>
								<li class="menu-peygiri-kharid"><a href="{$smarty.const.ROOT_ADDRESS}/cancellationFee">درصدهای کنسلی</a></li>
								<li class="menu-soalat"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=faq">سوالات متداول</a></li>
								<li class="menu-darbare-ma"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutus">درباره ما</a></li>
								<li class="menu-tamas-bama"><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=contactus">تماس باما</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
{/if}

<div class="main-temp">
	<div class="container">
		<div class="main-content">
			{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
		</div>
	</div>
</div>

{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation}
<footer>
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-copmany-contact">
						<div class="footer-address">
							<p>{$smarty.const.CLIENT_ADDRESS}</p>
						</div>
						<div class="footer-tell">

							<div class="tell-number"><span>تلفن تماس :</span><span>{$smarty.const.CLIENT_PHONE}</span></div>

						</div>

					</div>
				</div>


			</div>
		</div>
	</div>
	<div class="footer-middle">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-12">
					<div class="footer-about">
						<p>{$smarty.const.ABOUT_ME}</p>
					</div>
				</div>
				<div class="col-lg-5 col-md-9 mr-auto ml-auto">
					<div class="footer-imgs">
						<div class="footer-img-item">
							<a href="https://www.cao.ir/paxrights" ><img src="project_files/images/certificate1.png" alt="paxrights"></a>
						</div>
						<div class="footer-img-item">
							<a href="https://www.cao.ir/"><img src="project_files/images/certificate2.png" alt="cao"></a>
						</div>
						<div class="footer-img-item">
							<a href="http://aira.ir/images/uptoshahrivar.pdf"><img src="project_files/images/certificate3.png" alt="domain"></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="footer-copy-right">
						کلیه حقوق وب سایت متعلق به
						<a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">{$smarty.const.TITLE_SITE}</a>
						می باشد.
					</div>
					<div class="iran-tech">
						<p class=""><a href="https://www.iran-tech.com/intro" target="_blank">طراحی سایت آژانس مسافرتی</a> ایران تکنولوژی</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="footer-social">
						<a class="instagram-ico"></a>
						<a class="facebook-ico"></a>
						<a class="telegram-ico"></a>
						<a class="googleplus-ico"></a>
						<a class="limkedin-ico"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

{/if}

{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>

</html>