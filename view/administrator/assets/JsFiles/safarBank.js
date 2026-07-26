// متغیرهای سراسری
// متغیرهای سراسری
var pricingData = {
    click: [],
    unique_click: [],
    visit: [],
    unique_visit: []
};

var tempPricingData = {
    click: [],
    unique_click: [],
    visit: [],
    unique_visit: []
};

// باز کردن مودال تنظیم قیمت
function openClickPriceModal() {
    loadPricingData();
    $('#clickPriceModal').modal('show');
}

// بارگذاری داده‌های قیمت‌گذاری
// بارگذاری داده‌های قیمت‌گذاری
function loadPricingData() {
    $.ajax({
        url: amadeusPath + 'user_ajax.php',
        type: 'POST',
        data: {
            flag: 'getPricingSettings'
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                pricingData = {
                    click: response.data.click || [],
                    unique_click: response.data.unique_click || [],
                    visit: response.data.visit || [],
                    unique_visit: response.data.unique_visit || []
                };
                tempPricingData = JSON.parse(JSON.stringify(pricingData));
                renderPricingTables();
            } else {
                console.error('Error loading pricing data:', response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', error);
        }
    });
}

// نمایش جداول قیمت‌گذاری
// نمایش جداول قیمت‌گذاری
function renderPricingTables() {
    renderPricingTable('click', tempPricingData.click || []);
    renderPricingTable('unique_click', tempPricingData.unique_click || []);  // اضافه شد
    renderPricingTable('visit', tempPricingData.visit || []);
    renderPricingTable('unique_visit', tempPricingData.unique_visit || []);
}

function renderPricingTable(type, data) {
    // تعیین ID تیبل و بدنه بر اساس نوع
    var tableId = '';
    var tbodyId = '';

    switch(type) {
        case 'click':
            tableId = 'clickPricingTable';
            tbodyId = 'clickPricingBody';
            break;
        case 'unique_click':
            tableId = 'uniqueClickPricingTable';
            tbodyId = 'uniqueClickPricingBody';
            break;
        case 'visit':
            tableId = 'visitPricingTable';
            tbodyId = 'visitPricingBody';
            break;
        case 'unique_visit':
            tableId = 'uniqueVisitPricingTable';
            tbodyId = 'uniqueVisitPricingBody';
            break;
        default:
            return;
    }

    var $tbody = $('#' + tbodyId);

    // خالی کردن کامل تیبل قبل از رندر
    $tbody.empty();

    // اطمینان از اینکه تیبل نمایش داده میشه
    $('#' + tableId).show();

    if (!data || data.length === 0) {
        $tbody.html('<tr><td colspan="6" class="text-center text-muted">هیچ قیمتی تعریف نشده است</td></tr>');
        return;
    }

    $.each(data, function(index, item) {
        var formattedPrice = numberFormat(item.price_per_unit);

        var row = `
            <tr data-id="${item.id || 0}" data-index="${index}" data-type="${type}">
                <td style="text-align: center; vertical-align: middle;">${index + 1}</td>
                <td style="text-align: center; vertical-align: middle;">
                    <input type="number" class="form-control input-sm min-qty" value="${item.min_quantity}" style="width: 100px; text-align: center; display: inline-block;">
                </td>
                <td style="text-align: center; vertical-align: middle;">
                    <input type="number" class="form-control input-sm max-qty" value="${item.max_quantity || ''}" style="width: 100px; text-align: center; display: inline-block;" placeholder="نامحدود">
                </td>
                <td style="text-align: center; vertical-align: middle;">
                    <input type="text" class="form-control input-sm price-unit" value="${formattedPrice}" style="width: 150px; text-align: center; display: inline-block; direction: ltr;">
                </td>
                <td style="text-align: center; vertical-align: middle;">
                    <div class="input-group" style="display: inline-flex; width: auto;">
                        <input type="number" class="form-control input-sm discount" value="${item.discount_percent || 0}" style="width: 80px; text-align: center;">
                        <span class="input-group-addon">%</span>
                    </div>
                </td>
                <td style="text-align: center; vertical-align: middle;">
                    <button class="btn btn-danger btn-sm" onclick="deletePricing(${item.id || 0}, '${type}', ${index})">
                        <i class="fa fa-trash"></i>
                    </button>
                </td>
            </tr>
        `;
        $tbody.append(row);
    });

    // اضافه کردن event listener برای اینپوت‌های قیمت در این تیبل خاص
    $tbody.find('.price-unit').off('change').on('change', function() {
        var $row = $(this).closest('tr');
        var type = $row.data('type');
        var index = $row.data('index');
        var value = $(this).val();
        updatePriceWithFormat(type, index, value);
    });

    $tbody.find('.min-qty').off('change').on('change', function() {
        var $row = $(this).closest('tr');
        var type = $row.data('type');
        var index = $row.data('index');
        var value = $(this).val();
        updateTempPricingData(type, index, 'min_quantity', value);
    });

    $tbody.find('.max-qty').off('change').on('change', function() {
        var $row = $(this).closest('tr');
        var type = $row.data('type');
        var index = $row.data('index');
        var value = $(this).val();
        updateTempPricingData(type, index, 'max_quantity', value);
    });

    $tbody.find('.discount').off('change').on('change', function() {
        var $row = $(this).closest('tr');
        var type = $row.data('type');
        var index = $row.data('index');
        var value = $(this).val();
        updateTempPricingData(type, index, 'discount_percent', value);
    });
}

// به‌روزرسانی دیتای موقت با فرمت قیمت
function updatePriceWithFormat(type, index, value) {
    // حذف کاماها و تبدیل به عدد
    var rawValue = value.replace(/,/g, '');
    var numValue = parseFloat(rawValue);

    if (!isNaN(numValue)) {
        updateTempPricingData(type, index, 'price_per_unit', numValue);
        // به‌روزرسانی نمایش اینپوت با فرمت
        $(`#${type}PricingBody tr[data-index="${index}"] .price-unit`).val(numberFormat(numValue));
    }
}

// به‌روزرسانی دیتای موقت
function updateTempPricingData(type, index, field, value) {
    if (tempPricingData[type] && tempPricingData[type][index]) {
        tempPricingData[type][index][field] = value;
    } else {
        // اگر دیتا وجود نداشت، از DOM بخون
        var $row = $(`#${type}PricingBody tr[data-index="${index}"]`);
        if ($row.length) {
            if (!tempPricingData[type]) tempPricingData[type] = [];
            if (!tempPricingData[type][index]) {
                tempPricingData[type][index] = {
                    id: $row.data('id') || 0,
                    min_quantity: $row.find('.min-qty').val(),
                    max_quantity: $row.find('.max-qty').val(),
                    price_per_unit: $row.find('.price-unit').val().replace(/,/g, ''),
                    discount_percent: $row.find('.discount').val()
                };
            }
            tempPricingData[type][index][field] = value;
        }
    }
}

// افزودن قیمت جدید
function addNewPricing(type) {
    var newItem = {
        id: 0,
        min_quantity: 1,
        max_quantity: null,
        price_per_unit: 0,
        discount_percent: 0
    };

    if (!tempPricingData[type]) {
        tempPricingData[type] = [];
    }

    tempPricingData[type].push(newItem);
    renderPricingTable(type, tempPricingData[type]);
}

// حذف قیمت
function deletePricing(id, type, index) {
    $.confirm({
        title: 'حذف قیمت',
        content: 'آیا از حذف این قیمت اطمینان دارید؟',
        buttons: {
            confirm: {
                text: 'بله',
                action: function() {
                    if (id > 0) {
                        $.ajax({
                            url: amadeusPath + 'user_ajax.php',
                            type: 'POST',
                            data: {
                                flag: 'deletePricingSetting',
                                id: id
                            },
                            dataType: 'json',
                            success: function(response) {
                                if (response.success) {
                                    loadPricingData();
                                    $.alert('قیمت با موفقیت حذف شد');
                                }
                            }
                        });
                    } else {
                        // حذف از دیتای موقت
                        tempPricingData[type].splice(index, 1);
                        renderPricingTable(type, tempPricingData[type]);
                    }
                }
            },
            cancel: {
                text: 'خیر'
            }
        }
    });
}
// ذخیره همه تنظیمات
function saveAllPricing() {
    var allData = [];

    // جمع‌آوری داده‌های کلیک معمولی
    $('#clickPricingBody tr').each(function() {
        var $row = $(this);
        var id = $row.data('id');
        var minQty = $row.find('.min-qty').val();
        var maxQty = $row.find('.max-qty').val();
        var priceUnit = $row.find('.price-unit').val();
        var discount = $row.find('.discount').val();

        if (minQty !== undefined && minQty !== '' && priceUnit !== undefined && priceUnit !== '') {
            allData.push({
                id: id || 0,
                price_type: 'click',
                min_quantity: parseInt(minQty) || 0,
                max_quantity: (maxQty && maxQty !== '') ? parseInt(maxQty) : null,
                price_per_unit: priceUnit ? parseFloat(priceUnit.replace(/,/g, '')) : 0,
                discount_percent: parseFloat(discount) || 0
            });
        }
    });

    // جمع‌آوری داده‌های کلیک یکتا
    $('#uniqueClickPricingBody tr').each(function() {
        var $row = $(this);
        var id = $row.data('id');
        var minQty = $row.find('.min-qty').val();
        var maxQty = $row.find('.max-qty').val();
        var priceUnit = $row.find('.price-unit').val();
        var discount = $row.find('.discount').val();

        if (minQty !== undefined && minQty !== '' && priceUnit !== undefined && priceUnit !== '') {
            allData.push({
                id: id || 0,
                price_type: 'unique_click',
                min_quantity: parseInt(minQty) || 0,
                max_quantity: (maxQty && maxQty !== '') ? parseInt(maxQty) : null,
                price_per_unit: priceUnit ? parseFloat(priceUnit.replace(/,/g, '')) : 0,
                discount_percent: parseFloat(discount) || 0
            });
        }
    });

    // جمع‌آوری داده‌های بازدید معمولی
    $('#visitPricingBody tr').each(function() {
        var $row = $(this);
        var id = $row.data('id');
        var minQty = $row.find('.min-qty').val();
        var maxQty = $row.find('.max-qty').val();
        var priceUnit = $row.find('.price-unit').val();
        var discount = $row.find('.discount').val();

        if (minQty !== undefined && minQty !== '' && priceUnit !== undefined && priceUnit !== '') {
            allData.push({
                id: id || 0,
                price_type: 'visit',
                min_quantity: parseInt(minQty) || 0,
                max_quantity: (maxQty && maxQty !== '') ? parseInt(maxQty) : null,
                price_per_unit: priceUnit ? parseFloat(priceUnit.replace(/,/g, '')) : 0,
                discount_percent: parseFloat(discount) || 0
            });
        }
    });

    // جمع‌آوری داده‌های بازدید یکتا
    $('#uniqueVisitPricingBody tr').each(function() {
        var $row = $(this);
        var id = $row.data('id');
        var minQty = $row.find('.min-qty').val();
        var maxQty = $row.find('.max-qty').val();
        var priceUnit = $row.find('.price-unit').val();
        var discount = $row.find('.discount').val();

        if (minQty !== undefined && minQty !== '' && priceUnit !== undefined && priceUnit !== '') {
            allData.push({
                id: id || 0,
                price_type: 'unique_visit',
                min_quantity: parseInt(minQty) || 0,
                max_quantity: (maxQty && maxQty !== '') ? parseInt(maxQty) : null,
                price_per_unit: priceUnit ? parseFloat(priceUnit.replace(/,/g, '')) : 0,
                discount_percent: parseFloat(discount) || 0
            });
        }
    });

    // حذف آیتم‌های با price_per_unit صفر (اختیاری)
    allData = allData.filter(function(item) {
        return item.price_per_unit > 0;
    });

    if (allData.length === 0) {
        $.alert({
            title: 'اطلاع',
            icon: 'fa fa-info-circle',
            content: 'هیچ داده‌ای برای ذخیره وجود ندارد. لطفاً قیمت‌ها را وارد کنید.',
            rtl: true,
            type: 'blue'
        });
        return;
    }

    // حذف داده‌های تکراری بر اساس ترکیب price_type و min_quantity
    var uniqueData = [];
    var keys = {};

    for (var i = 0; i < allData.length; i++) {
        var item = allData[i];
        var key = item.price_type + '_' + item.min_quantity;

        // اگر این کلید قبلاً اضافه نشده یا مقدار price_per_unit جدید بهتره
        if (!keys[key]) {
            keys[key] = true;
            uniqueData.push(item);
        } else {
            // اگر تکراری بود، جایگزین کن با مقدار جدیدتر
            for (var j = 0; j < uniqueData.length; j++) {
                if (uniqueData[j].price_type === item.price_type &&
                    uniqueData[j].min_quantity === item.min_quantity) {
                    uniqueData[j] = item;
                    break;
                }
            }
        }
    }

    // نمایش لودینگ
    var loadingAlert = $.alert({
        title: 'در حال ذخیره سازی...',
        content: '<div class="text-center"><i class="fa fa-spinner fa-pulse fa-2x"></i><br>لطفاً صبر کنید...</div>',
        rtl: true,
        closeIcon: false,
        buttons: {
            close: {
                text: 'بستن',
                btnClass: 'btn-default',
                action: function() {}
            }
        }
    });

    // ارسال داده‌ها به سرور
    $.ajax({
        url: amadeusPath + 'user_ajax.php',
        type: 'POST',
        data: {
            flag: 'saveAllPricingSettings',
            settings: JSON.stringify(uniqueData)
        },
        dataType: 'json',
        timeout: 30000, // 30 ثانیه تایم‌اوت
        success: function(response) {
            // بستن مودال لودینگ
            if (loadingAlert) {
                loadingAlert.close();
            }
            $('.jconfirm').remove();

            if (response.success) {
                $.alert({
                    title: 'موفق',
                    icon: 'fa fa-check-circle',
                    content: response.message || 'تمامی تنظیمات با موفقیت ذخیره شد',
                    rtl: true,
                    type: 'green'
                });
                // بارگذاری مجدد دیتاها
                loadPricingData();
            } else {
                $.alert({
                    title: 'خطا',
                    icon: 'fa fa-exclamation-triangle',
                    content: response.message || 'خطا در ذخیره سازی',
                    rtl: true,
                    type: 'red'
                });
            }
        },
        error: function(xhr, status, error) {
            // بستن مودال لودینگ
            if (loadingAlert) {
                loadingAlert.close();
            }
            $('.jconfirm').remove();

            var errorMsg = 'خطا در ارتباط با سرور';
            if (status === 'timeout') {
                errorMsg = 'مدت زمان درخواست به پایان رسید. لطفاً مجدداً تلاش کنید.';
            } else if (error) {
                errorMsg = 'خطا: ' + error;
            }

            $.alert({
                title: 'خطا',
                icon: 'fa fa-times-circle',
                content: errorMsg,
                rtl: true,
                type: 'red'
            });
        }
    });
}

// وقتی مودال بسته شد
$('#clickPriceModal').on('hidden.bs.modal', function() {
    tempPricingData = JSON.parse(JSON.stringify(pricingData));
    renderPricingTables();
});

// تابع numberFormat برای فرمت اعداد
function numberFormat(num) {
    if (num === null || num === undefined || num === '') return '0';
    var n = parseFloat(num);
    if (isNaN(n)) return '0';
    return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// محاسبه قیمت بر اساس تعداد
$('#calcType, #calcQuantity').on('change keyup', function() {
    var type = $('#calcType').val();
    var quantity = parseInt($('#calcQuantity').val()) || 0;

    if (quantity > 0) {
        $.ajax({
            url: amadeusPath + 'user_ajax.php',
            type: 'POST',
            data: {
                flag: 'calculatePrice',
                type: type,
                quantity: quantity
            },
            dataType: 'json',
            success: function(response) {
                if (response.success && response.data) {
                    var data = response.data;
                    var html = `
                        <div style="direction: rtl;">
                            <div class="row pricing-details">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <div class="info-box-icon bg-info">
                                            <i class="fa fa-chart-line"></i>
                                        </div>
                                        <div class="info-box-content">
                                            <span class="info-box-text">بازه قیمتی</span>
                                            <span class="info-box-number">${data.price_range}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <div class="info-box-icon bg-primary">
                                            <i class="fa fa-tag"></i>
                                        </div>
                                        <div class="info-box-content">
                                            <span class="info-box-text">قیمت هر واحد</span>
                                            <span class="info-box-number">${numberFormat(data.price_per_unit_toman)} <small>تومان</small></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row pricing-details" style="margin-top: 10px;">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <div class="info-box-icon bg-warning">
                                            <i class="fa fa-calculator"></i>
                                        </div>
                                        <div class="info-box-content">
                                            <span class="info-box-text">قیمت پایه</span>
                                            <span class="info-box-number">${numberFormat(data.base_price_toman)} <small>تومان</small></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="info-box">
                                        <div class="info-box-icon bg-danger">
                                            <i class="fa fa-percent"></i>
                                        </div>
                                        <div class="info-box-content">
                                            <span class="info-box-text">تخفیف</span>
                                            <span class="info-box-number">${data.discount_percent}%</span>
                                            <span class="info-box-text small">${numberFormat(data.discount_amount_toman)} تومان</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-xs-12">
                                    <div class="info-box bg-success">
                                        <div class="info-box-icon">
                                            <i class="fa fa-credit-card"></i>
                                        </div>
                                        <div class="info-box-content">
                                            <span class="info-box-text">قیمت نهایی</span>
                                            <span class="info-box-number" style="font-size: 24px; font-weight: bold;">
                                                ${numberFormat(data.final_price_toman)} <small>تومان</small>
                                            </span>
                                            <div class="progress" style="margin-top: 10px; margin-bottom: 0;">
                                                <div class="progress-bar progress-bar-success" role="progressbar" 
                                                     style="width: ${data.discount_percent}%;">
                                                    ${data.discount_percent}% تخفیف
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    $('#calculatedPrice').html(html);
                } else {
                    $('#calculatedPrice').html(`
                        <div class="alert alert-warning text-center" style="margin-bottom: 0;">
                            <i class="fa fa-exclamation-triangle"></i> 
                            ${response.message || 'برای این تعداد قیمتی تعریف نشده است'}
                        </div>
                    `);
                }
            },
            error: function() {
                $('#calculatedPrice').html(`
                    <div class="alert alert-danger text-center" style="margin-bottom: 0;">
                        <i class="fa fa-times-circle"></i> خطا در محاسبه قیمت
                    </div>
                `);
            }
        });
    } else {
        $('#calculatedPrice').html(`
            <div class="alert alert-info text-center" style="margin-bottom: 0;">
                <i class="fa fa-info-circle"></i> لطفاً تعداد را وارد کنید
            </div>
        `);
    }
});

// ============== کدهای اصلی دیتاتیبل و توابع دیگر ==============

$(document).ready(function() {
    var table = $('#agenciesTable').DataTable({
        "order": [],
        "pageLength": 25,
        "drawCallback": function() {
            calculateTotals();
        }
    });

    function calculateTotals() {
        var totalVisits = 0;
        var uniqueVisits = 0;
        var totalClicks = 0;
        var uniqueClicks = 0;
        var toursCount = 0;
        var safarBankToursCount = 0;
        var totalToursCount = 0;
        var conversionSum = 0;
        var conversionCount = 0;

        $('#agenciesTable tbody tr').each(function() {
            totalVisits += parseInt($(this).find('td:eq(3)').text().replace(/,/g, '')) || 0;
            uniqueVisits += parseInt($(this).find('td:eq(4)').text().replace(/,/g, '')) || 0;
            totalClicks += parseInt($(this).find('td:eq(5)').text().replace(/,/g, '')) || 0;
            uniqueClicks += parseInt($(this).find('td:eq(6)').text().replace(/,/g, '')) || 0;
            toursCount += parseInt($(this).find('td:eq(7)').text().replace(/,/g, '')) || 0;
            safarBankToursCount += parseInt($(this).find('td:eq(8)').text().replace(/,/g, '')) || 0;
            totalToursCount += parseInt($(this).find('td:eq(9)').text().replace(/,/g, '')) || 0;
            var conv = parseFloat($(this).find('td:eq(10)').text()) || 0;  // ✅ اصلاح شد
            if (conv > 0) {
                conversionSum += conv;
                conversionCount++;
            }
        });

        $('#footerTotalVisits').text(numberFormat(totalVisits));
        $('#footerUniqueVisits').text(numberFormat(uniqueVisits));
        $('#footerTotalClicks').text(numberFormat(totalClicks));
        $('#footerUniqueClicks').text(numberFormat(uniqueClicks));
        $('#footerToursCount').text(numberFormat(toursCount));
        $('#footerSafarBankToursCount').text(numberFormat(safarBankToursCount));
        $('#footerTotalToursCount').text(numberFormat(totalToursCount));

        var avgConversion = conversionCount > 0 ? (conversionSum / conversionCount).toFixed(2) : 0;
        $('#footerAvgConversion').text(avgConversion + '%');
    }

    $('[data-toggle="tooltip"]').tooltip();
});

// متغیر برای نگهداری reference مودال لودینگ
var loadingAlert = null;

// تابع نمایش جزئیات آژانس
function showAgencyDetails(agencyId, agencyName) {
    var dateFrom = $('input[name="date_of"]').val();
    var dateTo = $('input[name="to_date"]').val();

    loadingAlert = $.alert({
        title: 'در حال بارگذاری...',
        content: '<div class="text-center"><i class="fa fa-spinner fa-pulse fa-3x"></i><br>در حال دریافت اطلاعات...</div>',
        rtl: true,
        closeIcon: true,
        buttons: {
            close: {
                text: 'بستن',
                btnClass: 'btn-default',
                action: function() {
                    if (window.currentAjaxRequest) {
                        window.currentAjaxRequest.abort();
                    }
                }
            }
        },
        onClose: function() {
            loadingAlert = null;
        }
    });

    window.currentAjaxRequest = $.ajax({
        url: amadeusPath + 'user_ajax.php',
        type: 'POST',
        data: {
            flag: 'getAgencyTourDetails',
            agency_id: agencyId,
            date_of: dateFrom,
            to_date: dateTo
        },
        dataType: 'json',
        success: function(response) {
            if (loadingAlert) {
                loadingAlert.close();
                loadingAlert = null;
            }
            if (response.success) {
                showTourDetailsModal(agencyName, response.data, response.totals);
            } else {
                $.alert({
                    title: 'خطا',
                    icon: 'fa fa-exclamation-triangle',
                    content: response.message || 'خطا در دریافت اطلاعات',
                    rtl: true,
                    type: 'red'
                });
            }
        },
        error: function(xhr, status, error) {
            if (loadingAlert) {
                loadingAlert.close();
                loadingAlert = null;
            }
            if (status !== 'abort') {
                $.alert({
                    title: 'خطا',
                    icon: 'fa fa-times-circle',
                    content: 'خطا در ارتباط با سرور',
                    rtl: true,
                    type: 'red'
                });
            }
        }
    });
}

// تابع نمایش مودال جزئیات تورها
function showTourDetailsModal(agencyName, tours, totals) {
    var tableHtml = `
        <div style="max-height: 500px; overflow-y: auto;">
            <table id="toursDetailsTable" class="table table-bordered table-striped table-hover" style="margin: 0;">
                <thead>
                    <tr style="background-color: #f5f5f5;">
                        <th width="50" class="text-center">#</th>
                        <th width="200" class="text-center">نام تور</th>
                        <th width="150" class="text-center">مقصد</th>
                        <th width="100" class="text-center">کل بازدید</th>
                        <th width="100" class="text-center">بازدید یکتا</th>
                        <th width="100" class="text-center">کل کلیک</th>
                        <th width="100" class="text-center">کلیک یکتا</th>
                        <th width="100" class="text-center">نرخ تبدیل</th>
                        <th width="80" class="text-center">روزها</th>
                    </tr>
                </thead>
                <tbody>
    `;

    if (tours && tours.length > 0) {
        $.each(tours, function(index, tour) {
            var conversionClass = '';
            if (tour.conversion_rate > 10) {
                conversionClass = 'label-success';
            } else if (tour.conversion_rate > 5) {
                conversionClass = 'label-warning';
            } else if (tour.conversion_rate > 0) {
                conversionClass = 'label-danger';
            } else {
                conversionClass = 'label-default';
            }

            tableHtml += `
                <tr>
                    <td class="text-center"><strong>${index + 1}</strong></td>
                    <td class="text-center"><strong>${escapeHtml(tour.tour_name)}</strong></td>
                    <td class="text-center">${escapeHtml(tour.destination_city) || '---'}</td>
                    <td class="text-center"><span class="badge badge-info">${numberFormat(tour.total_visits)}</span></td>
                    <td class="text-center">${numberFormat(tour.unique_visits)}</td>
                    <td class="text-center"><span class="badge badge-warning">${numberFormat(tour.total_clicks)}</span></td>
                    <td class="text-center">${numberFormat(tour.unique_clicks)}</td>
                    <td class="text-center"><span class="label ${conversionClass}" style="font-size: 12px;">${tour.conversion_rate}%</span></td>
                    <td class="text-center">${tour.days_count}</td>
                </tr>
            `;
        });
    } else {
        tableHtml += `
            <tr>
                <td colspan="9" class="text-center text-muted">
                    <i class="fa fa-info-circle"></i> هیچ توری برای این آژانس یافت نشد
                </td>
            </tr>
        `;
    }

    tableHtml += `
                </tbody>
                <tfoot>
                    <tr style="background-color: #f9f9f9; font-weight: bold;">
                        <th class="text-center">مجموع</th>
                        <th class="text-center">---</th>
                        <th class="text-center">---</th>
                        <th class="text-center">${numberFormat(totals.total_visits)}</th>
                        <th class="text-center">${numberFormat(totals.unique_visits)}</th>
                        <th class="text-center">${numberFormat(totals.total_clicks)}</th>
                        <th class="text-center">${numberFormat(totals.unique_clicks)}</th>
                        <th class="text-center">---</th>
                        <th class="text-center">${totals.tours_count} تور</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    `;

    if ($('#tourDetailsModal').length === 0) {
        $('body').append(`
            <div class="modal fade" id="tourDetailsModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document" style="width: 90%; max-width: 1200px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                                <i class="fa fa-pie-chart"></i> جزئیات تورهای آژانس: ${escapeHtml(agencyName)}
                            </h4>
                        </div>
                        <div class="modal-body" style="padding: 15px;">
                            ${tableHtml}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                <i class="fa fa-close"></i> بستن
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        `);
    } else {
        $('#tourDetailsModal .modal-title').html(`<i class="fa fa-pie-chart"></i> جزئیات تورهای آژانس: ${escapeHtml(agencyName)}`);
        $('#tourDetailsModal .modal-body').html(tableHtml);
    }

    $('#tourDetailsModal').modal('show');
    $('#toursDetailsTable th, #toursDetailsTable td').css({
        'vertical-align': 'middle',
        'text-align': 'center'
    });
}

// مدال تراکنش های مشتری
let currentClientId = null;
let currentClientName = null;

function showWalletDetails(clientId, clientName) {
    currentClientId = clientId;
    currentClientName = clientName;

    $.ajax({
        url: amadeusPath + 'user_ajax.php',
        type: 'POST',
        data: {
            flag: 'getClientTransaction',
            client_id: clientId
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                updateWalletUI(response.data);
                $('#walletModal').modal('show');
            } else {
                $.alert({
                    title: 'خطا',
                    content: response.message,
                    type: 'red'
                });
            }
        },
        error: function() {
            $.alert({
                title: 'خطا',
                content: 'خطا در دریافت اطلاعات',
                type: 'red'
            });
        }
    });
}

function updateWalletUI(data) {
    // به‌روزرسانی موجودی
    var balance = data.balance || 0;
    $('#currentBalanceDisplay').text(numberFormat(balance));
    $('#currentBalanceToman').text(numberFormat(balance / 10));

    // خالی کردن فرم
    $('#transactionAmount').val('');
    $('#transactionDesc').val('');

    // پر کردن جدول تراکنش‌ها
    var tbody = $('#transactionsBody');
    tbody.empty();

    if (data.transactions && data.transactions.length > 0) {
        $.each(data.transactions, function(index, tx) {
            var typeClass = tx.type == 'charge' ? 'label-charge' : 'label-consume';
            var typeText = tx.type == 'charge' ? 'شارژ' : 'مصرف';
            var amountFormatted = numberFormat(Math.abs(tx.amount));
            var amountClass = tx.type == 'charge' ? 'text-success' : 'text-danger';

            var row = `
                <tr>
                    <td style="text-align: center;">${index + 1}</td>
                    <td style="text-align: center;">${tx.created_at}</td>
                    <td style="text-align: center;">
                        <span class="${typeClass}">${typeText}</span>
                    </td>
                    <td style="text-align: center;" class="${amountClass}">
                        ${amountFormatted}
                    </td>
                    <td style="text-align: center;">${numberFormat(tx.balance)}</td>
                    <td style="text-align: center;">${tx.description || '-'}</td>
                </tr>
            `;
            tbody.append(row);
        });
    } else {
        tbody.html('<tr><td colspan="6" class="text-center text-muted">هیچ تراکنشی یافت نشد</td></tr>');
    }
}

function chargeClient() {
    var amount = $('#transactionAmount').val();
    var description = $('#transactionDesc').val();

    if (!amount || amount <= 0) {
        $.alert({
            title: 'خطا',
            content: 'لطفاً مبلغ معتبر (بزرگتر از صفر) وارد کنید',
            type: 'red'
        });
        return;
    }

    $.ajax({
        url: amadeusPath + 'user_ajax.php',
        type: 'POST',
        data: {
            flag: 'chargeClient',
            client_id: currentClientId,
            amount: amount,
            description: description || 'شارژ کیف پول'
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                $.alert({
                    title: 'موفق',
                    icon: 'fa fa-check-circle',
                    content: response.message,
                    type: 'green'
                });
                // ریلود اطلاعات
                showWalletDetails(currentClientId, currentClientName);
            } else {
                $.alert({
                    title: 'خطا',
                    content: response.message,
                    type: 'red'
                });
            }
        },
        error: function() {
            $.alert({
                title: 'خطا',
                content: 'خطا در ارتباط با سرور',
                type: 'red'
            });
        }
    });
}

function deductClient() {
    var amount = $('#transactionAmount').val();
    var description = $('#transactionDesc').val();

    if (!amount || amount <= 0) {
        $.alert({
            title: 'خطا',
            content: 'لطفاً مبلغ معتبر (بزرگتر از صفر) وارد کنید',
            type: 'red'
        });
        return;
    }

    $.confirm({
        title: 'تأیید کسر مبلغ',
        icon: 'fa fa-exclamation-triangle',
        content: 'آیا از کسر مبلغ ' + numberFormat(amount) + ' ریال از کیف پول این آژانس اطمینان دارید؟',
        rtl: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'بله، کسر شود',
                btnClass: 'btn-red',
                action: function() {
                    $.ajax({
                        url: amadeusPath + 'user_ajax.php',
                        type: 'POST',
                        data: {
                            flag: 'deductClient',
                            client_id: currentClientId,
                            amount: amount,
                            description: description || 'کسر از کیف پول'
                        },
                        dataType: 'json',
                        success: function(response) {
                            if (response.success) {
                                $.alert({
                                    title: 'موفق',
                                    icon: 'fa fa-check-circle',
                                    content: response.message,
                                    type: 'green'
                                });
                                showWalletDetails(currentClientId, currentClientName);
                            } else {
                                $.alert({
                                    title: 'خطا',
                                    content: response.message,
                                    type: 'red'
                                });
                            }
                        },
                        error: function() {
                            $.alert({
                                title: 'خطا',
                                content: 'خطا در ارتباط با سرور',
                                type: 'red'
                            });
                        }
                    });
                }
            },
            cancel: {
                text: 'خیر، انصراف',
                btnClass: 'btn-default'
            }
        }
    });
}



// توابع کمکی
function escapeHtml(str) {
    if (!str) return '';
    return str.replace(/[&<>]/g, function(m) {
        if (m === '&') return '&amp;';
        if (m === '<') return '&lt;';
        if (m === '>') return '&gt;';
        return m;
    });
}

function exportToursToExcel() {
    var table = $('#toursDetailsTable').clone();
    var html = '<html><head><meta charset="UTF-8"></head><body>' + table.prop('outerHTML') + '</body></html>';
    var blob = new Blob([html], {type: 'application/vnd.ms-excel'});
    var link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'tour_details_' + new Date().getTime() + '.xls';
    link.click();
    URL.revokeObjectURL(link.href);
}

// تابع changeSafarBankStatus
function changeSafarBankStatus(agencyId, agencyName, activate) {
    var statusText = activate ? 'فعال کردن' : 'غیرفعال کردن';
    var currentStatus = activate ? 'غیرفعال' : 'فعال';

    $.alert({
        title: 'تغییر وضعیت سفربانک',
        icon: 'fa fa-exchange',
        content: 'آژانس "' + agencyName + '" در حال حاضر ' + currentStatus + ' است. آیا از ' + statusText + ' آن اطمینان دارید؟',
        rtl: true,
        closeIcon: true,
        type: 'orange',
        buttons: {
            confirm: {
                text: 'بله، اطمینان دارم',
                btnClass: 'btn-green',
                action: function () {
                    $.ajax({
                        url: amadeusPath + 'user_ajax.php',
                        type: 'POST',
                        data: {
                            flag: 'toggleSafarBankStatus',
                            agency_id: agencyId,
                            activate: activate ? 1 : 0
                        },
                        dataType: 'json',
                        success: function(response) {
                            if (response.success) {
                                $.alert({
                                    title: 'تبریک',
                                    icon: 'fa fa-check-circle',
                                    content: response.message,
                                    rtl: true,
                                    type: 'green',
                                });
                                setTimeout(function() {
                                    location.reload();
                                }, 1500);
                            } else {
                                $.alert({
                                    title: 'خطا',
                                    icon: 'fa fa-exclamation-triangle',
                                    content: response.message,
                                    rtl: true,
                                    type: 'red',
                                });
                            }
                        },
                        error: function() {
                            $.alert({
                                title: 'خطا',
                                icon: 'fa fa-times-circle',
                                content: 'خطا در ارتباط با سرور',
                                rtl: true,
                                type: 'red',
                            });
                        }
                    });
                }
            },
            cancel: {
                text: 'خیر، انصراف',
                btnClass: 'btn-orange',
            }
        }
    });
}