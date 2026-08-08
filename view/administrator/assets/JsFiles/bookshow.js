$(document).ready(function () {

    // ('change', function () {
    //     alert($('button.btn-info[data-info=pendingBtn]').attr('data-target'));
    // });


    // data tables Option
    // $('#ticketHistory').DataTable({
    //     "order": [
    //         [0, 'desc']
    // ]});


    $("#SearchTransaction").validate({
        rules: {
            date_of: "required",
            to_date: "required"

        },
        messages: {},
        errorElement: "em",
        errorPlacement: function (error, element) {
            // Add the `help-block` class to the error element
            error.addClass("help-block");

            if(element.prop("type") === "checkbox"){
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
        },

        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group ").addClass("has-error").removeClass("has-success");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group ").addClass("has-success").removeClass("has-error");
        }
    });

    AlertUserCancel()
});

function ModalShowBook(RequestNumber) {


    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalShowBook',
            Param: RequestNumber
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}

function reReserve(factorNum, RequestNumber, dir) {
    return new Promise((resolve, reject) => {

        let RequestNumberObj = {};
        RequestNumberObj[dir] = RequestNumber;

        $.ajax({
            type: 'POST',
            url: amadeusPath + 'user_ajax.php',
            data: {
                flag: 'buyByCreditLocal',
                factorNum: factorNum,
                RequestNumber: RequestNumberObj
            },
            success: function (data) {
                if (data.indexOf('success') > -1) {
                    $.ajax({
                        url: amadeusPath + 'ajax',
                        type: 'POST',
                        dataType: 'JSON',
                        data: JSON.stringify({
                            method: 'bookFlight',
                            className: 'bookTicketFlight',
                            factorNumber: factorNum,
                            paymentType: 'credit',
                            trackingCode: '',
                            successPayment: '1',
                            paymentBank: ''
                        }),
                        success: function (data) {

                            resolve(true);

                        },
                        error: function () {
                            resolve(false);
                        }
                    });
                } else {
                    reject('creditError');
                }

            },
        });
    });
}

async function confirmReservationRequestAgain(el, RequestNumber, IdMember, SourceId, dir, factorNum) {
    $.confirm({
        theme: 'supervan',
        title: 'درخواست مجدد صدور رزرو',
        icon: 'fa fa-shopping-cart',
        content: 'آیا از درخواست مجدد برای صدور رزرو اطمینان دارید ؟',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'تایید',
                btnClass: 'btn-green',
                action: async function () {
                    let parentLoader = el.closest('td');
                    let loader = parentLoader.querySelector('.parent-ld');
                    let loaderLd = parentLoader.querySelector('.ld');
                    loader.style.display = 'block';
                    loaderLd.style.display = 'inline-block';

                    try {
                        let reBookResult = await reBook(el, RequestNumber, IdMember, SourceId, dir);

                        if (reBookResult) {
                            let priceChangeResponse = await hasChangePriceFlight(RequestNumber, factorNum);

                            if (priceChangeResponse.priceChanges && Object.keys(priceChangeResponse.priceChanges).length > 0) {
                                let message = '<div style="text-align: right; line-height: 2;">';
                                message += '<strong>تغییرات قیمت:</strong><br><br>';

                                for (let direction in priceChangeResponse.priceChanges) {
                                    let directionName =
                                        direction === 'dept'
                                            ? 'پرواز رفت'
                                            : direction === 'return'
                                                ? 'پرواز برگشت'
                                                : 'پرواز';
                                    message += '<strong>' + directionName + ':</strong><br>';

                                    priceChangeResponse.priceChanges[direction].forEach(function(change) {
                                        message += '• ' + change.message + '<br>';
                                    });

                                    message += '<br>';
                                }
                                message += '</div>';

                                $.confirm({
                                    theme: 'supervan',
                                    title: 'تغییر قیمت',
                                    icon: 'fa fa-exclamation-triangle',
                                    content: message,
                                    rtl: true,
                                    closeIcon: true,
                                    type: 'orange',
                                    buttons: {
                                        confirm: {
                                            text: 'تایید و ادامه',
                                            btnClass: 'btn-green',
                                            action: async function () {
                                                await proceedWithReserve(factorNum, RequestNumber, dir, loader, loaderLd);
                                            }
                                        },
                                        cancel: {
                                            text: 'انصراف',
                                            btnClass: 'btn-red',
                                            action: function() {
                                                loader.style.display = 'none';
                                                loaderLd.style.display = 'none';
                                            }
                                        }
                                    }
                                });
                            } else {
                                await proceedWithReserve(factorNum, RequestNumber, dir, loader, loaderLd);
                            }
                        } else {
                            $.toast({
                                heading: 'خطا در صدور',
                                text: 'صدور مجدد رزرو با خطا مواجه گردید',
                                position: 'top-right',
                                loaderBg: '#fff',
                                icon: 'error',
                                hideAfter: 4000,
                                textAlign: 'right',
                                stack: 6
                            });
                            loader.style.display = 'none';
                            loaderLd.style.display = 'none';
                        }
                    }
                    catch (error) {
                        if (error === 'creditError') {
                            $.toast({
                                heading: 'خطا در اعتبار',
                                text: 'اعتبار آژانس اصلی و یا آژانس زیر مجموعه جهت صدور رزرو کافی نیست',
                                position: 'top-right',
                                loaderBg: '#fff',
                                icon: 'error',
                                hideAfter: 4000,
                                textAlign: 'right',
                                stack: 6
                            });
                        } else {
                            $.toast({
                                heading: 'خطا',
                                text: 'خطای غیرمنتظره رخ داد',
                                position: 'top-right',
                                loaderBg: '#fff',
                                icon: 'error',
                                hideAfter: 4000,
                                textAlign: 'right',
                                stack: 6
                            });
                        }
                        loader.style.display = 'none';
                        loaderLd.style.display = 'none';
                    }
                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange',
            }
        }
    });
}

async function proceedWithReserve(factorNum, RequestNumber, dir, loader, loaderLd) {
    try {
        let reReserveResult = await reReserve(factorNum, RequestNumber, dir);

        if (reReserveResult) {
            $.toast({
                heading: 'صدور موفق',
                text: 'صدور مجدد رزرو با موفقیت انجام شد',
                position: 'top-right',
                loaderBg: '#fff',
                icon: 'success',
                hideAfter: 4000,
                textAlign: 'right',
                stack: 6
            });
        } else {
            $.toast({
                heading: 'خطا در صدور',
                text: 'صدور مجدد رزرو با خطا مواجه گردید',
                position: 'top-right',
                loaderBg: '#fff',
                icon: 'error',
                hideAfter: 4000,
                textAlign: 'right',
                stack: 6
            });
        }
    } catch (error) {
        $.toast({
            heading: 'خطا',
            text: 'خطای غیرمنتظره در صدور رزرو رخ داد',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'error',
            hideAfter: 4000,
            textAlign: 'right',
            stack: 6
        });
    }

    loader.style.display = 'none';
    loaderLd.style.display = 'none';

    setTimeout(() => {
        location.reload();
    }, 4000);
}

function reBook(el , RequestNumber , IdMember , SourceId , dir) {

    let RequestNumberObj = `{"${dir}":"${RequestNumber}"}`;
    let SourceIdObj = `{"${dir}":"${SourceId}"}`;

    return new Promise((resolve, reject) => {

        $.ajax({
            type: 'POST',
            url: amadeusPath + 'user_ajax.php',
            dataType: 'JSON',
            data: {
                flag: 'bookFlight',
                RequestNumber: RequestNumberObj,
                IdMember: IdMember,
                SourceId: SourceIdObj,
                CaptchaCode: '',
                CaptchaReturnCode: ''
            },
            success: function (data) {

                if (data.total_status == 'success' || data?.dept?.result_code == 'ERROR113') {
                    resolve(true);
                } else {
                    resolve(false);
                }
            },
            error: function () {
                resolve(false);
            }
        });

    });

}

function hasChangePriceFlight(RequestNum, factorNum) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: 'POST',
            url: amadeusPath + 'user_ajax.php',
            dataType: 'JSON',
            data: {
                flag: 'hasChangePriceFlight',
                RequestNum: RequestNum,
                factorNum: factorNum
            },
            success: function(response) {
                console.log('hasChangePriceFlight: ' , response)
                if (response.priceChanges && Object.keys(response.priceChanges).length > 0) {
                    let message = 'تغییرات قیمت:\n\n';

                    for (let direction in response.priceChanges) {
                        let directionName =
                            direction === 'dept'
                                ? 'پرواز رفت'
                                : direction === 'return'
                                    ? 'پرواز برگشت'
                                    : 'پرواز';
                        message += directionName + ':\n';

                        response.priceChanges[direction].forEach(function(change) {
                            message += '• ' + change.message + '\n';
                        });

                        message += '\n';
                    }

                }

                resolve(response); // اضافه شد
            },
            error: function(xhr, status, error) {
                reject(error); // اضافه شد
            }
        });
    });
}

