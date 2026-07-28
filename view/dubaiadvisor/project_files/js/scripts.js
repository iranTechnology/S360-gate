function findType(element) {
    let char = new RegExp("[\u0600-\u06FF]");
    if (char.test(element.value) === true) {
        element.style.direction =  "rtl"
    }
    else {
        element.style.direction =  "ltr"
    }
}
$("#rdo-3").click(function () {
    $('#regds_dept_date_Portal').prop('disabled', true);
})
$("#rdo-4").click(function () {
    $('#regds_dept_date_Portal').prop('disabled', false);
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

$('#owl-carousel3').owlCarousel({
    loop: true,
    margin: 15,
    dots: true,
    nav: false,
    rtl: true,
    autoplay: true,
    autoplayTimeout: 4000,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 4
        }
    }
})
// ----- Clock rendering logic
function updateTime() {
    let hour = data.dt.getHours();
    let minute = data.dt.getMinutes();
    let second = data.dt.getSeconds();
    data.dt.setSeconds(second + 1);
    data.hours.val = hour == 0 ? 360 : hour * 6 * 5 + minute / 60 * 30;
    data.minutes.val = minute == 0 ? 360 : minute * 6;
    data.seconds.val = second == 0 ? 360 : second * 6;
    data.seconds.el.classList.add('moving');
    if (second == 0) {
        data.minutes.el.classList.add('moving');
    }
    if (second == 0 && minute == 0) {
        data.hours.el.classList.add('moving');
    }
    data.hours.el.style.transform = `translate(-50%, -75%) rotate(${data.hours.val}deg)`;
    data.minutes.el.style.transform = `translate(-50%, -75%) rotate(${data.minutes.val}deg)`;
    data.seconds.el.style.transform = `translate(-50%, -75%) rotate(${data.seconds.val}deg)`;
}
// ----- Clock execution
$(document).ready(function () {
    if ($('.today-info-container-time').length) {
        setInterval(() => {
            updateTime();
        }, data.renderTime);
        updateTime();


// ----- Events area
    data.seconds.el.addEventListener('transitionend', () => {
        data.hours.el.classList.remove('moving');
        data.minutes.el.classList.remove('moving');
        data.seconds.el.classList.remove('moving');
        if (data.hours.val == 360) {
            data.hours.val = 0;
            data.hours.el.style.transform = `translate(-50%, -75%) rotate(0deg)`;
        }
        if (data.minutes.val == 360) {
            data.minutes.val = 0;
            data.minutes.el.style.transform = `translate(-50%, -75%) rotate(0deg)`;
        }
        if (data.seconds.val == 360) {
            data.seconds.val = 0;
            data.seconds.el.style.transform = `translate(-50%, -75%) rotate(0deg)`;
        }
    });

    }
})

