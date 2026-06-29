$(document).ready(function () {
    $('.close_room').click(function (e){
        e.stopPropagation();
        $(".hotel_local-rooms").removeClass('active_p');
    });
    $('.international-close-room-js').click(function (e){
        e.stopPropagation();
        $(".international-my-hotels-rooms-js").removeClass('active_p');
    });

    if($(window).width() > 992){
        $(window).scroll(function () {
            var sctop = $(this).scrollTop();
            if(sctop > 0){
                $('#navbar').addClass('fixedmenu');
            }
            else{
                $('#navbar').removeClass('fixedmenu');
            }
        });
    }

    $('.owl-blog').owlCarousel({
        loop:true,
        rtl:true,
        margin:20,
        nav:true,
        navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d=\"M89.45 87.5l143.1 152c4.375 4.625 6.562 10.56 6.562 16.5c0 5.937-2.188 11.87-6.562 16.5l-143.1 152C80.33 434.1 65.14 434.5 55.52 425.4c-9.688-9.125-10.03-24.38-.9375-33.94l128.4-135.5l-128.4-135.5C45.49 110.9 45.83 95.75 55.52 86.56C65.14 77.47 80.33 77.87 89.45 87.5z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 256 512\"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d=\"M166.5 424.5l-143.1-152c-4.375-4.625-6.562-10.56-6.562-16.5c0-5.938 2.188-11.88 6.562-16.5l143.1-152c9.125-9.625 24.31-10.03 33.93-.9375c9.688 9.125 10.03 24.38 .9375 33.94l-128.4 135.5l128.4 135.5c9.094 9.562 8.75 24.75-.9375 33.94C190.9 434.5 175.7 434.1 166.5 424.5z\"/></svg>"],
        dots:false,
        autoplay:true,
        autoplayTimeout:3500,
        autoplayHoverPause:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            768:{
                items:2
            },
            1000:{
                items:3
            },
            1200:{
                items:4
            }
        },
        stagePadding: 50,
    })
    $('.owl-hotel').owlCarousel({
        loop:true,
        rtl:true,
        margin:20,
        nav:false,
        dots:true,
        autoplay:true,
        autoplayTimeout:3500,
        autoplayHoverPause:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:3
            },
            1200:{
                items:4
            }
        },
    })
});


// گرفتن ترتیب فعلی از خود لیست
// روش اول: صبر برای لود کامل صفحه
// تابع مرتب‌سازی
function reorderHotelList() {
    var list = document.getElementById('listSearchCity_2');
    if (!list) {
        console.log('listSearchCity_2 پیدا نشد');
        return false;
    }

    var items = list.querySelectorAll('li');
    if (items.length === 0) {
        console.log('آیتمی در listSearchCity_2 پیدا نشد');
        return false;
    }

    var desiredOrder = ['کربلا', 'آل نجف', 'بغداد', 'اربیل', 'کاظمین', 'سلیمانیه', 'بصره', 'موصل', 'مشهد', 'وان'];
    var heading = list.querySelector('h2');

    // ساخت آرایه از آیتم‌ها با نام شهر
    var itemsWithName = [];
    for (var i = 0; i < items.length; i++) {
        var cityName = items[i].querySelector('.c-text')?.textContent.trim();
        if (cityName) {
            itemsWithName.push({ item: items[i], name: cityName });
        }
    }

    if (itemsWithName.length === 0) {
        console.log('هیچ شهری در لیست پیدا نشد');
        return false;
    }

    // مرتب‌سازی آرایه
    itemsWithName.sort(function(a, b) {
        var indexA = desiredOrder.indexOf(a.name);
        var indexB = desiredOrder.indexOf(b.name);
        if (indexA === -1) indexA = 999;
        if (indexB === -1) indexB = 999;
        return indexA - indexB;
    });

    // اضافه کردن به ترتیب جدید (بدون حذف innerHTML)
    for (var i = 0; i < itemsWithName.length; i++) {
        list.appendChild(itemsWithName[i].item);
    }

    console.log('✅ listSearchCity_2 مرتب شد:', itemsWithName.map(function(x) { return x.name; }));
    return true;
}

