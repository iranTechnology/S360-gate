
{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="hashedPass" value=functions::HashKey({$smarty.session.cardNo},'encrypt')}

<!doctype html>
<html lang="fa">
<head>
    <!-- Required meta tags -->
    <title>{$obj->Title_head()}</title>
    <link rel="shortcut icon" type="image/x-icon" href="project_files/images/favicon.png"/>
    <meta name="description" content="{$obj->Title_head()}">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>
    <!-- Bootstrap CSS -->

    {if $smarty.session.layout neq 'pwa'}
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicon.png">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <link rel="stylesheet" href="project_files/css/animate.min.css">
    <link rel="stylesheet" href="project_files/css/all.css">
    <link rel="stylesheet" href="project_files/css/header.css">
    {/if}
    <link rel="stylesheet" href="project_files/css/style.css">


    {if $smarty.const.SOFTWARE_LANG eq 'ar'}
        <link rel="stylesheet" href="project_files/css/style-ar.css">
    {/if}
    <script src="project_files/js/jquery-3.4.1.min.js"></script>
    <script src="project_files/js/modernizr.js"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}

</head>
<body class="body_temp">
{if $smarty.session.layout neq 'pwa' }
<header class="header_area">
    <div class="main_header_area animated">
        {if $smarty.const.SOFTWARE_LANG eq 'ar'}
            {include file="topBar-ar.tpl"}
        {elseif $smarty.const.SOFTWARE_LANG eq 'fa'}
            {include file="topBar.tpl"}
        {/if}



        <div class="container">
            <nav id="navigation1" class="navigation">
                <!-- Logo Area Start -->
                <div class="nav-header">
                    {if $smarty.const.SOFTWARE_LANG eq 'ar'}
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php">
                            <img src="project_files/images/logo.png" alt="سفریار گوهر توس">
                        </a>
                    {elseif $smarty.const.SOFTWARE_LANG eq 'fa'}
                        <a class="nav-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                            <img src="project_files/images/logo.png" alt="سفریار گوهر توس">
                        </a>
                    {/if}

                    <div class="nav-toggle"></div>
                </div>

                <div class="nav-menus-wrapper">
                    <ul class="nav-menu ">

                        {if $smarty.const.SOFTWARE_LANG eq 'ar'}
                        <li class="tours_menu"><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/ar/user/home.php">##GoharFlight##</a></li>
                        {elseif $smarty.const.SOFTWARE_LANG eq 'fa'}
                            <li class="tours_menu"><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">##GoharFlight##</a></li>
                            <li class="tours_menu"><a href="https://sgt724.com/Systems/Login.aspx">سپهر سیستم</a></li>

                        {/if}
                        <li class="tours_menu"><a href="javascript:;">##GoharTours##</a>
                            <ul class="nav-dropdown  animated fadeInUp ">

                                <li>
                                    <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=irantourcity&level=1">
                                        ##GoharLocalTours##
                                    </a>


                                </li>

                                <li>
                                    <a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=alltours">##GoharLocalLastSeen##
                                        </a></li>

                            </ul>
                        </li>

                        <li class=""><a href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=hotel">##GoharHotel##</a>

                        </li>

                        <li class=""><a href="javascript:;">  ##GoharKnowledge##</a>
                            <ul class="nav-dropdown  animated fadeInUp ">
                                <li><a class="SMAboutIran" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=aboutiran">##GoharAboutIran##
                                         </a></li>

                                {if $smarty.const.SOFTWARE_LANG eq 'fa'}

                                <li><a class="SMAboutCountry"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=aboutcountry">##GoharAboutWorld##
                                         </a></li>
                                {/if}
                                <li><a class="SMWeather"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=weather">##GoharWeather##
                                         </a></li>
                                <li><a class="SMWorldClock"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=worldclock">##GoharWorldClock##
                                          </a></li>
                                {if $smarty.const.SOFTWARE_LANG eq 'fa'}
                                <li><a class="SMWorldGallery"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=worldgallery">##GoharWorldGallery##
                                           </a></li>
                                <!--                                <li><a href=""> تبلیغات </a></li>-->
                                {/if}


                            </ul>
                        </li>
                        <li class="aboutUs"><a href="javascript:;">##GoharAboutUs##</a>
                            <ul class="nav-dropdown  animated fadeInUp ">

                                <li><a class="SMAbout"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=aboutus">##GoharAboutUs##
                                          </a></li>
                                <li><a href="{$smarty.const.ROOT_ADDRESS}/UserTracking"> ##GoharUserTracking##  </a></li>
                                <li><a class="SMRules"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=rules">##GoharRules##
                                        </a></li>
                                {if $smarty.const.SOFTWARE_LANG eq 'fa'}
                                <li><a class="SMFeedback"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/temp.php?irantech_parvaz=feedback">##GoharFeedBack##
                                        </a></li>
                                {/if}

                                <li><a class="SMStaff"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=staff">##GoharStaff##
                                           </a></li>

                                <li><a class="SMOrder"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=order">##GoharOrder##
                                           </a></li>

                                <li><a class="SMOrder"
                                       href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=order">##GoharOrder##
                                           </a></li>
                            </ul>
                        </li>
                        <li><a class="SMContactUs"
                               href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=contactus">##GoharContactUs##
                            </a></li>
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
    <div class="{if $smarty.session.layout neq 'pwa' }temp_content{else}mt-3{/if}">
        <div class="container">
            <div class="row">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}





