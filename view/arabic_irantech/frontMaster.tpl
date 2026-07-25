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
    <link rel="stylesheet" href="project_files/css/all.css">
    <link rel="stylesheet" href="project_files/css/animate.min.css">
    <link rel="stylesheet" href="project_files/css/header.css">
    <link rel="stylesheet" href="project_files/css/style.css">
    <link rel="stylesheet" href="project_files/css/responsive.css">
    <script type="text/javascript" src="project_files/js/jquery-3.4.1.min.js"></script>

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>
<body class="tempPage">

    {include file="topBar.tpl"}
    <header class="header_area">


        <div class="container">
            <div class="col-md-12">
                <div class="row">

                    <div class="logo">
                        <a class="nav-brand" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/">
                            <img src="project_files/images/logo.png" alt="Logo">

                        </a>
                    </div>
                    <div class="menus">

                        <div class="main_header_area animated">
                            <div class="container">
                                <div class="row">
                                    <nav id="navigation1" class="navigation">
                                        <!-- Logo Area Start -->
                                        <div class="nav-header">

                                            <div class="nav-toggle"></div>
                                        </div>

                                        <div class="nav-menus-wrapper">
                                            <ul class="nav-menu nav-tabs">

                                                <li><a href="javascript:;">رحلة </a>
                                                    <ul class="nav-dropdown">
                                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php#home" >رحلة الایران</a></li>
                                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php#menu1" > رحلة العالم</a></li>

                                                    </ul>
                                                </li>
                                                <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php#menu2"">فندق الداخلية </a></li>
                                                <li><a href="javascript:;">جولة </a>
                                                    <ul class="nav-dropdown">
                                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php#menu4" >جولة الایران </a></li>
                                                        <li><a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php#menu5" "> جولة العالم</a></li>

                                                    </ul>
                                                </li>


                                                <li><a class="SMRules" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/temp.php?irantech_parvaz=rules">قواعد التسوق </a></li>
                                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">تتبع المشتريات </a></li>
                                                <li><a class="SMFaq" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/temp.php?irantech_parvaz=faq">أسئلة مكررة </a></li>
                                                <li><a class="SMAbout" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/temp.php?irantech_parvaz=aboutus">من نحن </a></li>
                                                <li><a class="SMContactUs" href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/temp.php?irantech_parvaz=contactus">اتصل بنا </a></li>


                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="content_go">

        <div class="container">

            <div class="row">

                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>

        </div>

    </div>
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
    <div id="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="widget">
                        <div id="text-3" class="widget widget_text"><h3>من نحن</h3>
                            <div class="textwidget">
                                <p> {$smarty.const.ABOUT_ME}</p>
                            </div>
                        </div>

                        <div class="footer-links">
                            <a target="_blank" href="https://www.cao.ir/paxrights"><img src="project_files/images/certificate1.png"
                                                                                        alt="حقوق مسافر"></a>
                            <a target="_blank" href="https://www.cao.ir/"><img src="project_files/images/certificate2.png"
                                                                               alt="سازمان هواپیمایی کشور"></a>
                            <a target="_blank" href="http://aira.ir/images/uptoshahrivar.pdf"><img
                                        src="project_files/images/certificate3.png" alt="نرخ بلیط"></a>

                        </div>

                    </div>
                </div>
                <!-- break -->

                <!-- break -->
                <div class="col-md-6 col-sm-6 col-xs-6 col-6">
                    <div class="footer_col">
                        <div class="footer_title widget "><h3>معلومات الاتصال</h3></div>
                        <div class="footer_content footer_contact">
                            <ul class="contact_info_list">
                                <li class="contact_info_item d-flex flex-row">
                                    <div class="contact_info_text "><i class="fas fa-map-marked-alt "></i>
                                        <a class="SMFooterAddress">{$smarty.const.CLIENT_ADDRESS}</a>
                                    </div>
                                </li>
                                <li class="contact_info_item d-flex flex-row">
                                    <div class="contact_info_text"><i class="fas fa-phone"></i>
                                        <a href="tel:{$smarty.const.CLIENT_PHONE}" class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</a>
                                    </div>
                                </li>
                                <li class="contact_info_item d-flex flex-row">
                                    <div class="contact_info_text"><i class="fas fa-envelope"></i>
                                        <a href="mailto:Email@yahoo.com" target="_top" class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a>
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- break -->

                <!-- break -->

            </div>
            <!-- break -->
            <!-- begin:copyright -->
            <div class="bfooter">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 copyright">
                            <p> Web Designed By : <a href="https://www.iran-tech.com/">Iran Technology</a></p>

                        </div>

                    </div>
                </div>
            </div>
            <!-- end:copyright -->
        </div>

    </div>
    {/if}
