$(document).ready(function() {
    $('.c-header__btn').click(function () {

        $('.main-navigation__sub-menu2').toggleClass('active_log');
    });
    $('.menu-login').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });

    $('body').click(function () {

        $('.main-navigation__sub-menu2').removeClass('active_log');
    })

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
            HtmlCode += "<div class='search_item nafarat-bime'>" +
                "<input type='text' name='txt_birth_insurance" + i + "' id='txt_birth_insurance" + i + "' class='shamsiBirthdayCalendar search_input' placeholder=' تولد نفر  " + i + "' /></div>" +
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

    $('input:radio[name="DOM_TripMode8"]').change(
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
    // hide #back-top first
    $("#scroll-top").hide();
    // fade in #back-top
    /*$('#header_area_op').addClass('header_area_op');
    $("#top_header").addClass('display');*/

    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('#scroll-top').fadeIn();
               /* $('#header_area_op').removeClass('header_area_op');
                $("#top_header").removeClass('display');*/
            } else {
                $('#scroll-top').fadeOut();
              /*  $('#header_area_op').addClass('header_area_op');
                $("#top_header").addClass('display');*/
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
function reversDestination() {

    var origin = $("select#gds_origin_local option:selected").val();
    var desti = $("select#gds_destination_local option:selected").val();
    var originTxt = $("select#gds_origin_local option:selected").text();
    var destiTxt = $("select#gds_destination_local option:selected").text();
    if (desti !== "") {
        $("select#gds_origin_local option:selected").val(desti);
        $("select#gds_destination_local option:selected").val(origin);
        $("select#gds_origin_local option:selected").text(destiTxt);
        $("select#gds_destination_local option:selected").text(originTxt);
        $("span#select2-gds_origin_local-container").text(destiTxt);
        $("span#select2-gds_destination_local-container").text(originTxt);
    } else {
        selectDeparture

    }
}
