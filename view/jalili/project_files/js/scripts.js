$(document).ready(function() {
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


    // hide #back-top first
    $("#scroll-top").hide();
    // fade in #back-top
    $('#header_area_op').addClass('header_area_op');
    $("#top_header").addClass('display');

    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('#scroll-top').fadeIn();
                $('#header_area_op').removeClass('header_area_op');

                $("#top_header").removeClass('display');
            } else {
                $('#scroll-top').fadeOut();
                $('#header_area_op').addClass('header_area_op');

                $("#top_header").addClass('display');
            }
        });
        // scroll body to 0px on click
        $('#scroll-top button').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
        });
    });

});

