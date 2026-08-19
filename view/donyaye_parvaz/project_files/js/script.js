$(document).ready(function () {
    $('.c-header__btn').click(function () {

        $('.main-navigation__sub-menu2').toggleClass('active_log');
    });
    $('.menu-login').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });

    $('body').click(function () {

        $('.main-navigation__sub-menu2').removeClass('active_log');
    });



    $(window).scroll(function () {
        var scroll = $(this).scrollTop();
        var head = $('.header').height()
        if (scroll > head) {
            $('.header_tow').addClass('header_tow2')
        } else {
            $('.header_tow').removeClass('header_tow2')
        };
    });


    $(".menu").click(function () {
        if ($('.menu').hasClass('icon-search2hover')) {
            $('.menu').removeClass('icon-search2hover');
            $(".header_ris_bg").removeClass("header_ris_bg-w");
            $(".header_tow_list").removeClass("header_tow_list-w");
        } else {
            $('.menu').addClass('icon-search2hover');
            $(".header_ris_bg").addClass("header_ris_bg-w");
            $(".header_tow_list").addClass("header_tow_list-w");
        }
    })
    $(".header_ris_bg").click(function () {
        if ($('.menu').hasClass('icon-search2hover')) {
            $('.menu').removeClass('icon-search2hover');
            $(".header_ris_bg").removeClass("header_ris_bg-w");
            $(".header_tow_list").removeClass("header_tow_list-w");
        } else {
            $('.menu').addClass('icon-search2hover');
            $(".header_ris_bg").addClass("header_ris_bg-w");
            $(".header_tow_list").addClass("header_tow_list-w");
        }
    })

    $(".header_tow_list_li__a").click(function () {
        if ($(this).hasClass('this')) {
            $(this).removeClass('this')
            $(this).parent().children('ul').removeClass('d-flex')
        } else {
            $(this).addClass('this')
            $(this).parent().children('ul').addClass('d-flex')
        }
    })



    $(".header_tow_list_li123").click(function () {
        if ($(this).hasClass('this')) {
            $(this).removeClass('this')
            $(this).children('ul').removeClass('d-flex');
        } else {
            $(this).addClass('this')
            $(this).children('ul').addClass('d-flex');
        }
    })

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
        $('#scroll-top a').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
        });
    });



    $('.box-of-count-nafar').bind('click', function (e) {
        e.stopPropagation();
    });

    $('body').click(function () {
        $('.cbox-count-nafar').hide();
        $(".down-count-nafar").removeClass('fa-caret-up')
    })
    $(".radioli2").click(function () {
        $('.input_style2').prop('disabled', true);
    })
    $(".radioli1").click(function () {
        $('.input_style2').prop('disabled', false);
    })

    $(".click_scroll").click(()=>{
        $([document.documentElement, document.body]).animate({
            scrollTop: $("#myTab").offset().top - 250
        }, 500);

    })

});
$(document).ready(function (){
    $( ".main-navigation__button2" ).click( function() {
        $('.main-navigation__sub-menu2').fadeToggle(function() {
            $('button-chevron-2').toggle();
        });
    } );
});
