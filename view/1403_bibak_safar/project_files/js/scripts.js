$(document).ready(function () {
    $('.card_hotel').mousemove(function () {

        var perspective = '500px';
        var delta = 20;
        var width = $(this).width();
        var height = $(this).height();
        var midWidth = width / 2;
        var midHeight = height / 2;

        var pos = $(this).offset(),
            cursPosX = e.pageX - pos.left,
            cursPosY = e.pageY - pos.top,
            cursCenterX = midWidth - cursPosX,
            cursCenterY = midHeight - cursPosY;
        $(this).css('transform', 'perspective(50px)');


    });

    $.fn.transformHeroes = function () {

        var perspective = '500px',
            delta = 20,
            width = this.width(),
            height = this.height(),
            midWidth = width / 2,
            midHeight = height / 2;

        var pos = $(this).offset(),
            cursPosX = e.pageX - pos.left,
            cursPosY = e.pageY - pos.top,
            cursCenterX = midWidth - cursPosX,
            cursCenterY = midHeight - cursPosY;

        $(this).css('transform', 'perspective(' + perspective + ') rotateX(' + (cursCenterY / delta) + 'deg) rotateY(' + -(cursCenterX / delta) + 'deg)');

        $(this).removeClass('is-out');
        this.on({
            mousemove: function (e) {

            },
            mouseleave: function () {
                $(this).addClass('is-out');
            }
        });

        return this;
    };


    $('.theme-config').click(function () {

        $(this).toggleClass('active');
    });
    $('.theme-config').bind('click', function (e) {
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });

    $('body').click(function () {

        $('.theme-config').removeClass('active');
    });

    $("#dark_theme").click(function () {

        $('body').addClass('dark_theme');
        $('.logo_top img').attr('src', 'images/logo_dark.png');
        $('.wave_slider_top path').attr('fill', 'rgba(247, 200, 148, 0.60)');
        $('.wave_slider path').attr('fill', 'rgba(40,40,40,1)');
        $('#Path-5-Copy-2').attr('fill', 'rgba(40,40,40,1)');
        $('#Path-5').attr('fill', '#d6ad80');
        $('#Path-5-Copy').attr('fill', '#f7c894');
        $('#path_tour').attr('fill', '#292929');
        $('.app.section').css('background-image', 'url("images/app_bg-2_dark.png")');
        $('#path_tour2').attr('fill', '#f7c894');
        $('#hotel_foriegn').css('background-image', 'url("images/app_bg-2_dark.png")');
        $('.bottom_tour_svg').css('background-image', 'url("images/bottom_tour_svg_dark.png")');


    });

    $("#light_theme").click(function () {

        $('body').removeClass('dark_theme');
        $('.logo_top img').attr('src', 'images/logo_light.png');
        $('.wave_slider_top path').attr('fill', 'rgba(24, 194, 243, 0.60');
        $('.wave_slider path').attr('fill', 'rgba(255,255,255,1)');
        $('.wave_slider path').attr('fill', 'rgba(255,255,255,1)');
        $('#Path-5-Copy-2').attr('fill', '#fff');
        $('#Path-5').attr('fill', '#18c7f4');
        $('#Path-5-Copy').attr('fill', '#1b6fe5');

        $('#path_tour').attr('fill', '#fff');
        $('#path_tour2').attr('fill', '#1b6fe5');
        $('.app.section').css('background-image', 'url("images/app_bg-2.png")');
        $('.bottom_tour_svg').css('background-image', 'url("images/bottom_tour_svg.png")');

    });

    // $(".select2").select2();
    var heiw = $(window).height();

    $('.temp_content').css('min-height', heiw);

    var winh = $(window).height();

    /*if($(window).width() > 767){
        $('.banner').css('height' , winh);
    }*/



    $(window).scroll(function () {

        var sctop = $(this).scrollTop();

        if (sctop > 50) {


            $('.header_area').addClass('fixedmenu');

                $('.logo_top_right').show();



        }
        else {

            $('.header_area').removeClass('fixedmenu');
            $('.logo_top_right').hide();


        }


    });
    $('#number_of_passengers').on('change', function (e) {


        var itemInsu = $(this).val();

        itemInsu++;
        var HtmlCode = "";
        $(".nafaratbime").html('');

        var i = 1;
        while (i < itemInsu) {

            HtmlCode += "<div class='col-lg-2 col-md-3 col-6 col_search search_col nafarat-bime '>" +
                "<div class='form-group'>" +

                "<input placeholder='  تولد مسافر  " + i + "' type='text' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "' class=' form-control'  />" +
                " <i class='fa fa-calendar-alt'></i>" +

                "</div>" +
                "</div>";
            i++;

        }

        $(".nafaratbime ").append(HtmlCode);
    });


    $(".plus-nafar").click(function () {
        var nafar = $(this).siblings(".number-count").attr('data-number');
        if (nafar < 9) {
            var newnafar = ++nafar;
            $(this).siblings(".number-count").html(newnafar);
            $(this).siblings(".number-count").attr('data-number', newnafar);
            var whathidden = $(this).siblings(".number-count").attr('data-value');
            $("." + whathidden).val(newnafar);

        }
        var nafarbozorg = Number($(this).parents(".box-of-count-nafar").find(".bozorg-num .number-count").attr('data-number'));
        var nafarkoodak = Number($(this).parents(".box-of-count-nafar").find(".koodak-num .number-count").attr('data-number'));
        var nafarnozad = Number($(this).parents(".box-of-count-nafar").find(".nozad-num .number-count").attr('data-number'));
        var tedad = nafarbozorg + nafarkoodak + nafarnozad;
        $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(tedad + " مسافر ");
    });
    $(".minus-nafar").click(function () {
        var nafar = $(this).siblings(".number-count").attr('data-number');

        var nmin = $(this).siblings(".number-count").attr('data-min');
        if (nafar > nmin) {
            var newnafar = --nafar;
            $(this).siblings(".number-count").html(newnafar);
            $(this).siblings(".number-count").attr('data-number', newnafar);
            var whathidden = $(this).siblings(".number-count").attr('data-value');
            $("." + whathidden).val(newnafar);
        }
        var nafarbozorg2 = Number($(this).parents(".box-of-count-nafar").find(".bozorg-num .number-count").attr('data-number'));
        var nafarkoodak2 = Number($(this).parents(".box-of-count-nafar").find(".koodak-num .number-count").attr('data-number'));
        var nafarnozad2 = Number($(this).parents(".box-of-count-nafar").find(".nozad-num .number-count").attr('data-number'));
        var tedad2 = nafarbozorg2 + nafarkoodak2 + nafarnozad2;
        $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(tedad2 + " مسافر ");
    });

    $('.down-count-nafar').click(function () {

        $('.cbox-count-nafar').toggle();
        $(this).parents().find('.down-count-nafar').toggleClass('fa-caret-up');
    });


    $('input:radio[name="radio1"]').change(
        function () {
            if (this.checked && this.value == '1') {

                $('.flight_local').css('display', 'flex');
                $('.flight_forign').css('display', 'none');

            }
            else {

                $('.flight_local').css('display', 'none');
                $('.flight_forign').css('display', 'flex');
            }
        });


    $('input:radio[name="radio_gasht"]').change(
        function () {
            if (this.checked && this.value == '1') {

                $('#gasht_div').css('display', 'flex');
                $('#transfer_div').css('display', 'none');

            }
            else {

                $('#gasht_div').css('display', 'none');
                $('#transfer_div').css('display', 'flex');
            }
        });


    $('input:radio[name="radio"]').change(
        function () {
            if (this.checked && this.value == '1') {
                $('.return_input').attr('disabled', '');

            }
            else {
                $('.return_input').removeAttr('disabled', '');
            }
        });

    $('input:radio[name="radio"]').change(
        function () {
            if (this.checked && this.value == '1') {
                $('.return_input_train').attr('disabled', '');

            }
            else {
                $('.return_input_train').removeAttr('disabled', '');
            }
        });

    $('input:radio[name="radio2"]').change(
        function () {
            if (this.checked && this.value == '1') {

                $('#hotel_dakheli').css('display', 'flex');
                $('#hotel_khareji').css('display', 'none');

            }
            else {

                $('#hotel_dakheli').css('display', 'none');
                $('#hotel_khareji').css('display', 'flex');
            }
        });


    $('input:radio[name="radio3"]').change(
        function () {
            if (this.checked && this.value == '1') {

                $('#tour_dakheli').css('display', 'flex');
                $('#tour_khareji').css('display', 'none');

            }
            else {

                $('#tour_dakheli').css('display', 'none');
                $('#tour_khareji').css('display', 'flex');
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

    var owlslider = $('.home-slider');
    owlslider.owlCarousel({
        rtl: true,
        dots: true,
        loop: true,
        margin: 5,
        nav: false,
        animateOut: 'fadeOut',
        autoplay: false,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,

            },
            600: {
                items: 1,

            },
            1000: {
                items: 1,

            }
        }
    });

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

    var owltour = $('.owl_tours');
    owltour.owlCarousel({
        rtl: true,
        dots: false,
        loop: false,
        margin: 5,
        nav: false,
        autoplay: false,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            600: {
                items: 2,
                nav: false
            },
            1000: {
                items: 4,
                nav: false,
                margin: 5
            }
        }
    });
    var owlhotel = $('.owl_hotel');
    owlhotel.owlCarousel({
        rtl: true,
        dots: false,

        loop: true,
        margin: 5,
        nav: false,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,

            },
            600: {
                items: 2,

            },
            1000: {
                items: 4,

                margin: 5
            }
        }
    });

});


