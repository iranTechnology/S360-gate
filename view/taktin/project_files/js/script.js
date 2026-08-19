$(document).ready(function () {

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

// wow
  wow = new WOW();
  wow.init();

// slider









});