<a id="scroll-top" style=" cursor: pointer">
    <button><i class="fas fa-arrow-up"></i></button>
</a>
<script type="text/javascript" src="project_files/js/modernizr.js"></script>
{literal}
    <script type="text/javascript">
        $(document).ready(function () {


            var heiw = $(window).height();

            // $('.content_go').css('min-height' , heiw);

            var owltours = $('.owl-tours');
            owltours.owlCarousel({
                rtl: true,
                loop: true,
                margin: 10,
                nav: false,
                dots:true,
                autoplay: false,
                autoplayTimeout: 2000,
                autoplayHoverPause: true,
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 1,
                    },
                    600: {
                        items: 2,
                    },
                    1000: {
                        items: 4,
                        loop: true,
                        margin:20
                    }
                }
            });


            var owl = $('.owl-carousel');
            owl.owlCarousel({
                rtl: true,
                loop: true,
                margin: 10,
                nav: false,
                dots:false,
                autoplay: true,
                autoplayTimeout: 2000,
                autoplayHoverPause: true,
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 3,

                    },
                    600: {
                        items: 5,

                    },
                    1000: {
                        items: 10,

                        loop: true,
                        margin:20
                    }
                }
            });

            // hide #back-top first
            $("#scroll-top").hide();
            // fade in #back-top
            $(function () {
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 100) {
                        $('#scroll-top').fadeIn();
                    } else {
                        $('#scroll-top').fadeOut();
                    }
                });
                // scroll body to 0px on click
                $('#scroll-top button').click(function () {
                    $('body,html').animate({
                        scrollTop: 0
                    }, 800);
                });
            });
            $("#rdo-1").click(function () {
                $("#bargasht input").attr('disabled', '');
                $("#bargasht").css('display','none');
            });
            $("#rdo-2").click(function () {

                $("#bargasht input").removeAttr('disabled', '');
                $("#bargasht").css('display','block');
            });

            $("#rdo-3").click(function () {
                $("#bargasht2 input").attr('disabled', '');
                $("#bargasht2").css('display','block');

            });
            $("#rdo-4").click(function () {

                $("#bargasht2 input").removeAttr('disabled', '');
                $("#bargasht2").css('display','none');

            });

            $('.select2').select2();
            $('.select2-num').select2({minimumResultsForSearch: Infinity,});



            $(".select").click(function () {
                $(".cbox-count-nafar").show();
            });
            $(".select1").click(function () {
                $(".cbox-count-nafar1").show();
            });

            $(".plus-nafar").click(function () {
                var nafar = $(this).siblings(".number-count").attr('data-number');
                if (nafar < 9) {
                    var newnafar = ++nafar;
                    $(this).siblings(".number-count").html(newnafar);
                    $(this).siblings(".number-count").attr('data-number', newnafar);
                    var whathidden = $(this).siblings(".number-count").attr('data-value');
                    $("." + whathidden).val(newnafar);

                }
                var nafarbozorg = Number($(this).parents(".box-of-count-nafar").find(".bozorg-num .number-count").attr('data-number'));
                var nafarkoodak = Number($(this).parents(".box-of-count-nafar").find(".koodak-num .number-count").attr('data-number'));
                var nafarnozad = Number($(this).parents(".box-of-count-nafar").find(".nozad-num .number-count").attr('data-number'));
                var tedad = nafarbozorg + nafarkoodak + nafarnozad;
                $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(tedad + " مسافر ");
            });
            $(".minus-nafar").click(function () {
                var nafar = $(this).siblings(".number-count").attr('data-number');

                var nmin = $(this).siblings(".number-count").attr('data-min');
                if (nafar > nmin) {
                    var newnafar = --nafar;
                    $(this).siblings(".number-count").html(newnafar);
                    $(this).siblings(".number-count").attr('data-number', newnafar);
                    var whathidden = $(this).siblings(".number-count").attr('data-value');
                    $("." + whathidden).val(newnafar);
                }
                var nafarbozorg2 = Number($(this).parents(".box-of-count-nafar").find(".bozorg-num .number-count").attr('data-number'));
                var nafarkoodak2 = Number($(this).parents(".box-of-count-nafar").find(".koodak-num .number-count").attr('data-number'));
                var nafarnozad2 = Number($(this).parents(".box-of-count-nafar").find(".nozad-num .number-count").attr('data-number'));
                var tedad2 = nafarbozorg2 + nafarkoodak2 + nafarnozad2;
                $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(tedad2 + " مسافر ");
            });


            $('.box-of-count-nafar').bind('click', function(e){
                //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
                e.stopPropagation();

            });

            $('body').click(function () {

                $('.cbox-count-nafar').hide();
                $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
            });



            $('.down-count-nafar').click(function () {

                $('.cbox-count-nafar').toggle();
                $(this).parents().find('.down-count-nafar').toggleClass('fa-caret-up');
            });

            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            });



        });

        $(".icon_chane").click(function () {
            var href2=$(this).parents('.button_vijeh').find('.ref12').attr('data-href2');
            var href1=$(this).parents('.button_vijeh').find('.ref12').attr('data-href1');
            $(this).css('display' , 'none');
            $(this).parents('.button_vijeh').find('.icon_chane2').css('display' , 'inline-block');


            $(this).parents('.button_vijeh').find('.rout0').css('transform' ,'translate(-75px)');
            $(this).parents('.button_vijeh').find('.rout1').css('transform','translate(83px)');

            $(this).parents('.button_vijeh').find('.ref12').attr('href',href2);

        });

        $(".icon_chane2").click(function () {
            var href2=$(this).parents('.button_vijeh').find('.ref12').attr('data-href2');
            var href1=$(this).parents('.button_vijeh').find('.ref12').attr('data-href1');
            $(this).css('display' , 'none');
            $(this).parents('.button_vijeh').find('.icon_chane').css('display' , 'inline-block');


            $(this).parents('.button_vijeh').find('.rout0').css('transform','translate(0)');
            $(this).parents('.button_vijeh').find('.rout1').css('transform','translate(0)');
            $(this).parents('.button_vijeh').find('.ref12').attr('href',href1);

        });
        !(function(n, i, e, a) {
            ;(n.navigation = function(t, s) {
                var o = {
                        responsive: !0,
                        mobileBreakpoint: 991,
                        showDuration: 200,
                        hideDuration: 200,
                        showDelayDuration: 0,
                        hideDelayDuration: 0,
                        submenuTrigger: "hover",
                        effect: "fadeIn",
                        submenuIndicator: !0,
                        submenuIndicatorTrigger: !1,
                        hideSubWhenGoOut: !0,
                        visibleSubmenusOnMobile: !1,
                        fixed: !1,
                        overlay: !0,
                        overlayColor: "rgba(0, 0, 0, 0.5)",
                        hidden: !1,
                        hiddenOnMobile: !1,
                        offCanvasSide: "left",
                        offCanvasCloseButton: !0,
                        animationOnShow: "",
                        animationOnHide: "",
                        onInit: function() {},
                        onLandscape: function() {},
                        onPortrait: function() {},
                        onShowOffCanvas: function() {},
                        onHideOffCanvas: function() {}
                    },
                    r = this,
                    u = Number.MAX_VALUE,
                    d = 1,
                    l = "click.nav touchstart.nav",
                    f = "mouseenter focusin",
                    c = "mouseleave focusout"
                r.settings = {}
                var t = (n(t), t)
                n(t).find(".nav-search").length > 0 &&
                n(t)
                    .find(".nav-search")
                    .find("form")
                    .prepend(
                        "<span class='nav-search-close-button' tabindex='0'>&#10005;</span>"
                    ),
                    (r.init = function() {
                        ;(r.settings = n.extend({}, o, s)),
                        r.settings.offCanvasCloseButton &&
                        n(t)
                            .find(".nav-menus-wrapper")
                            .prepend(
                                "<span class='nav-menus-wrapper-close-button'>&#10005;</span>"
                            ),
                        "right" == r.settings.offCanvasSide &&
                        n(t)
                            .find(".nav-menus-wrapper")
                            .addClass("nav-menus-wrapper-right"),
                        r.settings.hidden &&
                        (n(t).addClass("navigation-hidden"),
                            (r.settings.mobileBreakpoint = 99999)),
                            v(),
                        r.settings.fixed && n(t).addClass("navigation-fixed"),
                            n(t)
                                .find(".nav-toggle")
                                .on("click touchstart", function(n) {
                                    n.stopPropagation(),
                                        n.preventDefault(),
                                        r.showOffcanvas(),
                                    s !== a && r.callback("onShowOffCanvas")
                                }),
                            n(t)
                                .find(".nav-menus-wrapper-close-button")
                                .on("click touchstart", function() {
                                    r.hideOffcanvas(), s !== a && r.callback("onHideOffCanvas")
                                }),
                            n(t)
                                .find(".nav-search-button, .nav-search-close-button")
                                .on("click touchstart keydown", function(i) {
                                    i.stopPropagation(), i.preventDefault()
                                    var e = i.keyCode || i.which
                                    "click" === i.type ||
                                    "touchstart" === i.type ||
                                    ("keydown" === i.type && 13 == e)
                                        ? r.toggleSearch()
                                        : 9 == e && n(i.target).blur()
                                }),
                        n(t).find(".megamenu-tabs").length > 0 && y(),
                            n(i).resize(function() {
                                r.initNavigationMode(C()), O(), r.settings.hiddenOnMobile && m()
                            }),
                            r.initNavigationMode(C()),
                        r.settings.hiddenOnMobile && m(),
                        s !== a && r.callback("onInit")
                    })
                var h = function() {
                        n(t)
                            .find(".nav-submenu")
                            .hide(0),
                            n(t)
                                .find("li")
                                .removeClass("focus")
                    },
                    v = function() {
                        n(t)
                            .find("li")
                            .each(function() {
                                n(this).children(".nav-dropdown,.megamenu-panel").length > 0 &&
                                (n(this)
                                    .children(".nav-dropdown,.megamenu-panel")
                                    .addClass("nav-submenu"),
                                r.settings.submenuIndicator &&
                                n(this)
                                    .children("a")
                                    .append(
                                        "<span class='submenu-indicator'><span class='submenu-indicator-chevron'></span></span>"
                                    ))
                            })
                    },
                    m = function() {
                        n(t).hasClass("navigation-portrait")
                            ? n(t).addClass("navigation-hidden")
                            : n(t).removeClass("navigation-hidden")
                    }
                    ;(r.showSubmenu = function(i, e) {
                    C() > r.settings.mobileBreakpoint &&
                    n(t)
                        .find(".nav-search")
                        .find("form")
                        .fadeOut(),
                        "fade" == e
                            ? n(i)
                                .children(".nav-submenu")
                                .stop(!0, !0)
                                .delay(r.settings.showDelayDuration)
                                .fadeIn(r.settings.showDuration)
                                .removeClass(r.settings.animationOnHide)
                                .addClass(r.settings.animationOnShow)
                            : n(i)
                                .children(".nav-submenu")
                                .stop(!0, !0)
                                .delay(r.settings.showDelayDuration)
                                .slideDown(r.settings.showDuration)
                                .removeClass(r.settings.animationOnHide)
                                .addClass(r.settings.animationOnShow),
                        n(i).addClass("focus")
                }),
                    (r.hideSubmenu = function(i, e) {
                        "fade" == e
                            ? n(i)
                                .find(".nav-submenu")
                                .stop(!0, !0)
                                .delay(r.settings.hideDelayDuration)
                                .fadeOut(r.settings.hideDuration)
                                .removeClass(r.settings.animationOnShow)
                                .addClass(r.settings.animationOnHide)
                            : n(i)
                                .find(".nav-submenu")
                                .stop(!0, !0)
                                .delay(r.settings.hideDelayDuration)
                                .slideUp(r.settings.hideDuration)
                                .removeClass(r.settings.animationOnShow)
                                .addClass(r.settings.animationOnHide),
                            n(i)
                                .removeClass("focus")
                                .find(".focus")
                                .removeClass("focus")
                    })
                var p = function() {
                        n("body").addClass("no-scroll"),
                        r.settings.overlay &&
                        (n(t).append("<div class='nav-overlay-panel'></div>"),
                            n(t)
                                .find(".nav-overlay-panel")
                                .css("background-color", r.settings.overlayColor)
                                .fadeIn(300)
                                .on("click touchstart", function(n) {
                                    r.hideOffcanvas()
                                }))
                    },
                    g = function() {
                        n("body").removeClass("no-scroll"),
                        r.settings.overlay &&
                        n(t)
                            .find(".nav-overlay-panel")
                            .fadeOut(400, function() {
                                n(this).remove()
                            })
                    }
                    ;(r.showOffcanvas = function() {
                    p(),
                        "left" == r.settings.offCanvasSide
                            ? n(t)
                                .find(".nav-menus-wrapper")
                                .css("transition-property", "left")
                                .addClass("nav-menus-wrapper-open")
                            : n(t)
                                .find(".nav-menus-wrapper")
                                .css("transition-property", "right")
                                .addClass("nav-menus-wrapper-open")
                }),
                    (r.hideOffcanvas = function() {
                        n(t)
                            .find(".nav-menus-wrapper")
                            .removeClass("nav-menus-wrapper-open")
                            .on(
                                "webkitTransitionEnd moztransitionend transitionend oTransitionEnd",
                                function() {
                                    n(t)
                                        .find(".nav-menus-wrapper")
                                        .css("transition-property", "none")
                                        .off()
                                }
                            ),
                            g()
                    }),
                    (r.toggleOffcanvas = function() {
                        C() <= r.settings.mobileBreakpoint &&
                        (n(t)
                            .find(".nav-menus-wrapper")
                            .hasClass("nav-menus-wrapper-open")
                            ? (r.hideOffcanvas(), s !== a && r.callback("onHideOffCanvas"))
                            : (r.showOffcanvas(), s !== a && r.callback("onShowOffCanvas")))
                    }),
                    (r.toggleSearch = function() {
                        "none" ==
                        n(t)
                            .find(".nav-search")
                            .find("form")
                            .css("display")
                            ? (n(t)
                                .find(".nav-search")
                                .find("form")
                                .fadeIn(200),
                                n(t)
                                    .find(".nav-search")
                                    .find("input")
                                    .focus())
                            : (n(t)
                                .find(".nav-search")
                                .find("form")
                                .fadeOut(200),
                                n(t)
                                    .find(".nav-search")
                                    .find("input")
                                    .blur())
                    }),
                    (r.initNavigationMode = function(i) {
                        r.settings.responsive
                            ? (i <= r.settings.mobileBreakpoint &&
                            u > r.settings.mobileBreakpoint &&
                            (n(t)
                                .addClass("navigation-portrait")
                                .removeClass("navigation-landscape"),
                                S(),
                            s !== a && r.callback("onPortrait")),
                            i > r.settings.mobileBreakpoint &&
                            d <= r.settings.mobileBreakpoint &&
                            (n(t)
                                .addClass("navigation-landscape")
                                .removeClass("navigation-portrait"),
                                k(),
                                g(),
                                r.hideOffcanvas(),
                            s !== a && r.callback("onLandscape")),
                                (u = i),
                                (d = i))
                            : (n(t).addClass("navigation-landscape"),
                                k(),
                            s !== a && r.callback("onLandscape"))
                    })
                var b = function() {
                        n("html").on("click.body touchstart.body", function(i) {
                            0 === n(i.target).closest(".navigation").length &&
                            (n(t)
                                .find(".nav-submenu")
                                .fadeOut(),
                                n(t)
                                    .find(".focus")
                                    .removeClass("focus"),
                                n(t)
                                    .find(".nav-search")
                                    .find("form")
                                    .fadeOut())
                        })
                    },
                    C = function() {
                        return (
                            i.innerWidth || e.documentElement.clientWidth || e.body.clientWidth
                        )
                    },
                    w = function() {
                        n(t)
                            .find(".nav-menu")
                            .find("li, a")
                            .off(l)
                            .off(f)
                            .off(c)
                    },
                    O = function() {
                        if (C() > r.settings.mobileBreakpoint) {
                            var i = n(t).outerWidth(!0)
                            n(t)
                                .find(".nav-menu")
                                .children("li")
                                .children(".nav-submenu")
                                .each(function() {
                                    n(this)
                                        .parent()
                                        .position().left +
                                    n(this).outerWidth() >
                                    i
                                        ? n(this).css("right", 0)
                                        : n(this).css("right", "auto")
                                })
                        }
                    },
                    y = function() {
                        function i(i) {
                            var e = n(i)
                                    .children(".megamenu-tabs-nav")
                                    .children("li"),
                                a = n(i).children(".megamenu-tabs-pane")
                            n(e).on("click.tabs touchstart.tabs", function(i) {
                                i.stopPropagation(),
                                    i.preventDefault(),
                                    n(e).removeClass("active"),
                                    n(this).addClass("active"),
                                    n(a)
                                        .hide(0)
                                        .removeClass("active"),
                                    n(a[n(this).index()])
                                        .show(0)
                                        .addClass("active")
                            })
                        }
                        if (n(t).find(".megamenu-tabs").length > 0)
                            for (var e = n(t).find(".megamenu-tabs"), a = 0; a < e.length; a++)
                                i(e[a])
                    },
                    k = function() {
                        w(),
                            h(),
                            navigator.userAgent.match(/Mobi/i) ||
                            navigator.maxTouchPoints > 0 ||
                            "click" == r.settings.submenuTrigger
                                ? n(t)
                                    .find(".nav-menu, .nav-dropdown")
                                    .children("li")
                                    .children("a")
                                    .on(l, function(e) {
                                        if (
                                            (r.hideSubmenu(
                                                n(this)
                                                    .parent("li")
                                                    .siblings("li"),
                                                r.settings.effect
                                            ),
                                                n(this)
                                                    .closest(".nav-menu")
                                                    .siblings(".nav-menu")
                                                    .find(".nav-submenu")
                                                    .fadeOut(r.settings.hideDuration),
                                            n(this).siblings(".nav-submenu").length > 0)
                                        ) {
                                            if (
                                                (e.stopPropagation(),
                                                    e.preventDefault(),
                                                "none" ==
                                                n(this)
                                                    .siblings(".nav-submenu")
                                                    .css("display"))
                                            )
                                                return (
                                                    r.showSubmenu(
                                                        n(this).parent("li"),
                                                        r.settings.effect
                                                    ),
                                                        O(),
                                                        !1
                                                )
                                            if (
                                                (r.hideSubmenu(n(this).parent("li"), r.settings.effect),
                                                "_blank" === n(this).attr("target") ||
                                                "blank" === n(this).attr("target"))
                                            )
                                                i.open(n(this).attr("href"))
                                            else {
                                                if (
                                                    "#" === n(this).attr("href") ||
                                                    "" === n(this).attr("href") ||
                                                    "javascript:void(0)" === n(this).attr("href")
                                                )
                                                    return !1
                                                i.location.href = n(this).attr("href")
                                            }
                                        }
                                    })
                                : n(t)
                                    .find(".nav-menu")
                                    .find("li")
                                    .on(f, function() {
                                        r.showSubmenu(this, r.settings.effect), O()
                                    })
                                    .on(c, function() {
                                        r.hideSubmenu(this, r.settings.effect)
                                    }),
                        r.settings.hideSubWhenGoOut && b()
                    },
                    S = function() {
                        w(),
                            h(),
                            r.settings.visibleSubmenusOnMobile
                                ? n(t)
                                    .find(".nav-submenu")
                                    .show(0)
                                : (n(t)
                                    .find(".submenu-indicator")
                                    .removeClass("submenu-indicator-up"),
                                    r.settings.submenuIndicator &&
                                    r.settings.submenuIndicatorTrigger
                                        ? n(t)
                                            .find(".submenu-indicator")
                                            .on(l, function(i) {
                                                return (
                                                    i.stopPropagation(),
                                                        i.preventDefault(),
                                                        r.hideSubmenu(
                                                            n(this)
                                                                .parent("a")
                                                                .parent("li")
                                                                .siblings("li"),
                                                            "slide"
                                                        ),
                                                        r.hideSubmenu(
                                                            n(this)
                                                                .closest(".nav-menu")
                                                                .siblings(".nav-menu")
                                                                .children("li"),
                                                            "slide"
                                                        ),
                                                        "none" ==
                                                        n(this)
                                                            .parent("a")
                                                            .siblings(".nav-submenu")
                                                            .css("display")
                                                            ? (n(this).addClass("submenu-indicator-up"),
                                                                n(this)
                                                                    .parent("a")
                                                                    .parent("li")
                                                                    .siblings("li")
                                                                    .find(".submenu-indicator")
                                                                    .removeClass("submenu-indicator-up"),
                                                                n(this)
                                                                    .closest(".nav-menu")
                                                                    .siblings(".nav-menu")
                                                                    .find(".submenu-indicator")
                                                                    .removeClass("submenu-indicator-up"),
                                                                r.showSubmenu(
                                                                    n(this)
                                                                        .parent("a")
                                                                        .parent("li"),
                                                                    "slide"
                                                                ),
                                                                !1)
                                                            : (n(this)
                                                                .parent("a")
                                                                .parent("li")
                                                                .find(".submenu-indicator")
                                                                .removeClass("submenu-indicator-up"),
                                                                void r.hideSubmenu(
                                                                    n(this)
                                                                        .parent("a")
                                                                        .parent("li"),
                                                                    "slide"
                                                                ))
                                                )
                                            })
                                        : n(t)
                                            .find(".nav-menu, .nav-dropdown")
                                            .children("li")
                                            .children("a")
                                            .on(l, function(e) {
                                                if (
                                                    (e.stopPropagation(),
                                                        e.preventDefault(),
                                                        r.hideSubmenu(
                                                            n(this)
                                                                .parent("li")
                                                                .siblings("li"),
                                                            r.settings.effect
                                                        ),
                                                        r.hideSubmenu(
                                                            n(this)
                                                                .closest(".nav-menu")
                                                                .siblings(".nav-menu")
                                                                .children("li"),
                                                            "slide"
                                                        ),
                                                    "none" ==
                                                    n(this)
                                                        .siblings(".nav-submenu")
                                                        .css("display"))
                                                )
                                                    return (
                                                        n(this)
                                                            .children(".submenu-indicator")
                                                            .addClass("submenu-indicator-up"),
                                                            n(this)
                                                                .parent("li")
                                                                .siblings("li")
                                                                .find(".submenu-indicator")
                                                                .removeClass("submenu-indicator-up"),
                                                            n(this)
                                                                .closest(".nav-menu")
                                                                .siblings(".nav-menu")
                                                                .find(".submenu-indicator")
                                                                .removeClass("submenu-indicator-up"),
                                                            r.showSubmenu(n(this).parent("li"), "slide"),
                                                            !1
                                                    )
                                                if (
                                                    (n(this)
                                                        .parent("li")
                                                        .find(".submenu-indicator")
                                                        .removeClass("submenu-indicator-up"),
                                                        r.hideSubmenu(n(this).parent("li"), "slide"),
                                                    "_blank" === n(this).attr("target") ||
                                                    "blank" === n(this).attr("target"))
                                                )
                                                    i.open(n(this).attr("href"))
                                                else {
                                                    if (
                                                        "#" === n(this).attr("href") ||
                                                        "" === n(this).attr("href") ||
                                                        "javascript:void(0)" === n(this).attr("href")
                                                    )
                                                        return !1
                                                    i.location.href = n(this).attr("href")
                                                }
                                            }))
                    }
                    ;(r.callback = function(n) {
                    s[n] !== a && s[n].call(t)
                }),
                    r.init()
            }),
                (n.fn.navigation = function(i) {
                    return this.each(function() {
                        if (a === n(this).data("navigation")) {
                            var e = new n.navigation(this, i)
                            n(this).data("navigation", e)
                        }
                    })
                })
        })(jQuery, window, document)

        ;(function($) {
            "use strict"

            var $window = $(window)

            if ($.fn.navigation) {
                $(".navigation").navigation()
                $("#always-hidden-nav").navigation({
                    hidden: true
                })
            }

            $window.on("load", function() {
                $("#preloader").fadeOut("slow", function() {
                    $(this).remove()
                })
            })
        })(jQuery)

    </script>
{/literal}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
</body>

</html>