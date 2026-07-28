$('.OWL_slider_banner').owlCarousel({
    loop:true,
    rtl:true,
    navText: ["<i class='fas fa-chevron-right'></i>","<i class='fas fa-chevron-left'></i>"],
    margin:0,
    nav:true,
    dots:false,
    autoplay:true,
    autoplayTimeout:3500,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
});
$("#scroll-top").hide();
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-top').fadeIn();
        } else {
            $('#scroll-top').fadeOut();
        }
    });
    $('#scroll-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 800);
    });
});

$('.box-of-count-passenger-boxes-js,.div_btn').on('click', function(e) {
    $('.cbox-count-passenger-js').toggle()
    $(this).parents().find('.down-count-passenger').toggleClass('fa-caret-up')
    e.stopPropagation()
})
$('.cbox-count-passenger-js').click((e) => {
    e.stopPropagation()
})
$('body').click(function () {
    $('.cbox-count-passenger-js').hide()
    $('.main-navigation__sub-menu').hide();
    $('.button-chevron').removeClass('rotate');

    $('.cbox-count-nafar').hide();
    $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
});
$('.btn-close').click(function () {
    $('.cbox-count-nafar').hide();
    $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');

})