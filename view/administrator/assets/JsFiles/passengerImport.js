$(document).ready(function () {
   const form = $('#passengerImportForm')
   const fileInput = $('#passengerImportFile')
   const checkButton = $('#passengerImportCheckBtn')
   const applyButton = $('#passengerImportApplyBtn')
   const resultBox = $('#passengerImportResult')

   // با تغییر فایل، نتیجه بررسی قبلی دیگر معتبر نیست
   fileInput.on('change', function () {
      resultBox.html('')
      applyButton.hide()
   })

   form.on('submit', function (e) {
      e.preventDefault()
      sendPassengerImport('checkExcel')
   })

   applyButton.on('click', function () {
      $.confirm({
         theme: 'supervan',
         title: 'ثبت نهایی مسافران',
         icon: 'fa fa-check',
         content: 'آیا از ثبت مسافران این فایل و ثبت نام آن‌ها در سیستم اطمینان دارید؟',
         rtl: true,
         closeIcon: true,
         type: 'green',
         buttons: {
            confirm: {
               text: 'تایید',
               btnClass: 'btn-green',
               action: function () {
                  sendPassengerImport('applyExcel')
               }
            },
            cancel: {
               text: 'انصراف',
               btnClass: 'btn-orange'
            }
         }
      })
   })

   function sendPassengerImport(method) {
      if (!fileInput[0].files.length) {
         renderPassengerImportErrors('لطفا ابتدا فایل اکسل را انتخاب نمایید', [])
         return
      }

      $('#passengerImportMethod').val(method)
      const formData = new FormData(form[0])

      toggleLoading(true, method)
      $.ajax({
         url: amadeusPath + 'ajax',
         type: 'POST',
         data: formData,
         processData: false,
         contentType: false,
         dataType: 'json',
         success: function (response) {
            handlePassengerImportResponse(method, response)
         },
         error: function (xhr) {
            const message = xhr.responseJSON && xhr.responseJSON.message
               ? xhr.responseJSON.message
               : 'خطا در ارتباط با سرور، لطفا مجددا تلاش نمایید'
            renderPassengerImportErrors(message, [])
         },
         complete: function () {
            toggleLoading(false, method)
         }
      })
   }

   function handlePassengerImportResponse(method, response) {
      const data = response.data || {}

      if (response.success) {
         if (data.applied) {
            applyButton.hide()
            fileInput.val('')
            resultBox.html(
               '<div class="alert alert-success m-t-20">' +
               '<p><i class="fa fa-check-circle"></i> ' + escapeHtml(response.message) + '</p>' +
               '<a class="btn btn-sm btn-info" href="' + $('#passengerImportBackLink').val() + '">بازگشت به لیست مسافران</a>' +
               '</div>'
            )
            return
         }

         resultBox.html(
            '<div class="alert alert-success m-t-20"><i class="fa fa-check-circle"></i> ' + escapeHtml(response.message) + '</div>' +
            renderPreviewTable(data.preview || [])
         )
         applyButton.show()
         return
      }

      applyButton.hide()
      let message = response.message
      if (data.applied) {
         // بخشی از ردیف‌ها ثبت شده‌اند؛ ارسال دوباره همین فایل ردیف‌های ثبت شده را تکراری اعلام می‌کند
         message += '. ردیف‌های ثبت شده را از فایل حذف کنید، خطای بقیه ردیف‌ها را برطرف کنید و فایل را دوباره آپلود کنید'
      }
      renderPassengerImportErrors(message, data.errors || [])
   }

   function renderPassengerImportErrors(message, errors) {
      let html = '<div class="alert alert-danger m-t-20">' +
         '<p><b><i class="fa fa-exclamation-triangle"></i> ' + escapeHtml(message) + '</b></p>'

      if (errors.length) {
         html += '<p>تعداد ردیف‌های دارای خطا: ' + errors.length + '</p><ul class="m-b-0">'
         errors.forEach(function (error) {
            let title = error.row > 0 ? 'ردیف ' + error.row + ' فایل' : 'خطای کلی'
            if (error.name) {
               title += ' (' + escapeHtml(error.name) + ')'
            }
            html += '<li class="m-b-10"><b>' + title + ':</b><ul>'
            error.messages.forEach(function (text) {
               html += '<li>' + escapeHtml(text) + '</li>'
            })
            html += '</ul></li>'
         })
         html += '</ul>'
      }

      html += '<p class="m-t-10 m-b-0">لطفا ابتدا خطاهای بالا را در فایل اکسل برطرف کرده و سپس فایل اصلاح شده را مجددا آپلود نمایید.</p></div>'
      resultBox.html(html)
   }

   function renderPreviewTable(rows) {
      if (!rows.length) {
         return ''
      }
      let html = '<div class="table-responsive"><table class="table table-striped table-bordered">' +
         '<thead><tr><th>ردیف فایل</th><th>نام</th><th>نام لاتین</th><th>ملیت</th><th>کد ملی/شماره پاسپورت</th><th>تاریخ تولد</th><th>موبایل</th><th>ایمیل</th><th>اعتبار</th></tr></thead><tbody>'
      rows.forEach(function (row) {
         html += '<tr>' +
            '<td>' + escapeHtml(row.row) + '</td>' +
            '<td>' + escapeHtml(row.name) + '</td>' +
            '<td>' + escapeHtml(row.name_en) + '</td>' +
            '<td>' + escapeHtml(row.nationality) + '</td>' +
            '<td>' + escapeHtml(row.code) + '</td>' +
            '<td>' + escapeHtml(row.birthday) + '</td>' +
            '<td>' + escapeHtml(row.mobile) + '</td>' +
            '<td>' + escapeHtml(row.email) + '</td>' +
            '<td>' + escapeHtml(row.credit) + '</td>' +
            '</tr>'
      })
      return html + '</tbody></table></div>'
   }

   function toggleLoading(isLoading, method) {
      checkButton.prop('disabled', isLoading)
      applyButton.prop('disabled', isLoading)
      fileInput.prop('disabled', isLoading)
      const button = method === 'applyExcel' ? applyButton : checkButton
      if (isLoading) {
         button.data('text', button.html()).html('<i class="fa fa-spinner fa-spin"></i> لطفا صبر کنید...')
      } else if (button.data('text')) {
         button.html(button.data('text'))
      }
   }

   function escapeHtml(value) {
      return $('<div>').text(value === undefined || value === null ? '' : String(value)).html()
   }
})
