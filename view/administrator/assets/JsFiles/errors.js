
function AddError(_this) {

   let itemCount = _this[0].dataset.counter;
   let displayAgencyId = `displayAgency${itemCount}`;
   let displayPassengerId = `displayPassenger${itemCount}`;
   let displayAdminId = `displayAdmin${itemCount}`
   let providerErrorId = `providerError${itemCount}`
   let displayAgency = document.getElementById(displayAgencyId).value;
   let displayPassenger = document.getElementById(displayPassengerId).value;
   let displayAdmin = document.getElementById(displayAdminId).value
   let displayProviderError = document.getElementById(providerErrorId).value

   $.ajax({
      url: `${amadeusPath}ajax`,
      data: JSON.stringify({
         method: 'updateErrorFlight',
         className: 'errors',
         id: itemCount,
         displayAgency: displayAgency,
         displayPassenger: displayPassenger,
         displayAdmin: displayAdmin,
         displayProviderError: displayProviderError,
      }),
      type: 'POST',
      dataType: 'JSON',
      success: function(response) {
         if (response.success === true) {
            $.toast({
               heading: 'ویرایش ارور',
               text: response.message.message,
               position: 'top-right',
               icon: 'success',
               hideAfter: 3500,
               textAlign: 'right',
               stack: 6,
            })
         } else {
            $.toast({
               heading: 'ویرایش ارور',
               text: response.message.message,
               position: 'top-right',
               icon: 'error',
               hideAfter: 3500,
               textAlign: 'right',
               stack: 6,
            })
         }
      }
   })
}

function AddNewError(keepForm = false) {
   let providerError = document.getElementById('newProviderError').value;
   let displayAdmin = document.getElementById('newDisplayAdmin').value;
   let displayAgency = document.getElementById('newDisplayAgency').value;
   let displayPassenger = document.getElementById('newDisplayPassenger').value;
   let sourceCode = document.getElementById('newSourceCode').value;
   let methodData = document.getElementById('methodData').value;

   if (!providerError.trim()) {
      $.toast({
         heading: 'خطا',
         text: 'لطفاً متن خطا را وارد کنید',
         position: 'top-right',
         icon: 'error',
         hideAfter: 3500,
         textAlign: 'right',
      });
      return;
   }

   let submitBtn = document.getElementById('submitNewErrorBtn');
   submitBtn.disabled = true;
   submitBtn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> در حال ثبت...';

   $.ajax({
      url: `${amadeusPath}ajax`,
      data: JSON.stringify({
         method: 'insertNewErrorWithManual',
         className: 'errors',
         providerError: providerError,
         displayAdmin: displayAdmin,
         displayAgency: displayAgency,
         displayPassenger: displayPassenger,
         sourceCode: sourceCode,
         methodData: methodData,
      }),
      type: 'POST',
      dataType: 'JSON',
      success: function(response) {
         submitBtn.disabled = false;
         submitBtn.innerHTML = '<i class="fa fa-check"></i> ثبت خطا';

         if (response.success === true) {
            $.toast({
               heading: 'افزودن ارور',
               text: response.message.message || 'خطا با موفقیت ثبت شد',
               position: 'top-right',
               icon: 'success',
               hideAfter: 3500,
               textAlign: 'right',
               stack: 6,
            });
            window.location.reload();
            if (!keepForm) {
               // خالی کردن فرم
               document.getElementById('newProviderError').value = '';
               document.getElementById('newDisplayAdmin').value = '';
               document.getElementById('newDisplayAgency').value = '';
               document.getElementById('newDisplayPassenger').value = '';
               document.getElementById('newSourceCode').value = ''; // ریست به مقدار پیشفرض
               document.getElementById('methodData').value = '';
            }

         } else {
            $.toast({
               heading: 'افزودن ارور',
               text: response.message.message || 'خطا در ثبت اطلاعات',
               position: 'top-right',
               icon: 'error',
               hideAfter: 3500,
               textAlign: 'right',
               stack: 6,
            });
         }
      },
      error: function(xhr, status, error) {
         submitBtn.disabled = false;
         submitBtn.innerHTML = '<i class="fa fa-check"></i> ثبت خطا';

         $.toast({
            heading: 'خطا',
            text: 'مشکل در ارتباط با سرور',
            position: 'top-right',
            icon: 'error',
            hideAfter: 3500,
            textAlign: 'right',
         });
      }
   });
}

// تابع برای ادامه افزودن
function AddNewErrorAndContinue() {
   AddNewError(true);
}