$(document).ready(function () {
    $('.switch-label-off').click();
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

    $(".select2").select2();
    var heiw = $(window).height();

    $('.banner_main').css('min-height' , heiw);

    $('.temp_content').css('min-height' , heiw);

    var winh = $(window).height();

    if($(window).width() > 767){
        $('.banner').css('height' , winh);
    }

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


    var header = $('.header_area.fixedmenu'),
        headerHeight = header.height(),
        treshold = 0,
        lastScroll = 0;

    $(document).on('scroll', function (evt) {
        var newScroll = $(document).scrollTop(),
            diff = newScroll-lastScroll - 15;

        // normalize treshold range
        treshold = (treshold+diff>headerHeight) ? headerHeight : treshold+diff;
        treshold = (treshold < 0) ? 0 : treshold + 15;

        header.css('top', (-treshold)+'px');

        lastScroll = newScroll;
    });

    /*$(window).scroll(function () {



        var sctop = $(this).scrollTop();

        if(sctop > $('.header_area').height()){


            $('.header_area').addClass('fixedmenu');


        }
        else{

            $('.header_area').removeClass('fixedmenu');


        }


    });*/
    $('#number_of_passengers').on('change', function (e) {


        var itemInsu = $(this).val();

        itemInsu++;
        var HtmlCode = "";
        $(".nafaratbime").html('');

        var i = 1;
        while (i < itemInsu) {

            HtmlCode += "<div class='col-lg-2 col-md-3 col-6 col_search search_col nafarat-bime '>" +
                "<div class='form-group'>"+

                "<input placeholder='تاریخ تولد مسافر " + i + "' autocomplete='off' type='text' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "' class='shamsiBirthdayCalendar form-control' />" +
               " <i class='fa fa-calendar-alt'></i>"+

                "</div>"+
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
        if(nafarnozad == 0 && nafarkoodak == 0){
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text( nafarbozorg + ' Adult');
        }else{
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text( nafarbozorg + ' Adult');

        }
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
        if(nafarnozad2 == 0 && nafarkoodak2 == 0){
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text( nafarbozorg2 + ' Adult , ' + nafarkoodak2 + ' Child , ' + nafarnozad2 + 'Baby');
        }else{
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text( nafarbozorg2 + ' Adult , ' + nafarkoodak2 + ' Child , ' + nafarnozad2 + 'Baby');
        }
    });

    $('.down-count-nafar').click(function () {

        $('.cbox-count-nafar').toggle();
        $(this).parents().find('.down-count-nafar').toggleClass('fa-caret-up');
    });

    $('.hotel_passenger_picker ul').click(function () {
        $('.myhotels-rooms').toggleClass('active_p');
    });
    $('.myhotels-rooms').on('click', '.close_room', function () {

        $(this).parent().removeClass('active_p');


    });
    $('body').on('click','.btn_add_room', function (e) {
        $('.myroom-hotel-item-title .close').show();

        let roomCount = parseInt($('.myroom-hotel-item').length) ;

        let numberAdult = parseInt($('.number_adult').text() );
        let number_room = parseInt($('.number_room').text() );
        $('.number_adult').text(numberAdult + 1)
        $('.number_room').text(number_room + 1)


        let code = createRoomHotel(roomCount);
        $(".hotel_select_room").append(code);
        if(roomCount ==3){
            $(this).hide();
        }



    });

    $('body').on('click', '.myroom-hotel-item .close', function () {

        let babyCountThis =$(this).parents('.myroom-hotel-item').find('.countChild').val();
        let number_baby = $('.number_baby').text();
        $('.number_baby').text(number_baby - babyCountThis );

        let AdultCountThis =$(this).parents('.myroom-hotel-item').find('.countParent').val();
        let number_adult = $('.number_adult').text();
        $('.number_adult').text(number_adult - AdultCountThis );

        $('.btn_add_room').show();

        let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
        let roomCount = $(".myroom-hotel-item").length;

        let number_room = parseInt($('.number_room').text());
        $('.number_room').text(number_room - 1)


        $(this).parents(".myroom-hotel-item").remove();
        let countRoom = parseInt($('#countRoom').val()) - 1;
        $("#countRoom option:selected").prop("selected", false);
        $("#countRoom option[value=" + countRoom + "]").prop("selected", true);
        let numberRoom = 1;
        let numberText = "First";
        $('.myroom-hotel-item').each(function () {
            $(this).data("roomnumber", numberRoom);
            if (numberRoom == 1) {
                numberText = "First";
            } else if (numberRoom == 2) {
                numberText = "Second";
            } else if (numberRoom == 3) {
                numberText = "Third";
            } else if (numberRoom == 4) {
                numberText = "Fourth";
            }
            $(this).find('.myroom-hotel-item-title').html('<span class="close"><i class="fa fa-trash-alt  mr-1"></i></span> room ' + numberText );
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
        if(roomCount == 2){
            $('.close').hide();
        }


    });






    $(document).ready(function () {

        $('.box-of-count-nafar-boxes').click(function () {

            $('.cbox-count-nafar').toggle();
            $(this).parents().find('.down-count-nafar').toggleClass('fa-caret-up');
        });


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

        if (inputNum < 7) {
            inputNum++;
            let numberAdult =parseInt( $('.number_adult').text());
            let resultNumber = numberAdult + 1
            $(this).siblings(".countParent").val(inputNum);
            $('.number_adult').html('');
            $('.number_adult').append(resultNumber);
        }
    });

    $('body').on('click', 'i.minusParent', function () {

        let data_roomnumber = $(this).parents('.myroom-hotel-item').attr('data-roomnumber');
        let ThiscountParent =  $(this).parents('.myroom-hotel-item').find('.countParent').val();


        var inputNum = $(this).siblings(".countParent").val();

        if (inputNum > 1) {
            inputNum--;
            let numberAdult =parseInt( $('.number_adult').text());
            let resultNumber = numberAdult - 1
            $(this).siblings(".countParent").val(inputNum);
            $('.number_adult').html('');
            $('.number_adult').append(resultNumber);
        }



    });

    $('body').on('click', 'i.addChild', function () {
        var inputNum = $(this).siblings(".countChild").val();
        inputNum++;
        if (inputNum < 5) {
            let numberBaby =parseInt( $('.number_baby').text());
            let numberBabyThis =parseInt($(this).parents().find('.countChild').val()) + 1;

            let resultNumber = numberBaby + 1

            $(this).siblings(".countChild").val(inputNum);
            $('.number_baby').html('');
            $('.number_baby').append(resultNumber);

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
            let numberBaby =parseInt( $('.number_baby').text());
            let numberBabyThis =parseInt($(this).parents().find('.countChild').val()) + 1;

            let resultNumber = numberBaby - 1

            inputNum--;
            $(this).siblings(".countChild").val(inputNum);
            $('.number_baby').html('');
            $('.number_baby').append(resultNumber);

            let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");

            var htmlBox = createBirthdayCalendar(inputNum, roomNumber);

            $(this).parents(".myroom-hotel-item-info").find(".tarikh-tavalods").html(htmlBox);

        } else {
            $(this).siblings(".countChild").val('0');

        }
    });


    $('input:radio[name="select-rb2"]').change(
        function(){
            if (this.checked && this.value == '1') {
                $('.return_input').attr('disabled', '');


            }
            else {
                $('.return_input').removeAttr('disabled', '');
            }
        });
    $('input:radio[name="DOM_TripMode2"]').change(
        function(){
            if (this.checked && this.value == '1') {
                $('.return_input2').removeAttr('disabled', '');

            }
            else {
                $('.return_input2').attr('disabled', '');
            }
        });

 $('input:radio[name="DOM_TripMode6"]').change(
        function(){
            if (this.checked && this.value == '1') {
                $('.return_input_train').removeAttr('disabled', '');

            }
            else {
                $('.return_input_train').attr('disabled', '');
            }
        });

    $('input:radio[name="DOM_TripMode4"]').change(
        function(){
            if (this.checked && this.value == '1') {


                $('#hotel_dakheli').css('display','flex');
                $('#hotel_khareji').hide();


            }
            else {
                $('#hotel_dakheli').hide();
                $('#hotel_khareji').css('display','flex');
            }
        });
    $('input:radio[name="DOM_TripMode8"]').change(
        function(){
            if (this.checked && this.value == '1') {


                $('#flight_khareji').css('display','flex');
                $('#flight_dakheli').hide();


            }
            else {
                $('#flight_khareji').hide();
                $('#flight_dakheli').css('display','flex');
            }
        });
    $('input:radio[name="DOM_TripMode7"]').change(
        function(){
            if (this.checked && this.value == '1') {


                $('#transfer_div').css('display','flex');
                $('#gasht_div').hide();


            }
            else {
                $('#transfer_div').hide();
                $('#gasht_div').css('display','flex');
            }
        });

    $('input:radio[name="DOM_TripMode5"]').change(
        function(){
            if (this.checked && this.value == '1') {


                $('#tour_khareji').css('display','flex');
                $('#tour_dakheli').hide();


            }
            else {
                $('#tour_khareji').hide();
                $('#tour_dakheli').css('display','flex');
            }
        });

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });

    $('.top__user_menu').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });

    $('.box-of-count-nafar').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
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

    var owlair = $('#owl-air');
    owlair.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 5,
        nav:false,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplaySpeed:1000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 3,

            },
            600: {
                items: 5,

            },
            1000: {
                items: 7,

                margin: 5
            }
        }
    });
    var owl_stour = $('.owl_tour_local');
    owl_stour.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 1,
        nav:true,
        autoplaySpeed:1000,
        autoplay: false,
        autoplayTimeout: 4000,
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


            }
        }
    });
    var owl_one_tour = $('.owl_tour_one_section');
    owl_one_tour.owlCarousel({
        dots:false,
        loop:true,
        nav:true,
        margin:20,
        autoplaySpeed:1000,
        autoplay: true,
        autoplayTimeout: 4000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            }
        }
    });
    var owl_stour = $('.owl_speciol_tour');
    owl_stour.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 1,
        nav:true,
        autoplaySpeed:1000,
        autoplay: true,
        autoplayTimeout: 4000,
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
                items: 3,
                margin:0,

            }
        }
    });
    var owl_tabliq = $('.owl_tabliq');
    owl_tabliq.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 5,
        animateOut: 'fadeOut',
        nav:false,
        autoplaySpeed:1000,
        autoplay: true,
        autoplayTimeout: 4000,
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
                items: 2,


            }
        }
    });
    var owltour = $('.owl-tour');
    owltour.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 5,
        nav:true,
        autoplaySpeed:1000,
        autoplay: true,
        autoplayTimeout: 4000,
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
                items: 3,
                margin:0,

            }
        }
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });
    var owlhotel = $('.owl-hotel');
    owlhotel.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 5,
        autoplaySpeed:1000,
        nav:true,
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
                margin:0,

            }
        }
    });
    var owlair = $('#owl-air');
    owlair.owlCarousel({
        rtl: true,
        dots:false,
        loop: true,
        margin: 0,
        nav:false,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 3,
                margin: 5
            },
            600: {
                items: 5,

            },
            1000: {
                items: 7,


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
        $('#scroll-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
        });
    });


});

