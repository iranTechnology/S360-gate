$('.owl-banner').owlCarousel({
    rtl:true,
    loop:true,
    animateOut: 'slideOutDown',
    margin:0,
    nav:false,
    dots: false,
    autoplay: true,
    stagePadding:0,
    smartSpeed:450,
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
$('.owl-hotels').owlCarousel({
    rtl:true,
    loop:true,
    margin:30,
    nav:false,
    dots: true,
    autoplay: false,
    autoplayTimeout: 5000,
    autoplaySpeed:7000,
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



// let counter = document.querySelectorAll(".counter-2")
// let arr = Array.from(counter)
//
// arr.map((item)=>{
//     let count = 0
//
//     function CounterUp(){
//         count++
//         item.innerHTML = count
//         if(count == item.dataset.number){
//             clearInterval(stop);
//         }
//     }
//     let stop = setInterval(
//         function(){
//             CounterUp();
//         },500/item.dataset.speed
//     );
// })



$(document).ready(function() {

    $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
            $('#navbar').addClass('scrolled');
        } else {
            $('#navbar').removeClass('scrolled');
        }
    });
});








// multiTrack

$('input:radio[name="DOM_TripMode8"]').change(
    function(){
        if (this.checked && this.value == '1') {
            $('#flight_khareji').css('display','flex');
            $('#flight_dakheli').hide();
            $('#flight_multiTrack').hide();
        }else {
            $('#flight_dakheli').css('display','flex');
            $('#flight_khareji').hide();
            $('#flight_multiTrack').hide();
        }
    });

$(".click_flight_multiTrack").click(function () {
    $('#flight_multiTrack').css('display','flex');
    $('#flight_dakheli').hide();
    $('#flight_khareji').hide();
})
$(".click_flight_oneWay").click(function () {
    $('#flight_khareji').css('display','flex');
    $('#flight_dakheli').hide();
    $('#flight_multiTrack').hide();
})
$(".click_flight_twoWay").click(function () {
    $('#flight_khareji').css('display','flex');
    $('#flight_dakheli').hide();
    $('#flight_multiTrack').hide();
})

// multiTrack
$('.owl-new-news').owlCarousel({
    rtl:true,
    loop:true,
    navText: ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"],
    margin:10,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplaySpeed:1000,
    nav:true,
    dots:false,
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
})
$('.owl-new-suitable').owlCarousel({
    rtl:true,
    loop:true,
    navText: ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"],
    margin:10,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplaySpeed:1000,
    nav:true,
    dots:false,
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
})



// ----- Clock rendering logic

// ----- Clock execution
$(document).ready(function () {
    $('.box-of-count-nafar-boxes').click(function () {
        $(".down-up").toggleClass('transform-me');
    })





    $('#hotel_local_room ul').click(function () {
        $('.hotel_local-rooms').toggleClass('active_p');
    });
    $('#hotel_local_room').click(function (event) {
        $('html').one('click', function () {
            $('.myhotels-rooms').removeClass('active_p');
        });
        event.stopPropagation();
    });

    $('.hotel_local-rooms').on('click', '.btn_add_room_hotel_local', function (e) {
        $('.hotel_local-rooms .close').show();
        $(this).parents(".hotel_local-rooms").find(".close").removeClass("d-none");
        let roomCount = parseInt($('.myroom-hotel_local-item').length);
        let numberAdult = parseInt($('.number_adult_hotel_local').text());
        let number_room = parseInt($('.number_room_hotel_local').text());
        $('.number_adult_hotel_local').text(numberAdult + 1);
        $('.number_room_hotel_local').text(number_room + 1);
        // let code = createRoomHotelLocal(roomCount);
        // $(".hotel_local_select_room").append(code);
        if (roomCount == 3) {
            $(this).hide();
        }
    });
    $('.hotel_local-rooms').on('click', '.myroom-hotel_local-item .close', function () {
        let babyCountThis = $(this).parents('.myroom-hotel_local-item').find('.countChild_hotel_local').val();
        let number_baby = $('.number_baby_hotel_local').text();
        $('.number_baby_hotel_local').text(number_baby - babyCountThis);
        let AdultCountThis = $(this).parents('.myroom-hotel_local-item').find('.countParent_hotel_local').val();
        let number_adult = $('.number_adult_hotel_local').text();
        $('.number_adult_hotel_local').text(number_adult - AdultCountThis);
        $('.btn_add_room_hotel_local').show();
        let roomNumber = $(this).parents(".myroom-hotel_local-item").data("roomnumber");
        let roomCount = $(".myroom-hotel_local-item").length;
        let number_room = parseInt($('.number_room_hotel_local').text());
        $('.number_room_hotel_local').text(number_room - 1);
        $(this).parents(".myroom-hotel_local-item").remove();
        let countRoom = parseInt($('#countRoom').val()) - 1;
        $("#countRoom option:selected").prop("selected", false);
        $("#countRoom option[value=" + countRoom + "]").prop("selected", true);
        let numberRoom = 1;
        let numberText = " room first";
        $('.myroom-hotel_local-item').each(function () {
            $(this).data("roomnumber", numberRoom);
            if (numberRoom == 1) {
                numberText = "first";
            } else if (numberRoom == 2) {
                numberText = "second";
            } else if (numberRoom == 3) {
                numberText = " Third";
            } else if (numberRoom == 4) {
                numberText = " fourth";
            }
            $(this).find('.myroom-hotel_local-item-title').html('<span class="close"><i class="fal fa-trash-alt"></i></span>' + ' room ' + numberText);
            $(this).find(".myroom-hotel_local-item-info").find("input[name^='adult_hotel_local']").attr("name", "adult_hotel_local" + numberRoom);
            $(this).find(".myroom-hotel_local-item-info").find("input[name^='adult_hotel_local']").attr("id", "adult_hotel_local" + numberRoom);
            $(this).find(".myroom-hotel_local-item-info").find("input[name^='child_hotel_local']").attr("name", "child_hotel_local" + numberRoom);
            $(this).find(".myroom-hotel_local-item-info").find("input[name^='child_hotel_local']").attr("id", "child_hotel_local" + numberRoom);
            let numberChild = 1;
            let inputNameSelectChildAge = $(this).find(".tarikh-tavalods .tarikh-tavalod-item");
            inputNameSelectChildAge.each(function () {
                $(this).find("select[name^='childAge']").attr("name", "childAge" + numberRoom + numberChild);
                $(this).find("select[name^='childAge']").attr("id", "childAge" + numberRoom + numberChild);
                numberChild++;
            });
            numberRoom++;
        });
        if (roomCount == 2) {
            $('.myroom-hotel_local-item-title .close').hide();
        }
    });


    $('.hotel_local-rooms').on('click', 'i.addParent_hotel_local', function () {
        var inputNum = $(this).siblings(".countParent_hotel_local").val();
        if (inputNum < 7) {
            inputNum++;
            let numberAdult = parseInt($('.number_adult_hotel_local').text());
            let resultNumber = numberAdult + 1;
            $(this).siblings(".countParent_hotel_local").val(inputNum);
            $('.number_adult_hotel_local').html('');
            $('.number_adult_hotel_local').append(resultNumber);
        }
    });
    $('.hotel_local-rooms').on('click', 'i.minusParent_hotel_local', function () {
        let data_roomnumber = $(this).parents('.myroom-hotel_local-item').attr('data-roomnumber');
        let ThiscountParent = $(this).parents('.myroom-hotel_local-item').find('.countParent_hotel_local').val();
        var inputNum = $(this).siblings(".countParent_hotel_local").val();
        if (inputNum > 1) {
            inputNum--;
            let numberAdult = parseInt($('.number_adult_hotel_local').text());
            let resultNumber = numberAdult - 1;
            $(this).siblings(".countParent_hotel_local").val(inputNum);
            $('.number_adult_hotel_local').html('');
            $('.number_adult_hotel_local').append(resultNumber);
        }
    });
    $('.hotel_local-rooms').on('click', 'i.minusParent_hotel_local', function () {
        let data_roomnumber = $(this).parents('.myroom-hotel_local-item').attr('data-roomnumber');
        let ThiscountParent = $(this).parents('.myroom-hotel_local-item').find('.countParent_hotel_local').val();
        var inputNum = $(this).siblings(".countParent_hotel_local").val();
        if (inputNum > 1) {
            inputNum--;
            let numberAdult = parseInt($('.number_adult_hotel_local').text());
            let resultNumber = numberAdult - 1;
            $(this).siblings(".countParent_hotel_local").val(inputNum);
            $('.number_adult_hotel_local').html('');
            $('.number_adult_hotel_local').append(resultNumber);
        }
    });
    // $('body').on('click', 'i.addChild', function () {
    //     var inputNum = $(this).siblings(".countChild").val();
    //     inputNum++;
    //     if (inputNum < 5) {
    //         let numberBaby =parseInt( $('.number_baby').text());
    //         let numberBabyThis =parseInt($(this).parents().find('.countChild').val()) + 1;
    //
    //         let resultNumber = numberBaby + 1
    //
    //         $(this).siblings(".countChild").val(inputNum);
    //         $('.number_baby').html('');
    //         $('.number_baby').append(resultNumber);
    //
    //         $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();
    //
    //         let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
    //
    //         var htmlBox = createBirthdayCalendar(inputNum, roomNumber);
    //
    //
    //     }
    // });

    // $('body').on('click', 'i.minusChild', function () {
    //
    //     var inputNum = $(this).siblings(".countChild").val();
    //     $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();
    //
    //     if (inputNum != 0) {
    //         let numberBaby =parseInt( $('.number_baby').text());
    //         let numberBabyThis =parseInt($(this).parents().find('.countChild').val()) + 1;
    //
    //         let resultNumber = numberBaby - 1
    //
    //         inputNum--;
    //         $(this).siblings(".countChild").val(inputNum);
    //         $('.number_baby').html('');
    //         $('.number_baby').append(resultNumber);
    //
    //         let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
    //
    //         var htmlBox = createBirthdayCalendar(inputNum, roomNumber);
    //
    //
    //
    //     } else {
    //         $(this).siblings(".countChild").val('0');
    //
    //     }
    // });

    // $('.hotel_local-rooms').on('click', 'i.addChild_hotel_local', function () {
    //     var inputNum = $(this).siblings(".countChild_hotel_local").val();
    //     inputNum++;
    //     if (inputNum < 5) {
    //         let numberBaby = parseInt($('.number_baby_hotel_local').text());
    //         let numberBabyThis = parseInt($(this).parents().find('.countChild_hotel_local').val()) + 1;
    //         let resultNumber = numberBaby + 1;
    //         $(this).siblings(".countChild_hotel_local").val(inputNum);
    //         $('.number_baby_hotel_local').html('');
    //         $('.number_baby_hotel_local').append(resultNumber);
    //         $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();
    //         let roomNumber = $(this).parents(".myroom-hotel_local-item").data("roomnumber");
    //         var htmlBox = createBirthdayCalendar(inputNum, roomNumber);
    //         $(this).parents(".myroom-hotel_local-item-info").find(".tarikh-tavalods").html(htmlBox);
    //     }
    // });
    // $('.hotel_local-rooms').on('click', 'i.minusChild_hotel_local', function () {
    //     var inputNum = $(this).siblings(".countChild_hotel_local").val();
    //     $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();
    //     if (inputNum != 0) {
    //         let numberBaby = parseInt($('.number_baby_hotel_local').text());
    //         let numberBabyThis = parseInt($(this).parents().find('.countChild_hotel_local').val()) + 1;
    //         let resultNumber = numberBaby - 1;
    //         inputNum--;
    //         $(this).siblings(".countChild_hotel_local").val(inputNum);
    //         $('.number_baby_hotel_local').html('');
    //         $('.number_baby_hotel_local').append(resultNumber);
    //         let roomNumber = $(this).parents(".myroom-hotel_local-item").data("roomnumber");
    //         var htmlBox = createBirthdayCalendar(inputNum, roomNumber);
    //         $(this).parents(".myroom-hotel_local-item-info").find(".tarikh-tavalods").html(htmlBox);
    //     } else {
    //         $(this).siblings(".countChild_hotel_local").val('0');
    //     }
    // });

    function createRoomHotelLocal(roomCount) {
        var HtmlCode = "";
        let i = $('.myroom-hotel_local-item').length + 1;
        let numberText = "اول";
        let valuefirst;
        if (i == 1) {
            numberText = "اول";
            valuefirst = "2"
        } else if (i == 2) {
            numberText = "second ";
            valuefirst = "1";
        } else if (i == 3) {
            numberText = " Third ";
            valuefirst = "1";
        } else if (i == 4) {
            numberText = " fourth";
            valuefirst = "1";
        }
        if (i < 5) {
            HtmlCode += `<div class="myroom-hotel_local-item" data-roomNumber="${i}"> <div class="myroom-hotel_local-item-title"> <span class="close"> <i class="trash"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3C140.6 6.8 151.7 0 163.8 0zM32 128H416L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32 128zM143 239c-9.4 9.4-9.4 24.6 0 33.9l47 47-47 47c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l47-47 47 47c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-47-47 47-47c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-47 47-47-47c-9.4-9.4-24.6-9.4-33.9 0z"/></svg></i> </span> room  ${numberText} </div><div class="myroom-hotel_local-item-info"> <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal"> <h6>Adult</h6> (Older than 12 years) <div><i class="addParent_hotel_local plus-nafar hotelroom-minus plus-hotelroom-bozorgsal "><svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M232 72c0-13.3-10.7-24-24-24s-24 10.7-24 24V232H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H184V440c0 13.3 10.7 24 24 24s24-10.7 24-24V280H392c13.3 0 24-10.7 24-24s-10.7-24-24-24H232V72z"></path></svg></i> <input readonly class="countParent_hotel_local"  min="0" value="${valuefirst}" max="5" type="number" name="adultHotelLocal${i}" id="adultHotelLocal${i}"> <i class="minusParent_hotel_local minus-nafar hotelroom-minus minus-hotelroom-bozorgsal"><svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 256c0 13.3-10.7 24-24 24L24 280c-13.3 0-24-10.7-24-24s10.7-24 24-24l368 0c13.3 0 24 10.7 24 24z"></path></svg></i> </div> </div> <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal"> <h6>Child</h6> (Less than 12 years) <div> <i class="addChild_hotel_local plus-nafar hotelroom-minus plus-hotelroom-koodak"><svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M232 72c0-13.3-10.7-24-24-24s-24 10.7-24 24V232H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H184V440c0 13.3 10.7 24 24 24s24-10.7 24-24V280H392c13.3 0 24-10.7 24-24s-10.7-24-24-24H232V72z"></path></svg> </i><input readonly class="countChild_hotel_local" min="0" value="0" max="5" type="number" name="childHotelLocal${i}" id="childHotelLocal${i}"> <i class="minusChild_hotel_local minus-nafar hotelroom-minus minus-hotelroom-koodak"><svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 256c0 13.3-10.7 24-24 24L24 280c-13.3 0-24-10.7-24-24s10.7-24 24-24l368 0c13.3 0 24 10.7 24 24z"></path></svg> </i> </div> </div><div class="tarikh-tavalods"></div> </div> </div>`;
        }
        return HtmlCode;
    }












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

                "<input placeholder='passenger's date of birth " + i + "' autocomplete='off' type='text' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "' class='shamsiBirthdayCalendar form-control' />" +
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
        if (nafarnozad == 0 && nafarkoodak == 0) {
            let allNafarat = nafarbozorg + nafarkoodak + nafarnozad;$(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(allNafarat + " راكب ");
        } else {
            let allNafarat = nafarbozorg + nafarkoodak + nafarnozad;$(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(allNafarat + " راكب ");
        }
    });
    $(".minus-nafar").click(function () {
        let nafar = $(this).siblings(".number-count").attr('data-number');
        let nmin = $(this).siblings(".number-count").attr('data-min');
        if (nafar > nmin) {
            var newnafar = --nafar;
            $(this).siblings(".number-count").html(newnafar);
            $(this).siblings(".number-count").attr('data-number', newnafar);
            var whathidden = $(this).siblings(".number-count").attr('data-value');
            $("." + whathidden).val(newnafar);
        }
        let nafarbozorg2 = Number($(this).parents(".box-of-count-nafar").find(".bozorg-num .number-count").attr('data-number'));
        let nafarkoodak2 = Number($(this).parents(".box-of-count-nafar").find(".koodak-num .number-count").attr('data-number'));
        let nafarnozad2 = Number($(this).parents(".box-of-count-nafar").find(".nozad-num .number-count").attr('data-number'));
        let tedad2 = nafarbozorg2 + nafarkoodak2 + nafarnozad2;
        if (nafarnozad2 == 0 && nafarkoodak2 == 0) {
            let allNafarat = nafarbozorg2 + nafarkoodak2 + nafarnozad2;$(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(allNafarat + " راكب ");
        } else {
            let allNafarat = nafarbozorg2 + nafarkoodak2 + nafarnozad2;$(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(allNafarat + " راكب ");
        }
    });


    $('.down-count-nafar').click(function () {

        $('.cbox-count-nafar').toggle();
        $(this).parents().find('.down-count-nafar').toggleClass('fa-caret-up');
    });




    $('.close_room').click(function (e) {
        e.stopPropagation();
        $('.myhotels-rooms').removeClass('active_p');
    });


    $('body').on('click','.btn_add_room', function (e) {
        $('.myroom-hotel-item-title .close').show();

        let roomCount = parseInt($('.myroom-hotel-item').length) ;

        let numberAdult = parseInt($('.number_adult').text() );
        let number_room = parseInt($('.number_room').text() );
        $('.number_adult').text(numberAdult + 1)
        $('.number_room').text(number_room + 1)


        // let code = createRoomHotel(roomCount);
        // $(".hotel_select_room").append(code);
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
        let numberText = "اول";
        $('.myroom-hotel-item').each(function () {
            $(this).data("roomnumber", numberRoom);
            if (numberRoom == 1) {
                numberText = "أولاً";
            } else if (numberRoom == 2) {
                numberText = "ثانية";
            } else if (numberRoom == 3) {
                numberText = "ثالث";
            } else if (numberRoom == 4) {
                numberText = "الرابع";
            }
            $(this).find('.myroom-hotel-item-title').html('<span class="close"><i class="fal fa-trash-alt"></i></span> غرفة ' + numberText );

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


        // var roomCount = $("#countRoom").val();
        // createRoomHotel(roomCount);
        // $(".myroom-hotel").find(".myroom-hotel-item").remove();
        // var code = createRoomHotel(roomCount);
        // $(".myroom-hotel").append(code);


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


    // $('body').on('click', 'i.addParent', function () {
    //
    //
    //     var inputNum = $(this).siblings(".countParent").val();
    //
    //     if (inputNum < 7) {
    //         inputNum++;
    //         let numberAdult =parseInt( $('.number_adult').text());
    //         let resultNumber = numberAdult + 1
    //         $(this).siblings(".countParent").val(inputNum);
    //         $('.number_adult').html('');
    //         $('.number_adult').append(resultNumber);
    //     }
    // });
    //
    // $('body').on('click', 'i.minusParent', function () {
    //
    //     let data_roomnumber = $(this).parents('.myroom-hotel-item').attr('data-roomnumber');
    //     let ThiscountParent =  $(this).parents('.myroom-hotel-item').find('.countParent').val();
    //
    //
    //     var inputNum = $(this).siblings(".countParent").val();
    //
    //     if (inputNum > 1) {
    //         inputNum--;
    //         let numberAdult =parseInt( $('.number_adult').text());
    //         let resultNumber = numberAdult - 1
    //         $(this).siblings(".countParent").val(inputNum);
    //         $('.number_adult').html('');
    //         $('.number_adult').append(resultNumber);
    //     }
    //
    //
    //
    // });

    // $('body').on('click', 'i.addChild', function () {
    //     var inputNum = $(this).siblings(".countChild").val();
    //     inputNum++;
    //     if (inputNum < 5) {
    //         let numberBaby =parseInt( $('.number_baby').text());
    //         let numberBabyThis =parseInt($(this).parents().find('.countChild').val()) + 1;
    //
    //         let resultNumber = numberBaby + 1
    //
    //         $(this).siblings(".countChild").val(inputNum);
    //         $('.number_baby').html('');
    //         $('.number_baby').append(resultNumber);
    //
    //         $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();
    //
    //         let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
    //
    //         var htmlBox = createBirthdayCalendar(inputNum, roomNumber);
    //
    //     }
    // });

    // $('body').on('click', 'i.minusChild', function () {
    //
    //     var inputNum = $(this).siblings(".countChild").val();
    //     $(this).parents(".child-number").siblings(".child-birthday-box").find(".childAge-button").remove();
    //
    //     if (inputNum != 0) {
    //         let numberBaby =parseInt( $('.number_baby').text());
    //         let numberBabyThis =parseInt($(this).parents().find('.countChild').val()) + 1;
    //
    //         let resultNumber = numberBaby - 1
    //
    //         inputNum--;
    //         $(this).siblings(".countChild").val(inputNum);
    //         $('.number_baby').html('');
    //         $('.number_baby').append(resultNumber);
    //
    //         let roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
    //
    //         var htmlBox = createBirthdayCalendar(inputNum, roomNumber);
    //
    //
    //     } else {
    //         $(this).siblings(".countChild").val('0');
    //
    //     }
    // });
    $('.btn-close').click(function () {
        $('.cbox-count-nafar').hide();
        $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');

    });


    $('input:radio[name="DOM_TripMode"]').change(
        function(){
            if (this.checked && this.value == '1') {
                $('.return_input').removeAttr('disabled', '');


            }
            else {
                $('.return_input').attr('disabled', '');
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


                $('#hotel_khareji').css('display','flex');
                $('#hotel_dakheli').hide();


            }
            else {
                $('#hotel_khareji').hide();
                $('#hotel_dakheli').css('display','flex');
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
        nav:true,
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
    var owlFlightProposal = $('.owlFlightProposal');
    owlFlightProposal.owlCarousel({
        rtl: true,
        loop: true,
        dots:false,
        margin: 5,
        nav:true,
        navText: ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"],
        autoplaySpeed:1000,
        autoplay: false,
        autoplayTimeout: 4000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav:false,
                dots:true,
            },
            600: {
                items: 2,
            },
            1000: {
                items: 3,


            }
        }
    });

    var owl_tour_local = $('#owl_tour_local');
    owl_tour_local.owlCarousel({
        rtl: true,
        loop: true,
        margin: 10,
        nav:true,
        navText: ["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"],
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
        nav:true,
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

if($(window).width() > 576){
    $('#flight-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/airline.jpg")')});
    $('#hotel-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/hotel.jpg")')});
    $('#tour-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/tour.jpg")')});
    $('#train-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/train.jpg")')});
    $('#bus-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/bus.jpg")')});
    $('#fun-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/tafrih.jpg")')});
    $('#car-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/car.jpg")')});
    $('#visa-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/visa.jpg")')});
    $('#gasht-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/gasht.jpg")')});
    $('#insurance-tab').click(function () {$('.section_slider').css('background-image' , 'url("images/insurance.jpg")')});

    $('a[data-target="#flight-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/airline.jpg")')});
    $('a[data-target="#hotel-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/hotel.jpg")')});
    $('a[data-target="#tour-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/tour.jpg")')});
    $('a[data-target="#train-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/train.jpg")')});
    $('a[data-target="#bus-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/bus.jpg")')});
    $('a[data-target="#fun-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/tafrih.jpg")')});
    $('a[data-target="#car-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/car.jpg")')});
    $('a[data-target="#visa-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/visa.jpg")')});
    $('a[data-target="#gasht-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/gasht.jpg")')});
    $('a[data-target="#insurance-tab"]').click(function () {$('.section_slider').css('background-image' , 'url("images/insurance.jpg")')});

}
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

    $('body').click(function () {
        $('.arrow-up').removeClass('show-flex');
    });
    $('.btn-user').click(function (e) {
        e.stopPropagation();
        $('.arrow-up').toggleClass('show-flex');
    });





});
//
// function createRoomHotel(roomCount) {
//
//     var HtmlCode = "";
//     let i = $('.myroom-hotel-item').length +1;
//     let numberText = "اول";
//     let valuefirst;
//
//
//     if (i == 1) {
//         numberText = "أولاً";
//         valuefirst = "2"
//     } else if (i == 2) {
//         numberText = "ثانية";
//         valuefirst = "1";
//
//     } else if (i == 3) {
//         numberText = "ثالث";
//         valuefirst = "1";
//
//     } else if (i == 4) {
//         numberText = "الرابع";
//         valuefirst = "1";
//
//     }
//
//
//     if(i < 5){
//         HtmlCode +=
//             `<div class="myroom-hotel-item" data-roomNumber="${i}">
//              <div class="myroom-hotel-item-title">
//              <span class="close">
//              <i class="trash"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3C140.6 6.8 151.7 0 163.8 0zM32 128H416L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32 128zM143 239c-9.4 9.4-9.4 24.6 0 33.9l47 47-47 47c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l47-47 47 47c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-47-47 47-47c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-47 47-47-47c-9.4-9.4-24.6-9.4-33.9 0z"/></svg></i>
//             </span>
//             غرفة  ${numberText}
//             </div><div class="myroom-hotel-item-info">
//         <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
//        <h6>الكبار</h6>
//            (أكبر من 12 سنة)
//         <div><i class="addParent plus-nafar hotelroom-minus plus-hotelroom-bozorgsal">
//                  <svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M232 72c0-13.3-10.7-24-24-24s-24 10.7-24 24V232H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H184V440c0 13.3 10.7 24 24 24s24-10.7 24-24V280H392c13.3 0 24-10.7 24-24s-10.7-24-24-24H232V72z"></path></svg>
//          </i>
//         <input readonly class="countParent"  min="0" value="${valuefirst}" max="5" type="number" name="adult${i}" id="adult${i}">
//         <i class="minusParent minus-nafar hotelroom-minus minus-hotelroom-bozorgsal">
//              <svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 256c0 13.3-10.7 24-24 24L24 280c-13.3 0-24-10.7-24-24s10.7-24 24-24l368 0c13.3 0 24 10.7 24 24z"></path></svg>
//         </i>
//         </div>
//         </div>
//         <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
//        <h6>طفل</h6>
//                                                     (أقل من 12 سنة)
//         <div>
//         <i class="addChild plus-nafar hotelroom-minus plus-hotelroom-koodak ">
//              <svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M232 72c0-13.3-10.7-24-24-24s-24 10.7-24 24V232H24c-13.3 0-24 10.7-24 24s10.7 24 24 24H184V440c0 13.3 10.7 24 24 24s24-10.7 24-24V280H392c13.3 0 24-10.7 24-24s-10.7-24-24-24H232V72z"></path></svg>
//         </i>
//         <input readonly class="countChild" min="0" value="0" max="5" type="number" name="child${i}" id="child${i}">
//         <i class="minusChild minus-nafar hotelroom-minus minus-hotelroom-koodak">
//             <svg class=" " xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 256c0 13.3-10.7 24-24 24L24 280c-13.3 0-24-10.7-24-24s10.7-24 24-24l368 0c13.3 0 24 10.7 24 24z"></path></svg>
//         </i>
//         </div>
//         </div><div class="tarikh-tavalods"></div>
//         </div>
//         </div>`;
//     }
//
//     return HtmlCode;
// }






$(".switch_routs").click(function (){
    let a = $("#select2-gds_origin_local-container").text();
    let b = $("#select2-gds_destination_local-container").text();
    if (a !== "Where" && b !== "Where"){
        $("#select2-gds_destination_local-container").text(a);
        $("#select2-gds_origin_local-container").text(b);
    }
    let c= $("#select2-gds_origin_local-container").val();
    let d =$("#select2-gds_destination_local-container").val();
    if (a !== "Where" && b !== "Where"){
        $("#select2-gds_destination_local-container").val(a);
        $("#select2-gds_origin_local-container").val(b);
    }
})

$(".switch_routs").click(function (){
    let a = $("#OriginPortal").text();
    let b = $("#DestinationPortal").text();
    if (a !== "Where?" && b !== "Where?"){
        $("#DestinationPortal").text(a);
        $("#OriginPortal").text(b);
    }
    let c= $("#OriginPortal").val();
    let d =$("#DestinationPortal").val();
    if (a !== "Where?" && b !== "Where?"){
        $("#DestinationPortal").val(a);
        $("#OriginPortal").val(b);
    }
})