function AddNote(RequestNumber,ClientID) {
    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalAddNote',
            Param: RequestNumber,
            ParamId: ClientID
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
}

function OpenChat(RequestNumber,Type,clientId) {
    document
        .querySelector('#ChatBtn' + RequestNumber)
        ?.parentNode
        .querySelector('span')
        ?.remove();

    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalChat',
            Param: {
                RequestNumber: RequestNumber,
                clientId: clientId
            },
            ParamId: Type
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
}


function ModalShowBookForFlight(RequestNumber) {


    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalShowBook',
            Param: RequestNumber
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}


function ModalSendSms(RequestNumber) {


    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalSendSms',
            Param: RequestNumber
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}


function ModalUploadProof(RequestNumber , type) {


    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalUploadProof',
            Param: {
                requestNumber : RequestNumber ,
                type : type
            }
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}


function ModalSendInteractiveSms(FactorNumber) {

    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalSendInteractiveSms',
            Param: FactorNumber
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}
function editInfoPassenger(RequestNumber, ClientId) {
    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'editInfoPassenger',
            Param: RequestNumber,
            ParamId: ClientId
        },
        function (data) {

            $('#ModalPublic').html(data);
            $("#flightDate").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
}

function insertPnr(RequestNumber, ClientId) {

    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'insertPnr',
            Param: RequestNumber,
            ParamId: ClientId
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}

function insertHotelPnr(RequestNumber, ClientId) {

    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'insertHotelPnr',
            Param: RequestNumber,
            ParamId: ClientId
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
}
function changePendingHotel(FactorNumber, ClientId) {

    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'changePendingHotel',
            Param: FactorNumber,
            ParamId: ClientId
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}

function FlightConvertToBook(RequestNumber, ClientId) {

    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'FlightConvertToBook',
            Param: RequestNumber,
            ParamId: ClientId
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}

function changeFlagBuyPrivate(RequestNumber) {

    $.post(amadeusPath + 'user_ajax.php',
        {
            RequestNumber: RequestNumber,
            flag: 'changeFlagBuyPrivate'
        },
        function (data) {

            if(data.indexOf('success') > -1){
                $('#i_Jump2StepPublic' + RequestNumber).removeClass('btn-info fa-shopping-cart tooltip-info').addClass('btn-danger fa-refresh tooltip-danger').attr('data-original-title', 'در حال رزرو بلیط');
            }

        });
}

function changeFlagBuySystemPublic(RequestNumber) {

    $.post(amadeusPath + 'user_ajax.php',
        {
            RequestNumber: RequestNumber,
            flag: 'changeFlagBuyPublicSystem'
        },
        function (data) {

            if(data.indexOf('success') > -1){
                $('#i_Jump2StepPublic' + RequestNumber).removeClass('btn-info fa-shopping-cart tooltip-info').addClass('btn-danger fa-refresh tooltip-danger').attr('data-original-title', 'در حال رزرو بلیط');
            }

        });
}

function changeFlagBuyPrivateToPublic(RequestNumber) {

    $.post(amadeusPath + 'user_ajax.php',
        {
            RequestNumber: RequestNumber,
            flag: 'changeFlagBuyPrivateToPublic'
        },
        function (data) {

            if(data.indexOf('success') > -1){
                $('#i_Jump2StepPublic' + RequestNumber).removeClass('btn-primary fa-shopping-cart tooltip-info').addClass('btn-danger fa-refresh tooltip-danger').attr('data-original-title', 'در حال رزرو بلیط');
            }

        });
}