/*
$('#tours_m').click(function () {

    $([document.documentElement, document.body]).animate({
        scrollTop: $(".searchs_box").offset().top - 150
    }, 500);

    $('#myTab .nav-link').removeClass('active');
    $('#tour-tab').addClass('active');

    $('.tab-pane').removeClass('active show');
    $('#tour').addClass('active show');

});

$('#hotels_m').click(function () {

    $([document.documentElement, document.body]).animate({
        scrollTop: $(".searchs_box").offset().top - 150
    }, 500);

    $('#myTab .nav-link').removeClass('active');
    $('#hotel-tab').addClass('active');

    $('.tab-pane').removeClass('active show');
    $('#hotel').addClass('active show');

});
$('#cars_m').click(function () {

    $([document.documentElement, document.body]).animate({
        scrollTop: $(".searchs_box").offset().top - 150
    }, 500);

    $('#myTab .nav-link').removeClass('active');
    $('#car-tab').addClass('active');

    $('.tab-pane').removeClass('active show');
    $('#car').addClass('active show');

});

$('#fun_m').click(function () {

    $([document.documentElement, document.body]).animate({
        scrollTop: $(".searchs_box").offset().top - 150
    }, 500);

    $('#myTab .nav-link').removeClass('active');
    $('#fun-tab').addClass('active');

    $('.tab-pane').removeClass('active show');
    $('#fun').addClass('active show');

});*/


