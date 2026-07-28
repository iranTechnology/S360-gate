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


    
        
  
});
