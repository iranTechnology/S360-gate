{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
<!doctype html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
          name="viewport">
    <meta content="ie=edge" http-equiv="X-UA-Compatible">
    <meta name="description" content="{$obj->Title_head()}">
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}" />

    <link rel="stylesheet" type="text/css" href="https://ikatour.ir/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">

    {if $smarty.session.layout neq 'pwa'}
    <link href="project_files/css/bootstrap.min.css" rel="stylesheet">
    <link href="project_files/css/animate.min.css" rel="stylesheet">
    <link href="project_files/css/all.css" rel="stylesheet">
    <link href="project_files/css/header.css" rel="stylesheet">
    <link href="project_files/css/slider.css" rel="stylesheet">
    <link href="project_files/css/style.css" rel="stylesheet">
    {/if}

    {literal}
        <script src="project_files/js/jquery-3.4.1.min.js"></script>
    {/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>
<body>
{if $smarty.session.layout neq 'pwa' }
<header class="header_area" style="background-color: #292929 !important;">
    <div class="top_header">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div class="right_top">
                    <div class="">
                        <a class="register stop-propagation main-navigation__button2" href="javascript:void(0)"><i class="flat_login"></i>
                            {include file="`$smarty.const.FRONT_THEMES_DIR`bibak_safar/topBarName.tpl"}
                            <div class="button-chevron-2 "></div>
                        </a>
                        <div class="main-navigation__sub-menu2 arrow-up p-0">
                            {include file="`$smarty.const.FRONT_THEMES_DIR`bibak_safar/topBar.tpl"}
                        </div>
                    </div>
                </div>
                <div class="logo_top">
                    <a class="" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">

                        <img alt="بی باک سفر" src="project_files/images/logo_light.png">

                    </a>
                </div>
                <div class="lef_top">

                    <div class="social-btns">
                        <a class="btn instagram" href="https://www.instagram.com/ikatour.ir">
                            <i class="fab fa-instagram"></i>
                        </a>

                        <a class="btn twitter" href="https://twitter.com/IKATOUR1">
                            <i class="fab fa-twitter"></i>
                        </a>

                        <a class="btn telegram" href="https://t.me/IKATOURIR">
                            <i class="fab fa-telegram-plane"></i>
                        </a>

                        <a class="btn whatsapp" href="https://api.whatsapp.com/send?phone=09384219077">
                            <i class="fab fa-whatsapp"></i>
                        </a>


                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="main_header_area animated">
        <div class="container">
            <nav class="navigation" id="navigation1">
                <div class="logo_top_right">
                    <img alt="" src="project_files/images/logo_light.png">
                </div>
                <div class="nav-header">

                    <div class="nav-toggle"></div>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu ">
                        <li><a href="javascript:">تور</a>
                            <ul class="nav-dropdown">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/irantourcity/1">تور داخلی</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/countrytour/1">تور خارجی</a></li>
                                <li><a href="javascript:">جست و جوی تور</a></li>
                            </ul>
                        </li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/visacountry">ویزا</a></li>
                        <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel"> هتل ها </a></li>
                        <li class=""><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید </a></li>
                        <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/order2"> درخواست خدمات </a></li>
                        <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/blog"> وبلاگ </a></li>
                        <li class="know"><a href="javascript:"> دانستنیها</a>
                            <ul class="nav-dropdown nav-submenu">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutcountry" target="_blank"> معرفی کشورها </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutiran" target="_blank"> معرفی ایران </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/embassy" target="_blank">سفارت</a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/weather" target="_blank"> هواشناسی </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/worldclock" target="_blank"> ساعت کشورها </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/change" target="_blank"> نرخ ارز </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/news" target="_blank"> اخبار </a></li>
                            </ul>
                        </li>
                        <li class=""><a href="#"> آژانس ما</a>
                            <ul class="nav-dropdown fadeIn animated">
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules"> قوانین و مقررات </a></li>
                                <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/specific/2"> فرم ها </a></li>
                            </ul>
                        </li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus"> درباره ما </a></li>
                        <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus"> تماس با ما </a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
{/if}

{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <div class="content_tech" style="padding-top: 180px " >
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}


{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

        <footer class="footer">
        <div class="f_backs">
            <svg height="80vh" style="bottom: 2em;" viewBox="0 0 1920 1069.03" width="1920"
                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <defs>
                    <filter filterUnits="userSpaceOnUse" height="1069.03" id="filter_back1" width="2107" x="-107"
                            y="6229.97">
                        <feImage height="1069.03" preserveAspectRatio="none" result="image" width="2107" x="-107"
                                 xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjEwNyIgaGVpZ2h0PSIxMDY5LjAzIiB2aWV3Qm94PSIwIDAgMjEwNyAxMDY5LjAzIj4KICA8ZGVmcz4KICAgIDxzdHlsZT4KICAgICAgLmNscy0xIHsKICAgICAgICBmaWxsOiB1cmwoI2xpbmVhci1ncmFkaWVudCk7CiAgICAgIH0KICAgIDwvc3R5bGU+CiAgICA8bGluZWFyR3JhZGllbnQgaWQ9ImxpbmVhci1ncmFkaWVudCIgeDE9IjEyOTEuNDgxIiB5MT0iMTA2OS4wMyIgeDI9IjgxNS41MTkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSItMC4yNSIgc3RvcC1jb2xvcj0iIzRlYzdmNSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEuMjUiIHN0b3AtY29sb3I9IiM1Yzc1ZmUiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgPC9kZWZzPgogIDxyZWN0IGNsYXNzPSJjbHMtMSIgd2lkdGg9IjIxMDciIGhlaWdodD0iMTA2OS4wMyIvPgo8L3N2Zz4K"
                                 y="6229.97"></feImage>
                        <feComposite in2="SourceGraphic" operator="in" result="composite"></feComposite>
                        <feBlend in2="SourceGraphic" result="blend"></feBlend>
                    </filter>
                </defs>
                <path class="fb_back1"
                      d="M-57,6419c1.352-11.23,254.118,277.89,989-51,821.97-367.86,1065,116,1065,116l3,815-2107-15Z"
                      data-name="FOOTER copy"
                      id="FOOTER_copy"
                      transform="translate(0 -6229.97)"></path>
            </svg>
            <svg height="73vh" viewBox="0 0 1920 1016.94" width="1920" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink">
                <defs>
                    <filter filterUnits="userSpaceOnUse" height="1056.94" id="filter_back2" width="2107" x="-107"
                            y="6338.06">
                        <feImage height="1056.94" preserveAspectRatio="none" result="image" width="2107" x="-107"
                                 xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjEwNyIgaGVpZ2h0PSIxMDU2Ljk0IiB2aWV3Qm94PSIwIDAgMjEwNyAxMDU2Ljk0Ij4KICA8ZGVmcz4KICAgIDxzdHlsZT4KICAgICAgLmNscy0xIHsKICAgICAgICBmaWxsOiB1cmwoI2xpbmVhci1ncmFkaWVudCk7CiAgICAgIH0KICAgIDwvc3R5bGU+CiAgICA8bGluZWFyR3JhZGllbnQgaWQ9ImxpbmVhci1ncmFkaWVudCIgeDE9Ijg1MC42MzkiIHgyPSIxMjU2LjM2MSIgeTI9IjEwNTYuOTQiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSItMC4yNSIgc3RvcC1jb2xvcj0iIzRlYzdmNSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEuMjUiIHN0b3AtY29sb3I9IiM1Yzc1ZmUiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgPC9kZWZzPgogIDxyZWN0IGNsYXNzPSJjbHMtMSIgd2lkdGg9IjIxMDciIGhlaWdodD0iMTA1Ni45NCIvPgo8L3N2Zz4K"
                                 y="6338.06"></feImage>
                        <feComposite in2="SourceGraphic" operator="in" result="composite"></feComposite>
                        <feBlend in2="SourceGraphic" result="blend"></feBlend>
                    </filter>
                </defs>
                <path class="fb_back2"
                      d="M-60,6395c-0.553.21,264.737,365.49,992,69,833.9-339.96,1065,116,1065,116l3,815-2107-15Z"
                      id="FOOTER"
                      transform="translate(0 -6338.06)"></path>
            </svg>
            <svg height="45vh" viewBox="0 0 1920 669.78" width="1920" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink">
                <defs>
                    <filter filterUnits="userSpaceOnUse" height="762.78" id="filter_back3" width="2144" x="-99" y="6685.22">
                        <feImage height="762.78" preserveAspectRatio="none" result="image" width="2144" x="-99"
                                 xlink:href="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjE0NCIgaGVpZ2h0PSI3NjIuNzgiIHZpZXdCb3g9IjAgMCAyMTQ0IDc2Mi43OCI+CiAgPGRlZnM+CiAgICA8c3R5bGU+CiAgICAgIC5jbHMtMSB7CiAgICAgICAgZmlsbDogdXJsKCNsaW5lYXItZ3JhZGllbnQpOwogICAgICB9CiAgICA8L3N0eWxlPgogICAgPGxpbmVhckdyYWRpZW50IGlkPSJsaW5lYXItZ3JhZGllbnQiIHgxPSI4OTQuMTU1IiB4Mj0iMTI0OS44NDUiIHkyPSI3NjIuNzgiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSItMC4yNSIgc3RvcC1jb2xvcj0iIzRlYzdmNSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEuMjUiIHN0b3AtY29sb3I9IiM1Yzc1ZmUiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgPC9kZWZzPgogIDxyZWN0IGNsYXNzPSJjbHMtMSIgd2lkdGg9IjIxNDQiIGhlaWdodD0iNzYyLjc4Ii8+Cjwvc3ZnPgo="
                                 y="6685.22"></feImage>
                        <feComposite in2="SourceGraphic" operator="in" result="composite"></feComposite>
                        <feBlend in2="SourceGraphic" mode="screen" result="blend"></feBlend>
                    </filter>
                </defs>
                <path class="fb_back3"
                      d="M2045,6803s-250.73-234.24-704-42c-384.969,163.27-350.217,523.62-767,475C96.722,7180.33-99,7448-99,7448l2112-93Z"
                      id="footer"
                      transform="translate(0 -6685.22)"></path>
            </svg>
        </div>
        <div>
            <div class="container">
                <div>
                    <div class="col-12 p-0 d-flex flex-wrap">
                        <div class="d-none d-lg-block col-lg-4 col-md-12 footer-widget">
                            <h4 class="widget-title"> درباره ما </h4>
                            <aside class="widget widget_media_image" id="media_image-2">
                                <p>{$smarty.const.ABOUT_ME}</p>
                            </aside>
                            <div>
                                <ul class="footer-bottom-social">
                                    <li><a href="https://www.facebook.com/ikatour1"><i class="fab fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/IKATOUR1"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="https://www.instagram.com/ikatour.ir"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                                    <li><a href="https://api.whatsapp.com/send?phone=09384219077"><i class="fab fa-whatsapp"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-12 pr-lg-C5">
                            <div class="footer-widget">
                                <h4 class="widget-title">دسترسی آسان</h4>
                                <ul class="footer-menu">
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/irantourcity/1"> تورهای ایران </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/visacountry"> ویزا </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/hotel"> هتل ها </a></li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> پیگیری خرید </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/order2"> درخواست خدمات </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/blog"> وبلاگ </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/change"> نرخ ارز </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/news"> اخبار </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/rules"> قوانین و مقررات </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/specific/2"> فرم ها</a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/aboutus"> درباره ما </a></li>
                                    <li><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}{$mainPage}/contactus"> تماس با ما </a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                            <div class="footer-widget">
                                <h4 class="widget-title">تماس با ما</h4>
                                <p>
                                    <i class="fa fa-map-marker"></i>

                                    {$smarty.const.CLIENT_ADDRESS}

                                </p>
                                <p>
                                    <i class="fa fa-envelope"></i>
                                    <a style="color: #fff;" href="mailto:{$smarty.const.CLIENT_EMAIL}">{$smarty.const.CLIENT_EMAIL}</a>
                                </p>
                                <p>
                                    <i class="fa fa-headphones"></i>
                                    <a style="color: #fff;" href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                                </p>
                                <div class="coderah">
{*                                    <form action="temp.php?irantech_parvaz=refrense" class="TrcBox" id="FormCodeRahgiriPrj"*}
{*                                          method="post" name="FormCodeRahgiriPrj" style="width: 100%;">*}
{*                                        <input aria-describedby="basic-addon1" autocomplete="off" id="txtsearch"*}
{*                                               name="CodeRahgiriTemp"*}
{*                                               onblur="if (this.value==''){this.value='کد رهگیری خود را وارد کنید...';}"*}
{*                                               onfocus="{this.value='';}"*}
{*                                               type="text" value="کد رهگیری خود را وارد کنید...">*}
{*                                        <button class="btn button-winona" type="submit"><i class="fas fa-check"></i>*}
{*                                        </button>*}
{*                                    </form>*}
                                </div>
                                <aside class="mt-1 widget widget_text logo-moshtari" id="text-2">
                                    <div class="textwidget">
                                        <ul style="text-align: center">
                                            <li><a referrerpolicy='origin' target='_blank' href='https://trustseal.enamad.ir/?id=438204&Code=Qw4JJ0p4nM1bzSGIq73tes4nCeFcbK3Z'><img referrerpolicy='origin' src='https://trustseal.enamad.ir/logo.aspx?id=438204&Code=Qw4JJ0p4nM1bzSGIq73tes4nCeFcbK3Z' alt='' style='cursor:pointer' Code='Qw4JJ0p4nM1bzSGIq73tes4nCeFcbK3Z'></a></li>
                                            <li><a href="https://caa.gov.ir" rel="nofollow" target="_blank"><img
                                                            alt="" src="project_files/images/certificate2.png"></a></li>
                                            <li><a style="width:100%; height:100%;" href="https://tehran.mcth.ir" rel="nofollow"
                                                   target="_blank">
                                                    <img  alt="" src="project_files/images/certificate4.png"></a></li>


                                        </ul>
                                    </div>

                                </aside>

                            </div>

                        </div>

                        <div class="d-lg-noneCustom col-lg-4 col-md-12 footer-widget">
                            <h4 class="widget-title"> درباره ما </h4>
                            <aside class="widget widget_media_image">
                                <p>{$smarty.const.ABOUT_ME}</p>
                            </aside>
                            <div>
                                <ul class="footer-bottom-social">
                                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">


                    <div class="col-lg-12 col-md-12">
                        <p class="copyright"><span>
                        <a href="https://www.iran-tech.com/"> طراحی سایت آژانس هواپیمایی </a>: ایران تکنولوژی  </span>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </footer>
        <a href="tel:02122220360" class="link-all-phone">
            <i class="fa fa-phone"></i>
        </a>
    <a data-placement="top" id="scroll-top" style="cursor: pointer;">
        <button><i class="fas fa-arrow-up"></i></button>
    </a>
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}

{literal}
<script src="project_files/js/megamenu.js"></script>

<script src="project_files/js/scripts.js"></script>
{/literal}
{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}
</body>
</html>