$('#flightda-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/airline.jpg")')});
$('#hotel-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/hotel.jpg")')});
$('#tour-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/tour.jpg")')});
$('#train-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/train.jpg")')});
$('#bus-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/bus.jpg")')});
$('#fun-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/tafrih.jpg")')});
$('#car-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/car.jpg")')});
$('#visa-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/visa.jpg")')});
$('#gasht-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/gasht.jpg")')});
$('#insurance-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/insurance.jpg")')});

$('a[data-target="#flightda-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/airline.jpg")')});
$('a[data-target="#hotel-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/hotel.jpg")')});
$('a[data-target="#tour-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/tour.jpg")')});
$('a[data-target="#train-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/train.jpg")')});
$('a[data-target="#bus-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/bus.jpg")')});
$('a[data-target="#fun-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/tafrih.jpg")')});
$('a[data-target="#car-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/car.jpg")')});
$('a[data-target="#visa-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/visa.jpg")')});
$('a[data-target="#gasht-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/gasht.jpg")')});
$('a[data-target="#insurance-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/insurance.jpg")')});


$('.lang ').bind('click', function(e){
    //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
    e.stopPropagation();
});

$('body').click(function () {
    $('.lang_ul').removeClass('active_lang');
});

$('.lang span').click(function () {
    $('.lang_ul').toggleClass('active_lang');
});


