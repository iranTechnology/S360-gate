$(document).ready(function () {
       
// switch
 if($("#switch-me").length > 0){
    $('#switch-me').switchy();
    $('.safar').on('click', function(){
      $('#switch-me').val($(this).attr('type')).change();
      $('.safar').removeClass('selected-cal');
        $(this).addClass('selected-cal');
    });
    $('#switch-me').on('change', function(){
      if ($(this).val() == '1'){
        $('.bargasht-cal').addClass('bargasht-calendar-disable');
        $('.bargasht-calendar input').val('');
        $('.two-way-btn').removeClass('selected-cal');
      $('.one-way-btn').addClass('selected-cal');
        
      } else if ($(this).val() == '0'){
      $('.bargasht-cal').removeClass('bargasht-calendar-disable');
      $('.one-way-btn').removeClass('selected-cal');
        $('.two-way-btn').addClass('selected-cal');
      }
    });


      $('#switch-me2').switchy();
    $('.safar').on('click', function(){
      $('#switch-me').val($(this).attr('type')).change();
      $('.safar').removeClass('selected-cal');
        $(this).addClass('selected-cal');
    });
    $('#switch-me').on('change', function(){
      if ($(this).val() == '1'){
        $('.bargasht-cal').addClass('bargasht-calendar-disable');
        $('.bargasht-calendar input').val('');
        $('.two-way-btn').removeClass('selected-cal');
      $('.one-way-btn').addClass('selected-cal');
        
      } else if ($(this).val() == '0'){
      $('.bargasht-cal').removeClass('bargasht-calendar-disable');
      $('.one-way-btn').removeClass('selected-cal');
        $('.two-way-btn').addClass('selected-cal');
      }
    });
}

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
                right:-20
            },700);
        });
    $('.close-menu').click (function(){
            $('.mainMenuContainer').animate({
                right:-545
            },700);
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
        $(".sp-inner h5").prepend( "<span>+</span>" );
    }
      
    


        //===========flight Date
       $( "#flightDate" ).click(function() {
                alert(date);
            //var data = $('#date').text();
            var date ="1395/دی/28";

            var arr = date.split("/");
            $("#txtCalendarFrom1Year").val(arr[0]);
            $("#txtCalendarFrom1Month").val(arr[1]);
            $("#txtCalendarFrom1Day").val(arr[2]);
        });
 

     // =============number input resutNumber

      function myFunction() {
          var x = document.getElementById("Demo");
          if (x.className.indexOf("w3-show") == -1) {
              x.className += " w3-show";
          } else { 
              x.className = x.className.replace(" w3-show", "");
          }
      }
     
      function add(value){
            var currentVal = parseInt($(".qty" + value).val());   
            var sumVal = parseInt($(".qty4").val()); 

            if (!isNaN(currentVal)) { 
              $(".qty" + value).val(currentVal + 1);
              $(".qty4").val(sumVal + 1);
            }

        };

        function minus(value){
            var currentVal = parseInt($(".qty" + value).val());
            var sumVal = parseInt($(".qty4").val()); 

            if (!isNaN(currentVal)) {
                $(".qty" + value).val(currentVal - 1);
               $(".qty4").val(sumVal - 1);
            }
        };

        function closeOver(f, value){
            return function(){
                f(value);
            };
        }

        $(function () {
            var numButtons = 4;    
            for (var i = 1; i <= numButtons; i++) {
                $("#add" + i).click(closeOver(add, i));
                $("#minus" + i).click(closeOver(minus, i));
            }
        });


      $(".flightSearchBox ").click(function(){
              $(this).find(".arzan-flight-btn").toggleClass("displayBlock");
              $("#lightboxContainer").toggleClass("lightboxContainerOpacity");

           });
      $("#lightboxContainer").click(function(){
         $("#lightboxContainer").removeClass("lightboxContainerOpacity");
          $("#lightboxContainer").toggleClass("lightboxContainerOpacity");
          });

      $(".max-reng").text($(".addui-slider-handle-h div span").text());   
      $("body").delegate(".addui-slider-handle-h", "mousemove",function(){
          var maxRange= $(".addui-slider-handle-h div span").text();
          $(".max-reng").text(maxRange);
      });
      
      $(".min-rang").text($(".addui-slider-handle-l div span").text());
      $("body").delegate(".addui-slider-handle-l", "mousemove",function(){
          var minRange= $(".addui-slider-handle-l div span").text();
          $(".min-rang").text(minRange);
      });

});
