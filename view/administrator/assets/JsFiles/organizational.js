$(document).ready(function () {

    $('#upload_file').on('change', function() {
        var file = this.files[0];
        if (file) {
            var fileName = file.name;
            var fileSize = (file.size / 1024 / 1024).toFixed(2) + ' MB';

            // نمایش نام و حجم فایل
            $('#selectedFileName').text(fileName);
            $('#selectedFileSize').text(fileSize);

            // بررسی نوع فایل
            var fileType = file.type;
            var fileExtension = fileName.split('.').pop().toLowerCase();

            // اگر عکس بود، پیش‌نمایش نمایش داده شود
            if (fileType.startsWith('image/') || ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(fileExtension)) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#filePreview').attr('src', e.target.result).show();
                    $('#fileIcon').hide();
                };
                reader.readAsDataURL(file);
            } else {
                // اگر فایل PDF یا غیرعکس بود
                $('#filePreview').hide();
                $('#fileIcon').show();

                // آیکون مناسب بر اساس نوع فایل
                if (fileExtension === 'pdf') {
                    $('#fileIcon').removeClass().addClass('fa fa-file-pdf-o').css('color', '#dc3545');
                } else if (['doc', 'docx'].includes(fileExtension)) {
                    $('#fileIcon').removeClass().addClass('fa fa-file-word-o').css('color', '#2b5797');
                } else if (['xls', 'xlsx'].includes(fileExtension)) {
                    $('#fileIcon').removeClass().addClass('fa fa-file-excel-o').css('color', '#217346');
                } else {
                    $('#fileIcon').removeClass().addClass('fa fa-file-o').css('color', '#6b7280');
                }
                $('#fileIcon').show();
            }

            // نمایش باکس فایل انتخاب شده
            $('#fileSelected').show();
            $('.file-label').hide();
        }
    });
    $('.js-switch').each(function() {
        new Switchery($(this)[0], $(this).data());
    });

        CKEDITOR.replace('rules',{
            allowedContent: true,
            autoParagraph: true,
        });