$('.lang ').bind('click', function(e){
    //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
    e.stopPropagation();

});


$(function () {
    $('[data-toggle="tooltip"]').tooltip()
});

$('.top__user_menu').bind('click', function(e){
    //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
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
    iframe.find('span').on('click', function() {
        $('.main-navigation__item').find('.main-navigation__sub-menu2').toggle();
        $('.button-chevron-2').toggleClass('rotate');

    });

    $('.main-navigation__button2').click(function () {


        $('.main-navigation__sub-menu2').fadeToggle(function () {
            $('button-chevron-2').toggle();
        });
        $('.button-chevron-2').toggleClass('rotate');

    });

    $(".track-code").click(function() {
        $('html, body').animate({
            scrollTop: $(".footer_top").offset().top
        }, 2000);
    });


    $(".hotel-scroll").click(function() {
        scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });


});

function createRoomHotel(roomCount) {

    var HtmlCode = "";
    let i = $('.myroom-hotel-item').length +1;
    let numberText = "اول";
    let valuefirst;


    if (i == 1) {
        numberText = "First";
        valuefirst = "2"
    } else if (i == 2) {
        numberText = "Second";
        valuefirst = "1";

    } else if (i == 3) {
        numberText = "Third";
        valuefirst = "1";

    } else if (i == 4) {
        numberText = "Fourth";
        valuefirst = "1";

    }


    if(i < 5){
        HtmlCode +=
            `<div class="myroom-hotel-item" data-roomNumber="${i}">
             <div class="myroom-hotel-item-title">
             <span class="close">
             <i class="fa fa-trash-alt mr-1"></i>
            </span>
            room  ${numberText}
            </div><div class="myroom-hotel-item-info">
        <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
       <h6>Adult</h6>
           (Older than 12 years)
        <div><i class="addParent plus-nafar hotelroom-minus plus-hotelroom-bozorgsal fas fa-plus"></i>
        <input readonly class="countParent"  min="0" value="${valuefirst}" max="5" type="number" name="adult${i}" id="adult${i}">
        <i class="minusParent minus-nafar hotelroom-minus minus-hotelroom-bozorgsal fas fa-minus"></i>
        </div>
        </div>
        <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
       <h6>Child</h6>
             (Less than 12 years)
        <div>
        <i class="addChild plus-nafar hotelroom-minus plus-hotelroom-koodak fas fa-plus">
        
        </i><input readonly class="countChild" min="0" value="0" max="5" type="number" name="child${i}" id="child${i}">
        <i class="minusChild minus-nafar hotelroom-minus minus-hotelroom-koodak fas fa-minus"></i>
        </div>
        </div><div class="tarikh-tavalods"></div>
        </div>
        </div>`;
    }

    return HtmlCode;
}








