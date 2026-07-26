$(".select2").select2();

$('.select2-itadmin-login-register').select2({
    minimumResultsForSearch: Infinity
});

$(document).ready(function () {

    $('#ModalPublic').modal('show');

    let ClientId = $('#ClientId').val();

    if(ClientId !=="")
    {
        $('.LoginAuto').trigger('click');
    }

});

function LoginAdmin(){
    let username =$('#username').val();
    let password =$('#password').val();
    let member =$('#member').val();
    let captcha = $("#signup-captcha2").val();
    let type_manager = $('#typeManage').val();
    let client_id = $('#ClientId').val();


        if (captcha || client_id !== "") {
            $.post(amadeusPath + 'captcha/securimage_check.php',
                {
                    captchaAjax: captcha
                },
                function (data) {
                    if (data == true || client_id !== "") {

                        reloadCaptchaSignin2();
                        $.ajax({
                            type: 'POST',
                            url: amadeusPath + 'ajax',
                            dataType: 'JSON',
                            data:  JSON.stringify({
                                className: 'admin',
                                method: 'loginAdmin',
                                username,
                                password,
                                client_id,
                                type_manager,
                                member,
                            }),
                            success: function (response) {
                                $.toast({
                                    heading: 'ورود به پنل مدیریت',
                                    text: response.message,
                                    position: 'bottom-right',
                                    loaderBg: '#53e69d ',
                                    icon: 'success',
                                    hideAfter: 2000,
                                    textAlign: 'right',
                                    stack: 6
                                });
                                setTimeout(function () {
                                    window.location = 'admin';
                                }, 2500);

                            },
                            error:function(error) {
                                $.toast({
                                    heading: 'ورود به پنل مدیریت',
                                    text: error.responseJSON.message,
                                    position: 'bottom-right',
                                    loaderBg: '#ffcc00',
                                    icon: 'error',
                                    textAlign: 'right',
                                    hideAfter: 3000,
                                    stack: 6
                                });
                            }
                        });
                    } else {
                        reloadCaptchaSignin2();
                        $.toast({
                            heading: 'ورود به پنل مدیریت',
                            text: 'لطفا کد امنیتی را صحیح وارد نمائید',
                            position: 'bottom-right',
                            loaderBg: '#ffcc00',
                            icon: 'error',
                            textAlign: 'right',
                            hideAfter: 3000,
                            stack: 6
                        });
                    }
                })
        } else {
            $.toast({
                heading: 'ورود به پنل مدیریت',
                text: 'لطفا کد امنیتی را  وارد نمائید',
                position: 'bottom-right',
                loaderBg: '#ffcc00',
                icon: 'error',
                textAlign: 'right',
                hideAfter: 3000,
                stack: 6
            });
        }

}

function reloadCaptchaSignin2() {
    var capcha = amadeusPath + 'captcha/securimage_show.php?sid=' + Math.random();
    $("#captchaImage").attr("src", capcha);
}
// متغیرهای سراسری
let otpCountdown = null;
let isSendingOtp = false;

