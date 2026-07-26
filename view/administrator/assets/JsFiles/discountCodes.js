$(document).ready(function () {

    $('.js-switch').each(function() {
        new Switchery($(this)[0], $(this).data());
    });

    $("#DiscountCodesAdd").validate({
        rules: {
            Title:'required',
            // Amount: required,
            StartDate:'required',
            EndDate:'required',
            Stock: {
                required: true,
                number: true,
            },
            limit_point_club:{
                required: {
                    depends: function (element) {
                        return $('input#limit_point_club').is(':checked');
                    }
                },
            }
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
            if (!validateDiscount()) {
                return false;
            }
            $(form).ajaxSubmit({
                url: amadeusPath + 'user_ajax.php',
                type: "post",
                success: function (response) {

                    var res = response.split(':');

                    if (response.indexOf('success') > -1) {
                        $.toast({
                            heading: 'افزودن کد تخفیف جدید',
                            text: res[1],
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'success',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });
                        setTimeout(function(){
                            window.location ='discountCodes';
                        }, 1000);
                    } else {
                        $.toast({
                            heading: 'افزودن کد تخفیف جدید',
                            text: res[1],
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'error',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });

                    }


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

    $("#DiscountCodesEdit").validate({
        rules: {
            Title:'required',
            Amount:'required',
            StartDate:'required',
            EndDate:'required',
            Stock: {
                required: true,
                number: true,
            }
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
                url: amadeusPath + 'user_ajax.php',
                type: "post",
                success: function (response) {
                    var res = response.split(':');

                    if (response.indexOf('success') > -1) {
                        $.toast({
                            heading: 'ویرایش کد تخفیف',
                            text: res[1],
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'success',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });
                        setTimeout(function(){
                            window.location ='discountCodes';
                        }, 1000);
                    } else {
                        $.toast({
                            heading: 'ویرایش کد تخفیف',
                            text: res[1],
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'error',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });

                    }


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

    //generate output of excel file
    $('#discountCodesExcel').DataTable({
        "order": [
            [0, 'asc']
        ],
        dom: 'lBfrtip',
        buttons: [
            {
                extend: 'excel',
                text: 'دریافت فایل اکسل',
                exportOptions: {}
            }
        ]
    });

});
function validateDiscount() {
    var cashValue = $('#discountAmountCash').val().trim();
    var percentValue = $('#discountAmountPercent').val().trim();
    var typeDiscount = $('#typeDiscount').val();

    console.log('validateDiscount - typeDiscount:', typeDiscount);
    console.log('validateDiscount - cashValue:', cashValue);
    console.log('validateDiscount - percentValue:', percentValue);

    // ========== چک کردن اینکه حداقل یکی پر شده ==========
    if (cashValue === '' && percentValue === '') {
        $.toast({
            heading: 'خطا',
            text: 'لطفاً حداقل یکی از فیلدهای تخفیف (ریال یا درصد) را پر کنید',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'error',
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6
        });
        return false;
    }

    // ========== چک کردن نوع تخفیف ==========
    if (typeDiscount === '') {
        $.toast({
            heading: 'خطا',
            text: 'نوع تخفیف مشخص نیست',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'error',
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6
        });
        return false;
    }

    // ========== اگر درصد هست، بیشتر از ۱۰۰ نباشه ==========
    if (typeDiscount === 'percent') {
        var percentNum = parseFloat(percentValue);
        if (percentNum > 100) {
            $.toast({
                heading: 'خطا',
                text: 'درصد تخفیف نمی‌تواند بیشتر از ۱۰۰ باشد',
                position: 'top-right',
                loaderBg: '#fff',
                icon: 'error',
                hideAfter: 3500,
                textAlign: 'right',
                stack: 6
            });
            return false;
        }
        if (percentNum <= 0) {
            $.toast({
                heading: 'خطا',
                text: 'درصد تخفیف باید بزرگتر از صفر باشد',
                position: 'top-right',
                loaderBg: '#fff',
                icon: 'error',
                hideAfter: 3500,
                textAlign: 'right',
                stack: 6
            });
            return false;
        }
    }

    // ========== اگر ریال هست، بزرگتر از صفر باشه ==========
    if (typeDiscount === 'cash') {
        var cashNum = parseFloat(cashValue);
        if (cashNum <= 0) {
            $.toast({
                heading: 'خطا',
                text: 'مبلغ تخفیف باید بزرگتر از صفر باشد',
                position: 'top-right',
                loaderBg: '#fff',
                icon: 'error',
                hideAfter: 3500,
                textAlign: 'right',
                stack: 6
            });
            return false;
        }
    }

    return true;
}
function activate(id)
{
    $.post(amadeusPath + 'user_ajax.php',
        {
            id: id,
            flag: 'ActivateDiscountCode'
        },
        function (data) {

            var res = data.split(':');
            if (data.indexOf('success') > -1)
            {
                $.toast({
                    heading: 'وضعیت کد تخفیف',
                    text: res[1],
                    position: 'top-right',
                    loaderBg: '#fff',
                    icon: 'success',
                    hideAfter: 3500,
                    textAlign: 'right',
                    stack: 6
                });

            } else
            {
                $.toast({
                    heading: 'وضعیت کد تخفیف',
                    text: res[1],
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

function ModalShowBook(reserveType, factorNumber) {

    if(reserveType == 'Flight'){
        $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalShowBook',
            Param: factorNumber
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
    }
    else if(reserveType == 'Hotel')
    {
        $.post(libraryPath + 'ModalCreatorForHotel.php',
        {
            Controller: 'bookhotelshow',
            Method: 'ModalShowBook',
            Param: factorNumber
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
    }
    else if(reserveType == 'Insurance')
    {
        $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookingInsurance',
            Method: 'ModalShowInsuranceBook',
            Param: factorNumber
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
    }
    else if(reserveType == 'Europcar')
    {
        $.post(libraryPath + 'ModalCreatorForEuropcar.php',
        {
            Method: 'ModalShowBook',
            factorNumber: factorNumber
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
    }
    else if(reserveType == 'Tour')
    {
        $.post(libraryPath + 'ModalCreatorForTour.php',
        {
            Method: 'ModalShowBook',
            factorNumber: factorNumber
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
    }
    else if(reserveType == 'Visa')
    {
        $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookingVisa',
            Method: 'ModalShowVisaBook',
            Param: factorNumber
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
    }
}

function deleteCode(id)
{
    $.confirm({
        theme: 'supervan' ,// 'material', 'bootstrap'
        title: 'حذف تغییرات',
        icon: 'fa fa-trash',
        content: 'آیا از حذف تغییرات اطمینان دارید',
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
                            flag: 'discountCodeDelete',
                            id: id
                        },
                        function (data) {

                            var res = data.split(':');

                            if (data.indexOf('success') > -1)
                            {

                                $.toast({
                                    heading: 'حذف تغییرات',
                                    text: res[1],
                                    position: 'top-right',
                                    loaderBg: '#fff',
                                    icon: 'success',
                                    hideAfter: 3500,
                                    textAlign: 'right',
                                    stack: 6
                                });

                                setTimeout(function () {
                                    location.reload();
                                }, 1000);

                            }else {
                                $.toast({
                                    heading: 'حذف تغییرات',
                                    text: res[1],
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
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange'
            }
        }
    });
}

function showAmountPointDiscountCode(){
    if ($('#is_consume').is(':checked')) {
        $('.limit-point-club').show()
    }else{
        $('.limit-point-club').hide()
    }

}
function handleDiscountInput(element) {
    var cashInput = $('#discountAmountCash');
    var percentInput = $('#discountAmountPercent');
    var typeDiscountHidden = $('#typeDiscount');
    var percentAlert = $('#percentAlert');

    var cashValue = cashInput.val().trim();
    var percentValue = percentInput.val().trim();

    // ========== مدیریت فعال/غیرفعال کردن ==========
    if (cashValue !== '' && cashValue !== '0') {
        // اگر مبلغ ریالی پر شده
        percentInput.prop('disabled', true);
        percentInput.val('');
        typeDiscountHidden.val('cash');  // ← مقدار رو به cash تنظیم کن
        percentAlert.hide();

        cashInput.attr('name', 'Amount');
        percentInput.removeAttr('name');

    } else if (percentValue !== '' && percentValue !== '0') {
        // اگر درصد پر شده
        cashInput.prop('disabled', true);
        cashInput.val('');
        typeDiscountHidden.val('percent');  // ← مقدار رو به percent تنظیم کن
        percentAlert.show();

        percentInput.attr('name', 'Amount');
        cashInput.removeAttr('name');

    } else {
        // هر دو خالی
        cashInput.prop('disabled', false);
        percentInput.prop('disabled', false);
        typeDiscountHidden.val('cash');  // ← پیش‌فرض cash
        percentAlert.hide();

        cashInput.attr('name', 'Amount');
        percentInput.removeAttr('name');
    }


}

// ========== اعتبارسنجی ورودی (فقط عدد) ==========
$('#discountAmountCash, #discountAmountPercent').on('keypress', function(e) {
    var key = e.which;
    if (key < 48 || key > 57) {
        if (key !== 8 && key !== 0) {
            e.preventDefault();
            return false;
        }
    }
});

// ========== حذف کاما و تبدیل به عدد ==========
$('#discountAmountCash, #discountAmountPercent').on('blur', function() {
    var value = $(this).val();
    if (value !== '') {
        value = value.replace(/,/g, '').replace(/\s/g, '');
        $(this).val(value);
    }
});

// ========== دریافت مقدار Amount برای ارسال ==========
function getDiscountAmount() {
    var typeDiscount = $('#typeDiscount').val();

    if (typeDiscount === 'cash') {
        return $('#discountAmountCash').val().trim() || '0';
    } else if (typeDiscount === 'percent') {
        return $('#discountAmountPercent').val().trim() || '0';
    }

    return '0';
}
