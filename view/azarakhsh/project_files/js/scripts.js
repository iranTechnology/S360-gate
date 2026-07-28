$(document).ready(function() {
    $('.c-header__btn-login').click(function () {

        $('.main-navigation__sub-menu2').toggleClass('active_log');
    });
    $('.c-header__btn').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });
    $('#owl-banner').owlCarousel({
        rtl: true,
        dots: true,
        loop: true,
        margin: 0,
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
                items: 1,
            },
            1000: {

                items: 1,

            }
        }
    });
    $('#owl-example2').owlCarousel({
        rtl: true,
        dots:true,
        loop: false,
        margin: 0,
        nav:false,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        responsiveClass: true,
        responsive: {
            0: {
                nav:false,
                dots:true,
                items: 1,
            },
            600: {
                items: 2,
            },
            1000: {

                items: 3,

            }
        }
    });
    $('#owl-example3').owlCarousel({
        rtl: true,
        dots:true,
        loop: false,
        margin: 0,
        padding: 0,
        nav:false,
        autoplay: true,
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

                items: 2,

            }
        }
    });
    //search box
    $('.select2').select2({

    });
    <!--select oneway toway-->
    $('.multiselectportal').click(function () {
        if($("input[name='select-rb']:checked").val() == '1'){
            $('.checktest1').prop("disabled", "disabled");
        } else{
            $('.checktest1').removeAttr("disabled");
        }
    });
    $('.select_multiway').click(function () {
        if($("input[name='select-rb2']:checked").val() == '1'){
            $('.checktest').prop("disabled", "disabled");
        } else{
            $('.checktest').removeAttr("disabled");
        }
    });
    $('.radioChangeStations').click(function () {
        if($("input[name='changeStations']:checked").val() == 'sourceStations'){
            $('#destStationId').prop("disabled", "disabled");
        } else{
            $('#destStationId').removeAttr("disabled");
        }
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
        var nafarbozorg = Number($(this).parents(".search-tab-inner").find(".bozorg-num .number-count").attr('data-number'));
        var nafarkoodak = Number($(this).parents(".search-tab-inner").find(".koodak-num .number-count").attr('data-number'));
        var nafarnozad = Number($(this).parents(".search-tab-inner").find(".nozad-num .number-count").attr('data-number'));
        var tedad = nafarbozorg + nafarkoodak + nafarnozad;
        $(this).parents(".search-tab-inner").find(".text-count-nafar").text(tedad + " مسافر ");
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
        var nafarbozorg2 = Number($(this).parents(".search-tab-inner").find(".bozorg-num .number-count").attr('data-number'));
        var nafarkoodak2 = Number($(this).parents(".search-tab-inner").find(".koodak-num .number-count").attr('data-number'));
        var nafarnozad2 = Number($(this).parents(".search-tab-inner").find(".nozad-num .number-count").attr('data-number'));
        var tedad2 = nafarbozorg2 + nafarkoodak2 + nafarnozad2;
        $(this).parents(".search-tab-inner").find(".text-count-nafar").text(tedad2 + " مسافر ");
    });
    $(".box-of-count-nafar-boxes").click(function () {
        $(this).siblings(".cbox-count-nafar").toggle();
    });
    $('.box-of-count-nafar').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });
    $('#number_of_passengers').on('change', function (e) {

        var itemInsu = $("#number_of_passengers").val();

        itemInsu++;
        var HtmlCode = "";
        $(".nafarat-bime").remove();

        var i = 1;
        while (i < itemInsu) {
            HtmlCode += "<div class='search_item nafarat-bime col-lg-4 col-md-4 col-sm-6 col-12'>" +
                "<div class='lable-search'>تاریخ تولد یک نفر:</div>"+"<input type='text' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "' class='shamsiBirthdayCalendar search_input' placeholder=' تولد نفر  " + i + "' /></div>" +
                "</div>";
            i++;
        }

        $(".nafaratbime").append(HtmlCode);
    });
    $('body').click(function () {


        $('.cbox-count-nafar').hide();
        $(this).parents().find('.down-count-nafar').removeClass('fa-caret-up');
    });

    $(".parvaz_charter").click(function() {
        $([document.documentElement, document.body]).animate({
            scrollTop: $(".masir-section").offset().top -15
        }, 1000);
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

});