// تابع اصلی برای درخواست OTP
function authenticateInitDigitCode() {
    if (isSendingOtp) return;

    const username = $('#username').val();
    const type_manager = $('#typeManage').val();


    isSendingOtp = true;

    // تغییر حالت لینک ارسال مجدد
    const $resendLink = $('#sendotp a[onclick="authenticateInitDigitCode()"]');
    $resendLink.text('در حال ارسال...');
    $resendLink.css('pointer-events', 'none');

    // درخواست ارسال OTP
    $.ajax({
        url: amadeusPath + 'ajax',
        type: 'POST',
        dataType: 'JSON',
        data: JSON.stringify({
            className: 'admin',
            method: 'sendAdminLoginOtp',
            username: username,
            type_manager: type_manager,
            to_json: true
        }),
        success: function(response) {
            let message = '';
            let status = '';

            if (typeof response === 'string') {
                try {
                    const parsed = JSON.parse(response);
                    message = parsed.message || parsed.result?.message || '';
                    status = parsed.status || parsed.result?.status || '';
                } catch(e) {
                    message = response;
                }
            } else if (response.data && typeof response.data === 'string') {
                try {
                    const parsed = JSON.parse(response.data);
                    message = parsed.message || response.message || '';
                    status = parsed.status || response.status || '';
                } catch(e) {
                    message = response.message || '';
                    status = response.status || '';
                }
            } else {
                message = response.message || response.result?.message || '';
                status = response.status || response.result?.status || '';
            }

            if (status === 'success') {
                $('#loginform').hide();
                $('#sendotp').show();

                // ریست و شروع تایمر
                resetOtpTimer();
                startOtpTimer(120);

                $.toast({
                    heading: 'کد تایید',
                    text: message || 'کد تایید ارسال شد',
                    icon: 'success',
                    hideAfter: 3000,
                    position: 'bottom-right'
                });

                $('#code').focus();
            } else {
                $.toast({
                    heading: 'خطا',
                    text: message || 'خطا در ارسال کد',
                    icon: 'error',
                    hideAfter: 3000,
                    position: 'bottom-right'
                });
                // ریست لینک ارسال مجدد
                $resendLink.text('ارسال مجدد کد');
                $resendLink.css('pointer-events', 'auto');
            }
            isSendingOtp = false;
        },
        error: function(error) {
            let msg = error.responseJSON?.message || 'خطا در ارتباط با سرور';
            $.toast({
                heading: 'خطا',
                text: msg,
                icon: 'error',
                hideAfter: 3000
            });
            $resendLink.text('ارسال مجدد کد');
            $resendLink.css('pointer-events', 'auto');
            isSendingOtp = false;
        }
    });
}

// تابع ریست تایمر
function resetOtpTimer() {
    if (otpCountdown) {
        clearInterval(otpCountdown);
        otpCountdown = null;
    }
    $('.otp-timer').remove();

    // ریست لینک ارسال مجدد
    const $resendLink = $('#sendotp a[onclick="authenticateInitDigitCode()"]');
    $resendLink.text('ارسال مجدد کد');
    $resendLink.css('pointer-events', 'auto');
    $resendLink.removeClass('disabled');

    // فعال کردن دکمه تایید و ورود
    const $loginBtn = $('#sendotp .LoginAuto');
    $loginBtn.prop('disabled', false);
    $loginBtn.text('تایید و ورود');
}

