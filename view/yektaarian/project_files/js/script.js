$(document).ready(function () {
    $('.top__user_menu').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });

    $('.box-of-count-nafar').bind('click', function(e){
        //as when we click inside the menu it bubbles up and closes the menu when it hits html we have to stop the propagation while its open
        e.stopPropagation();

    });

    $('body').click(function () {

        $('.main-navigation__sub-menu').hide();
        $('.main-navigation__sub-menu2').hide();
        $('.button-chevron').removeClass('rotate');
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

        $('.main-navigation__sub-menu2').toggle();
        $('.button-chevron-2').toggleClass('rotate');
        $('.main-navigation__sub-menu').hide();
        $('.button-chevron').removeClass('rotate');

    });

    $('ul.mainMenu > li > a').find('span').parent('a').addClass('arrow');

    function createRoomHotel(roomCount) {
        var HtmlCode = "";
        var i = 1;
        var numberText = "اول";

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
        var numberTextChild = "سلام";
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
        var roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");
        $(this).parents(".myroom-hotel-item").remove();
        var countRoom = parseInt($('#countRoom').val()) - 1;
        $("#countRoom option:selected").prop("selected", false);
        $("#countRoom option[value=" + countRoom + "]").prop("selected", true);
        var numberRoom = 1;
        var numberText = "اول";
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
            var numberChild = 1;
            var inputNameSelectChildAge = $(this).find(".tarikh-tavalods .tarikh-tavalod-item");
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

            var roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");

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

            var roomNumber = $(this).parents(".myroom-hotel-item").data("roomnumber");

            var htmlBox = createBirthdayCalendar(inputNum, roomNumber);

            $(this).parents(".myroom-hotel-item-info").find(".tarikh-tavalods").html(htmlBox);
        } else {
            $(this).siblings(".countChild").val('0');
        }
    });

  $('.package-btn').click(function(){
    $(".blackContainer").fadeIn('slow');
    $('.package-p').fadeIn();
  });

      // date change PopUp
    $('.date').on("click",function(){
        $(".blackContainer").fadeIn('slow');
        $(".date-change").fadeIn('slow');
    });

    $('.close-date-change').on("click",function(){
        $(".blackContainer").fadeOut('slow');
        $(".date-change").fadeOut('slow');
    });



       // customer-information
       $('.c-icon,.i-icon').mouseenter(function(){
            $('.c-i').addClass('active-c-i');
       });
       $('.c-i').mouseleave(function(){
            $(this).removeClass('active-c-i');
       });


    // ===== Back to top scroll =====
    $(document).scroll(function () {
      var y = $(window).scrollTop();
      if (y > 300) {
        $('.backToTop').fadeIn('slow');
      } else {
        $('.backToTop').fadeOut('slow');
      }
    });

    $(".backToTop").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
    });
    
    // ===== Menu =====



    $('a.mobMenu').click (function(){
            $('.mainMenuContainer').animate({
                right:0
            },1000);
        });
    $('.close-menu').click (function(){
            $('.mainMenuContainer').animate({
                right:-550
            },1000);
        });

    $('.sp-inner h5').click(function(){
        $(this).parent().find('.sp-box').slideToggle();
    })

    
    
	// first sub menu
    if ($("ul.mainMenu > li").has("ul.subMenu")) {
        $("ul.mainMenu > li").has("ul.subMenu").children("a").prepend( "<span>+</span>" );
    }
    if ($("ul.mainMenu > li ul.subMenu li").has("ul")) {
        var thisParent2=$("ul.mainMenu > li ul.subMenu li").has('ul').parent();
        
        $("ul.mainMenu > li ul.subMenu li").has("ul").children("a").prepend( "<span>+</span>" );
    }


    if ($(window).width() <992 ) {
    $(".mainMenu > li").find('>a').click(function (e) {
        var mainItem=$(this).parent();
        if($(this).parent().find('>ul'))
        {
            mainItem.find('>.subMenu').slideToggle();
        }
    });
    $('ul.mainMenu > li ul.subMenu li a').click(function(){
        var thisParent= $(this).parent();
        thisParent.find('ul').slideToggle();
    });

	}

	// second sub menu
    if ($("ul.mainMenu > li").has("ul.subMenu")) {
        $("ul.mainMenu > li").has("ul.subMenu").find(".subsubMenu").prev("a").prepend( "<span>+</span>" );
        $("ul.subMenu>li").has("ul").find(" > li").prev("a").prepend( "<span>+</span>" );
    }


    $('.newsletter-btn').click(function(){
      $('.blackContainer').fadeIn();
      $('.p-newsletter').fadeIn();

    });
    $('.close-p,.blackContainer').click(function(){
      $('.blackContainer').fadeOut();
      $('.pop-up').fadeOut();
      $(".date-change").fadeOut('slow');

    });
    

	// ===== Menu Fix to Top =====
      if ($(window).width() >992)
        { 
         $(document).scroll(function () {
          var y = $(window).scrollTop();
          if (y > 5) {
            $('header').addClass('menu-fix');

          } else {
            $('header').removeClass('menu-fix');

          }
        });
   
}




});