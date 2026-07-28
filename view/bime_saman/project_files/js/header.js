$(document).ready(function () {
    $(".clickable").click(function (e) {
        $(e.currentTarget).parent().children('ul').slideToggle();
        $(this).toggleClass("d-flex");
        $(e.currentTarget).children('svg').toggleClass("rotate-svg");
    });

    $(".parent-svg-xmark-menu").click(function () {
        $(".svg-xmark").addClass('d-show-flex');
        $(".svg-xmark").removeClass('d-hide-none');


        $(".svg-menu-click").addClass('d-hide-none');


        $(".back-hamburger").fadeIn();
        $(".menu-hamburger").toggleClass('translateX-svg');

    });
    $(".back-hamburger").click(function () {
        $(this).fadeOut();
        $(".menu-hamburger").removeClass('translateX-svg');
        $(".svg-xmark").addClass('d-hide-none');
        $(".svg-xmark").removeClass('d-show-flex');

        $(".svg-menu-click").removeClass('d-hide-none');
        $(".svg-menu-click").addClass('d-show-flex');

    });
});

