$(document).ready(function () {

    $(".main-navigation__sub-menu2").hide();
    $('.main-navigation__button2').click(function () {
       $(".main-navigation__sub-menu2").toggle();
       return false
    });
    $('body').click(function () {
        $(".main-navigation__sub-menu2").hide();
    });

    $(window).scroll(function () {
        let scroll = $(this).scrollTop();
        if (scroll > 80) {
            $('#navbar').addClass('header_fixed')
        } else {
            $('#navbar').removeClass('header_fixed')
        }
    });
    $("#scroll-top").hide();
});
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-top').fadeIn();
        } else {
            $('#scroll-top').fadeOut();
        }
    });
    $('#scroll-top').click(function () {
        $('body,html').animate({scrollTop: 0}, 800);
    });
});
$(".select2_in , .select2").select2();