function createRoomHotel(roomCount) {
    var HtmlCode = "";
    var i = 1;
    let numberText = "اول";

    while (i <= roomCount) {
        if (i == 1) {
            numberText = "اول";
        } else if (i == 2) {
            numberText = "دوم";
        } else if (i == 3) {
            numberText = "سوم";
        } else if (i == 4) {
            numberText = "چهارم";
        }

        HtmlCode +=
            '<div class="myroom-hotel-item" data-roomNumber="' + i + '">'
            + '<div class="myroom-hotel-item-title">اتاق  ' + numberText + '<span class="close"></span></div>'
            + '<div class="myroom-hotel-item-info">'
            + '<div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">'
            + '<span>تعداد بزرگسال<i>(12 سال به بالا)</i></span>'
            + '<div>'
            + '<i class="addParent plus-nafar hotelroom-minus plus-hotelroom-bozorgsal fas fa-plus"></i>'
            + '<input readonly class="countParent"  min="0" value="1" max="5" type="number" name="adult' + i + '" id="adult' + i + '">'
            + '<i class="minusParent minus-nafar hotelroom-minus minus-hotelroom-bozorgsal fas fa-minus"></i>'
            + '</div>'
            + '</div>'
            + '<div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">'
            + '<span>تعداد کودک<i>(زیر 12 سال)</i></span>'
            + '<div>'
            + '<i class="addChild plus-nafar hotelroom-minus plus-hotelroom-koodak fas fa-plus"></i>'
            + '<input readonly class="countChild" min="0" value="0" max="5" type="number" name="child' + i + '" id="child' + i + '">'
            + '<i class="minusChild minus-nafar hotelroom-minus minus-hotelroom-koodak fas fa-minus"></i>'
            + '</div>'
            + '</div>'
            + '<div class="tarikh-tavalods">'
            + '</div>'
            + '</div>'
            + '</div>';
        i++;
    }
    return HtmlCode;
};

