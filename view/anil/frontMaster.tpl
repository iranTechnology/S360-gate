{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <title>{$obj->Title_head()}</title>
    <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png"/>
    <meta name="description" content="{$obj->Title_head()}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
    <link rel="stylesheet" href="project_files/css/select2.css">
    <link rel="stylesheet" href="project_files/css/tabs.css">
    <link rel="stylesheet" href="project_files/css/style.css">
    <link rel="stylesheet" href="project_files/css/header.css">
    <script src="project_files/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="project_files/js/modernizr.js"></script>
    <script type="text/javascript" src="project_files/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="project_files/js/popper.min.js"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}
    <link rel="stylesheet" href="project_files/css/all.min.css">

</head>
<body>
<div class="topbar">
    <div class="container">

        <div class="row">
            <div class="right_topbar">


                <div class="top__user_menu">

                    <div class="main-navigation__item support margin-vl-2">
                        <button aria-label="Support" type="button" class="main-navigation__button2 support-icon">
                            <div class="button-text-wrapper">
                                <strong class="hidden-xs hidden-sm ltr long-text">
                                    {include file="`$smarty.const.FRONT_THEMES_DIR`anil/topBarName.tpl"}
                                </strong>
                            </div>
                            <svg width="27px" height="27px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="mx-1 mx-2-md"><g><path d="M12,10.5 C14.6233526,10.5 16.75,8.37335256 16.75,5.75 C16.75,3.12664744 14.6233526,1 12,1 C9.37664744,1 7.25,3.12664744 7.25,5.75 C7.25,8.37335256 9.37664744,10.5 12,10.5 Z M12,11.5 C8.82436269,11.5 6.25,8.92563731 6.25,5.75 C6.25,2.57436269 8.82436269,0 12,0 C15.1756373,0 17.75,2.57436269 17.75,5.75 C17.75,8.92563731 15.1756373,11.5 12,11.5 Z M22,24 C22,18.4771525 17.5228475,14 12,14 C6.4771525,14 2,18.4771525 2,24 L1,24 C1,17.9248678 5.92486775,13 12,13 C18.0751322,13 23,17.9248678 23,24 L22.5,24 L22,24 Z"></path></g></svg>
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

                            {include file="`$smarty.const.FRONT_THEMES_DIR`anil/topBar.tpl"}

                        </div>


                    </div>
                </div>


            </div>
            <div class="left_topbar">


                <a rel="nofollow" href="https://anilparvaz.ir/cnl">
                    <span class="fusion-megamenu-icon"><i class="glyphicon fa-tag fas"></i></span><span
                        class="menu-text">کنسلی بلیط</span></a>


                <a class="phone">
                        <span class="fusion-megamenu-icon">
                        <i class="glyphicon fa-phone-square fas"></i></span>
                    <span class="menu-text">۰۲۱۸۸۸۴۹۳۲۴ | ۰۹۳۳۲۴۴۹۹۵۸</span>
                </a>


            </div>

        </div>

    </div>


</div>
<div class="header">


    <div class="container">

        <div class="row">

            <div class="menus">
                
                <div class="hamber">
                    <i class="fa fa-bars"></i>
                </div>
                <div class="logo_mob">
                    <a href="https://anilparvaz.ir/">

                        <img src="project_files/images/logo.png" alt="آنیل پرواز">
                    </a>

                </div>
                <ul>


                    <li class="menu-item">
                        <a href="https://anilparvaz.ir/" class="fusion-bottombar-highlight">
                            <span class="fusion-megamenu-icon"><i class="glyphicon fa-plane fas"></i></span>
                            <span class="menu-text">بلیط هواپیما</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="https://anilparvaz.ir/hotel" class="fusion-bottombar-highlight">
                            <span class="fusion-megamenu-icon"><i class="glyphicon fa-hotel fas"></i></span>
                            <span class="menu-text">رزرو هتل</span>
                        </a>
                    </li>
                    <li class="menu-item ">
                        <a href="https://anilparvaz.ir/tours" class="fusion-flex-link fusion-bottombar-highlight">
                            <span class="fusion-megamenu-icon"><i class="glyphicon fa-umbrella-beach fas"></i></span>
                            <span class="menu-text">تور</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="https://anilparvaz.ir/visa" class="fusion-flex-link fusion-bottombar-highlight">
                            <span class="fusion-megamenu-icon"><i class="fa-solid fa-address-card"></i></span>
                            <span class="menu-text">ویزا</span>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="https://anilparvaz.ir/attraction" class="fusion-flex-link fusion-bottombar-highlight">
                            <span class="fusion-megamenu-icon"><i class="fa-solid fa-earth-americas"></i></span>
                            <span class="menu-text">گردشگری</span>
                        </a>
                    </li>
                </ul>
                <div class="logo">
                    <a href="https://anilparvaz.ir/">
                        <img src="project_files/images/logo.png" alt="آنیل پرواز">
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="content_anil">

    <div class="container">

        <div class="row">

            {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}

        </div>

    </div>

</div>

{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

<div class="fusion-footer">

    <footer class="fusion-footer-widget-area fusion-widget-area">
        <div class="fusion-row">
            <div class="fusion-columns fusion-columns-3 fusion-widget-area">
                <div class="row">

                    <div class="fusion-column col-lg-4 col-md-4 col-sm-6 col-12 col-xs-12">
                        <section id="nav_menu-7" class="fusion-footer-widget-column widget widget_nav_menu"><h4
                                class="widget-title">مطالب جدید</h4>
                            <div class="menu-link-container">
                                <ul id="menu-link" class="menu">
                                    <li id="menu-item-17710" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-17710">
                                        <a href="https://anilparvaz.ir/ahvaz-to-mashhad"> <i class="fa fa-angle-left"></i>بلیط بندرعباس به مشهد</a></li>
                                    <li id="menu-item-17709"
                                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-17709">
                                        <a href="https://anilparvaz.ir/ahvaz-to-mashhad"><i class="fa fa-angle-left"></i> بلیط اهواز به مشهد</a></li>
                                    <li id="menu-item-17712"
                                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-17712">
                                        <a href="https://anilparvaz.ir/abadan-to-mashhad"><i class="fa fa-angle-left"></i>بلیط آبادان به مشهد</a></li>
                                    <li id="menu-item-17711"
                                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-17711">
                                        <a href="https://anilparvaz.ir/tabriz-to-mashhad"><i class="fa fa-angle-left"></i>بلیط تبریز به مشهد</a></li>
                                </ul>
                            </div>
                            <div style="clear:both;"></div>
                        </section>
                    </div>
                    <div class="fusion-column col-lg-4 col-md-4 col-sm-6 col-12 col-xs-12">
                        <section id="contact_info-widget-2" class="fusion-footer-widget-column widget contact_info"><h4
                                class="widget-title">تماس با ما</h4>
                            <div class="contact-info-container">
                                <p class="address">تهران: خیابان مطهری خیابان سلیمان خاطر پلاک 78</p>

                                <p class="phone">تلفن: 88849324-021</p>

                                <p class="mobile">موبایل: 09392449958</p>

                                <p class="fax">فکس: 88845385-021</p>

                                <p class="email">ایمیل: <a href="mailto:anilparvaz [@] yahoo.com">anilparvaz [@]
                                    yahoo.com</a></p>

                            </div>
                            <div style="clear:both;"></div>
                        </section>
                    </div>
                    <div class="fusion-column fusion-column-last col-lg-4 col-md-4 col-sm-6 col-12 col-xs-12">
                        <section id="custom_html-2"
                                 class="widget_text fusion-footer-widget-column widget widget_custom_html"><h4
                                class="widget-title">مجوزها و افتخارات ما</h4>
                            <div class="textwidget custom-html-widget"><a href="https://anilparvaz.com/license"><img
                                    class="alignnone wp-image-17701 size-full"
                                    src="https://anilparvaz.ir/wp-content/uploads/2020/01/lic.png" alt="" width="319"
                                    height="207"></a></div>
                            <div style="clear:both;"></div>
                        </section>
                    </div>
                </div>

                <div class="fusion-clearfix"></div>
            </div> <!-- fusion-columns -->
        </div> <!-- fusion-row -->
    </footer> <!-- fusion-footer-widget-area -->



</div>
<footer id="footer" class="fusion-footer-copyright-area">
    <div class="fusion-row">
        <div class="fusion-copyright-content">

            <div class="fusion-copyright-notice">
                <div>
                    Copyright 2012 - 2020 | کلیه حقوق این سایت محفوظ و متعلق به آژانس هواپیمایی و جهانگردی <a
                        href="https://anilparvaz.ir/">آنیل پرواز</a> می‌باشد&nbsp;
                </div>
            </div>
            <div class="fusion-social-links-footer">
                <div class="fusion-social-networks boxed-icons">
                    <div class="fusion-social-networks-wrapper"><a
                            class="fusion-social-network-icon fab fa-instagram"
                            style="" href="https://www.instageram.com/Anil_parvaz" target="_blank"
                            rel="noopener noreferrer" data-placement="top" data-title="Instagram" data-original-title="Instagram">
                        <span class="screen-reader-text"></span></a>
                        <a class="fusion-social-network-icon fab fa-facebook-f"
                           style="" href="https://www.facebook.com/anilparvaz.tehran" target="_blank"
                           rel="noopener noreferrer" data-placement="top" data-title="Facebook"
                           data-toggle="tooltip" title="" data-original-title="Facebook"><span
                                class="screen-reader-text"></span></a><a
                                class="fusion-social-network-icon fusion-tooltip fab fa-whatsapp"
                                style="" href="https://t.me/anillparvaz" target="_blank" rel="noopener noreferrer"
                                data-placement="top" data-title="Whatsapp" data-toggle="tooltip" title=""
                                data-original-title="Whatsapp"><span class="screen-reader-text"></span></a>
                    </div>
                </div>
            </div>

        </div> <!-- fusion-fusion-copyright-content -->
    </div> <!-- fusion-row -->
</footer> <!-- #footer -->
{/if}
{literal}


<script>
    $(document).ready(function () {

        var hei_topbar = $('.topbar').height();

        $(window).scroll(function () {
            if($(this).scrollTop() >hei_topbar ){
                $('.header').addClass('fixed');
            }
            else{
                $('.header').removeClass('fixed');
            }


        })





    })
    $(document).ready(function () {
        $('.top__user_menu').bind('click', function(e){
            //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
            e.stopPropagation();

        });

        $('.box-of-count-nafar').bind('click', function(e){
            //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
            e.stopPropagation();

        });

        $('body').click(function () {

            $('.main-navigation__sub-menu').hide();
            $('.main-navigation__sub-menu2').hide();
            $('.button-chevron').removeClass('rotate');
            $('.button-chevron-2').removeClass('rotate');

            $('.cbox-count-nafar').hide();
            $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
        });
        $('.main-navigation__button').click(function () {

            $('.main-navigation__sub-menu').fadeToggle();
            $(this).find('.button-chevron').toggleClass('rotate');
            $('.main-navigation__sub-menu2').hide();
            $('.button-chevron-2').removeClass('rotate');
        });
        var iframe = $('#loginedname').contents();
        iframe.find('span').on('click', function() {
            $('.main-navigation__item').find('.main-navigation__sub-menu2').toggle();
            $('.button-chevron-2').toggleClass('rotate');

        });

        $('.main-navigation__button2').click(function () {

            $('.main-navigation__sub-menu2').toggle();
            $('.button-chevron-2').toggleClass('rotate');
            $('.main-navigation__sub-menu').hide();
            $('.button-chevron').removeClass('rotate');

        });




    });
    $(document).ready(function () {

        $('.hamber').click(function () {

            $('.menus ul').toggleClass('showmenu');

        })
    })
</script>
{/literal}
{include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>
</html>