// ============================================
// اعتبارسنجی فرم افزودن دسته بندی
// ============================================
    $("#organizationCategoryAdd").validate({
        rules: {
            title: 'required',
            description: 'required',
            job_guide: 'required',
            rules: 'required',
        },
        messages: {},
        errorElement: "em",
        errorPlacement: function (error, element) {
            error.addClass("help-block");
            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
        },
        submitHandler: function (form) {
            // ذخیره دکمه و متن اصلی
            var submitBtn = $(form).find('button[type="submit"]');
            var originalText = submitBtn.html();

            // تغییر متن دکمه و اضافه کردن لودر
            submitBtn.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> در حال ثبت...')
                .prop('disabled', true)
                .addClass('disabled');

            // به‌روزرسانی CKEditor
            if (CKEDITOR.instances.rules) {
                CKEDITOR.instances.rules.updateElement();
            }

            // جمع‌آوری داده‌های فرم
            var formData = $(form).serializeArray();
            var data = {};

            $.each(formData, function(i, field) {
                data[field.name] = field.value;
            });

            // پارامترهای مورد نیاز برای افزودن
            data.className = 'organizationalCategory';
            data.method = 'organizationCategoryAdd';
            data.to_json = true;

            // ارسال به صورت JSON
            $.ajax({
                url: amadeusPath + 'ajax',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'JSON',
                data: JSON.stringify(data),
                success: function(response) {
                    response = response.data;
                    let displayIcon = response.result_status === 'success' ? 'success' : 'error';

                    $.toast({
                        heading: 'دسته بندی سازمانی',
                        text: response.result_message || response.message,
                        position: 'top-right',
                        icon: displayIcon,
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });

                    if (response.result_status === 'success' || response.success === true) {
                        submitBtn.html(originalText)
                            .prop('disabled', false)
                            .removeClass('disabled');

                        setTimeout(function() {
                            window.location = 'categoryList';
                        }, 1000);
                    } else {
                        submitBtn.html(originalText)
                            .prop('disabled', false)
                            .removeClass('disabled');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Ajax Error:', error);
                    submitBtn.html(originalText)
                        .prop('disabled', false)
                        .removeClass('disabled');

                    $.toast({
                        heading: 'خطا',
                        text: 'مشکلی در ارتباط با سرور پیش آمده است.',
                        position: 'top-right',
                        icon: 'error',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                }
            });
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
        }
    });

// ============================================
// اعتبارسنجی فرم ویرایش دسته بندی
// ============================================
    $("#organizationCategoryEdit").validate({
        rules: {
            title: 'required',
            description: 'required',
            job_guide: 'required',
            rules: 'required',
        },
        messages: {},
        errorElement: "em",
        errorPlacement: function (error, element) {
            error.addClass("help-block");
            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
        },
        submitHandler: function (form) {
            // ذخیره دکمه و متن اصلی
            var submitBtn = $(form).find('button[type="submit"]');
            var originalText = submitBtn.html();

            // تغییر متن دکمه و اضافه کردن لودر
            submitBtn.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> در حال ویرایش...')
                .prop('disabled', true)
                .addClass('disabled');

            // به‌روزرسانی CKEditor
            if (CKEDITOR.instances.rules) {
                CKEDITOR.instances.rules.updateElement();
            }

            // جمع‌آوری داده‌های فرم
            var formData = $(form).serializeArray();
            var data = {};

            $.each(formData, function(i, field) {
                data[field.name] = field.value;
            });

            // پارامترهای مورد نیاز برای ویرایش
            data.className = 'organizationalCategory';
            data.method = 'organizationCategoryEdit';  // ✅ متد update برای ویرایش
            data.to_json = true;

            // ارسال به صورت JSON
            $.ajax({
                url: amadeusPath + 'ajax',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'JSON',
                data: JSON.stringify(data),
                success: function(response) {
                    response = response.data;
                    let displayIcon = response.result_status === 'success' ? 'success' : 'error';

                    $.toast({
                        heading: 'دسته بندی سازمانی',
                        text: response.result_message || response.message,
                        position: 'top-right',
                        icon: displayIcon,
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });

                    if (response.result_status === 'success' || response.success === true) {
                        submitBtn.html(originalText)
                            .prop('disabled', false)
                            .removeClass('disabled');

                        setTimeout(function() {
                            window.location = 'categoryList';
                        }, 1000);
                    } else {
                        submitBtn.html(originalText)
                            .prop('disabled', false)
                            .removeClass('disabled');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Ajax Error:', error);
                    submitBtn.html(originalText)
                        .prop('disabled', false)
                        .removeClass('disabled');

                    $.toast({
                        heading: 'خطا',
                        text: 'مشکلی در ارتباط با سرور پیش آمده است.',
                        position: 'top-right',
                        icon: 'error',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                }
            });
        },
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
        }
    });

});
function removeSelectedFile() {
    $('#upload_file').val('');
    $('#fileSelected').hide();
    $('.file-label').show();
    $('#filePreview').hide().attr('src', '');
    $('#fileIcon').hide();
}
function activate(id) {
    $.post(amadeusPath + 'user_ajax.php',
        {
            id: id,
            flag: 'changeStatusOrganizationalCategory'
        },
        function (data) {
            // داده ها به صورت JSON می آیند
            try {
                var res = typeof data === 'object' ? data : JSON.parse(data);

                if (res.result_status === 'success') {
                    $.toast({
                        heading: 'وضعیت',
                        text: res.result_message,
                        position: 'top-right',
                        loaderBg: '#fff',
                        icon: 'success',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                } else {
                    $.toast({
                        heading: 'وضعیت',
                        text: res.result_message,
                        position: 'top-right',
                        loaderBg: '#fff',
                        icon: 'error',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                }
            } catch (e) {
                // اگر خطایی در parse رخ داد
                $.toast({
                    heading: 'خطا',
                    text: 'خطا در پردازش پاسخ',
                    position: 'top-right',
                    loaderBg: '#fff',
                    icon: 'error',
                    hideAfter: 3500,
                    textAlign: 'right',
                    stack: 6
                });
            }
        }
    );
}
// تابع تایید کاربر

function acceptUser(id) {
    $.confirm({
        theme: 'supervan',
        title: 'تایید کاربر',
        icon: 'fa fa-check',
        content: 'آیا از تایید این کاربر مطمئن هستید؟',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'تایید و آپلود فایل',
                btnClass: 'btn-green',
                action: function () {
                    $('#upload_user_id').val(id);
                    resetUploadForm();
                    $('#uploadFileModal').modal('show');
                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange',
            }
        }
    });
}

// ============================================
// کدهای مودال آپلود فایل
// ============================================
$(document).ready(function() {

    // کلیک روی دکمه آپلود
    $('#submitUploadBtn').on('click', function(e) {
        e.preventDefault();
        submitUploadForm();
    });

    // ارسال فرم با Enter
    $('#uploadFileForm').on('keypress', function(e) {
        if (e.which === 13) {
            e.preventDefault();
            submitUploadForm();
        }
    });

    // ریست فرم هنگام بستن مودال
    $('#uploadFileModal').on('hidden.bs.modal', function() {
        resetUploadForm();
    });

    // نمایش نام فایل انتخاب شده
    $('#upload_file').on('change', function() {
        var fileName = $(this).val().split('\\').pop();
        if (fileName) {
            // نمایش نام فایل در کنار input
            $(this).next('.file-name').remove();
            $(this).after('<span class="file-name text-success mr-2">' + fileName + '</span>');
        }
    });
});

// ============================================
// تابع ریست فرم
// ============================================
function resetUploadForm() {
    $('#uploadFileForm')[0].reset();
    $('#upload_file').removeClass('is-invalid');
    $('.invalid-feedback').hide();
    $('.file-name').remove();
    $('#uploadProgress').addClass('d-none');
    $('#uploadProgress .progress-bar').css('width', '0%').text('0%');
    $('#submitUploadBtn').prop('disabled', false).html('<i class="fa fa-check"></i> تایید و آپلود');
}

// ============================================
// تابع ارسال فرم
// ============================================
function submitUploadForm() {
    var fileInput = $('#upload_file');
    var file = fileInput[0].files[0];

    // اعتبارسنجی فایل
    if (!file) {
        showFileError('لطفاً یک فایل انتخاب کنید');
        return;
    }

    // بررسی حجم فایل (حداکثر 5 مگابایت)
    if (file.size > 5 * 1024 * 1024) {
        showFileError('حجم فایل بیشتر از 5 مگابایت است');
        return;
    }

    // بررسی نوع فایل
    var allowedExtensions = ['pdf', 'jpg', 'jpeg'];
    var fileExtension = file.name.split('.').pop().toLowerCase();
    if (!allowedExtensions.includes(fileExtension)) {
        showFileError('نوع فایل مجاز نیست. فرمت‌های مجاز: ' + allowedExtensions.join(', '));
        return;
    }

    // حذف خطاهای قبلی
    fileInput.removeClass('is-invalid');
    $('.invalid-feedback').hide();

    // آماده‌سازی برای ارسال
    var formData = new FormData($('#uploadFileForm')[0]);
    formData.append('flag', 'acceptUserOrganizationalCategory');

    // نمایش progress bar
    $('#uploadProgress').removeClass('d-none');
    $('#submitUploadBtn').prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> در حال آپلود...');

    // ارسال با Ajax
    $.ajax({
        url: amadeusPath + 'user_ajax.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        xhr: function() {
            var xhr = new window.XMLHttpRequest();
            xhr.upload.addEventListener('progress', function(e) {
                if (e.lengthComputable) {
                    var percent = Math.round((e.loaded / e.total) * 100);
                    $('#uploadProgress .progress-bar').css('width', percent + '%').text(percent + '%');
                }
            });
            return xhr;
        },
        success: function(response) {
            console.log('Response:', response);

            // بستن مودال
            $('#uploadFileModal').modal('hide');
            resetUploadForm();

            // پردازش پاسخ
            try {
                var data = typeof response === 'string' ? JSON.parse(response) : response;

                if (data.result_status === 'success' || data.success === true) {
                    $.toast({
                        heading: 'تایید کاربر',
                        text: data.result_message || data.message || 'کاربر با موفقیت تایید شد',
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                    setTimeout(function() {
                        location.reload();
                    }, 1500);
                } else {
                    $.toast({
                        heading: 'خطا در تایید کاربر',
                        text: data.result_message || data.message || 'مشکلی در تایید کاربر رخ داد',
                        position: 'top-right',
                        icon: 'error',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                }
            } catch (e) {
                // اگر پاسخ به صورت متن بود
                if (response.indexOf('success') > -1) {
                    var res = response.split(':');
                    $.toast({
                        heading: 'تایید کاربر',
                        text: res[1] || 'کاربر با موفقیت تایید شد',
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                    setTimeout(function() {
                        location.reload();
                    }, 1500);
                } else {
                    $.toast({
                        heading: 'خطا در تایید کاربر',
                        text: response || 'مشکلی در تایید کاربر رخ داد',
                        position: 'top-right',
                        icon: 'error',
                        hideAfter: 3500,
                        textAlign: 'right',
                        stack: 6
                    });
                }
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);

            $('#uploadProgress').addClass('d-none');
            $('#submitUploadBtn').prop('disabled', false).html('<i class="fa fa-check"></i> تایید و آپلود');

            $.toast({
                heading: 'خطا در ارتباط با سرور',
                text: 'لطفاً مجدداً تلاش کنید',
                position: 'top-right',
                icon: 'error',
                hideAfter: 3500,
                textAlign: 'right',
                stack: 6
            });
        }
    });
}

// ============================================
// تابع نمایش خطای فایل
// ============================================
function showFileError(message) {
    var fileInput = $('#upload_file');
    fileInput.addClass('is-invalid');

    var feedback = fileInput.next('.invalid-feedback');
    feedback.html(message).show();

    $.toast({
        heading: 'خطا در فایل',
        text: message,
        position: 'top-right',
        icon: 'error',
        hideAfter: 3500,
        textAlign: 'right',
        stack: 6
    });
}

// تابع رد کاربر
function rejectUser(id) {
    $.confirm({
        theme: 'supervan',
        title: 'رد کاربر',
        icon: 'fa fa-times',
        content: 'آیا از رد این کاربر مطمئن هستید؟',
        rtl: true,
        closeIcon: true,
        type: 'red',
        buttons: {
            confirm: {
                text: 'رد',
                btnClass: 'btn-red',
                action: function () {
                    $.post(amadeusPath + 'user_ajax.php',
                        {
                            id: id,
                            flag: 'rejectUserOrganizationalCategory'
                        },
                        function (data) {
                            console.log(data);

                            if (typeof data === 'string') {
                                try {
                                    var jsonData = JSON.parse(data);
                                    if (jsonData.result_status === 'success') {
                                        $.toast({
                                            heading: 'رد کاربر',
                                            text: jsonData.result_message,
                                            position: 'top-right',
                                            icon: 'success',
                                            hideAfter: 3500,
                                            textAlign: 'right',
                                            stack: 6
                                        });
                                        setTimeout(function() {
                                            location.reload();
                                        }, 1500);
                                    } else {
                                        $.toast({
                                            heading: 'خطا در رد کاربر',
                                            text: jsonData.result_message,
                                            position: 'top-right',
                                            icon: 'error',
                                            hideAfter: 3500,
                                            textAlign: 'right',
                                            stack: 6
                                        });
                                    }
                                } catch (e) {
                                    var res = data.split(':');
                                    var status = res[0] ? res[0].trim() : '';
                                    var message = res[1] ? res[1].trim() : '';

                                    if (status === 'success') {
                                        $.toast({
                                            heading: 'رد کاربر',
                                            text: message,
                                            position: 'top-right',
                                            icon: 'success',
                                            hideAfter: 3500,
                                            textAlign: 'right',
                                            stack: 6
                                        });
                                        setTimeout(function() {
                                            location.reload();
                                        }, 1500);
                                    } else {
                                        $.toast({
                                            heading: 'خطا در رد کاربر',
                                            text: message || 'مشکلی در رد کاربر رخ داد',
                                            position: 'top-right',
                                            icon: 'error',
                                            hideAfter: 3500,
                                            textAlign: 'right',
                                            stack: 6
                                        });
                                    }
                                }
                            }
                        }
                    );
                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange',
            }
        }
    });
}
function deleteRecord(id)
{
    $.confirm({
        theme: 'supervan' ,// 'material', 'bootstrap'
        title: 'حذف رکورد',
        icon: 'fa fa-trash',
        content: 'آیا از حذف رکورد اطمینان دارید',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'تایید',
                btnClass: 'btn-green',
                action: function () {
                    $.post(amadeusPath + 'user_ajax.php',
                    {
                        flag: 'organizationDelete',
                        id: id
                    },
                    function (data) {

                        var res = data.split(':');

                        if (data.indexOf('success') > -1) {
                            var displayIcon = 'success';
                        } else {
                            var displayIcon = 'error';
                        }

                        $.toast({
                            heading: 'حذف رکورد',
                            text: res[1],
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: displayIcon,
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });

                        if (data.indexOf('success') > -1) {

                            setTimeout(function () {
                                location.reload();
                            }, 1000);
                        }
                    });
                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange'
            }
        }
    });
}