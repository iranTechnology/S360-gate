$(document).ready(function () {

    $(".fa-times").click(function (){
        $(".alertC").addClass("alertCD")
    })
    $('.Advertising_slider').owlCarousel({
        loop:true,
        margin:20,
        rtl:true,
        dots:true,
        nav:false,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:2
            }
        }
    })
    $('.blog_slider').owlCarousel({
        loop:true,
        margin:20,
        rtl:true,
        dots:true,
        nav:false,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:2
            }
        }
    })
    $('.owl-hotel-ghods').owlCarousel({
        rtl:true,
        loop:true,
        margin:30,
        nav:false,
        navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M505 273c9.4-9.4 9.4-24.6 0-33.9L369 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l95 95L24 232c-13.3 0-24 10.7-24 24s10.7 24 24 24l406.1 0-95 95c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L505 273z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L143 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-95-95L488 280c13.3 0 24-10.7 24-24s-10.7-24-24-24L81.9 232l95-95c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>"],
        autoplay: true,
        autoplayTimeout:3000,
        dots:true,
        responsive:{
            0:{
                items:1,
            },
            600:{
                items:2,
            },
            990:{
                items:3,
            },
            1200:{
                items:4,
            }
        }
    });
    $('.tours').owlCarousel({
        loop: true,
        margin: 20,
        nav: false,
        dots:true,
        rtl: true,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        responsive: {
            0: {
                items: 1
            },
            700: {
                items: 2
            },
            1000: {
                items: 4
            }
        }
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
    $('#number_of_passengers').on('change', function (e) {
        var itemInsu = $(this).val();
        itemInsu++;
        var HtmlCode = "";
        $(".nafaratbime").html('');
        var i = 1;
        while (i < itemInsu) {
            HtmlCode += "<div class='p-1 col-lg-2 col-md-4 col-sm-6 col-6 col_search nafarat-bime d-flex flex-column justify-content-between'>" +
                "<p></p> <div class='form-group'  style='position: relative'>" +
                "<input placeholder='تاریخ تولد مسافر " + i + "' autocomplete='off' type='text' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "' class='shamsiBirthdayCalendar form-control' />" +
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
        if (nafarnozad == 0 && nafarkoodak == 0) {
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(nafarbozorg + ' بزرگسال , ' + nafarkoodak + ' کودک , ' + nafarnozad + 'نوزاد');
        } else {
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(nafarbozorg + ' بزرگسال , ' + nafarkoodak + ' کودک , ' + nafarnozad + 'نوزاد');
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
        if (nafarnozad2 == 0 && nafarkoodak2 == 0) {
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(nafarbozorg2 + ' بزرگسال , ' + nafarkoodak2 + ' کودک , ' + nafarnozad2 + 'نوزاد');
        } else {
            $(this).parents(".box-of-count-nafar").find(".text-count-nafar").text(nafarbozorg2 + ' بزرگسال , ' + nafarkoodak2 + ' کودک , ' + nafarnozad2 + 'نوزاد');
        }
    });
    $('.box-of-count-nafar-boxes').click(function () {
        $('.cbox-count-nafar').toggle();
        $(this).parents().find('.down-count-nafar').toggleClass('fa-caret-up');
    });
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
        $('#countRoomPackage').on('change', function (e) {

            var roomCount = $("#countRoomPackage").val();
            createRoomHotelPackage(roomCount);
            $(".mypackage-rooms").find(".myroom-hotel-item").remove();
            var code = createRoomHotelPackage(roomCount);
            $(".mypackage-rooms").append(code);


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
        $('input:radio[name="DOM_TripMode"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('.return_input').removeAttr('disabled', '');
                } else {
                    $('.return_input').attr('disabled', '');
                }
            });
        $('input:radio[name="DOM_TripMode2"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('.return_input2').removeAttr('disabled', '');
                } else {
                    $('.return_input2').attr('disabled', '');
                }
            });
        $('input:radio[name="DOM_TripMode6"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('.return_input_train').removeAttr('disabled', '');
                } else {
                    $('.return_input_train').attr('disabled', '');
                }
            });

        $('input:radio[name="DOM_TripMode4"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('#hotel_khareji').css('display', 'flex');
                    $('#hotel_dakheli').hide();
                } else {
                    $('#hotel_khareji').hide();
                    $('#hotel_dakheli').css('display', 'flex');
                }
            });
        $('input:radio[name="DOM_TripMode8"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('#flight_khareji').css('display', 'flex');
                    $('#flight_dakheli').hide();
                } else {
                    $('#flight_khareji').hide();
                    $('#flight_dakheli').css('display', 'flex');
                }
            });
        $('input:radio[name="DOM_TripMode7"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('#transfer_div').css('display', 'flex');
                    $('#gasht_div').hide();
                } else {
                    $('#transfer_div').hide();
                    $('#gasht_div').css('display', 'flex');
                }
            });

        $('input:radio[name="DOM_TripMode5"]').change(
            function () {
                if (this.checked && this.value == '1') {
                    $('#tour_khareji').css('display', 'flex');
                    $('#tour_dakheli').hide();
                } else {
                    $('#tour_khareji').hide();
                    $('#tour_dakheli').css('display', 'flex');
                }
            });
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
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

        $(".select2_in").select2({
            templateResult: formatState
        });


    });
    $('.multiselectportal').click(function () {
        if ($("input[name='select-rb']:checked").val() == '1') {
            $('.returnCalendar').prop("disabled", "disabled");
        } else {
            $('.returnCalendar').removeAttr("disabled");
        }
    });
    $('.select_multiway').click(function () {
        if ($("input[name='select-rb2']:checked").val() == '1') {
            $('.checktest').prop("disabled", "disabled");
        } else {
            $('.checktest').removeAttr("disabled");
        }
    });

    $('.close_room').click(function () {
       $('.myhotels-rooms').removeClass('active_p');
    });


    function createRoomHotel(roomCount) {

        var HtmlCode = "";
        let i = $('.myroom-hotel-item').length + 1;
        let numberText = "اول";
        let valuefirst;


        if (i == 1) {
            numberText = "اول";
            valuefirst = "2"
        } else if (i == 2) {
            numberText = "دوم";
            valuefirst = "1";

        } else if (i == 3) {
            numberText = "سوم";
            valuefirst = "1";

        } else if (i == 4) {
            numberText = "چهارم";
            valuefirst = "1";

        }


        if (i < 5) {
            HtmlCode +=
                `<div class="myroom-hotel-item" data-roomNumber="${i}">
             <div class="myroom-hotel-item-title">
             <span class="close">
             <i class="fa fa-trash-alt"></i>
            </span>
             اتاق  ${numberText}
            </div><div class="myroom-hotel-item-info">
        <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
       <h6>بزرگسال</h6>
           (بزرگتر از ۱۲ سال)
        <div><i class="addParent plus-nafar hotelroom-minus plus-hotelroom-bozorgsal fas fa-plus"></i>
        <input readonly class="countParent"  min="0" value="${valuefirst}" max="5" type="number" name="adult${i}" id="adult${i}">
        <i class="minusParent minus-nafar hotelroom-minus minus-hotelroom-bozorgsal fas fa-minus"></i>
        </div>
        </div>
        <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
       <h6>کودک</h6>
                                                    (کوچکتر از ۱۲ سال)
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
    function createRoomHotelPackage(roomCount) {

        var HtmlCode = "";
        let i = $('.myroom-package-item').length + 1;
        let numberText = "اول";
        let valuefirst;


        if (i == 1) {
            numberText = "اول";
            valuefirst = "2"
        } else if (i == 2) {
            numberText = "دوم";
            valuefirst = "1";

        } else if (i == 3) {
            numberText = "سوم";
            valuefirst = "1";

        } else if (i == 4) {
            numberText = "چهارم";
            valuefirst = "1";

        }


        if (i < 5) {
            HtmlCode +=
                `<div class="myroom-package-item" data-roomNumber="${i}">
                <div class="myroom-package-item-title">
                <span class="close">
                <i class="fa fa-trash-alt"></i>
               </span>
             اتاق  ${numberText}
            </div><div class="myroom-package-item-info">
        <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
       <h6>بزرگسال</h6>
           (بزرگتر از ۱۲ سال)
        <div><i class="addParent_p plus-nafar hotelroom-minus plus-hotelroom-bozorgsal fas fa-plus"></i>
        <input readonly class="countParent_p"  min="0" value="${valuefirst}" max="5" type="number" name="adultpackage${i}" id="adultpackage${i}">
        <i class="minusParent_p minus-nafar hotelroom-minus minus-hotelroom-bozorgsal fas fa-minus"></i>
        </div>
        </div>
        <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">
       <h6>کودک</h6>
                                                    (کوچکتر از ۱۲ سال)
        <div>
        <i class="addChild_p plus-nafar hotelroom-minus plus-hotelroom-koodak fas fa-plus">
        
        </i><input readonly class="countChild_p" min="0" value="0" max="5" type="number" name="childpackage${i}" id="childpackage${i}">
        <i class="minusChild_p minus-nafar hotelroom-minus minus-hotelroom-koodak fas fa-minus"></i>
        </div>
        </div><div class="tarikh-tavalods"></div>
        </div>
        </div>`;
        }

        return HtmlCode;
    }
    function GetSubCategoriesOnSelectBox(thiss) {
        $.ajax({
            type: 'post',
            url: masir_commands + 'GlobalFile/Ajax.php',
            data: {
                usage: 'GetSubCategories',
                Param: thiss.val()
            },
            success: function (data) {
                var JsonData = JSON.parse(data);
                if ($('#select_tafrih_zirmagmoee_searchbox').data('select2')) {
                    $('#select_tafrih_zirmagmoee_searchbox').select2('destroy');
                }
                $('#select_tafrih_zirmagmoee_searchbox').html(JsonData);
                $('#select_tafrih_zirmagmoee_searchbox').select2();


            }
        });
    }
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
            HtmlCode += '<div class="tarikh-tavalod-item">' +
                '<span>سن کودک <i>' + numberTextChild + '</i></span>' +
                '<select id="childAge' + roomNumber + i + '" name="childAge' + roomNumber + i + '">' +
                '<option value="1">0 تا 1 سال</option>' +
                '<option value="2">1 تا 2 سال</option>' +
                '<option value="3">2 تا 3 سال</option>' +
                '<option value="4">3 تا 4 سال</option>' +
                '<option value="5">4 تا 5 سال</option>' +
                '<option value="6">5 تا 6 سال</option>' +
                '<option value="7">6 تا 7 سال</option>' +
                '<option value="8">7 تا 8 سال</option>' +
                '<option value="9">8 تا 9 سال</option>' +
                '<option value="10">9 تا 10 سال</option>' +
                '<option value="11">10 تا 11 سال</option>' +
                '<option value="12">11 تا 12 سال</option>' +
                '</select>' +
                '</div>';
            i++;
        }

        return HtmlCode;
    };
});

