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


function confirmReservationRequestAgainHotel(el, factorNumber, clientId) {
    if (el.dataset.reserving === '1' || el.dataset.confirming === '1') return;
    el.dataset.confirming = '1';
    $.confirm({
        theme: 'supervan',
        title: 'درخواست مجدد رزرو هتل',
        icon: 'fa fa-shopping-cart',
        content: 'آیا از درخواست مجدد رزرو هتل اطمینان دارید؟',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        onDestroy: function () { delete el.dataset.confirming; },
        buttons: {
            confirm: {
                text: 'تأیید',
                btnClass: 'btn-green',
                action: function () { proceedWithReserveHotel(el, factorNumber, clientId); }
            },
            cancel: { text: 'انصراف', btnClass: 'btn-red' }
        }
    });
}

async function proceedWithReserveHotel(el, factorNumber, clientId) {
    if (el.dataset.reserving === '1') return;
    const parent = el.closest('.pull-left');
    const loader = parent?.querySelector('.parent-ld');
    const loaderLd = parent?.querySelector('.ld');
    el.dataset.reserving = '1';
    if (loader) loader.style.display = 'block';
    if (loaderLd) loaderLd.style.display = 'inline-block';
    try {
        const response = await $.ajax({
            url: amadeusPath + 'ajax',
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify({
                className: 'bookshowTest',
                method: 'retryHotelReservation',
                factorNumber: factorNumber,
                clientId: clientId
            })
        });
        if (!response || !response.success) {
            throw new Error(response?.message || 'خطا در رزرو مجدد هتل');
        }
        $.toast({
            heading: 'درخواست موفق',
            text: $('<div>').text(response.message).html(),
            position: 'top-right', icon: 'success', hideAfter: 4000, textAlign: 'right'
        });
        setTimeout(() => location.reload(), 4000);
    } catch (error) {
        $.toast({
            heading: 'خطا در رزرو مجدد هتل',
            text: $('<div>').text(error.message || 'خطا در ارتباط با سرور').html(),
            position: 'top-right', icon: 'error', hideAfter: 6000, textAlign: 'right'
        });
    } finally {
        delete el.dataset.reserving;
        if (loader) loader.style.display = 'none';
        if (loaderLd) loaderLd.style.display = 'none';
    }
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


