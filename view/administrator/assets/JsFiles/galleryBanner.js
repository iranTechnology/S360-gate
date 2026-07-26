
$(document).ready(function() {
  $('.dropify').dropify();
  $('.js-switch').each(function () {
    new Switchery($(this)[0], $(this).data());
  });

  $('#add_galleryBanner').validate({
    rules: {
      title: 'required',
      pic: 'required',
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
      //tinyMCE.triggerSave();
      $(form).ajaxSubmit({
        url: amadeusPath + 'ajax',
        type: 'POST',
        // mimeType: "multipart/form-data",
        // contentType: false,
        // processData: false,
        success: function(response) {
          // console.log(response);
          let displayIcon
          if (response.success === true) {
            displayIcon = 'success'
          } else {
            displayIcon = 'error'
          }

          $.toast({
            heading: 'گالری بنر',
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
              // window.location = `${amadeusPath}itadmin/galleryBanner/list`;
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

  $("#edit_gallery_banner").validate({
    rules: {
      title: 'required',
    },
    messages: {
    },
    errorElement: "em",
    errorPlacement: function (error, element) {
      // Add the `help-block` class to the error element
      error.addClass("help-block");

      if (element.prop("type") === "checkbox") {
        error.insertAfter(element.parent("label"));
      } else {
        error.insertAfter(element);
      }
    },
    submitHandler: function (form) {
      $(form).ajaxSubmit({
        url: amadeusPath + 'ajax',
        type: "post",
        success: function (response) {
          let displayIcon
          if (response.success === true) {
            displayIcon = 'success'
          } else {
            displayIcon = 'error'
          }

          $.toast({
            heading: 'گالری بنر',
            text: response.message,
            position: 'top-right',
            icon: displayIcon,
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6,
          })

          if (response.success === true) {
            setTimeout(function() {
              // location.reload()
              window.location = `${amadeusPath}itadmin/galleryBanner/list`;
            }, 1000)
          }
        },

        error:function(error) {
          $.toast({
            heading: 'ویرایش گالری بنر',
            text: error.responseJSON.message,
            position: 'top-right',
            loaderBg: '#fff',
            icon: error.responseJSON.status,
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6
          });
        }
      });
    },
    highlight: function (element, errorClass, validClass) {
      $(element).parents(".form-group ").addClass("has-error").removeClass("has-success");
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).parents(".form-group ").addClass("has-success").removeClass("has-error");
    }
  });

})


function updateStatusGalleryBanner(id){
  $.ajax({
    type: 'POST',
    url: amadeusPath + 'ajax',
    dataType: 'JSON',
    data:  JSON.stringify({
      className: 'galleryBanner',
      method: 'updateStatusGalleryBanner',
      id,
    })
    ,
    success: function (data) {
      $.toast({
        heading: 'تغییر وضعیت گالری بنر',
        text: data.message,
        position: 'top-right',
        loaderBg: '#fff',
        icon: 'success',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
      });

    },
    error:function(error) {
      $.toast({
        heading: 'تغییر وضعیت گالری بنر',
        text: error.responseJSON.message,
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



function deleteGalleryBanner(id){
  $.ajax({
    type: 'POST',
    url: amadeusPath + 'ajax',
    dataType: 'JSON',
    data:  JSON.stringify({
      className: 'galleryBanner',
      method: 'deleteGalleryBanner',
      id,
    }),
    success: function (data) {
      $.toast({
        heading: 'حذف وضعیت گالری بنر',
        text: data.message,
        position: 'top-right',
        loaderBg: '#fff',
        icon: 'success',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
      });

    },
    error:function(error) {
      $.toast({
        heading: 'حذف وضعیت گالری بنر',
        text: error.responseJSON.message,
        position: 'top-right',
        loaderBg: '#fff',
        icon: 'error',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
      });
    },
    complete: function() {
      setTimeout(function() {
        location.reload()
        // window.location = `${amadeusPath}itadmin/galleryBanner/list`;
      }, 1000)
    },
  });
}
$(document).on('click', '.deleteGalleryBanner', function(e) {
  e.preventDefault()
  if (confirm('آیا مطمئن هستید ؟')) {
    let id = $(this).data('id')
    deleteGalleryBanner(id)
  }
})

function change_order(){
  if (confirm('آیا از تغییر ترتیب موارد مطمئن هستید ؟')) {
    var inputs = document.querySelectorAll('input[name^="order["]');
    var values = {};

    inputs.forEach(function(input) {
      var name = input.name;
      var value = input.value;
      var match = name.match(/\[(\d+)\]/);
      if (match) {
        var numberInsideBrackets = match[1];
        console.log(numberInsideBrackets); // Output: "60"
      }
      values[numberInsideBrackets] = value;
    });
    $.ajax({
      type: 'POST',
      url: amadeusPath + 'ajax',
      dataType: 'JSON',
      data:  JSON.stringify({
        className: 'galleryBanner',
        method: 'changeOrder',
        data: values,
      }),
      success: function (data) {
        $.toast({
          heading: 'تغییر ترتیب',
          text: data.message,
          position: 'top-right',
          loaderBg: '#fff',
          icon: 'success',
          hideAfter: 3500,
          textAlign: 'right',
          stack: 6
        });

      },
      error:function(error) {
        $.toast({
          heading: 'تغییر ترتیب',
          text: error.responseJSON.message,
          position: 'top-right',
          loaderBg: '#fff',
          icon: 'error',
          hideAfter: 3500,
          textAlign: 'right',
          stack: 6
        });
      },
      complete: function() {
        setTimeout(function() {
          location.reload()
          // window.location = `${amadeusPath}itadmin/galleryBanner/list`;
        }, 1000)
      },
    });
  }
}

function changeIsShowBanner(is_show_banner){
  $.ajax({
    type: 'POST',
    url: amadeusPath + 'ajax',
    dataType: 'JSON',
    data:  JSON.stringify({
      className: 'galleryBanner',
      method: 'changeIsShowBanner',
      is_show_banner,
    })
    ,
    success: function (data) {
      $.toast({
        heading: 'تغییر نمایش بنر',
        text: data.message,
        position: 'top-right',
        loaderBg: '#fff',
        icon: 'success',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
      });

    },
    error:function(error) {
      $.toast({
        heading: 'تغییر نمایش بنر',
        text: error.responseJSON.message,
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


function toggleDivBanner(_this, is_show = true) {
  if (is_show) {
    _this.addClass("d-flex").removeClass("d-none")
  } else {
    _this.removeClass("d-flex").addClass("d-none")
  }
}

// تابع اصلی با پارامتر skipStatus (پیش‌فرض false)
function toggleableBanner(_this, status, skipStatus = false) {
  const name = _this.attr("name");
  const values = $('input[name="' + name + '"]');
  const value = $('input[name="' + name + '"]:checked').val();

  // ذخیره مقدار انتخاب شده در localStorage (برای استفاده در رفرش)
  if (value) {
    localStorage.setItem('selected_page_type', value);
  }

  let names = [];
  values.each(function () {
    names.push($(this).val());
  });

  // مخفی کردن همه بخش‌ها
  names.forEach(item => {
    toggleDivBanner($("." + item + "-toggleable"), false);
  });

  // نمایش بخش مربوط به مقدار انتخاب شده
  toggleDivBanner($("." + value + "-toggleable"));

  // فقط در صورتی که skipStatus == false باشد، changeIsShowBanner صدا زده می‌شود
  if (!skipStatus && typeof changeIsShowBanner === 'function') {
    changeIsShowBanner(status);
  }
}

// بازیابی وضعیت هنگام بارگذاری صفحه (رفرش)
$(document).ready(function() {
  var savedValue = localStorage.getItem('selected_page_type');
  if (savedValue) {
    var $radioToSelect = $('input[name="page_type"][value="' + savedValue + '"]');
    if ($radioToSelect.length) {
      $('input[name="page_type"]').prop('checked', false);
      $radioToSelect.prop('checked', true);
      var status = (savedValue === 'main_page') ? 1 : 0;
      // ارسال true به عنوان سومین پارامتر => changeIsShowBanner اجرا نمی‌شود
      toggleableBanner($radioToSelect, status, true);
    } else {
      $('input[name="page_type"][value="main_page"]').prop('checked', true);
      toggleableBanner($('input[name="page_type"][value="main_page"]'), 1, true);
    }
  } else {
    var $defaultRadio = $('input[name="page_type"]:checked');
    if ($defaultRadio.length === 0) {
      $defaultRadio = $('input[name="page_type"][value="main_page"]');
      $defaultRadio.prop('checked', true);
    }
    var defaultStatus = ($defaultRadio.val() === 'main_page') ? 1 : 0;
    toggleableBanner($defaultRadio, defaultStatus, true);
  }
});


function deleteSpecialPage(id){
  $.ajax({
    type: 'POST',
    url: amadeusPath + 'ajax',
    dataType: 'JSON',
    data:  JSON.stringify({
      className: "specialPages",
      method: "removeSpecialPage",
      id: id,
    }),
    success: function (data) {
      $.toast({
        heading: 'صفحات ویژه ',
        text: data.message,
        position: 'top-right',
        loaderBg: '#fff',
        icon: 'success',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
      });

    },
    error:function(error) {
      $.toast({
        heading: 'صفحات ویژه',
        text: error.responseJSON.message,
        position: 'top-right',
        loaderBg: '#fff',
        icon: 'error',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
      });
    },
    complete: function() {
      setTimeout(function() {
        location.reload()
        // window.location = `${amadeusPath}itadmin/rentCar/catList`;
      }, 1000)
    },
  });
}

$(document).on('click', '.deleteSpecialPage', function(e) {
  e.preventDefault()
  if (confirm('آیا مطمئن هستید ؟')) {
    let id = $(this).data('id')
    deleteSpecialPage(id)
  }
});
