// let lat = 31.877226886703863;
// let lon = 54.36041360798489;

// // initialize map
// map = L.map('g-map').setView([lat, lon], 15);
// // set map tiles source
// L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
//     attribution: '',
//     maxZoom: 16,
//     minZoom: 14,
// }).addTo(map);
// // add marker to the map
// marker = L.marker([lat, lon]).addTo(map);
// // add popup to the marker
// marker.bindPopup("یزد ، میدان مهدیه ، بلوار امام جعفر صادق ، کوچه شهید باهنر ، پلاک آب ").openPopup();






$("#scroll-top").addClass('d-my-none');
// fade in #back-top
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-top').addClass('d-my-flex');
            $('#scroll-top').removeClass('d-my-none');
        } else {
            $('#scroll-top').removeClass('d-my-flex');
            $('#scroll-top').addClass('d-my-none');
        }
    });
    // scroll body to 0px on click
    $('#scroll-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 800);
    });
});

function clickScroll(e){
    $("html").animate({
        scrollTop: $(`#${e}`).offset().top - 200
    }, 1000);
}

$('.destinations-iran-owl').owlCarousel({
    rtl:true,
    loop:true,
    margin:10,
    nav:false,
    navText: ["<span class='fas fa-chevron-right'></span>","<span class='fas fa-chevron-left'></span>"],
    autoplay: false,
    autoplayTimeout: 5000,
    autoplaySpeed:3000,
    dots:true,
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
$('.tour-owl').owlCarousel({
    rtl:true,
    loop:true,
    margin:10,
    nav:false,
    navText: ["<span class='fas fa-chevron-right'></span>","<span class='fas fa-chevron-left'></span>"],
    autoplay: false,
    autoplayTimeout: 5000,
    autoplaySpeed:3000,
    dots:true,
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
$('.problem-owl').owlCarousel({
    rtl:true,
    loop:true,
    margin:10,
    nav:false,
    navText: ["<span class='fas fa-chevron-right'></span>","<span class='fas fa-chevron-left'></span>"],
    autoplay: false,
    autoplayTimeout: 5000,
    autoplaySpeed:3000,
    dots:true,
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

$('.honors-owl').owlCarousel({
    rtl:true,
    loop:true,
    margin:10,
    nav:false,
    navText: ["<span class='fas fa-chevron-right'></span>","<span class='fas fa-chevron-left'></span>"],
    autoplay: true,
    autoplayTimeout: 5000,
    autoplaySpeed:3000,
    dots:true,
    responsive:{
        0:{
            items:2
        },
        600:{
            items:4
        },
        1000:{
            items:5
        }
    }
});
$.extend( $.fn, {

    // https://jqueryvalidation.org/validate/
    validate: function( options ) {

        // If nothing is selected, return nothing; can't chain anyway
        if ( !this.length ) {
            if ( options && options.debug && window.console ) {
                console.warn( "Nothing selected, can't validate, returning nothing." );
            }
            return;
        }

        // Check if a validator for this form was already created
        var validator = $.data( this[ 0 ], "validator" );
        if ( validator ) {
            return validator;
        }

        // Add novalidate tag if HTML5.
        this.attr( "novalidate", "novalidate" );

        validator = new $.validator( options, this[ 0 ] );
        $.data( this[ 0 ], "validator", validator );

        if ( validator.settings.onsubmit ) {

            this.on( "click.validate", ":submit", function( event ) {

                // Track the used submit button to properly handle scripted
                // submits later.
                validator.submitButton = event.currentTarget;

                // Allow suppressing validation by adding a cancel class to the submit button
                if ( $( this ).hasClass( "cancel" ) ) {
                    validator.cancelSubmit = true;
                }

                // Allow suppressing validation by adding the html5 formnovalidate attribute to the submit button
                if ( $( this ).attr( "formnovalidate" ) !== undefined ) {
                    validator.cancelSubmit = true;
                }
            } );

            // Validate the form on submit
            this.on( "submit.validate", function( event ) {
                if ( validator.settings.debug ) {

                    // Prevent form submit to be able to see console output
                    event.preventDefault();
                }
                function handle() {
                    var hidden, result;

                    // Insert a hidden input as a replacement for the missing submit button
                    // The hidden input is inserted in two cases:
                    //   - A user defined a `submitHandler`
                    //   - There was a pending request due to `remote` method and `stopRequest()`
                    //     was called to submit the form in case it's valid
                    if ( validator.submitButton && ( validator.settings.submitHandler || validator.formSubmitted ) ) {
                        hidden = $( "<input type='hidden'/>" )
                          .attr( "name", validator.submitButton.name )
                          .val( $( validator.submitButton ).val() )
                          .appendTo( validator.currentForm );
                    }

                    if ( validator.settings.submitHandler ) {
                        result = validator.settings.submitHandler.call( validator, validator.currentForm, event );
                        if ( hidden ) {

                            // And clean up afterwards; thanks to no-block-scope, hidden can be referenced
                            hidden.remove();
                        }
                        if ( result !== undefined ) {
                            return result;
                        }
                        return false;
                    }
                    return true;
                }

                // Prevent submit for invalid forms or custom submit handlers
                if ( validator.cancelSubmit ) {
                    validator.cancelSubmit = false;
                    return handle();
                }
                if ( validator.form() ) {
                    if ( validator.pendingRequest ) {
                        validator.formSubmitted = true;
                        return false;
                    }
                    return handle();
                } else {
                    validator.focusInvalid();
                    return false;
                }
            } );
        }

        return validator;
    },

    // https://jqueryvalidation.org/valid/
    valid: function() {
        var valid, validator, errorList;

        if ( $( this[ 0 ] ).is( "form" ) ) {
            valid = this.validate().form();
        } else {
            errorList = [];
            valid = true;
            validator = $( this[ 0 ].form ).validate();
            this.each( function() {
                valid = validator.element( this ) && valid;
                if ( !valid ) {
                    errorList = errorList.concat( validator.errorList );
                }
            } );
            validator.errorList = errorList;
        }
        return valid;
    },

    // https://jqueryvalidation.org/rules/
    rules: function( command, argument ) {
        var element = this[ 0 ],
          settings, staticRules, existingRules, data, param, filtered;

        // If nothing is selected, return empty object; can't chain anyway
        if ( element == null ) {
            return;
        }

        if ( !element.form && element.hasAttribute( "contenteditable" ) ) {
            element.form = this.closest( "form" )[ 0 ];
            element.name = this.attr( "name" );
        }

        if ( element.form == null ) {
            return;
        }

        if ( command ) {
            settings = $.data( element.form, "validator" ).settings;
            staticRules = settings.rules;
            existingRules = $.validator.staticRules( element );
            switch ( command ) {
                case "add":
                    $.extend( existingRules, $.validator.normalizeRule( argument ) );

                    // Remove messages from rules, but allow them to be set separately
                    delete existingRules.messages;
                    staticRules[ element.name ] = existingRules;
                    if ( argument.messages ) {
                        settings.messages[ element.name ] = $.extend( settings.messages[ element.name ], argument.messages );
                    }
                    break;
                case "remove":
                    if ( !argument ) {
                        delete staticRules[ element.name ];
                        return existingRules;
                    }
                    filtered = {};
                    $.each( argument.split( /\s/ ), function( index, method ) {
                        filtered[ method ] = existingRules[ method ];
                        delete existingRules[ method ];
                    } );
                    return filtered;
            }
        }

        data = $.validator.normalizeRules(
          $.extend(
            {},
            $.validator.classRules( element ),
            $.validator.attributeRules( element ),
            $.validator.dataRules( element ),
            $.validator.staticRules( element )
          ), element );

        // Make sure required is at front
        if ( data.required ) {
            param = data.required;
            delete data.required;
            data = $.extend( { required: param }, data );
        }

        // Make sure remote is at back
        if ( data.remote ) {
            param = data.remote;
            delete data.remote;
            data = $.extend( data, { remote: param } );
        }

        return data;
    }
} );

function validateFeedbackForm(name,family,email,message) {

    // Validate name (non-empty)
    if (name.trim() === '') {
        alert('Please enter your name.');
        return false;
    }


    // Validate name (non-empty)
    if (family.trim() === '') {
        alert('Please enter your family.');
        return false;
    }

    // Validate email (using HTML5 built-in validation)
    if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
        alert('Please enter a valid email address.');
        return false;
    }

    // Validate message (non-empty)
    if (message.trim() === '') {
        alert('Please enter your message.');
        return false;
    }

    // If all validations pass, the form will submit
    return true;
}
function submitFeedback() {
    var name = $('#feedback-name').val() + $('#feedback-family').val();
    var family = $('#feedback-family').val();
    var phone = $('#feedback-phone').val();
    var email = $('#feedback-Email').val();
    var message = $('#feedback-Message').val();
    var type = 'feedback';
    var check  = validateFeedbackForm(name,family,email,message)
    if (check) {

        $.post(amadeusPath + 'user_ajax.php',
          {
              name: name,
              phone: phone,
              email: email,
              message: message,
              type: type,
              flag: 'contactUs',
          },
          function(data) {
              console.log(data)
              var res = JSON.parse(data);
              if (res.success) {
                  $.alert({
                      title: 'S360FeedBack',
                      icon: 'fa fa-check',
                      content: res.message,
                      rtl: true,
                      type: 'green'
                  });

                  $('#feedback-name').val('');
                  $('#feedback-family').val('');
                  $('#feedback-phone').val('');
                  $('#feedback-Email').val('');
                  $('#feedback-Message').val('');
              } else {
                  $.alert({
                      title: 'S360FeedBack',
                      icon: 'fa fa-user',
                      content: res.message,
                      rtl: true,
                      type: 'red'
                  });
              }
              $("#fcf-button").html('contactSendMessage');
              $('#fcf-button').prop('disabled', false);
          })
    }

}


$('.close_room').click(function () {

    $(".myhotels-rooms").removeClass('active_p');
});


function validateContactForm(name,family,phone,email,message) {

    // Validate name (non-empty)
    if (name.trim() === '') {
        alert('Please enter your name.');
        return false;
    }
    // Validate name (non-empty)
    if (family.trim() === '') {
        alert('Please enter your family.');
        return false;
    }

    // Validate email (using HTML5 built-in validation)
    if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
        alert('Please enter a valid email address.');
        return false;
    }

    const phoneRegex = /^(?:\+?\d{1,3})?[ -]?\d{10}$/; // Adjust the regex as needed
    if (!phone.match(phoneRegex)) {
        alert('Please enter a valid phone number for whatsapp.');
        return false;
    }

    // Validate message (non-empty)
    if (message.trim() === '') {
        alert('Please enter your message.');
        return false;
    }

    // If all validations pass, the form will submit
    return true;
}
function submitContact() {
    $("#fcf-button").html('Pleasewait');
    $('#fcf-button').prop('disabled', true);
    var name = $('#contactUs-name').val() + $('#contactUs-family').val();
    var family = $('#contactUs-family').val();
    var phone = $('#contactUs-phone').val();
    var email = $('#contactUs-Email').val();
    var message = $('#contactUs-Message').val();
    var type = 'feedback';
    var check  = validateContactForm(name,family,phone,email,message)
    if (check) {

        $.post(amadeusPath + 'user_ajax.php',
          {
              name: name,
              phone: phone,
              email: email,
              message: message,
              flag: 'contactUs',
          },
          function(data) {
              var res = JSON.parse(data);
              if (res.success) {
                  $.alert({
                      title: 'S360FeedBack',
                      icon: 'fa fa-check',
                      content: res.message,
                      rtl: true,
                      type: 'green'
                  });

                  $('#contactUs-name').val('');
                  $('#contactUs-family').val('');
                  $('#contactUs-phone').val('');
                  $('#contactUs-Email').val('');
                  $('#contactUs-Message').val('');
              } else {
                  $.alert({
                      title: 'S360FeedBack',
                      icon: 'fa fa-user',
                      content: res.message,
                      rtl: true,
                      type: 'red'
                  });
              }
              $("#fcf-button").html('contactSendMessage');
              $('#fcf-button').prop('disabled', false);
          })
    }

}

$(document).ready(function(){

    $('body').click(function() {
        $('.main-navigation__sub-menu2').removeClass('d-flex');
        $('.main-navigation__sub-menu2').addClass('d-none');
    });

    $('.main-navigation__button2').click(function(e) {
        e.stopPropagation();
        $('.main-navigation__sub-menu2').toggleClass('d-flex');
    });

});

