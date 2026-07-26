function ModalShowContact(contactId) {
  $('#seenContact-'+contactId).addClass('btn-outline')
  $.post(libraryPath + 'ModalCreator.php',
      {
        Controller: 'contactUs',
        Method: 'ModalShowContact',
        Param: contactId
      },
      function (data) {

        $('#ModalPublic').html(data);

      }
  );
}

$('#editContactUs').validate({
  rules: {
    "status_id": {
      required: true,
    },
    'admin_response': {
      maxlength: 255
    },
  },
  messages: {},
  errorElement: 'em',
  errorPlacement: function(error, element) {
    // Add the `help-block` class to the error element
    error.addClass('help-block')

    if (element.prop('type') === 'checkbox') {
      error.insertAfter(element.parent('label'))
    } else {
      error.insertAfter(element)
    }
  },
  submitHandler: function(form) {
    $('#submit-button').prop('disabled', true);
    $(form).ajaxSubmit({
      url: amadeusPath + 'ajax',
      type: 'POST',
      success: function(response) {
        $('#submit-button').prop('disabled', false);
        // console.log(response);
        let displayIcon
        if (response.success === true) {
          displayIcon = 'success'
        } else {
          displayIcon = 'error'
        }

        $.toast({
          heading: 'تماس با ما',
          text: response.message,
          position: 'top-right',
          icon: displayIcon,
          hideAfter: 3500,
          textAlign: 'right',
          stack: 6,
        })

        if (response.success === true) {
          setTimeout(function() {
            location.reload()
            // window.location = `${amadeusPath}itadmin/articles/list`;
          }, 1000)
        }
      },
    })
  },
  highlight: function(element, errorClass, validClass) {
    $(element)
        .parents('.form-group ')
        .addClass('has-error')
        .removeClass('has-success')
  },
  unhighlight: function(element, errorClass, validClass) {
    $(element)
        .parents('.form-group ')
        .addClass('has-success')
        .removeClass('has-error')
  },
})


try {
  fetch(LANG_XML_URL)
      .then(r => r.text())
      .then(text => {
        var parser = new DOMParser();
        var xmlDoc = parser.parseFromString(text, "text/xml"); // تعریف صریح متغیر

        // بررسی اینکه آیا XML به درستی لود شده است
        if (xmlDoc.getElementsByTagName("parsererror").length === 0) {
          $("#Home").html(xmlDoc.getElementsByTagName("Home")[0].textContent);

          if (PAGE_NAME === "ListContact") {
            $("#Contactus").html(xmlDoc.getElementsByTagName("Contactus")[0].textContent);
            $("#PA_CO_LIST").html(xmlDoc.getElementsByTagName("PA_CO_LIST")[0].textContent);
            $("#PA_CO_LISTTITLE").html(xmlDoc.getElementsByTagName("PA_CO_LISTTITLE")[0].textContent);
            $("#Code").html(xmlDoc.getElementsByTagName("Code")[0].textContent);
            $("#Namefamily").html(xmlDoc.getElementsByTagName("Namefamily")[0].textContent);
            $("#Language").html(xmlDoc.getElementsByTagName("Language")[0].textContent);
            $("#Mobile").html(xmlDoc.getElementsByTagName("Mobile")[0].textContent);
            $("#TrackingCodeEnd").html(xmlDoc.getElementsByTagName("TrackingCodeEnd")[0].textContent);
            $("#Status").html(xmlDoc.getElementsByTagName("Status")[0].textContent);
            $("#Agency").html(xmlDoc.getElementsByTagName("Agency")[0].textContent);
            $("#Date").html(xmlDoc.getElementsByTagName("Date")[0].textContent);
            $("#Show").html(xmlDoc.getElementsByTagName("Show")[0].textContent);
            $(".PA_CO_REQUESTDETAIL").html(xmlDoc.getElementsByTagName("PA_CO_REQUESTDETAIL")[0].textContent);
            $(".PA_CO_STATUSNOTSEEN").html(xmlDoc.getElementsByTagName("PA_CO_STATUSNOTSEEN")[0].textContent);
            $(".PA_CO_STATUSSEEN").html(xmlDoc.getElementsByTagName("PA_CO_STATUSSEEN")[0].textContent);
            $(".PA_CO_STATUSACCEPT").html(xmlDoc.getElementsByTagName("PA_CO_STATUSACCEPT")[0].textContent);
            $(".PA_CO_STATUSREJECT").html(xmlDoc.getElementsByTagName("PA_CO_STATUSREJECT")[0].textContent);


            if ($.fn.DataTable.isDataTable('#myTable')) { //تنظیمات خالی بشه تا دوباره تنظیم کنیم
              $('#myTable').DataTable().destroy();
            }
            $('#myTable').DataTable({
              language: {
                search: xmlDoc.getElementsByTagName("Search")[0].textContent,
                lengthMenu: xmlDoc.getElementsByTagName("PA_CO_RESULTTABLE")[0].textContent,
                info: xmlDoc.getElementsByTagName("PA_CO_DT_INFO")[0].textContent,
                paginate: {
                  previous: xmlDoc.getElementsByTagName("PA_CO_DT_PREVIOUS")[0].textContent,
                  next: xmlDoc.getElementsByTagName("PA_CO_DT_NEXT")[0].textContent
                }
              }
            });
          }
          else if(PAGE_NAME === "EditContact") {
            $("#PA_CO_PAGEEDIT").html(xmlDoc.getElementsByTagName("PA_CO_PAGEEDIT")[0].textContent);
            $("#PA_CO_REQUESTDETAIL").text(xmlDoc.getElementsByTagName("PA_CO_REQUESTDETAIL")[0].textContent+' '+xmlDoc.getElementsByTagName("Contactus")[0].textContent);
            $("#PA_CO_REQUESTDETAIL_H2").html(xmlDoc.getElementsByTagName("PA_CO_REQUESTDETAIL")[0].textContent);
            $("#PA_CO_TITLEDETAIL").html(xmlDoc.getElementsByTagName("PA_CO_TITLEDETAIL")[0].textContent);
            $("#TitleTd").html(xmlDoc.getElementsByTagName("Title")[0].textContent);
            $("#BodyTD").html(xmlDoc.getElementsByTagName("Body")[0].textContent);
            $("#NamefamilyTd").html(xmlDoc.getElementsByTagName("Namefamily")[0].textContent);
            $("#LanguageTd").html(xmlDoc.getElementsByTagName("Language")[0].textContent);
            $("#MobileTd").html(xmlDoc.getElementsByTagName("Mobile")[0].textContent);
            $("#EmailTd").html(xmlDoc.getElementsByTagName("Email")[0].textContent);
            $("#PA_CO_REQUESTTEXT").text(xmlDoc.getElementsByTagName("PA_CO_REQUESTTEXT")[0].textContent);
            $("#PA_CO_ADMINRESULT").text(xmlDoc.getElementsByTagName("PA_CO_ADMINRESULT")[0].textContent);
            $("#PA_CO_REQUESTDATE").text(xmlDoc.getElementsByTagName("PA_CO_REQUESTDATE")[0].textContent);
            $("#RequestStatus").text(xmlDoc.getElementsByTagName("RequestStatus")[0].textContent);
            $("#PA_CO_ADMINNOTE").text(xmlDoc.getElementsByTagName("PA_CO_ADMINNOTE")[0].textContent);
            $("#submit-button").text(xmlDoc.getElementsByTagName("Save")[0].textContent);

          }

        }
      })
      .catch(error => {
        console.error("❌ خطا در دریافت فایل XML:", error);
      });

} catch (e) {
  console.error("❌ خطای کلی:", e);
}