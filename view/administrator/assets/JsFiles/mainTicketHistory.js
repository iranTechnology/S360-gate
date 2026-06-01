var xmlDoc = null;
fetch(LANG_XML_URL)
    .then(r => r.text())
    .then(text => {
        var parser = new DOMParser();
        // var را از اینجا برداشتیم
        xmlDoc = parser.parseFromString(text, "text/xml");  // تعریف صریح متغیر

        // بررسی اینکه آیا XML به درستی لود شده است
        if (xmlDoc.getElementsByTagName("parsererror").length === 0) {
            $("#Home").html(xmlDoc.getElementsByTagName("Home")[0].textContent);
            $("#PA_BUY_LIST").html(xmlDoc.getElementsByTagName("PA_BUY_LIST")[0].textContent);
            $(".PA_BUY_HISTORY").html(xmlDoc.getElementsByTagName("PA_BUY_HISTORY")[0].textContent);
            $("#PA_COM_BUY_HISTORY").html(xmlDoc.getElementsByTagName("PA_COM_BUY_HISTORY")[0].textContent);
            $("#PA_BUY_DATES").html(xmlDoc.getElementsByTagName("PA_BUY_DATES")[0].textContent);
            $("#PA_BUY_DATEE").html(xmlDoc.getElementsByTagName("PA_BUY_DATEE")[0].textContent);
            $("#PA_BUY_DATERS").html(xmlDoc.getElementsByTagName("PA_BUY_DATERS")[0].textContent);
            $("#PA_BUY_DATERE").html(xmlDoc.getElementsByTagName("PA_BUY_DATERE")[0].textContent);
            $("#Statusreservation_OP").text(xmlDoc.getElementsByTagName("Statusreservation")[0].textContent);
            $(".OptionAll").text(xmlDoc.getElementsByTagName("All")[0].textContent);
            $("#StatusSuccess").text(xmlDoc.getElementsByTagName("Successpayment")[0].textContent);
            $("#StatusFail").text(xmlDoc.getElementsByTagName("ErrorPayment")[0].textContent);
            $("#pnr").attr(
                "placeholder",
                xmlDoc.getElementsByTagName("PA_BUY_PNR")[0].textContent
            );
            $("#OriginCity").text(xmlDoc.getElementsByTagName("Origincity")[0].textContent);
            $("#Destinationcity").text(xmlDoc.getElementsByTagName("Destinationcity")[0].textContent);
            $("#request_number").attr(
                "placeholder",
                xmlDoc.getElementsByTagName("PA_BUY_REQUEST")[0].textContent
            );
            $("#flight_number").attr(
                "placeholder",
                xmlDoc.getElementsByTagName("PA_BUY_NUMBERFLIGHT")[0].textContent
            );
            $("#passenger_national_code").attr(
                "placeholder",
                xmlDoc.getElementsByTagName("PA_BUY_NationalCode")[0].textContent
            );
            $("#DateFlight").attr(
                "placeholder",
                xmlDoc.getElementsByTagName("PA_BUY_DATEFLIGHT")[0].textContent
            );
            $("#OptionTypeflight").text(xmlDoc.getElementsByTagName("Typeflight")[0].textContent);
            $("#Typeflight").html(xmlDoc.getElementsByTagName("Typeflight")[0].textContent);
            $("#ChoseOption").text(xmlDoc.getElementsByTagName("ChoseOption")[0].textContent);
            $(".OptionAll").text(xmlDoc.getElementsByTagName("All")[0].textContent);
            $(".FlightCharter").text(xmlDoc.getElementsByTagName("CharterType")[0].textContent);
            $(".FlightSystem").text(xmlDoc.getElementsByTagName("SystemType")[0].textContent);
            $(".FlightCharterPrivate").text(xmlDoc.getElementsByTagName("DedicatedPiedChart")[0].textContent);
            $(".FlightSystemPrivate").text(xmlDoc.getElementsByTagName("DedicatedPidSystem")[0].textContent);
            $("#spanFlight").html(xmlDoc.getElementsByTagName("GoharFlight")[0].textContent);
            $("#silenceSpanHotel").html(xmlDoc.getElementsByTagName("silenceSpanHotel")[0].textContent);
            $("#Bus").html(xmlDoc.getElementsByTagName("Bus")[0].textContent);
            $("#PA_BUY_BUTFILTER").text(xmlDoc.getElementsByTagName("PA_BUY_BUTFILTER")[0].textContent);
            $(".DownloadExcelFile").html(xmlDoc.getElementsByTagName("PA_BUY_DownloadExcelFile")[0].textContent);




        }
    })
    .catch(error => {
        console.error("❌ خطا در دریافت فایل XML:", error);
});



