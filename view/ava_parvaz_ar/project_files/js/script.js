$(document).ready(function () {
    $('body').click(function () {
        $('.main-navigation__sub-menu2').hide();
    });
    $('.main-navigation__button2').click(function (e) {
        e.stopPropagation()
    });
    $('.OWL_slider_banner').owlCarousel({
        rtl: true,
        loop:true,
        margin:1,
        nav:false,
        dots:false,
        animateOut: 'fadeOut',
        autoplay:true,
        autoplayTimeout:6000,
        items:1,
    })
    $('.owl-tour').owlCarousel({
        rtl:true,
        loop:true,
        margin:10,
        nav:false,
        navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M233 239c9.4 9.4 9.4 24.6 0 33.9L73 433c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l143-143L39 113c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L233 239z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L167 433c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9L57.9 256 201 113c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>"],
        autoplay: true,
        autoplayTimeout: 5000,
        autoplaySpeed:3000,
        dots:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            }
        }
    });

    $('.owl-hotel').owlCarousel({
        rtl:true,
        loop:true,
        margin:15,
        nav:false,
        navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M233 239c9.4 9.4 9.4 24.6 0 33.9L73 433c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l143-143L39 113c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L233 239z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L167 433c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9L57.9 256 201 113c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>"],
        autoplay: true,
        autoplayTimeout: 5000,
        autoplaySpeed:3000,
        dots:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            }
        }
    });


});

$('.internal-my-hotels-rooms-js').on('click', '.close_room', function () {

    $(this).parent().parent().removeClass('active_p');


});
$('.international-my-hotels-rooms-js').on('click', '.close_room', function () {

    $(this).parent().parent().removeClass('active_p');

});