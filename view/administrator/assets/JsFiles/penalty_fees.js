$(document).ready(function () {
  // ثبت
  $("#penaltyForm").validate({
    rules: {
      amount: "required",
    },
    messages: {
      amount: "لطفاً مبلغ به ریال وارد کنید",
    },
    submitHandler: function (form) {
      $.ajax({
        url: amadeusPath + 'ajax',
        type: "POST",
        data: JSON.stringify({
          className: 'penaltyFees',
          method: 'savePage',
          amount : $('#amount').val(),
          to_json: true
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
          if (response.status === "success" || response.status === true) {
            $.toast({
              heading: 'کارمزد جریمه',
              text: response.message || 'کارمزد با موفقیت ذخیره شد.',
              position: 'top-right',
              loaderBg: '#fff',
              icon: 'success',
              hideAfter: 3500,
              textAlign: 'right',
              stack: 6
            });

            $('#penaltyForm')[0].reset();
            setTimeout(function () {
              location.reload()
            }, 1000)
          } else {
            $.toast({
              heading: 'کارمزد جریمه',
              text: response.message || 'خطا در ذخیره کارمزد.',
              position: 'top-right',
              loaderBg: '#fff',
              icon: 'error',
              hideAfter: 3500,
              textAlign: 'right',
              stack: 6
            });
          }
        },
        error: function () {
          $.toast({
            heading: 'کارمزد جریمه',
            text: 'خطا در ارتباط با سرور.',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'error',
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6
          });
        }
      });
    }
  });
});
function deleteAccess(id) {
  if (confirm('آیا مطمئن هستید ؟')) {
    $.ajax({
      url:amadeusPath + 'ajax',
      data: JSON.stringify({
        className: "penaltyFees",
        method: "deletePenalty",
        id: id,
      }),
      type: "POST",
      dataType: "JSON",
      success: function (response) {
        if (response.success === true) {
          $.toast({
            heading: "حذف کارمزد جریمه",
            text: response.message,
            position: "top-right",
            icon: "success",
            hideAfter: 3500,
            textAlign: "right",
            stack: 6,
          })
        } else {
          $.toast({
            heading: "حذف کارمزد جریمه",
            text: response.message,
            position: "top-right",
            icon: "warning",
            hideAfter: 3500,
            textAlign: "right",
            stack: 6,
          })
        }
      },
      complete: function () {
        setTimeout(function () {
          location.reload()
        }, 1000)
      },
    })
  }
}
function isDigitPenalty(entry)
{
  var key = window.event.keyCode;
  if((key>=48 && key<=57) || key==122) {
    return true;
  } else {
    $.confirm({
      title: useXmltag("ErrorEnteringInformation"),
      content: useXmltag("Pleaseenteronlynumberfield"),
      autoClose: 'cancelAction|4000',
      escapeKey: 'cancelAction',
      type: 'red',
      buttons: {
        cancelAction: {
          text: useXmltag("Closing"),
          btnClass: 'btn-red'

        }
      }
    });
    return false;
  }
}

function separatorPenalty(txt){
  var iDistance = 3;
  var strChar = ",";
  var strValue = txt.value;

  if(strValue != 'undefined' &&  strValue.length>3){
    var str="";
    for(var i=0;i<strValue.length;i++){
      if(strValue.charAt(i)!=strChar){
        if ((strValue.charAt(i) >= 0) && (strValue.charAt(i) <= 9)){
          str=str+strValue.charAt(i);
        }
      }
    }

    strValue=str;
    var iPos = strValue.length;
    iPos -= iDistance;
    while(iPos>0){
      strValue = strValue.substr(0,iPos)+strChar+strValue.substr(iPos);
      iPos -= iDistance;
    }
  }
  txt.value=strValue;
}