function createBirthdayCalendar(inputNum, roomNumber) {
    var i = 1;
    var HtmlCode = "";
    let numberTextChild = "سلام";
    while (i <= inputNum) {
        if (i == 1) {
            numberTextChild = "اول";
        } else if (i == 2) {
            numberTextChild = "دوم";
        } else if (i == 3) {
            numberTextChild = "سوم";
        } else if (i == 4) {
            numberTextChild = "چهارم";
        }
        HtmlCode += '<div class="tarikh-tavalod-item">'
            + '<span>سن کودک <i>' + numberTextChild + '</i></span>'
            + '<select id="childAge' + roomNumber + i + '" name="childAge' + roomNumber + i + '">'
            + '<option value="1">0 تا 1 سال</option>'
            + '<option value="2">1 تا 2 سال</option>'
            + '<option value="3">2 تا 3 سال</option>'
            + '<option value="4">3 تا 4 سال</option>'
            + '<option value="5">4 تا 5 سال</option>'
            + '<option value="6">5 تا 6 سال</option>'
            + '<option value="7">6 تا 7 سال</option>'
            + '<option value="8">7 تا 8 سال</option>'
            + '<option value="9">8 تا 9 سال</option>'
            + '<option value="10">9 تا 10 سال</option>'
            + '<option value="11">10 تا 11 سال</option>'
            + '<option value="12">11 تا 12 سال</option>'
            + '</select>'
            + '</div>';
        i++;
    }

    return HtmlCode;
};


