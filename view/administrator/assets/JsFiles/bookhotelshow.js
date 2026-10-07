$(document).ready(function () {


    //data tables Option
    $('#hotelHistory').DataTable();
    $("#SearchTransaction").validate({
        rules: {
            date_of: "required",
            to_date: "required"
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
        highlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group ").addClass("has-error").removeClass("has-success");
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).parents(".form-group ").addClass("has-success").removeClass("has-error");
        }
    });


});


function displayAdvanceSearch(Obj) {

    if ($(Obj).is(':checked') === true) {
        $('.showAdvanceSearch').fadeIn(500);
    } else {
        $('.showAdvanceSearch').fadeOut(500);
    }
}


$('#hotelHistory').DataTable({
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

async function confirmReservationRequestAgainHotel(el, RequestNumber, IdMember, SourceId, dir, factorNum, clientId) {
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
                    if (loader) {
                        loader.style.display = 'block';
                    }

                    if (loaderLd) {
                        loaderLd.style.display = 'inline-block';
                    }

                    try {
                        await proceedWithReserve(factorNum, RequestNumber, dir, loader, loaderLd);
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
                        loader?.style && (loader.style.display = 'none');
                        loaderLd?.style && (loaderLd.style.display = 'none');
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
        const result = await reReserve(factorNum, RequestNumber, dir);
        const pending = result === 'pending';
        $.toast({
            heading: pending ? 'در انتظار تایید' : (result ? 'صدور موفق' : 'خطا در صدور'),
            text: pending ? 'پیش‌رزرو در انتظار تایید تامین‌کننده است' :
                (result ? 'صدور مجدد رزرو با موفقیت انجام شد' : 'صدور مجدد رزرو با خطا مواجه گردید'),
            position: 'top-right',
            loaderBg: '#fff',
            icon: pending ? 'info' : (result ? 'success' : 'error'),
            hideAfter: 4000,
            textAlign: 'right',
            stack: 6
        });
        setTimeout(() => location.reload(), 4000);
    } finally {
        if (loader) loader.style.display = 'none';
        if (loaderLd) loaderLd.style.display = 'none';
    }
}
function reReserve(factorNum, RequestNumber, dir, typeApplication = 'api', paymentStatus = 'fullPayment', serviceType = '') {
    return new Promise((resolve, reject) => {

        $.ajax({
            type: 'POST',
            url: amadeusPath + 'user_ajax.php',
            dataType: 'text',
            data: {
                flag: 'buyByCreditHotelLocal',
                factorNumber: factorNum,
                typeApplication: typeApplication,
                paymentStatus: paymentStatus,
                serviceType: serviceType,
                isRepetHotel:true,
                discountCode: '',
                creditUse: ''
            },
            success: function (data) {
                if (data.indexOf('success') > -1) {
                    $.ajax({
                        url: amadeusPath + 'ajax',
                        type: 'POST',
                        dataType: 'JSON',
                        data: JSON.stringify({
                            method: 'HotelReserveNew',
                            className: 'detailHotel',
                            factorNumber: factorNum,
                            requestNumber: RequestNumber,
                            typeApplication: typeApplication
                        }),
                        success: function (data) {
                            if (data && data.book === 'OnRequest') {
                                resolve('pending');
                                return;
                            }
                            if (!data || data.book !== 'yes' || Number(data.StatusCode) !== 200 || !data.price_session_id || !data.request_number) {
                                resolve(false);
                                return;
                            }
                            $.ajax({
                                url: amadeusPath + 'ajax',
                                type: 'POST',
                                dataType: 'JSON',
                                data: JSON.stringify({
                                    method: 'Reserve',
                                    className: 'detailHotel',
                                    factor_number: factorNum,
                                    request_number: data.request_number,
                                    price_session_id: data.price_session_id
                                }),
                                success: function (result) {
                                    resolve(result && result.Success === true && Number(result.StatusCode) === 200 && result.Result && !result.Result.Error && result.Result.Status !== 'pending' ? true : (result && result.Result && result.Result.Status === 'pending' ? 'pending' : false));
                                },
                                error: function () { resolve(false); }
                            });

                        },
                        error: function () {
                            resolve(false);
                        }
                    });
                } else {
                    reject('creditError');
                }

            },
            error: function (xhr, status, error) {
                reject(error || status);
            }
        });
    });
}

function ModalShowBookForHotel(factorNumber) {
    console.log('ModalShowBookForHotel');
    $.post(libraryPath + 'ModalCreatorForHotel.php',
        {
            Controller: 'bookhotelshow',
            Method: 'ModalShowBook',
            Param: factorNumber.replace(' ','')
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}

function ModalShowEditBookHotel(factorNumber) {

    $.post(libraryPath + 'ModalCreatorForHotel.php',
        {
            Controller: 'bookhotelshow',
            Method: 'ModalShowEditBookHotel',
            Param: factorNumber
        },
        function (data) {

            $('#ModalPublic').html(data);

        });
}




function createExcelForReportHotel() {

    $('#btn-excel').css('opacity', '0.5');
    $('#loader-excel').removeClass('displayN');

    setTimeout(function () {
        $.ajax({
            type: 'post',
            url: amadeusPath + 'hotel_ajax.php',
            data: $('#SearchHotelHistory').serialize(),
            success: function (data) {

                $('#btn-excel').css('opacity', '1');
                $('#loader-excel').addClass('displayN');

                var res = data.split('|');
                if (data.indexOf('success') > -1) {

                    var url = amadeusPath + 'pic/excelFile/' + res[1];
                    var isFileExists = fileExists(url);
                    if (isFileExists){
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


function fileExists(url) {
    if(url){
        var req = new XMLHttpRequest();
        req.open('GET', url, false);
        req.send();
        return req.status==200;
    } else {
        return false;
    }
}



function ConfirmAdminRequestedPrereserveHotelUser(FactorNumber) {
    // alert(FactorNumber)
    console.log(FactorNumber);
    const ConfirmAdminRequestedPrereserveHotelUserCode = $('#ConfirmAdminRequestedPrereserveHotelUserCode').val().trim();

    if (FactorNumber === "") {

        $.toast({
            heading: ` تایید پرداخت`,
            text: 'لطفا توضیحات خود را وارد نمائید',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'error',
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6
        });
        $('#DescriptionClient').css('background-color', '#a94442');
    } else {
        $.confirm({
            theme: 'supervan' ,// 'material', 'bootstrap'
            title: `تایید پرداخت`,
            icon: 'fa fa-bon',
            content: 'آیا از تایید درخواست اطمینان دارید',
            rtl: true,
            closeIcon: true,
            type: 'orange',
            buttons: {
                confirm: {
                    text: 'تایید',
                    btnClass: 'btn-green',
                    action: function () {
                        $.post(amadeusPath + 'hotel_ajax.php',
                            {
                                FactorNumber: FactorNumber,
                                ConfirmAdminRequestedPrereserveHotelUserCode: ConfirmAdminRequestedPrereserveHotelUserCode,
                                flag: 'ConfirmRequestedHotelPrereserveByAdmin'
                            },
                            function (data) {
                                var res = data.split(':');
                                if (data.indexOf('success') > -1) {
                                    $.toast({
                                        heading: `تایید پرداخت`,
                                        text: res[1],
                                        position: 'top-right',
                                        loaderBg: '#fff',
                                        icon: 'success',
                                        hideAfter: 3500,
                                        textAlign: 'right',
                                        stack: 6
                                    });

                                    setTimeout(function () {
                                        location.reload()
                                        // window.location = `${amadeusPath}itadmin/ticket/mainTicketHistory`;
                                    }, 1000);
                                } else {
                                    $.alert({
                                        title: `تایید پرداخت`,
                                        icon: 'fa fa-times',
                                        content: res[1],
                                        rtl: true,
                                        type: 'red',
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


}



function RejectAdminRequestedPrereserveHotelUser(FactorNumber) {
    // alert(FactorNumber)
    console.log(FactorNumber);


    if (FactorNumber === "") {

        $.toast({
            heading: ` عدم تایید `,
            text: 'لطفا توضیحات خود را وارد نمائید',
            position: 'top-right',
            loaderBg: '#fff',
            icon: 'error',
            hideAfter: 3500,
            textAlign: 'right',
            stack: 6
        });
        $('#DescriptionClient').css('background-color', '#a94442');
    } else {
        $.confirm({
            theme: 'supervan' ,// 'material', 'bootstrap'
            title: ` عدم تایید `,
            icon: 'fa fa-bon',
            content: 'آیا از رد این درخواست اطمینان دارید؟!',
            rtl: true,
            closeIcon: true,
            type: 'orange',
            buttons: {
                confirm: {
                    text: 'عدم تایید',
                    btnClass: 'btn-green',
                    action: function () {
                        $.post(amadeusPath + 'hotel_ajax.php',
                            {
                                FactorNumber: FactorNumber,
                                flag: 'RejectRequestedHotelPreeserveByAdmin'
                            },
                            function (data) {
                                var res = data.split(':');
                                if (data.indexOf('success') > -1) {
                                    $.toast({
                                        heading: `عدم تایید`,
                                        text: res[1],
                                        position: 'top-right',
                                        loaderBg: '#fff',
                                        icon: 'success',
                                        hideAfter: 3500,
                                        textAlign: 'right',
                                        stack: 6
                                    });

                                    setTimeout(function () {
                                        location.reload()
                                        // window.location = `${amadeusPath}itadmin/ticket/mainTicketHistory`;
                                    }, 1000);
                                } else {
                                    $.alert({
                                        title: `عدم تایید`,
                                        icon: 'fa fa-times',
                                        content: res[1],
                                        rtl: true,
                                        type: 'red',
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


}