{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
    <footer class="image-bg light-footer">
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="footer-widget">
                            <h4 class="widget-title"> ##GoharAboutUs## </h4>
                            {if $smarty.const.SOFTWARE_LANG eq 'fa'}
                            <aside id="media_image-2" class="widget widget_media_image">
                                <p>{$smarty.const.ABOUT_ME}</p>
                            </aside>
                            {else}
                            <aside id="media_image-2" class="widget widget_media_image">
                                <p>                    تأسست وكالة السفر في عام 2011 بهدف توفير خدمة سفر مريحة ومريحة ، وذلك باستخدام أحدث التقنيات لإنتاج جول آلي بالكامل في هذه الصناعة.
                                </p>
                            </aside>
                            {/if}
                            <aside id="text-2" class="mt-1 widget widget_text logo-moshtari">
                                <div class="textwidget">
                                    <ul style="text-align: center">
                                        <li><a rel="nofollow" target="_blank" href="https://www.cao.ir/paxrights"><img
                                                        src="project_files/images/certificate1.png"
                                                        alt="حقوق مسافر"></a></li>
                                        <li><a rel="nofollow" target="_blank" href="https://www.cao.ir/"><img
                                                        src="project_files/images/certificate2.png"
                                                        alt="سازمان هواپیمایی کشور"></a></li>
                                        <li><a rel="nofollow" target="_blank"
                                               href="http://aira.ir/images/FARE%2098.06.pdf"><img
                                                        src="project_files/images/certificate3.png" alt="نرخ بلیط"></a>
                                        </li>


                                    </ul>

                                </div>

                            </aside>

                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="row">

                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="footer-widget">
                                    <h4 class="widget-title">##GoharEasyAccess## </h4>
                                    <ul class="footer-menu">
                                        <li><a class="SMTourLocal"
                                               href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=irantourcity&level=1">##GoharLocalTours##
                                                </a></li>
                                        <li><a class="SMHotelLocal"
                                               href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=iranhotelcity">##GoharHotelLocal##
                                                 </a></li>
                                        {if $smarty.const.SOFTWARE_LANG eq 'fa'}

                                        <li><a class="SMHotelPortal"
                                               href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=hotelcountry">##GoharHotelPortal##
                                                 </a></li>
                                        {/if}
                                        <li><a class="SMAboutIran"
                                               href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=aboutiran">##GoharAboutIran##
                                                </a></li>
                                        {if $smarty.const.SOFTWARE_LANG eq 'fa'}

                                        <li><a class="SMAboutCountry"
                                               href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/{$smarty.const.SOFTWARE_LANG}/user/temp.php?irantech_parvaz=aboutcountry">##GoharAboutWorld##
                                                </a></li>
                                        {/if}

                                    </ul>
                                </div>
                            </div>


                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="footer-widget">
                                    <h4 class="widget-title">##GoharContactUs##</h4>
                                    {if $smarty.const.SOFTWARE_LANG eq 'fa'}

                                    <p class="SMFooterAddress">
                                        <i class="fa fa-map-marker-alt"></i>
                                        {$smarty.const.CLIENT_ADDRESS}
                                    </p>
                                    {else}
                                    <p class="SMFooterAddressEn">
                                        <i class="fa fa-map-marker-alt"></i>
                                        مشهد تقاطع الشهداء - بداية شارع بهجت - بجانب بنك صادرات
                                    </p>
                                    {/if}
                                    <p class="SMFooterEmail">
                                        <i class="fa fa-envelope"></i>
                                        {$smarty.const.CLIENT_EMAIL}
                                    </p>
                                    <p class="SMFooterPhone">
                                        <i class="fa fa-headphones"></i>
                                        {$smarty.const.CLIENT_PHONE}
                                    </p>


                                </div>
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
                    <a href="https://www.iran-tech.com/"> ##GoharDesignAgencyWebsite## </a>: ##GoharIranTech##  </span>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </footer>
{/if}

{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}

{/if}


{literal}
    <script type="text/javascript">
        !(function (n, i, e, a) {
            ;(n.navigation = function (t, s) {
                var o = {
                        responsive: !0,
                        mobileBreakpoint: 991,
                        showDuration: 0,
                        hideDuration: 0,
                        showDelayDuration: 0,
                        hideDelayDuration: 0,
                        submenuTrigger: "hover",
                        effect: "show",
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
                        onInit: function () {
                        },
                        onLandscape: function () {
                        },
                        onPortrait: function () {
                        },
                        onShowOffCanvas: function () {
                        },
                        onHideOffCanvas: function () {
                        }
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
                    (r.init = function () {
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
                                .on("click touchstart", function (n) {
                                    n.stopPropagation(),
                                        n.preventDefault(),
                                        r.showOffcanvas(),
                                    s !== a && r.callback("onShowOffCanvas")
                                }),
                            n(t)
                                .find(".nav-menus-wrapper-close-button")
                                .on("click touchstart", function () {
                                    r.hideOffcanvas(), s !== a && r.callback("onHideOffCanvas")
                                }),
                            n(t)
                                .find(".nav-search-button, .nav-search-close-button")
                                .on("click touchstart keydown", function (i) {
                                    i.stopPropagation(), i.preventDefault()
                                    var e = i.keyCode || i.which
                                    "click" === i.type ||
                                    "touchstart" === i.type ||
                                    ("keydown" === i.type && 13 == e)
                                        ? r.toggleSearch()
                                        : 9 == e && n(i.target).blur()
                                }),
                        n(t).find(".megamenu-tabs").length > 0 && y(),
                            n(i).resize(function () {
                                r.initNavigationMode(C()), O(), r.settings.hiddenOnMobile && m()
                            }),
                            r.initNavigationMode(C()),
                        r.settings.hiddenOnMobile && m(),
                        s !== a && r.callback("onInit")
                    })
                var h = function () {
                        n(t)
                            .find(".nav-submenu")
                            .hide(0),
                            n(t)
                                .find("li")
                                .removeClass("focus")
                    },
                    v = function () {
                        n(t)
                            .find("li")
                            .each(function () {
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
                    m = function () {
                        n(t).hasClass("navigation-portrait")
                            ? n(t).addClass("navigation-hidden")
                            : n(t).removeClass("navigation-hidden")
                    }
                ;(r.showSubmenu = function (i, e) {
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
                    (r.hideSubmenu = function (i, e) {
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
                var p = function () {
                        n("body").addClass("no-scroll"),
                        r.settings.overlay &&
                        (n(t).append("<div class='nav-overlay-panel'></div>"),
                            n(t)
                                .find(".nav-overlay-panel")
                                .css("background-color", r.settings.overlayColor)
                                .fadeIn(300)
                                .on("click touchstart", function (n) {
                                    r.hideOffcanvas()
                                }))
                    },
                    g = function () {
                        n("body").removeClass("no-scroll"),
                        r.settings.overlay &&
                        n(t)
                            .find(".nav-overlay-panel")
                            .fadeOut(400, function () {
                                n(this).remove()
                            })
                    }
                ;(r.showOffcanvas = function () {
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
                    (r.hideOffcanvas = function () {
                        n(t)
                            .find(".nav-menus-wrapper")
                            .removeClass("nav-menus-wrapper-open")
                            .on(
                                "webkitTransitionEnd moztransitionend transitionend oTransitionEnd",
                                function () {
                                    n(t)
                                        .find(".nav-menus-wrapper")
                                        .css("transition-property", "none")
                                        .off()
                                }
                            ),
                            g()
                    }),
                    (r.toggleOffcanvas = function () {
                        C() <= r.settings.mobileBreakpoint &&
                        (n(t)
                            .find(".nav-menus-wrapper")
                            .hasClass("nav-menus-wrapper-open")
                            ? (r.hideOffcanvas(), s !== a && r.callback("onHideOffCanvas"))
                            : (r.showOffcanvas(), s !== a && r.callback("onShowOffCanvas")))
                    }),
                    (r.toggleSearch = function () {
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
                    (r.initNavigationMode = function (i) {
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
                var b = function () {
                        n("html").on("click.body touchstart.body", function (i) {
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
                    C = function () {
                        return (
                            i.innerWidth || e.documentElement.clientWidth || e.body.clientWidth
                        )
                    },
                    w = function () {
                        n(t)
                            .find(".nav-menu")
                            .find("li, a")
                            .off(l)
                            .off(f)
                            .off(c)
                    },
                    O = function () {
                        if (C() > r.settings.mobileBreakpoint) {
                            var i = n(t).outerWidth(!0)
                            n(t)
                                .find(".nav-menu")
                                .children("li")
                                .children(".nav-submenu")
                                .each(function () {
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
                    y = function () {
                        function i(i) {
                            var e = n(i)
                                    .children(".megamenu-tabs-nav")
                                    .children("li"),
                                a = n(i).children(".megamenu-tabs-pane")
                            n(e).on("click.tabs touchstart.tabs", function (i) {
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
                    k = function () {
                        w(),
                            h(),
                            navigator.userAgent.match(/Mobi/i) ||
                            navigator.maxTouchPoints > 0 ||
                            "click" == r.settings.submenuTrigger
                                ? n(t)
                                    .find(".nav-menu, .nav-dropdown")
                                    .children("li")
                                    .children("a")
                                    .on(l, function (e) {
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
                                    .on(f, function () {
                                        r.showSubmenu(this, r.settings.effect), O()
                                    })
                                    .on(c, function () {
                                        r.hideSubmenu(this, r.settings.effect)
                                    }),
                        r.settings.hideSubWhenGoOut && b()
                    },
                    S = function () {
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
                                            .on(l, function (i) {
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
                                            .on(l, function (e) {
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
                ;(r.callback = function (n) {
                    s[n] !== a && s[n].call(t)
                }),
                    r.init()
            }),
                (n.fn.navigation = function (i) {
                    return this.each(function () {
                        if (a === n(this).data("navigation")) {
                            var e = new n.navigation(this, i)
                            n(this).data("navigation", e)
                        }
                    })
                })
        })(jQuery, window, document)

        ;(function ($) {
            "use strict"

            var $window = $(window)

            if ($.fn.navigation) {
                $(".navigation").navigation()
                $("#always-hidden-nav").navigation({
                    hidden: true
                })
            }

            $window.on("load", function () {
                $("#preloader").fadeOut("slow", function () {
                    $(this).remove()
                })
            })
        })(jQuery)


        $(document).ready(function () {


            $(".select2").select2();
            var heiw = $(window).height();

            // $('.temp_content').css('min-height', heiw);

            var winh = $(window).height();

            if ($(window).width() > 767) {
                $('.banner').css('height', winh);
            }

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

            $(window).scroll(function () {

                var sctop = $(this).scrollTop();

                if (sctop > 50) {


                    $('.header_area').addClass('fixedmenu');


                }
                else {

                    $('.header_area').removeClass('fixedmenu');


                }


            });


            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            });

            $('.top__user_menu').bind('click', function (e) {
                //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
                e.stopPropagation();

            });

            $('.box-of-count-nafar').bind('click', function (e) {
                //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
                e.stopPropagation();

            });

            $('body').click(function () {

                $('.main-navigation__sub-menu').hide();
                $('.button-chevron').removeClass('rotate');

                $('.cbox-count-nafar').hide();
                $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
            });

        });

    </script>
{/literal}

<a data-toggle="tooltip" data-placement="top" id="scroll-top" style="cursor: pointer; display: block;">
    <button><i class="fas fa-arrow-up"></i></button>
</a>


{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

</body>

</html>
