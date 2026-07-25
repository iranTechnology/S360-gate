$('.owl-banner-kanoun').owlCarousel({
    rtl:true,
    loop:true,
    margin:0,
    nav: true,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L167 433c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9L57.9 256 201 113c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>" ,"<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M233 239c9.4 9.4 9.4 24.6 0 33.9L73 433c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l143-143L39 113c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L233 239z\"/></svg>"],
    autoplay: true,
    autoplayTimeout:5000,
    autoplayHoverPause:true,
    dots:false,
    responsive:{
        0:{
            items:1,
            nav: false
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
});
$('.owl-tour').owlCarousel({
    loop:true,
    rtl:true,
    margin:20,
    navText: ['<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M166.5 424.5l-143.1-152c-4.375-4.625-6.562-10.56-6.562-16.5c0-5.938 2.188-11.88 6.562-16.5l143.1-152c9.125-9.625 24.31-10.03 33.93-.9375c9.688 9.125 10.03 24.38 .9375 33.94l-128.4 135.5l128.4 135.5c9.094 9.562 8.75 24.75-.9375 33.94C190.9 434.5 175.7 434.1 166.5 424.5z"/></svg>','<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M89.45 87.5l143.1 152c4.375 4.625 6.562 10.56 6.562 16.5c0 5.937-2.188 11.87-6.562 16.5l-143.1 152C80.33 434.1 65.14 434.5 55.52 425.4c-9.688-9.125-10.03-24.38-.9375-33.94l128.4-135.5l-128.4-135.5C45.49 110.9 45.83 95.75 55.52 86.56C65.14 77.47 80.33 77.87 89.45 87.5z"/></svg>'],
    nav:false,
    dots:true,
    autoplay:true,
    autoplayTimeout:3500,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:2
        },
        1000:{
            items:3
        },
        1200:{
            items:4
        }
    },
});

function clickScroll(e){
    $("html").animate({
        scrollTop: $(`#${e}`).offset().top - 30
    }, 1000);
}

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})

$(".select2").select2();


// hide #back-top first
$("#scroll-top").addClass('d-none');
// fade in #back-top
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-top').addClass('d-flex');
            $('#scroll-top').removeClass('d-none');
        } else {
            $('#scroll-top').removeClass('d-flex');
            $('#scroll-top').addClass('d-none');
        }
    });
    // scroll body to 0px on click
    $('#scroll-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 800);
    });
});


$(document).ready(function() {
    // $(window).scroll(function() {
    //     if ($(this).scrollTop() > 200) {
    //         $('.header_area').addClass('scrolled');
    //     } else {
    //         $('.header_area').removeClass('scrolled');
    //     }
    // });


    $(".parent-hamburger").click(function (){

        $(".parent-aside").toggleClass('width-aside');
        $(".parent-content").toggleClass('width-content');
        $(".parent-aside ul a svg").toggleClass('width-content-svg');
        $(".parent-aside ul a ").toggleClass('width-content-a');

    });
    $("body").click(function (){
        $(".parent-aside").removeClass('right-0');
    });
    $(".my-bars-gisoo").click(function (e){
        e.stopPropagation();
        $(".parent-aside").toggleClass('right-0');
    });

    $('.lang').click(function (e) {
        e.stopPropagation();
        $('.lang_ul').toggleClass('active_lang');
    });
    $('body').click(function () {
        $('.lang_ul').removeClass('active_lang');
    });



});