// ۳. محتویات اصلی فایل datepicker-scripts.js (نسخه اصلاح شده)
function e(n) {
    setTimeout(function() {
        var i = $(n).datepicker("widget").find(".ui-datepicker-buttonpane"),
            t = $('<button class="btn" type="button"><\/button>');
        $.cookie("datepickerRegional") == "en" ? (t.html('شمسی'), t.attr("data-regional", "fa")) : (t.html('میلادی'), t.attr("data-regional", "en"));
        t.unbind("click").bind("click", function() {
            var t = $(this).attr("data-regional");
            if (t == "en") {
                $.cookie("datepickerRegional", "en", { path: "/", expires: 365 });
                o("en");
            } else {
                $.cookie("datepickerRegional", "fa", { path: "/", expires: 365 });
                o("fa");
            }
            $(n).datepicker("hide");
            $(n).datepicker("show");
        });
        t.appendTo(i);
    }, 1);
}

function o(n) {
    $(".hasDatepicker").each(function(t, i) {
        var r = $(i);
        var s = r.datepicker("option", "dateFormat");
        if (n === "en") {
            r.datepicker("option", $.datepicker.regional[""]);
            r.datepicker("option", "dateFormat", "yy-mm-dd");
        } else {
            r.datepicker("option", $.datepicker.regional.fa);
            r.datepicker("option", "dateFormat", "yy-mm-dd");
        }
    });
}

// توابع تبدیل تاریخ (همان کدهایی که فرستادی)
var GREGORIAN_EPOCH = 1721425.5;
var PERSIAN_EPOCH = 1948320.5;
function n(n, t) { return n - t * Math.floor(n / t); }
function s(n) { return n % 4 == 0 && !(n % 100 == 0 && n % 400 != 0); }
function t(n, t, i) { return GREGORIAN_EPOCH - 1 + 365 * (n - 1) + Math.floor((n - 1) / 4) + -Math.floor((n - 1) / 100) + Math.floor((n - 1) / 400) + Math.floor((367 * t - 362) / 12 + (t <= 2 ? 0 : s(n) ? -1 : -2) + i); }
function r(i) {
    var u = Math.floor(i - .5) + .5, f = u - GREGORIAN_EPOCH, l = Math.floor(f / 146097), e = n(f, 146097), o = Math.floor(e / 36524), h = n(e, 36524), a = Math.floor(h / 1461), v = n(h, 1461), c = Math.floor(v / 365), r = l * 400 + o * 100 + a * 4 + c;
    if (o == 4 || c == 4) r++;
    var y = u - t(r, 1, 1), p = u < t(r, 3, 1) ? 0 : s(r) ? 1 : 2;
    var month = Math.floor(((y + p) * 12 + 373) / 367), day = u - t(r, month, 1) + 1;
    return [r, month, day];
}
function i(t, i, r) {
    var u = t - (t >= 0 ? 474 : 473), f = 474 + n(u, 2820);
    return r + (i <= 7 ? (i - 1) * 31 : (i - 1) * 30 + 6) + Math.floor((f * 682 - 110) / 2816) + (f - 1) * 365 + Math.floor(u / 2820) * 1029983 + (PERSIAN_EPOCH - 1);
}

// ۴. اجرای نهایی در زمان لود صفحه
$(document).ready(function() {
    // 2) نابود کردن کامل هر نوع datepicker که قبلاً نصب شده
    $('input.datepicker, input.datepickerReturn, .hasDatepicker')
        .each(function() {
            try { $(this).datepicker('destroy'); } catch(e) {}
            $(this).removeClass('hasDatepicker');
        });

    // 3) بر اساس زبان datepicker صحیح را نصب می‌کنیم
    if (LANG_PANEL_ADMIN === 'en' || LANG_PANEL_ADMIN === 'ar') {
        // ✅ میلادی (فایل زبان را ریست می‌کنیم)
        $('.datepickerReturn')
            .removeClass('datepicker')
            .datepicker({
                dateFormat: 'yy-mm-dd',
                changeYear: true,
                changeMonth: true,
                // این دو خط کلید حل مشکل است:
                regional: "",
                monthNames: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                dayNamesMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
            });
    }else {
        // شمسی
        $('.datepicker')
            .removeClass('datepickerReturn') // جلوگیری از اجرای میلادی
            .datepicker({
                dateFormat: 'yy-mm-dd',
                yearRange: '1300:1450'
            });
    }

});
