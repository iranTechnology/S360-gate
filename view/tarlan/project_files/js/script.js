$(document).ready(function () {

    $(".fa-times").click(function (){
        $(".alertC").addClass("alertCD")
    })


    $(function() {
        $(".action-button > a").on('mouseenter', function(e) {
            x = e.pageX - $(this).offset().left;
            y = e.pageY - $(this).offset().top;
            $(this).find("span").css({
                top: y,
                left: x
            });
        });
        $(".action-button > a").on('mouseout', function(e) {
            x = e.pageX - $(this).offset().left;
            y = e.pageY - $(this).offset().top;
            $(this).find("span").css({
                top: y,
                left: x
            });
        });
    });
    // $(".select2").select2();
    $('.switch-label-off').click();

    $(document).ready(function () {
        $('body').on('click', '.more_close_matn', function () {
            $(this).parents('.card_matn_').removeClass('show_more');
            $(this).parents('.card_matn_').find('.more_read_matn').show();
            $(this).remove();
        });
        $('.more_read_matn').click(function () {
            $(this).parents('.card_matn_').addClass('show_more');
            $(this).hide();
            $(this).parent('.content_card_matn').append('<a class="more_close_matn">بستن</a>');
        });
        $('.more_read').click(function () {
            $(this).parents('.card_').addClass('show_more');
            $(this).hide();
            $(this).parent('.content_card').append('<a class="more_close">بستن</a>');
        });
        $('body').on('click', '.more_close', function () {
            $(this).parents('.card_').removeClass('show_more');
            $(this).parents('.content_card').find('.more_read').show();
            $(this).remove();
        });
        $('.more_matn').click(function () {
            $(this).parent('.c-card-content').toggleClass('selected');
            $(this).toggleClass('select_btn');

            if ($(this).parent('.c-card-content').hasClass('selected')) {
                $(this).text('بستن')
            } else {
                $(this).text('بیشتر بخوانید')
            }
        });
        setTimeout(function () {
            if ($('.more_matn').parent().find('.typo__context').height() < 340) {
                $('.more_matn').hide();
                $('.c-card-content .typo__context').addClass('hide_before');
            } else {
                $('.more_matn').show();
            }
        }, 2000);
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
        $(document).ready(function () {
            $('#package_room ul').click(function () {
                $('.mypackege-rooms').toggleClass('active_p');
            });
            $('.hotel_passenger_picker ul').click(function () {
                $('.myhotels-rooms').toggleClass('active_p');
            });
            $('#package_room').click(function (event) {
                $('html').one('click', function () {
                    $('.myhotels-rooms').removeClass('active_p');
                });
                event.stopPropagation();
            });
            var wwidth = $(window).width();
            if (wwidth < 575) {
                var wheight = $(window).height();
                var sheight = $('.search').height();
                var height11 = sheight + 200;
                $(".js-height-full").height(height11);
            } else {
                var wheight = $(window).height();
                var sheight = $('.search').height();
                var height1 = wheight - sheight;
                var height = height1 + sheight;
                $(".js-height-full").height(height);
            }
        });


        $('.top__user_menu').bind('click', function (e) {
            e.stopPropagation();
        });


        $('.main-navigation__button').click(function () {

            $('.main-navigation__sub-menu').toggle();
            $('.button-chevron').toggleClass('rotate');

        });

        $('body').click(function () {

            $('.main-navigation__sub-menu').hide();
            $('.button-chevron').removeClass('rotate');

            $('.cbox-count-nafar').hide();
            $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
        });
        $('.btn-close').click(function () {
            $('.cbox-count-nafar').hide();
            $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');

        })



    });
    $('.lang ').bind('click', function (e) {
        e.stopPropagation();
    });
    $('body').click(function () {
        $('.lang_ul').removeClass('active_lang');
    });
    $('.lang span').click(function () {
        $('.lang_ul').toggleClass('active_lang');
    });
    $('.top__user_menu').bind('click', function (e) {
        e.stopPropagation();
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });
    $('.box-of-count-nafar').bind('click', function (e) {
        e.stopPropagation();
    });
    $('.main-navigation__button').click(function () {

        $('.main-navigation__sub-menu').toggle();
        $('.button-chevron').toggleClass('rotate');

    });
    $('body').click(function () {

        $('.main-navigation__sub-menu').hide();
        $('.button-chevron').removeClass('rotate');

        $('.cbox-count-nafar').hide();
        $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
    });
    $(document).ready(function () {
        $('.top__user_menu').bind('click', function (e) {
            e.stopPropagation();
        });



        $('body').click(function () {

            $('.main-navigation__sub-menu2').hide();

            $('.button-chevron-2').removeClass('rotate');

            $('.cbox-count-nafar').hide();
            $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
        });

        $('.menu-login').bind('click', function (e) {
            //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
            e.stopPropagation();

        });
        $('.main-navigation__button').click(function () {

            $('.main-navigation__sub-menu').fadeToggle();
            $(this).find('.button-chevron').toggleClass('rotate');
            $('.main-navigation__sub-menu2').hide();
            $('.button-chevron-2').removeClass('rotate');
        });
        var iframe = $('#loginedname').contents();
        iframe.find('span').on('click', function () {
            $('.main-navigation__item').find('.main-navigation__sub-menu2').toggle();
            $('.button-chevron-2').toggleClass('rotate');

        });

        $('.main-navigation__button2').click(function () {


            $('.main-navigation__sub-menu2').fadeToggle(function () {
                $('button-chevron-2').toggle();
            });
            $('.button-chevron-2').toggleClass('rotate');

        });

        function formatState(state) {
            if (!state.id) {
                return state.text;
            }
            var baseUrl = "/user/pages/images/flags";
            var $state = $(
                '<span class="city_start"><i class="fa fa-map-marker-alt"></i>' + state.text + '</span>'
            );
            return $state;
        };



    });




});