// تایمر شمارش معکوس
function startOtpTimer(seconds) {
    let remaining = seconds;

    // حذف تایمر قبلی
    $('.otp-timer').remove();

    // غیرفعال کردن لینک ارسال مجدد
    const $resendLink = $('#sendotp a[onclick="authenticateInitDigitCode()"]');
    $resendLink.css('pointer-events', 'none');
    $resendLink.addClass('text-muted');
    $resendLink.removeClass('text-primary');

    // غیرفعال کردن دکمه تایید و ورود (اختیاری)
    const $loginBtn = $('#sendotp .LoginAuto');


    // اضافه کردن تایمر به صفحه
    const timerHtml = '<div class="otp-timer text-center m-t-10 bg-white">' +
        '<span class="text-muted">زمان باقیمانده: </span>' +
        '<span id="otp-timer-countdown" class="text-danger font-weight-bold"></span>' +
        '</div>';

    // قرار دادن تایمر قبل از دکمه‌ها
    $('#sendotp .form-group.text-center').before(timerHtml);

    // پاک کردن تایمر قبلی
    if (otpCountdown) {
        clearInterval(otpCountdown);
    }

    otpCountdown = setInterval(function() {
        if (remaining <= 0) {
            clearInterval(otpCountdown);
            otpCountdown = null;

            // به روز رسانی نمایش تایمر
            $('#otp-timer-countdown').text('منقضی شد');

            // فعال کردن لینک ارسال مجدد
            $resendLink.text('ارسال مجدد کد');
            $resendLink.css('pointer-events', 'auto');
            $resendLink.removeClass('text-muted');
            $resendLink.addClass('text-primary');

            // فعال کردن دکمه تایید و ورود (اما با پیام خطا)
            $loginBtn.prop('disabled', false);
            $loginBtn.text('تایید و ورود');

            // تغییر رنگ تایمر به نارنجی
            $('#otp-timer-countdown').css('color', '#ff9800');

            // اضافه کردن پیام انقضا
            $('.otp-timer').append('<div class="text-warning small mt-2">کد منقضی شد، لطفاً مجدداً درخواست کنید</div>');

        } else {
            let mins = Math.floor(remaining / 60);
            let secs = remaining % 60;
            let timeString = `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;

            $('#otp-timer-countdown').text(timeString);
            $resendLink.text(`ارسال مجدد (${timeString})`);
            remaining--;
        }
    }, 1000);
}

// تابع ورود با کد OTP
function loginWithOtp() {
    const code = $('#code').val().trim();
    const username = $('#username').val();
    const type_manager = $('#typeManage').val();
    const client_id = $('#ClientId').val();
    const member = $('#member').val();

    if (!code || code.length !== 4) {
        $.toast({
            heading: 'ورود به پنل مدیریت',
            text: 'لطفا کد 4 رقمی را وارد کنید',
            position: 'bottom-right',
            icon: 'error',
            textAlign: 'right',
            hideAfter: 3000
        });
        $('#code').val('').focus();
        return;
    }

    // غیرفعال کردن دکمه ورود هنگام ارسال
    const $loginBtn = $('#sendotp .LoginAuto');
    $loginBtn.prop('disabled', true);
    $loginBtn.text('در حال بررسی...');

    $.ajax({
        type: 'POST',
        url: amadeusPath + 'ajax',
        dataType: 'JSON',
        data: JSON.stringify({
            className: 'admin',
            method: 'loginAdminWithOtp',
            otp_code: code,
            username: username,
            type_manager: type_manager,
            client_id: client_id,
            member: member,
            to_json: true
        }),
        success: function(response) {
            let result = response;

            if (response.data && typeof response.data === 'string') {
                try {
                    result = JSON.parse(response.data);
                } catch(e) {
                    result = response;
                }
            }

            if (typeof response === 'string') {
                try {
                    result = JSON.parse(response);
                } catch(e) {
                    result = { status: 'error', message: response };
                }
            }

            $.toast({
                heading: 'ورود به پنل مدیریت',
                text: result.message || (result.status === 'success' ? 'ورود موفق' : 'خطا در ورود'),
                position: 'bottom-right',
                loaderBg: '#53e69d',
                icon: result.status === 'success' ? 'success' : 'error',
                hideAfter: 2000,
                textAlign: 'right',
                stack: 6
            });

            if (result.status === 'success') {
                setTimeout(function() {
                    window.location = 'changePassword';
                }, 2500);
            } else {
                $('#code').val('').focus();
                $loginBtn.prop('disabled', false);
                $loginBtn.text('تایید و ورود');
            }
        },
        error: function(error) {
            $.toast({
                heading: 'ورود به پنل مدیریت',
                text: error.responseJSON?.message || 'خطا در تایید کد',
                position: 'bottom-right',
                loaderBg: '#ffcc00',
                icon: 'error',
                textAlign: 'right',
                hideAfter: 3000,
                stack: 6
            });
            $('#code').val('').focus();
            $loginBtn.prop('disabled', false);
            $loginBtn.text('تایید و ورود');
        }
    });
}

// تابع بازگشت به فرم ورود
function backToLogin() {
    resetOtpTimer();
    $('#sendotp').hide();
    $('#loginform').show();
    $('#code').val('');
    $('#username').focus();
}

$(document).ready(function() {
   $('#sendotp').hide();
   $('#code').on('keypress', function(e) {
        if (e.which === 13) {
            loginWithOtp();
        }
    });

    $('<style>')
        .prop('type', 'text/css')
        .html(`
            .resend-disabled {
                pointer-events: none;
                opacity: 0.6;
                cursor: not-allowed;
            }
            .otp-timer {
                font-size: 14px;
                border-radius: 5px;
         
            }
        `)
        .appendTo('head');
});

// بازسازی کپچا
function reloadCaptchaSignin2() {
    var timestamp = new Date().getTime();
    $('#captchaImage').attr('src', amadeusPath + 'captcha/securimage_show.php?' + timestamp);
    $('#signup-captcha2').val('');
}