$('body').on('click', '.myroom-hotel-item .close', function () {
    let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
    $(this).parents(".myroom-hotel-item").remove();
    let countRoom = parseInt($('#countRoom').val()) - 1;
    $("#countRoom option:selected").prop("selected", false);
    $("#countRoom option[value=" + countRoom + "]").prop("selected", true);
    let numberRoom = 1;
    let numberText = "اول";
    $('.myroom-hotel-item').each(function () {
        $(this).data("roomnumber", numberRoom);
        if (numberRoom == 1) {
            numberText = "اول";
        } else if (numberRoom == 2) {
            numberText = "دوم";
        } else if (numberRoom == 3) {
            numberText = "سوم";
        } else if (numberRoom == 4) {
            numberText = "چهارم";
        }
        $(this).find('.myroom-hotel-item-title').html(' اتاق ' + numberText + '<span class="close"></span>');
        $(this).find(".myroom-hotel-item-info").find("input[name^='adult']").attr("name", "adult" + numberRoom);
        $(this).find(".myroom-hotel-item-info").find("input[name^='adult']").attr("id", "adult" + numberRoom);
        $(this).find(".myroom-hotel-item-info").find("input[name^='child']").attr("name", "child" + numberRoom);
        $(this).find(".myroom-hotel-item-info").find("input[name^='child']").attr("id", "child" + numberRoom);
        let numberChild = 1;
        let inputNameSelectChildAge = $(this).find(".tarikh-tavalods .tarikh-tavalod-item");
        inputNameSelectChildAge.each(function () {
            $(this).find("select[name^='childAge']").attr("name", "childAge" + numberRoom + numberChild);
            $(this).find("select[name^='childAge']").attr("id", "childAge" + numberRoom + numberChild);
            numberChild++;
        });
        numberRoom++;
    });
});


