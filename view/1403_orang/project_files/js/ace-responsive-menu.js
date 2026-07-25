$(document).ready(function() {
    "use strict";
    $('.main-site-menu > ul > li:has(  ul)').addClass('menu-dropdown-icon');
    $('.main-site-menu > ul > li > ul:not(:has(ul))').addClass('normal-sub');
    $(".main-site-menu > ul").before("<a href=\"#\" class=\"menu-mobile\">&nbsp;</a>");
    $(".main-site-menu > ul > li").hover(function(e) {
        if ($(window).width() > 991) {
            $(this).children("ul").stop(true, false).fadeToggle(150);
            e.preventDefault();
        }
    });
    $(".main-site-menu > ul > li").click(function() {
        if ($(window).width() <= 991) {
            $(this).children("ul").fadeToggle(150);
        }
    });
    $(".menu-mobile").click(function(e) {
        $(".main-site-menu > ul").toggleClass('show-on-mobile');
        e.preventDefault();
    });
});
$(window).resize(function() {
    $(".main-site-menu > ul > li").children("ul").hide();
    $(".main-site-menu > ul").removeClass('show-on-mobile');
});