function DoneIsPrivate(RequestNumber) {
    $.confirm({
        theme: 'supervan',// 'material', 'bootstrap'
        title: 'تایید  خرید پید اختصاصی',
        icon: 'fa fa-shopping-cart',
        content: 'آیا از قطعی بودن  این خرید اطمینان دارید',
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
                            RequestNumber: RequestNumber,
                            flag: 'done_private'
                        },
                        function (data) {
                            var res = data.split(':');

                            if(data.indexOf('success') > -1){


                                $.toast({
                                    heading: 'تایید اتمام خرید پید اختصاصی',
                                    text: res[1],
                                    position: 'top-right',
                                    loaderBg: '#fff',
                                    icon: 'success',
                                    hideAfter: 3500,
                                    textAlign: 'right',
                                    stack: 6
                                });

                                setTimeout(function () {
                                    $('#checkWarningFinal' + RequestNumber).remove();
                                    $('#Jump2Step' + RequestNumber).remove();
                                    $('#checkSuccessFinal' + RequestNumber).fadeIn(500);
                                }, 1000);
                            } else {
                                $.toast({
                                    heading: 'تایید اتمام خرید پید اختصاصی',
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
                btnClass: 'btn-orange',
            }
        }
    });
}

function DoneIsPublice(RequestNumber) {
    $.confirm({
        theme: 'supervan',// 'material', 'bootstrap'
        title: 'تایید  خرید اشتراکی منبع 10',
        icon: 'fa fa-shopping-cart',
        content: 'آیا از قطعی بودن  این خرید اطمینان دارید',
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
                            RequestNumber: RequestNumber,
                            flag: 'done_public'
                        },
                        function (data) {
                            var res = data.split(':');

                            if(data.indexOf('success') > -1){
                                $.toast({
                                    heading: 'تایید اتمام خرید پید اختصاصی',
                                    text: res[1],
                                    position: 'top-right',
                                    loaderBg: '#fff',
                                    icon: 'success',
                                    hideAfter: 3500,
                                    textAlign: 'right',
                                    stack: 6
                                });

                                setTimeout(function () {
                                    $('#checkWarningFinalPublic' + RequestNumber).remove();
                                    $('#Jump2Step' + RequestNumber).remove();
                                    $('#checkSuccessFinalPublic' + RequestNumber).fadeIn(500);
                                }, 1000);
                            } else {
                                $.toast({
                                    heading: 'تایید اتمام خرید پید اختصاصی',
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
                btnClass: 'btn-orange',
            }
        }
    });
}


function displayAdvanceSearch(Obj) {

    if($(Obj).is(':checked') === true){
        $('.showAdvanceSearch').fadeIn(500);
    } else {
        $('.showAdvanceSearch').fadeOut(500);
    }
}


$('#ticketHistory').DataTable({
    "order": [
        [0, 'desc']
    ],
    dom: 'lBfrtip',
    // buttons: [
    //     'copy', 'excel', 'print'
    // ]
    buttons: [
        {
            extend: 'excel',
            text: 'دریافت فایل اکسل',
            exportOptions: {}
        },
        {
            extend: 'print',
            text: 'چاپ سطر های لیست',
            exportOptions: {}
        },
        {
            extend: 'copy',
            text: 'کپی لیست',
            exportOptions: {}
        }

    ]
});

$('#RTRDRepoert').DataTable({
    "order": [
        [0, 'desc']
    ],
    dom: 'lBfrtip',
    // buttons: [
    //     'copy', 'excel', 'print'
    // ]
    buttons: [
        {
            extend: 'excel',
            text: 'دریافت فایل اکسل',
            exportOptions: {}
        },

    ]
});

function ModalShowBookForEntertainment(factorNumber) {
    $.post(libraryPath + 'ModalCreatorForEntertainment.php',
        {
            Method: 'ModalShowBook',
            factorNumber: factorNumber,
        },
        function (data) {
            $('#ModalPublic').html(data);
        });
}
function DonePreReserve(RequestNumber, FactorNumber, ClientID) {
    $.confirm({
        theme: 'supervan',// 'material', 'bootstrap'
        title: 'پیش رزرو کردن بلیط',
        icon: 'fa fa-shopping-cart',
        content: 'آیا از قطعی بودن  پیش رزرو کردن خرید اطمینان دارید',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'تایید',
                btnClass: 'btn-green',
                action: function () {

                    $.confirm({
                        theme: 'bootstrap',// 'material', 'bootstrap','supervan'
                        title: 'پیش رزرو کردن بلیط',
                        icon: 'fa fa-shopping-cart',
                        content: 'آیا اطمینان دارید از پیش رزرو کردن این خرید؟',
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
                                            RequestNumber: RequestNumber,
                                            FactorNumber: FactorNumber,
                                            ClientID: ClientID,
                                            flag: 'preReserveBuy'
                                        },
                                        function (data) {
                                            var res = data.split(':');

                                            if(data.indexOf('success') > -1){

                                                $.toast({
                                                    heading: 'پیش رزرو کردن بلیط',
                                                    text: res[1],
                                                    position: 'top-right',
                                                    loaderBg: '#fff',
                                                    icon: 'success',
                                                    hideAfter: 3500,
                                                    textAlign: 'right',
                                                    stack: 6
                                                });

                                                setTimeout(function () {
                                                    $('#DonePrereserve' + RequestNumber).remove();

                                                }, 1000);
                                            } else {
                                                $.toast({
                                                    heading: 'پیش رزرو کردن بلیط',
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
                                btnClass: 'btn-orange',
                            }
                        }
                    });
                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange',
            }
        }
    });
}


function sendSms(RequestNumber) {
    $.confirm({
        theme: 'supervan',// 'material', 'bootstrap'
        title: 'ارسال پیام کوتاه',
        icon: 'fa fa-shopping-cart',
        content: 'آیا ازارسال این پیام اطمینان دارید',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'تایید',
                btnClass: 'btn-green',
                action: function () {

                    var contentSms = $('#contentSms').val();
                    var Reason = $('#Reason').val();
                    $.post(amadeusPath + 'user_ajax.php',
                        {
                            RequestNumber: RequestNumber,
                            contentSms: contentSms,
                            Reason: Reason,
                            flag: 'SendSmsForUser'
                        },
                        function (data) {
                            var res = data.split(':');
                            if(data.indexOf('success') > -1){


                                $.toast({
                                    heading: 'ارسال پیام کوتاه',
                                    text: res[1],
                                    position: 'top-right',
                                    loaderBg: '#fff',
                                    icon: 'success',
                                    hideAfter: 3500,
                                    textAlign: 'right',
                                    stack: 6
                                });

                                setTimeout(function () {
                                    $('#ModalPublic').modal('hide');
                                }, 1000);
                            } else {
                                $.toast({
                                    heading: 'ارسال پیام کوتاه',
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
                btnClass: 'btn-orange',
            }
        }
    });
}


function sendInteractiveSms(factorNumber, memberID) {
    $.confirm({
        theme: 'supervan',// 'material', 'bootstrap'
        title: 'ارسال مجدد کد ترانسفر',
        icon: 'fa fa-shopping-cart',
        content: 'آیا از ارسال این پیام اطمینان دارید',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'تایید',
                btnClass: 'btn-green',
                action: function () {

                    $.ajax({
                        type: 'POST',
                        url: amadeusPath + 'user_ajax.php',
                        dataType: 'JSON',
                        data:
                            {
                                flag: 'reSendInteractiveSms',
                                factorNumber: factorNumber,
                                memberID: memberID,
                                offCodeGroup: $('input[name=offCodeGroup]:checked').val()
                            },
                        success: function (response) {

                            if(response.result_status == 'success'){
                                var displayIcon = 'success';
                            } else {
                                var displayIcon = 'error';
                            }

                            $.toast({
                                heading: 'ارسال مجدد پیامک کد ترانسفر',
                                text: response.result_message,
                                position: 'top-right',
                                icon: displayIcon,
                                hideAfter: 3500,
                                textAlign: '1000',
                                stack: 6
                            });

                            if(response.result_status == 'success'){
                                setTimeout(function () {
                                    $('#ModalPublic').modal('hide');
                                }, 1000);
                            }

                        }
                    });

                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange',
            }
        }
    });
}

function ModalSenEmailForOther(RequestNumber, ClientID) {


    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'bookshow',
            Method: 'ModalSenEmailForOther',
            Param: RequestNumber,
            ParamId: ClientID
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}

function createExcelForReportTicket() {

    $('#btn-excel').css('opacity', '0.5');
    $('#loader-excel').removeClass('displayN');

    setTimeout(function () {
        $.ajax({
            type: 'post',
            url: amadeusPath + 'user_ajax.php',
            data: $('#SearchTicketHistory').serialize(),
            success: function (data) {

                $('#btn-excel').css('opacity', '1');
                $('#loader-excel').addClass('displayN');

                var res = data.split('|');
                if(data.indexOf('success') > -1){
                    var url = amadeusPath + 'pic/excelFile/' + res[1];
                    var isFileExists = fileExists(url);
                    if(isFileExists){
                        window.open(url, 'Download');
                    } else {
                        $.toast({
                            heading: 'دریافت فایل اکسل',
                            text: 'متاسفانه در ساخت فایل اکسل مشکلی پیش آمده. لطفا مجددا تلاش کنید.',
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'error',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });
                    }
                } else {

                    $.toast({
                        heading: 'دریافت فایل اکسل',
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
    }, 10000);


}


function fileExists(url) {
    if(url){
        var req = new XMLHttpRequest();
        req.open('GET', url, false);
        req.send();
        return req.status == 200;
    } else {
        return false;
    }
}

function ModalCancelAdmin(type, RequestNumber) {


    $.post(libraryPath + 'ModalCreator.php',
        {
            Controller: 'user',
            Method: 'ModalCancelAdmin',
            Param: RequestNumber,
            ParamId: type
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}


function SelectUser(RequestNumber) {


    var National = [];
    var Reasons = $('#ReasonUser').val();
    var FactorNumber = $('#FactorNumber').val();
    var MemberId = $('#MemberId').val();
    var typeService = $('#typeService').val();
    var flightType = $('#flightType').val();


//    var passenger_age = $('#passenger_age').val();

    National = $('.SelectUser:checked').map(function () {


        return $(this).val();

    });

    var NationalCodes = National.get();


    if(NationalCodes != "" && Reasons != ""){
        $.post(amadeusPath + 'user_ajax.php',
            {
                NationalCodes: NationalCodes,
                Reasons: Reasons,
                FactorNumber: FactorNumber,
                RequestNumber: RequestNumber,
                MemberId: MemberId,
                typeService: typeService,
                admin: 'yes',
                flightType: flightType,
                flag: 'RequestCancelUser'
            },
            function (data) {
                var res = data.split(':');
                if(data.indexOf('success') > -1){
                    $.alert({
                        title: 'ارسال درخواست کنسلی',
                        icon: 'fa fa-check',
                        content: 'درخواست کنسلی شما با موفقیت ثبت شد',
                        rtl: true,
                        type: 'green'
                    });

                } else {
                    $.alert({
                        title: 'ارسال درخواست کنسلی',
                        icon: 'fa fa-times',
                        content: res[1],
                        rtl: true,
                        type: 'red'
                    });
                    $('#SendEmailForOther').attr("disabled", false);
                    $('#loaderTracking').fadeOut(500);
                }

            });
    } else {
        $.alert({
            title: 'ارسال درخواست کنسلی',
            icon: 'fa fa-times',
            content: 'لطفا دلیل کنسلی و یا حداقل یک نفر را مشخص نمائید',
            rtl: true,
            type: 'red'
        });
    }


}

function DataTableMaker(Target) {
    // اگر DataTable قبلاً وجود دارد، آن را کاملاً destroy کن
    if($.fn.DataTable.isDataTable(Target)){
        $(Target).DataTable().clear().destroy();
    }

    // بررسی کن که جدول موجود است و حداقل یک سطر دارد
    if($(Target).length > 0 && $(Target).find('thead tr th').length > 0){
        // حالا DataTable جدید را initialize کن
        try {
            var table = $(Target).DataTable({
                dom: 'lfrtip', // B را حذف کردیم چون buttons مشکل ایجاد می‌کند
                searching: true,
                processing: false, // processing را false می‌کنیم چون خودمان loading را مدیریت می‌کنیم
                destroy: true // این اطمینان می‌دهد که اگر DataTable قبلی وجود داشت، destroy شود
            });
        } catch(e) {
            console.error('Error initializing DataTable:', e);
        }
    }

}

var RowCounter = 0;
var NewRowCounter = 0;
var OldRowCounter = 0;

function fadeBG(Target) {
    setInterval(function () {
        Target.removeClass('HotTag').addClass('EndHotTag');

    }, 0);

}

function ExecuteHistoryFilter(target) {
    $('[data-info="filter-div"]').addClass('d-none').find('input, select, textarea').prop("disabled", true);
    $('[data-info="filter-div"][data-target="' + target + '"]').removeClass('d-none').find('input, select, textarea').prop("disabled", false);
    if(LANG_PANEL_ADMIN!='fa')
        $('#DivBoxSearch').addClass('d-none');

    var filterData = $('#FormExecuteHistoryFilter').serialize();
    var thiss = $("a[data-target=" + target + "][data-info=pendingBtn]");

    if(thiss.hasClass('running')){

    } else {


        $('a[data-info="pendingBtn"]').prop('disabled', true).removeClass(function (index, className) {
            return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
        });
        $('a[data-info="pendingBtn"]').prop('disabled', true).addClass('btn-default');
        var TableName = '#mainTicketHistory';
        thiss.removeClass(function (index, className) {
            return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
        });
        thiss.addClass('running btn-warning');
        thiss.find('.ld').show(); // نمایش loader داخل دکمه
        $('.table-responsive').addClass('running ld-over'); // اضافه کردن loading overlay
        var DataTarget = thiss.attr('data-target');
        var bussy = false;
        var TableDivision = $('table' + TableName);

        if(bussy === false){
            bussy = true;
            $.ajax({
                url: amadeusPath + 'user_ajax.php',
                type: 'POST',
                dataType: 'json',
                data: {
                    filter: filterData,
                    target: target,
                    flag: 'mainTicketHistory',
                },
                success: function (data) {
                    thiss.removeClass(function (index, className) {
                        return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
                    });
                    thiss.removeClass(function (index, className) {
                        return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
                    });
                    thiss.addClass('btn-success');

                    // ابتدا DataTable را destroy کن
                    if($.fn.DataTable.isDataTable(TableName)){
                        $(TableName).DataTable().clear().destroy();
                    }
                    // سپس محتوا را خالی کن
                    TableDivision.html('');

                    // بررسی داده دریافتی (دیگر نیازی به JSON.parse نداریم چون dataType: 'json' است)
                    var JsonData = data;

                    if(JsonData !== null && typeof JsonData === 'object' && (typeof JsonData.new !== "undefined" || typeof JsonData.data !== "undefined")){

                        NewRowCounter = (typeof JsonData.new !== "undefined" ? JsonData.new.length : '');
                        OldRowCounter = (typeof JsonData.data !== "undefined" ? JsonData.data.length : '');
                        RowCounter = NewRowCounter + OldRowCounter;


                        $('#RowCounter').val(RowCounter);
                        TableDivision.html("<thead><tr></tr></thead><tbody></tbody><tfoot></tfoot>");
                        var TableThead = TableDivision.find('thead tr');
                        var TableTbody = TableDivision.find('tbody');
                        var TableTfooter = TableDivision.find('tfoot');
                        var TableTbodyHtml = '';
                        var TableTfooterHtml = '';

                        if(typeof JsonData.new !== "undefined"){

                            var eachNewCounter = 0;
                            $.each(JsonData.new, function (key, value) {
                                if(eachNewCounter == 0){
                                    $.each(value, function (key, value) {
                                        if(key !== '' && key !== "رنگ"){
                                            TableThead.append('<th>' + key + '</th>');
                                        }
                                    });
                                }
                                var bgColor = value["رنگ"] || '';
                                var styleAttr = '';
                                if (bgColor != '') {
                                    styleAttr = ' style="background-color:' + bgColor + ' !important;"';
                                }
                                TableTbodyHtml += '<tr class="HotTag"' + styleAttr + '>';
                                $.each(value, function (key, value) {
                                    if(key !== '' && key !== "رنگ"){
                                        TableTbodyHtml += '<td>' + value + '</td>';
                                    }
                                });
                                TableTbodyHtml += '</tr>';
                                eachNewCounter = eachNewCounter + 1;
                            });
                        }
                        if(typeof JsonData.data !== "undefined"){

                            var eachCounter = 0;
                            $.each(JsonData.data, function (key, value) {
                                if(eachCounter == 0 && (NewRowCounter == 0 && OldRowCounter != 0)){
                                    $.each(value, function (key, value) {
                                        if(key !== '' && key !== "رنگ"){
                                            TableThead.append('<th>' + key + '</th>');
                                        }
                                    });
                                }
                                var bgColor = value["رنگ"] || '';
                                var styleAttr = '';
                                if (bgColor != '') {
                                    styleAttr = ' style="background-color:' + bgColor + ' !important;"';
                                }
                                TableTbodyHtml += '<tr' + styleAttr + '>';
                                $.each(value, function (key, value) {
                                    if (key !== '' && key !== "رنگ") {
                                        TableTbodyHtml += '<td>' + value + '</td>';
                                    }
                                });
                                TableTbodyHtml += '</tr>';
                                eachCounter = eachCounter + 1;
                            });
                        }
                        TableTbody.append(TableTbodyHtml);

                        if(typeof JsonData.footer !== "undefined"){

                            $.each(JsonData.footer, function (key, value) {
                                TableTfooterHtml += '<tr>';
                                TableTfooterHtml += value;
                                TableTfooterHtml += '</tr>';
                            });
                            TableTfooter.append(TableTfooterHtml);
                        }

                        // فقط اگر جدول header داشت، DataTable را initialize کن
                        if($('#mainTicketHistory thead tr th').length > 0){
                            DataTableMaker('#mainTicketHistory');
                            setTimeout(function () {
                                var searchText = 'جستجو';
                                var lengthText = 'نمایش';
                                var resultText = 'نتیجه';
                                var prevText = 'قبلی';
                                var nextText = 'بعدی';
                                var infoText = 'Showing _START_ to _END_ of _TOTAL_ entries';

                                if (xmlDoc && xmlDoc.getElementsByTagName("parsererror").length === 0) {
                                    if (xmlDoc.getElementsByTagName("Search").length > 0)
                                        searchText = xmlDoc.getElementsByTagName("Search")[0].textContent;

                                    if (xmlDoc.getElementsByTagName("PA_CO_RESULTTABLE2").length > 0)
                                        lengthText = xmlDoc.getElementsByTagName("PA_CO_RESULTTABLE2")[0].textContent;

                                    if (xmlDoc.getElementsByTagName("Result").length > 0)
                                        resultText = xmlDoc.getElementsByTagName("Result")[0].textContent;

                                    if (xmlDoc.getElementsByTagName("PA_CO_DT_PREVIOUS").length > 0)
                                        prevText = xmlDoc.getElementsByTagName("PA_CO_DT_PREVIOUS")[0].textContent;

                                    if (xmlDoc.getElementsByTagName("PA_CO_DT_NEXT").length > 0)
                                        nextText = xmlDoc.getElementsByTagName("PA_CO_DT_NEXT")[0].textContent;

                                    if (xmlDoc.getElementsByTagName("PA_CO_DT_INFO").length > 0)
                                        infoText = xmlDoc.getElementsByTagName("PA_CO_DT_INFO")[0].textContent;
                                }

                                // ۱. جستجو (Search) - پاکسازی کامل برای حذف کلمه Search انگلیسی
                                var $searchLabel = $('#mainTicketHistory_filter label');
                                var $searchInput = $searchLabel.find('input').first();
                                $searchLabel.empty().append(document.createTextNode(searchText + ' ')).append($searchInput);

                                // ۲. تعداد نمایش (Length) - پاکسازی کامل برای حذف کلمه Show انگلیسی
                                var $lenLabel = $('#mainTicketHistory_length label');
                                var $lenSelect = $lenLabel.find('select').first();
                                $lenLabel.empty().append(document.createTextNode(lengthText + ' ')).append($lenSelect).append(document.createTextNode(' ' + resultText));

                                // ۳. آمار پایین جدول (Info) - جایگزینی متن Showing... با متن XML
                                var $infoDiv = $('#mainTicketHistory_info');
                                if ($infoDiv.length > 0) {
                                    // چون DataTable خودش اعداد را جایگزین کرده، ما باید فرمت کلی را از XML بگیریم
                                    // اما برای اینکه کار راحت شود، فقط اگر متن انگلیسی بود آن را با متن درست جایگزین می‌کنیم
                                    var currentInfo = $infoDiv.text();
                                    // اگر دیتاتیبل قبلاً اعداد را چیده، ما فقط متن را جایگزین می‌کنیم
                                    // راه ساده‌تر: تنظیم مستقیم متن info از روی مقادیر موجود
                                    var table = $('#mainTicketHistory').DataTable();
                                    var pageInfo = table.page.info();
                                    var finalInfo = infoText
                                        .replace('_START_', pageInfo.start + 1)
                                        .replace('_END_', pageInfo.end)
                                        .replace('_TOTAL_', pageInfo.recordsTotal);
                                    $infoDiv.text(finalInfo);
                                }

                                // ۴. دکمه‌های قبلی و بعدی (Pagination)
                                $('#mainTicketHistory_previous').text(prevText);
                                $('#mainTicketHistory_next').text(nextText);

                            }, 200); // زمان را کمی بیشتر کردیم (200ms) تا مطمئن شویم جدول کاملاً رندر شده
                        }
                        $(".popoverBox").popover({trigger: "hover"});
                        $('[data-toggle="tooltip"]').tooltip();
                        $('[data-toggle="hover"]').popover();
                        $('[data-toggle="popover"]').popover();

                        bussy = false;
                        $('.table-responsive').removeClass('running ld-over'); // حذف loading overlay
                        $('.table-responsive .ld.ld-ring.ld-spin').hide(); // مخفی کردن loader داخل table
                        thiss.removeClass('running btn-warning'); // حذف کامل running و btn-warning
                        $('a[data-info="pendingBtn"]').find('.ld.ld-ring.ld-spin').hide(); // مخفی کردن همه loader های دکمه‌ها
                        $('a[data-info="pendingBtn"]').prop('disabled', false);
                        $('a[data-info="pendingBtn"]').removeClass('running'); // حذف running از همه دکمه‌ها
                        fadeBG($('.HotTag'));

                    } else {
                        var Result='موردی یافت نشد';
                        // بررسی وجود xmlDoc و نبود خطا در پارس کردن
                        if (xmlDoc && xmlDoc.getElementsByTagName("parsererror").length === 0) {
                            var tags = xmlDoc.getElementsByTagName("NothingFound");

                            // چک کردن اینکه آیا تگ در فایل XML اصلا وجود دارد؟
                            if (tags.length > 0) {
                                Result = tags[0].textContent;
                            }
                        }
                        TableDivision.html(Result);

                        bussy = false;
                        $('.table-responsive').removeClass('running ld-over'); // حذف loading overlay
                        $('.table-responsive .ld.ld-ring.ld-spin').hide(); // مخفی کردن loader داخل table
                        thiss.removeClass(function (index, className) {
                            return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
                        });
                        thiss.removeClass('running').addClass('btn-danger');
                        $('a[data-info="pendingBtn"]').find('.ld.ld-ring.ld-spin').hide(); // مخفی کردن همه loader های دکمه‌ها
                        $('a[data-info="pendingBtn"]').prop('disabled', false);
                        $('a[data-info="pendingBtn"]').removeClass('running'); // حذف running از همه دکمه‌ها
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                    console.error('Response:', xhr.responseText);
                    var ResultCom='خطا در دریافت اطلاعات';
                    if (xmlDoc && xmlDoc.getElementsByTagName("parsererror").length === 0) {
                        var tags = xmlDoc.getElementsByTagName("ReceiveInfoError");

                        // چک کردن اینکه آیا تگ در فایل XML اصلا وجود دارد؟
                        if (tags.length > 0) {
                            ResultCom = tags[0].textContent;
                        }
                    }
                    TableDivision.html(ResultCom+ ' : ' + error);
                    bussy = false;
                    $('.table-responsive').removeClass('running ld-over'); // حذف loading overlay
                    $('.table-responsive .ld.ld-ring.ld-spin').hide(); // مخفی کردن loader داخل table
                    thiss.removeClass(function (index, className) {
                        return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
                    });
                    thiss.removeClass('running').addClass('btn-danger');
                    $('a[data-info="pendingBtn"]').find('.ld.ld-ring.ld-spin').hide(); // مخفی کردن همه loader های دکمه‌ها
                    $('a[data-info="pendingBtn"]').prop('disabled', false);
                    $('a[data-info="pendingBtn"]').removeClass('running'); // حذف running از همه دکمه‌ها
                }
            });
            CheckReserveHotelTab();
        }
    }
}
// تابع تبدیل تاریخ میلادی به شمسی با فرمت (yyyy-mm-dd) - نسخه دستی بدون وابستگی
function convertToJalali(miladiDate) {
    try {
        let date = new Date(miladiDate);

        // اگر تاریخ نامعتبر است
        if(isNaN(date.getTime())) {
            console.error('تاریخ نامعتبر:', miladiDate);
            return '';
        }

        // الگوریتم تبدیل میلادی به شمسی (دستی)
        function gregorianToJalali(gy, gm, gd) {
            var g_d_m = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
            var jy = (gy <= 1600) ? 0 : 979;
            gy -= (gy <= 1600) ? 621 : 1600;
            var gy2 = (gm > 2) ? (gy + 1) : gy;
            var days = (365 * gy) + (parseInt((gy + 3) / 4)) - (parseInt((gy + 99) / 100)) + (parseInt((gy + 399) / 400)) - 80 + gd + g_d_m[gm - 1];
            jy += 33 * (parseInt(days / 12053));
            days %= 12053;
            jy += 4 * (parseInt(days / 1461));
            days %= 1461;
            if (days > 365) {
                jy += parseInt((days - 1) / 365);
                days = (days - 1) % 365;
            }
            var jm = (days < 186) ? 1 + parseInt(days / 31) : 7 + parseInt((days - 186) / 30);
            var jd = 1 + ((days < 186) ? (days % 31) : ((days - 186) % 30));
            return [jy, jm, jd];
        }

        let year = date.getFullYear();
        let month = date.getMonth() + 1;
        let day = date.getDate();

        let jalali = gregorianToJalali(year, month, day);

        let jy = jalali[0];
        let jm = String(jalali[1]).padStart(2, '0');
        let jd = String(jalali[2]).padStart(2, '0');

        let result = jy + '-' + jm + '-' + jd;


        return result;
    } catch(e) {
        console.error('خطا در تبدیل تاریخ:', e);
        return '';
    }
}

// تابع محاسبه تاریخ میلادی بر اساس تعداد روز قبل
function getDateByDaysAgo(days) {
    let date = new Date();
    date.setDate(date.getDate() - days);

    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let day = String(date.getDate()).padStart(2, '0');



    return date;
}

// دریافت تاریخ شمسی به صورت رشته (فرمت: yyyy-mm-dd)
function getJalaliDateByDaysAgo(days) {
    let miladiDate = getDateByDaysAgo(days);
    let result = convertToJalali(miladiDate);

    return result;
}

// دریافت تاریخ شمسی به صورت نمایشی (فرمت: dd/mm/yyyy)
function getJalaliDisplayDateByDaysAgo(days) {
    let miladiDate = getDateByDaysAgo(days);
    try {
        function gregorianToJalali(gy, gm, gd) {
            var g_d_m = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
            var jy = (gy <= 1600) ? 0 : 979;
            gy -= (gy <= 1600) ? 621 : 1600;
            var gy2 = (gm > 2) ? (gy + 1) : gy;
            var days = (365 * gy) + (parseInt((gy + 3) / 4)) - (parseInt((gy + 99) / 100)) + (parseInt((gy + 399) / 400)) - 80 + gd + g_d_m[gm - 1];
            jy += 33 * (parseInt(days / 12053));
            days %= 12053;
            jy += 4 * (parseInt(days / 1461));
            days %= 1461;
            if (days > 365) {
                jy += parseInt((days - 1) / 365);
                days = (days - 1) % 365;
            }
            var jm = (days < 186) ? 1 + parseInt(days / 31) : 7 + parseInt((days - 186) / 30);
            var jd = 1 + ((days < 186) ? (days % 31) : ((days - 186) % 30));
            return [jy, jm, jd];
        }

        let date = new Date(miladiDate);
        let jalali = gregorianToJalali(date.getFullYear(), date.getMonth() + 1, date.getDate());

        let day = String(jalali[2]).padStart(2, '0');
        let month = String(jalali[1]).padStart(2, '0');
        let year = jalali[0];

        return  year +  '/' + month + '/' + day ;
    } catch(e) {
        console.error('خطا در تبدیل تاریخ نمایشی:', e);
        return '';
    }
}

// مقداردهی اولیه تاریخ‌ها در دکمه‌ها (نمایشی)
function initializeDates() {
    const todayElement = document.getElementById('todayDate');
    if (todayElement) todayElement.innerText = getJalaliDisplayDateByDaysAgo(0);

    const yesterdayElement = document.getElementById('yesterdayDate');
    if (yesterdayElement) yesterdayElement.innerText = getJalaliDisplayDateByDaysAgo(1);

    const twoDaysElement = document.getElementById('twoDaysAgoDate');
    if (twoDaysElement) twoDaysElement.innerText = getJalaliDisplayDateByDaysAgo(2);

    const threeDaysElement = document.getElementById('threeDaysAgoDate');
    if (threeDaysElement) threeDaysElement.innerText = getJalaliDisplayDateByDaysAgo(3);
}
// function initializeDates() {
//     document.getElementById('todayDate').innerText = getJalaliDisplayDateByDaysAgo(0);
//     document.getElementById('yesterdayDate').innerText = getJalaliDisplayDateByDaysAgo(1);
//     document.getElementById('twoDaysAgoDate').innerText = getJalaliDisplayDateByDaysAgo(2);
//     document.getElementById('threeDaysAgoDate').innerText = getJalaliDisplayDateByDaysAgo(3);
// }

// مدیریت کلاس active روی دکمه‌های تاریخ
function setActiveDateButton(activeButton) {
    // حذف کلاس active از همه دکمه‌های تاریخ
    const allDateButtons = document.querySelectorAll('.btn-filter-date');
    if(allDateButtons){
        allDateButtons.forEach(button => {
            button.classList.remove('active');
        });
    }
    activeButton.classList.add('active');

}
function AlertUserCancel(){
    $.ajax({
        type: 'POST',
        url: amadeusPath + 'user_ajax.php',
        data:
            {
                flag: 'checkCancellations',
            },
        success: function (data) {
            console.log('data' , data.hasNewCancel)
            if(data.hasNewCancel){
                $('#showAlertCancellations')[0].classList.add('d-block');
            }

        }
    });
}



function filterByDays(days , event) {
    AlertUserCancel()
    $.ajax({
        type: 'POST',
        url: amadeusPath + 'user_ajax.php',
        data:
            {
                flag: 'checkGRSCredit',
            },
        success: function (data) {
            console.log('data' , data)
            $('#GRSCredit2').html(data)
        }
    });

    $.ajax({
        type: 'POST',
        url: amadeusPath + 'user_ajax.php',
        data:
            {
                flag: 'checkCityNetCredit',
            },
        success: function (data) {
            $('#CityNetCredit2').html(data)
        }
    });
    if (event && event.currentTarget) {
        setActiveDateButton(event.currentTarget);
    } else {
        // اگر event ارسال نشد، با استفاده از selector دکمه مناسب را پیدا کن
        const buttons = document.querySelectorAll('.btn-filter-date');
        buttons.forEach(button => {
            const onclickAttr = button.getAttribute('onclick');
            if (onclickAttr && onclickAttr.includes(`filterByDays(${days})`)) {
                setActiveDateButton(button);
            }
        });
    }

    // دریافت تاریخ شمسی (فرمت: yyyy-mm-dd) برای ارسال به سرور
    let jalaliDate = getJalaliDateByDaysAgo(days);



    if(jalaliDate === '' || !jalaliDate) {
        console.error('تاریخ شمسی محاسبه نشد!');
        return false;
    }

    // تنظیم تاریخ شمسی در فیلدهای جستجو
    if ($('#date_of').length) {
        $('#date_of').val(jalaliDate);
    } else {
        console.error('عنصر date_of یافت نشد!');
    }

    if ($('#to_date').length) {
        $('#to_date').val(jalaliDate);
    } else {
        console.error('عنصر to_date یافت نشد!');
    }

    // بررسی مجدد مقادیر قبل از ارسال
    let checkDateFrom = $('#date_of').val();
    let checkDateTo = $('#to_date').val();

    // اجرای جستجو
    RenderBookingsAsCards('allTicket');
}

// تابع اصلاح شده RenderBookingsAsCards
function RenderBookingsAsCards(target) {
    // گرفتن تاریخ شمسی از فیلدها
    let dateFrom = $('#date_of').val() || '';
    let dateTo = $('#to_date').val() || '';


    // ساخت filterData با تاریخ شمسی
    let filterData = {
        date_of: dateFrom,
        to_date: dateTo
    };


    var thiss = $("a[data-target=" + target + "][data-info=pendingBtn]");

    if(thiss.hasClass('running')){
        return false;
    } else {
        $('a[data-info="pendingBtn"]').prop('disabled', true);
        $('a[data-info="pendingBtn"]').addClass('btn-default');

        thiss.removeClass(function (index, className) {
            return (className.match(/(^|\s)btn-\S+/g) || []).join(' ');
        });
        thiss.addClass('running btn-warning');
        thiss.find('.ld').show();

        $('#bookingsContainer').html('<div class="card-loading"><div class="card-spinner"></div><p>در حال بارگذاری...</p></div>');

        $.ajax({
            url: amadeusPath + 'user_ajax.php',
            type: 'POST',
            dataType: 'json',
            data: {
                filter: $.param(filterData),
                target: target,
                flag: 'mainTicketHistory'
            },
            success: function (data) {

                console.log(data)

                thiss.removeClass('running btn-warning').addClass('btn-success');

                var JsonData = data;

                if(JsonData !== null && typeof JsonData === 'object' && (typeof JsonData.new !== "undefined" || typeof JsonData.data !== "undefined")){

                    let allBookings = [];

                    if(typeof JsonData.new !== "undefined"){
                        allBookings = allBookings.concat(JsonData.new);
                    }
                    if(typeof JsonData.data !== "undefined"){
                        allBookings = allBookings.concat(JsonData.data);
                    }

                    // ========== اضافه کردن مرتب سازی DESC ==========
                    allBookings.sort(function(a, b) {
                        // مقایسه رشته‌ای به صورت نزولی (ساعت بزرگتر اول بیاد)
                        if (a.request_time > b.request_time) return -1;
                        if (a.request_time < b.request_time) return 1;
                        return 0;
                    });
                    // =============================================
                    renderBookingCardsSimple(allBookings);

                    let resultText = allBookings.length + ' رکورد';

                    if (dateFrom && dateTo && dateFrom !== dateTo) {
                        resultText += ' - بازه: ' + dateFrom + ' تا ' + dateTo;
                    } else if (dateFrom) {
                        let parts = dateFrom.split('-');
                        if (parts.length === 3) {
                            resultText += ' - تاریخ: ' + parts[2] + '/' + parts[1] + '/' + parts[0];
                        } else {
                            resultText += ' - تاریخ: ' + dateFrom;
                        }
                    }

                    thiss.removeClass('running btn-warning');
                    $('a[data-info="pendingBtn"]').find('.ld.ld-ring.ld-spin').hide();
                    $('a[data-info="pendingBtn"]').prop('disabled', false);
                    $('a[data-info="pendingBtn"]').removeClass('running');

                } else {
                    $('#bookingsContainer').html('<div class="card-empty">📭 موردی یافت نشد</div>');
                    // if ($('#resultCount').length) $('#resultCount').text('0 رکورد');
                    thiss.removeClass('running').addClass('btn-danger');
                    $('a[data-info="pendingBtn"]').find('.ld.ld-ring.ld-spin').hide();
                    $('a[data-info="pendingBtn"]').prop('disabled', false);
                    $('a[data-info="pendingBtn"]').removeClass('running');
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', status, error);
                $('#bookingsContainer').html('<div class="card-empty">⚠️ خطا در دریافت اطلاعات</div>');
                thiss.removeClass('running').addClass('btn-danger');
                $('a[data-info="pendingBtn"]').find('.ld.ld-ring.ld-spin').hide();
                $('a[data-info="pendingBtn"]').prop('disabled', false);
                $('a[data-info="pendingBtn"]').removeClass('running');
            }
        });
    }
}

// اجرا هنگام بارگذاری صفحه
$(document).ready(function() {
    initializeDates();


});
// تابع رندر کارت‌ها بدون عملیات
function renderBookingCardsSimple(bookings) {
    const container = $('#bookingsContainer');

    if (!bookings || bookings.length === 0) {
        container.html('<div class="card-empty">📭 هیچ رکوردی یافت نشد</div>');
        return;
    }

    let html = '';

    for (let i = 0; i < bookings.length; i++) {
        const booking = bookings[i];
        const serviceType = Object.values(booking['service_type'])[0] || 'سایر';
        const serviceClass = getCardServiceClass(serviceType);
        const serviceIcon = getCardServiceIcon(serviceType);
        const statusClass = getCardStatusClass(Object.values(booking['status'])[0]);
        const errorData = booking['errorData'] ? booking['errorData'] : ''
        const factorNumber = serviceType === 'اتوبوس' ? booking['request_number'] + ' - ' + booking['factor_number'] : booking['request_number']
        html += `
            <div class="booking-card">
                <div class="card-header-service ${serviceClass}">
                    <div>
                        <span class="service-icon">${serviceIcon}</span>
                        <span class="service-name">${serviceType}</span>
                    </div>
                     <div class="">
                        <div class="info-value"  data-status="${Object.values(booking['status'])[0]}" data-error-message="${errorData.message_admin}"  onmouseover="showErrorMessage(this)">
                            <span class="status-badge ${statusClass}">${escapeCardHtml(booking['status'][0] || 'نامشخص')}</span>
                        </div>
                    </div>
                    <span class="card-badge">#${booking['id'] || (i+1)}</span>
                </div>
                
                <div class="card-body">
                    <div class="info-item">
                        <div class="info-label">شماره درخواست:</div>
                        <div class="info-value"><strong>${escapeCardHtml(factorNumber || '-')}</strong> (${escapeCardHtml(booking['request_time'] || '-')})</div>
                    </div>
             
                    
                    <div class="info-item">
                        <div class="info-label">نام مسافر:</div>
                        <div class="info-value">${escapeCardHtml(booking['passenger_name'] || '-')}</div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">نام آژانس:</div>
                        <div class="info-value">${escapeCardHtml(booking['agency_name'] || '-')}</div>
                    </div>
                    
                   
                    
                   
                </div>
            </div>
        `;
    }

    container.html(html);
}
function showErrorMessage(element) {
    const status = element.getAttribute('data-status');
    let errorMessage = element.getAttribute('data-error-message');
    if (status.includes('خطای مشخص')) {
        // حذف tooltip قبلی اگر وجود داشت
        const existingTooltip = document.querySelector('.custom-tooltip');
        if (existingTooltip) existingTooltip.remove();
        // ایجاد المنت tooltip
        let tooltip = document.createElement('div');
        tooltip.className = 'custom-tooltip';
        tooltip.innerHTML = `
            <div style="display: flex; align-items: center; gap: 8px;">
                <span style="font-size: 16px;">⚠️</span>
                <span>${errorMessage}</span>
            </div>
            <div style="
                position: absolute;
                bottom: -6px;
                left: 50%;
                transform: translateX(-50%);
                width: 0;
                height: 0;
                border-left: 6px solid transparent;
                border-right: 6px solid transparent;
                border-top: 6px solid #1e293b;
            "></div>
        `;

        tooltip.style.cssText = `
            position: fixed;
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            color: #fff;
            padding: 10px 16px;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 500;
            z-index: 10000;
            white-space: nowrap;
            pointer-events: none;
            box-shadow: 0 10px 25px -5px rgba(0,0,0,0.2);
            font-family: inherit;
            animation: tooltipFadeIn 0.2s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
        `;

        // موقعیت tooltip
        const rect = element.getBoundingClientRect();
        const tooltipWidth = 250;
        let leftPos = rect.left + rect.width/2 - tooltipWidth/2;

        // جلوگیری از خروج از صفحه
        leftPos = Math.max(10, Math.min(leftPos, window.innerWidth - tooltipWidth - 10));

        tooltip.style.top = (rect.top - 45) + 'px';
        tooltip.style.left = leftPos + 'px';

        // اضافه کردن استایل انیمیشن اگر وجود نداشت
        if (!document.getElementById('tooltip-styles')) {
            const style = document.createElement('style');
            style.id = 'tooltip-styles';
            style.textContent = `
                @keyframes tooltipFadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(5px);
                    }
                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                @keyframes tooltipFadeOut {
                    from {
                        opacity: 1;
                        transform: translateY(0);
                    }
                    to {
                        opacity: 0;
                        transform: translateY(5px);
                    }
                }
            `;
            document.head.appendChild(style);
        }

        document.body.appendChild(tooltip);

        // حذف با انیمیشن
        const removeTooltip = () => {
            tooltip.style.animation = 'tooltipFadeOut 0.15s ease';
            setTimeout(() => {
                if (tooltip.parentNode) tooltip.remove();
            }, 150);
        };

        element.onmouseleave = removeTooltip;
        setTimeout(removeTooltip, 2500);
    }
}
// توابع کمکی
function getCardServiceClass(serviceType) {
    const map = {
        'پرواز': 'service-flight',
        'هتل': 'service-hotel',
        'بیمه': 'service-insurance',
        'اتوبوس': 'service-bus'
    };
    return map[serviceType] || 'service-other';
}

function getCardServiceIcon(serviceType) {
    const map = {
        'پرواز': '<i class="fa fa-plane"></i>',
        'هتل': '<i class="fa fa-hotel"></i>',
        'بیمه': '<i class="fa fa-shield-alt"></i>',
        'اتوبوس': '<i class="fa fa-bus"></i>'
    };
    return map[serviceType] || '<i class="fa fa-ticket-alt"></i>';
}
function getCardStatusClass(status) {

    if (!status) return 'status-secondary';
    if (status.includes('قطعی') || status.includes('موفق') || status.includes('اختصاصی')) return 'status-success';
    if (status.includes('پیش') || status.includes('در حال')) return 'status-warning';
    if (status.includes('کنسل')) return 'status-secondary';
    if (status.includes('درگاه')) return 'status-info';
    if (status.includes('خطای نامشخص')) return 'status-purple';
    if (status.includes('خطا')) return 'status-danger';
    return 'status-secondary';
}

function escapeCardHtml(text) {
    if (!text) return '';
    return String(text).replace(/[&<>]/g, function(m) {
        if (m === '&') return '&amp;';
        if (m === '<') return '&lt;';
        if (m === '>') return '&gt;';
        return m;
    });
}

function ExecuteExcelFilter(thiss) {
    var TargetFile = thiss.attr('data-target-file');
    var target = thiss.attr('data-target');
    var FilterData = $('#FormExecuteHistoryFilter').serialize();
    console.log("FilterData: ", FilterData)
    thiss.addClass('running btn-default').removeClass('btn-primary');
    setTimeout(function () {
        $.ajax({
            type: 'post',
            url: amadeusPath + TargetFile,
            data: FilterData,
            success: function (data) {

                thiss.addClass('btn-primary').removeClass('running btn-default');

                var res = data.split('|');
                if(data.indexOf('success') > -1){

                    var url = amadeusPath + 'pic/excelFile/' + res[1];
                    var isFileExists = fileExists(url);
                    if(isFileExists){
                        window.open(url, 'Download');
                    } else {
                        $.toast({
                            heading: 'دریافت فایل اکسل',
                            text: 'متاسفانه در ساخت فایل اکسل مشکلی پیش آمده. لطفا مجددا تلاش کنید.',
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'error',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });
                    }


                }
                else {

                    $.toast({
                        heading: 'دریافت فایل اکسل',
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
    }, 5000);

}
function CheckReserveHotelTab(){
    $.post(amadeusPath + 'hotel_ajax.php',
        {
            flag: "checkReserveHotel"
        },
        function (data) {
            if (parseInt(data) > 0){
                $('a[data-target="hotel-list2"][data-info="pendingBtn"]').addClass('reap_admin_note');
            } else {
                $('a[data-target="hotel-list2"][data-info="pendingBtn"]').removeClass('reap_admin_note');

            }
        });
}

function selectTextMessage(_this){
    const sample_text=$('input[name="sample_sms_text"]').val()
    let new_text=''
    const content=$('#contentSms')
    switch (_this.val()) {
        case 'Delay':
            new_text=' با تغییر در ساعت 00:00 مورخ --/--/-- انجام خواهد شد. در صورت عدم تمایل به استفاده از پرواز در ساعت جدید لطفا حداکثر تا ساعت 00:00 مورخ --/--/-- جهت استرداد بلیط اقدام نمایید .'
            break;
        case 'HurryUp':
            new_text=' با تغییر در ساعت 00:00 مورخ --/--/-- انجام خواهد شد. در صورت عدم تمایل به استفاده از پرواز در ساعت جدید لطفا حداکثر تا ساعت 00:00 مورخ --/--/-- جهت استرداد بلیط اقدام نمایید .'
            break;
        case 'Cancel':
            new_text=' باطل میباشد . لذا خواهشمند است جهت استرداد بلیت و برگشت وجه اقدام فرمایید . '
            break;
    }
    content.val(sample_text+new_text)
}

function ModalCancelFlightAdmin(RequestNumber , type) {
    $.post(libraryPath + 'ModalCreator.php', {
            Controller: 'user',
            requestNumber: RequestNumber,
            Method: 'ModalCancelFlightAdmin',
            Param: RequestNumber,
            ParamId: type
        },
        function (data) {
            $("#ModalPublic").html(data);
        });
}

function ModalCancelHotelAdmin(factorNumber , type) {
    $.post(libraryPath + 'ModalCreator.php', {
            Controller: 'user',
            typeApplication: type,
            factorNumber: factorNumber,
            Param: factorNumber,
            Method: 'ModalCancelHotelAdmin',
        },
        function (data) {
            $("#ModalPublic").html(data);
        });
}



function DirectCancellationFlightAdmin(RequestNumber) {


    var National = [];
    var Reasons = $('#ReasonUser').val();
    var FactorNumber = $('#FactorNumber').val();
    var MemberId = $('#MemberId').val();
    var AccountOwner = $('#AccountOwner').val();
    var CardNumber = $('#CardNumber').val();
    var NameBank = $('#NameBank').val();
    var backCredit = $('#backCredit').val();
    var typeService = $('#typeService').val();
    if ($('#PercentNoMatter').is(':checked')) {
        var PercentNoMatter = 'Yes';
    } else {
        var PercentNoMatter = 'No';
    }

//    var passenger_age = $('#passenger_age').val();

    National = $('.SelectUser:checked').map(function () {


        return $(this).val();

    });

    var NationalCodes = National.get();

    //

    var DescriptionClient = $('#DescriptionClient').val();
    if($('#isCreditPayment').length > 0)
    {
        var isCreditPayment = $('#isCreditPayment').is(':checked');
    }else{
        var isCreditPayment = $('#isCreditPayment').is(':checked');
    }

    $.confirm({
        theme: 'supervan' , // 'material', 'bootstrap'
        title: 'ثبت کنسلی',
        icon: 'fa fa-trash',
        content: 'آیا از ثبت کنسلی اطمینان دارید ؟',
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
                            NationalCodes: NationalCodes,
                            Reasons: Reasons,
                            FactorNumber: FactorNumber,
                            RequestNumber: RequestNumber,
                            MemberId: MemberId,
                            AccountOwner: AccountOwner,
                            CardNumber: CardNumber,
                            NameBank: NameBank,
                            backCredit: backCredit,
                            PercentNoMatter: PercentNoMatter,
                            typeService: typeService,
                            DescriptionClient: DescriptionClient,
                            isCreditPayment: isCreditPayment,
                            flag: 'DirectCancellationFlightAdmin'
                        },
                        function (data) {
                            console.log(data)
                            var res = JSON.parse(data);
                            console.log(res)
                            if (res.success) {
                                $.toast({
                                    heading: 'ثبت کنسلی',
                                    text: res.message,
                                    position: 'top-right',
                                    loaderBg: '#fff',
                                    icon: 'success',
                                    hideAfter: 2000,
                                    textAlign: 'right',
                                    stack: 6,

                                });
                                setTimeout(function() {
                                    $('.modal').modal('hide');
                                }, 200);

                            } else {
                                $.toast({
                                    heading: 'ثبت کنسلی',
                                    text: res.message,
                                    position: 'top-right',
                                    loaderBg: '#fff',
                                    icon: 'error',
                                    hideAfter: 2000,
                                    textAlign: 'right',
                                    stack: 6
                                });
                                setTimeout(function() {
                                    $('.modal').modal('hide');
                                }, 200);
                            }
                            setTimeout(function() {
                                console.log('sdfsfsf');
                                $('.modal').modal('hide');
                            }, 200);

                        });
                }
            },
            cancel: {
                text: 'انصراف',
                btnClass: 'btn-orange',
            }
        }
    });


}

function DirectCancellationHotelAdmin(typeApplication, factorNumber) {

    if ($('#Ruls').is(':checked')) {

        $("form#cancelBuyForm").find('#typeService').val(typeService);
        $("form#cancelBuyForm").find('#factorNumber').val(factorNumber);
        var form = $("#cancelBuyForm");
        var formData = $(form).serializeArray();
        var formArray = {};
        $.each(formData, function() {
            formArray[this.name] = this.value;
        });
        var DescriptionClient = $('#DescriptionClient').val();

        var typeService = typeApplication;
        var FactorNumber = formArray['FactorNumber'];
        var commentUser = formArray['comment'];
        var cardNumber = formArray['cardNumber'];
        var AccountOwner = formArray['accountOwner'];
        var backCredit = formArray['backCredit'];
        var Status = 'RequestMember';
        var NameBank = formArray['NameBank'];

        $.confirm({
            theme: 'supervan' ,// 'material', 'bootstrap'
            title: 'ثبت کنسلی',
            icon: 'fa fa-trash',
            content: 'آیا از ثبت کنسلی اطمینان دارید ؟',
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
                                typeService: typeApplication,
                                FactorNumber: FactorNumber,
                                RequestNumber: FactorNumber,
                                commentUser: commentUser,
                                CardNumber: cardNumber,
                                AccountOwner: AccountOwner,
                                Status: Status,
                                NameBank: NameBank,
                                backCredit: backCredit,
                                DescriptionClient: DescriptionClient,
                                isCreditPayment: false,
                                Indemnity: '',
                                flag: 'DirectCancellationHotelAdmin'
                            },
                            function (data) {
                                console.log(data)
                                var res = JSON.parse(data);
                                console.log(res)
                                if (res.success) {
                                    $.toast({
                                        heading: 'ثبت کنسلی',
                                        text: res.message,
                                        position: 'top-right',
                                        loaderBg: '#fff',
                                        icon: 'success',
                                        hideAfter: 2000,
                                        textAlign: 'right',
                                        stack: 6,

                                    });
                                    setTimeout(function() {
                                        console.log('sdfsdfs');
                                        $('.modal').modal('hide');
                                    }, 200);
                                } else {
                                    $.toast({
                                        heading: 'ثبت کنسلی',
                                        text: res.message,
                                        position: 'top-right',
                                        loaderBg: '#fff',
                                        icon: 'error',
                                        hideAfter: 2000,
                                        textAlign: 'right',
                                        stack: 6
                                    });
                                    setTimeout(function() {
                                        $('.modal').modal('hide');
                                    }, 200);
                                }
                                setTimeout(function() {
                                    $('.modal').modal('hide');
                                }, 200);
                            });
                    }
                },
                cancel: {
                    text: 'انصراف',
                    btnClass: 'btn-orange',
                }
            }
        });



    } else {
        $.alert({
            title: 'ارسال درخواست کنسلی رزرو',
            icon: 'fa fa-times',
            content: 'لطفا قوانین را مطالعه کرده و انتخاب نمائید',
            rtl: true,
            type: 'red'
        });

    }




}
function FuncreateExcelForRavisFlight() {

    $('#btn-excel').css('opacity', '0.5');
    $('#loader-excel').removeClass('displayN');
    $('#FormExecuteHistoryFilter input[name="flag"]').val('createExcelForRavisFlight');
    $('#FormExecuteHistoryFilter select[name="successfull"]').val('book').trigger('change');

    setTimeout(function () {
        $.ajax({
            type: 'post',
            url: amadeusPath + 'user_ajax.php',
            data: $('#FormExecuteHistoryFilter').serialize(),
            success: function (data) {
                $('#btn-excel').css('opacity', '1');
                $('#loader-excel').addClass('displayN');
                var res = data.split('|');
                if (data.indexOf('success') > -1) {
                    var url = amadeusPath + 'pic/excelFile/' + res[1];
                    var isFileExists = fileExists(url);
                    if (isFileExists) {
                        window.open(url, 'Download');
                    } else {
                        $.toast({
                            heading: 'دریافت فایل اکسل',
                            text: 'متاسفانه در ساخت فایل اکسل مشکلی پیش آمده. لطفا مجددا تلاش کنید.',
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'error',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });
                    }


                } else {

                    $.toast({
                        heading: 'دریافت فایل اکسل',
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
    }, 5000);


}
function FuncreateExcelForRavisHotel() {

    $('#btn-excel').css('opacity', '0.5');
    $('#loader-excel').removeClass('displayN');
    $('#FormExecuteHistoryFilter input[name="flag"]').val('createExcelForRavisHotel');
    $('#FormExecuteHistoryFilter select[name="successfull"]').val('book').trigger('change');

    setTimeout(function () {
        $.ajax({
            type: 'post',
            url: amadeusPath + 'user_ajax.php',
            data: $('#FormExecuteHistoryFilter').serialize(),
            success: function (data) {
                $('#btn-excel').css('opacity', '1');
                $('#loader-excel').addClass('displayN');
                var res = data.split('|');
                if (data.indexOf('success') > -1) {
                    var url = amadeusPath + 'pic/excelFile/' + res[1];
                    var isFileExists = fileExists(url);
                    if (isFileExists) {
                        window.open(url, 'Download');
                    } else {
                        $.toast({
                            heading: 'دریافت فایل اکسل',
                            text: 'متاسفانه در ساخت فایل اکسل مشکلی پیش آمده. لطفا مجددا تلاش کنید.',
                            position: 'top-right',
                            loaderBg: '#fff',
                            icon: 'error',
                            hideAfter: 3500,
                            textAlign: 'right',
                            stack: 6
                        });
                    }


                } else {

                    $.toast({
                        heading: 'دریافت فایل اکسل',
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
    }, 5000);


}