function reorderMobileDestinations() {
    var container = document.getElementById('mobilePopularDestinationsHotel');
    if (!container) {
        console.log('mobilePopularDestinationsHotel پیدا نشد');
        return false;
    }

    var items = container.querySelectorAll('li');
    if (items.length === 0) {
        console.log('آیتمی در mobilePopularDestinationsHotel پیدا نشد');
        return false;
    }

    var desiredOrder = ['کربلا', 'آل نجف', 'بغداد', 'اربیل', 'کاظمین', 'سلیمانیه', 'بصره', 'موصل', 'مشهد', 'وان'];

    // ساخت آرایه از آیتم‌ها با نام شهر
    var itemsWithName = [];
    for (var i = 0; i < items.length; i++) {
        var span = items[i].querySelector('.city-text div:last-child span');
        var cityName = span ? span.textContent.trim() : '';
        if (cityName) {
            itemsWithName.push({ item: items[i], name: cityName });
        }
    }

    if (itemsWithName.length === 0) {
        console.log('هیچ شهری در لیست موبایل پیدا نشد');
        return false;
    }

    // مرتب‌سازی آرایه
    itemsWithName.sort(function(a, b) {
        var indexA = desiredOrder.indexOf(a.name);
        var indexB = desiredOrder.indexOf(b.name);
        if (indexA === -1) indexA = 999;
        if (indexB === -1) indexB = 999;
        return indexA - indexB;
    });

    // اضافه کردن به ترتیب جدید (بدون حذف innerHTML)
    for (var i = 0; i < itemsWithName.length; i++) {
        container.appendChild(itemsWithName[i].item);
    }

    console.log('✅ mobilePopularDestinationsHotel مرتب شد:', itemsWithName.map(function(x) { return x.name; }));
    return true;
}

// نسخه پشتیبان - هر 1 ثانیه یکبار چک کن
var isReordered = false;

function checkAndReorder() {
    if (isReordered) {
        console.log('مرتب‌سازی قبلاً انجام شده است');
        return;
    }

    console.log('چک کردن لیست‌ها...');

    var list = document.getElementById('listSearchCity_2');
    var mobileList = document.getElementById('mobilePopularDestinationsHotel');

    var listItems = list ? list.querySelectorAll('li').length : 0;
    var mobileItems = mobileList ? mobileList.querySelectorAll('li').length : 0;

    console.log('تعداد آیتم‌ها - لیست عادی: ' + listItems + ', لیست موبایل: ' + mobileItems);

    if (listItems > 0 || mobileItems > 0) {
        isReordered = true;
        console.log('🎯 شروع مرتب‌سازی نهایی...');

        if (listItems > 0) {
            reorderHotelList();
        }
        if (mobileItems > 0) {
            reorderMobileDestinations();
        }

        console.log('✅ مرتب‌سازی با موفقیت انجام شد!');
    }
}

// هر 1 ثانیه یکبار چک کن
var interval = setInterval(checkAndReorder, 1000);

// بعد از 15 ثانیه stop کن
setTimeout(function() {
    clearInterval(interval);
    if (!isReordered) {
        console.log('⚠️ مرتب‌سازی انجام نشد - لیست پیدا نشد');
    } else {
        console.log('✅ فرآیند مرتب‌سازی متوقف شد');
    }
}, 15000);

// همچنین وقتی روی input کلیک شد، دوباره چک کن
var searchInput = document.getElementById('autoComplateSearchIN_2');
if (searchInput) {
    searchInput.addEventListener('click', function() {
        console.log('🖱️ کلیک روی جستجو - ریست کردن وضعیت مرتب‌سازی');
        isReordered = false;
        setTimeout(function() {
            checkAndReorder();
        }, 500);
    });
}

// اجرای اولیه بعد از لود صفحه
document.addEventListener('DOMContentLoaded', function() {
    console.log('📄 صفحه لود شد - شروع فرآیند مرتب‌سازی');
    setTimeout(function() {
        checkAndReorder();
    }, 500);
});