$('#countRoom').on('change', function (e) {


    var roomCount = $("#countRoom").val();
    createRoomHotel(roomCount);
    $(".myroom-hotel").find(".myroom-hotel-item").remove();
    var code = createRoomHotel(roomCount);
    $(".myroom-hotel").append(code);


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

$('body').on('click', 'i.addParent', function () {

    var inputNum = $(this).siblings(".countParent").val();
    inputNum++;
    if (inputNum < 7) {
        $(this).siblings(".countParent").val(inputNum);
    }
});
$('body').on('click', 'i.minusParent', function () {
    var inputNum = $(this).siblings(".countParent").val();
    if (inputNum != 0) {
        inputNum--;
        $(this).siblings(".countParent").val(inputNum);
    } else {
        $(this).siblings(".countParent").val('0');
    }
});

$('body').on('click', 'i.addChild', function () {
    var inputNum = $(this).siblings(".countChild").val();
    inputNum++;
    if (inputNum < 5) {
        $(this).siblings(".countChild").val(inputNum);

        $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();

        let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");

        var htmlBox = createBirthdayCalendar(inputNum, roomNumber);

        $(this).parents(".myroom-hotel-item-info").find(".tarikh-tavalods").html(htmlBox);
    }
});
$('body').on('click', 'i.minusChild', function () {
    var inputNum = $(this).siblings(".countChild").val();
    $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();

    if (inputNum != 0) {
        inputNum--;
        $(this).siblings(".countChild").val(inputNum);

        let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");

        var htmlBox = createBirthdayCalendar(inputNum, roomNumber);

        $(this).parents(".myroom-hotel-item-info").find(".tarikh-tavalods").html(htmlBox);
    } else {
        $(this).siblings(".countChild").val('0');
    }
});


$(window).bind("load resize scroll", function (e) {
    var y = $(window).scrollTop();

    $(".parallax-bg-img").filter(function () {
        return $(this).offset().top < (y + $(window).height()) &&
            $(this).offset().top + $(this).height() > y;
    }).css('background-position', 'right ' + parseInt(y / 6 - 440) + 'px');
});

$(window).bind("load resize scroll", function (e) {
    var y = $(window).scrollTop();

    $(".circle_parallex").filter(function () {
        return $(this).offset().top < (y + $(window).height()) &&
            $(this).offset().top + $(this).height() > y;
    }).css('bottom', parseInt(y / 6 - 405) + 'px');
});




//iframe register
$('.stop-propagation').bind('click', function (e) {
    e.stopPropagation();
});
$('.top__user_menu').bind('click', function(e){
    //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
    e.stopPropagation();

});

$('.main-navigation__button2').click(function () {
    $('.main-navigation__sub-menu2').fadeToggle(function () {
        $('button-chevron-2').toggle();
    });
    $('.button-chevron-2').toggleClass('rotate');
});
$('body').click(function () {

    $('.main-navigation__sub-menu').hide();
    $('.button-chevron').removeClass('rotate');

    $('.cbox-count-nafar').hide();
    $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
});
$(document).ready(function () {
    $('.top__user_menu').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });



    $('body').click(function () {

        $('.main-navigation__sub-menu2').hide();

        $('.button-chevron-2').removeClass('rotate');

        $('.cbox-count-nafar').hide();
        $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
    });

    $('.main-navigation__button').click(function () {

        $('.main-navigation__sub-menu').fadeToggle();
        $(this).find('.button-chevron').toggleClass('rotate');
        $('.main-navigation__sub-menu2').hide();
        $('.button-chevron-2').removeClass('rotate');
    });
    var iframe = $('#loginedname').contents();
    iframe.find('span').on('click', function() {
        $('.main-navigation__item').find('.main-navigation__sub-menu2').toggle();
        $('.button-chevron-2').toggleClass('rotate');

    });

    $('.main-navigation__button2').click(function () {
        $('.button-chevron-2').toggleClass('rotate');

    });

    function formatState (state) {
        if (!state.id) {
            return state.text;
        }
        var baseUrl = "/user/pages/images/flags";
        var $state = $(
            '<span class="city_start"><i class="fa fa-map-marker-alt"></i>' + state.text + '</span>'
        );
        return $state;
    };

    // $(".select2_in").select2({
    //     templateResult: formatState
    // });


});

$('.stop-propagation').bind('click', function (e) {
    e.stopPropagation();
});
$('.hotel_passenger_picker').bind('click', function(e){
    e.stopPropagation();
});
// $('.hotel_passenger_picker ul').click(function () {
//     $('.myhotels-rooms').toggleClass('active_p');
// });

$('body').on('click','.btn_add_room', function (e) {
    $('.myroom-hotel-item-title .close').show();


    let roomCount = parseInt($('.myroom-hotel-item').length) ;

    let numberAdult = parseInt($('.number_adult').text() );
    let number_room_po = parseInt($('.number_room_po').text() );

    $('.number_adult').text(numberAdult + 1);
    $('.number_room_po').text(number_room_po + 1);

    let code = createRoomHotel(roomCount);
    $(".hotel_select_room").append(code);
    if(roomCount ==3){
        $(this).hide();
    }



});




