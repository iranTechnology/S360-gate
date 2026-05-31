$('.owl-tour-arshida').owlCarousel({
    rtl: true,
    loop: true,
    margin: 10,
    nav: true,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 320 512\"><!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. --><path d=\"M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z\"/></svg>", "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 320 512\"><!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. --><path d=\"M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z\"/></svg>"],
    autoplay: true,
    autoplayTimeout: 5000,
    autoplaySpeed: 1000,
    dots: false,
    responsive: {
        0: {
            items: 1,
            nav: false,
            dots: true,
        },
        576: {
            items: 1,
            nav: true,
            dots: false,
        }
    }
});

$(".owl-tour-gisoo").owlCarousel({
  rtl: true,
  loop: true,
  margin: 16,
  nav: false,
  navText: [
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M505 273c9.4-9.4 9.4-24.6 0-33.9L369 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l95 95L24 232c-13.3 0-24 10.7-24 24s10.7 24 24 24l406.1 0-95 95c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L505 273z"/></svg>',
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M7 239c-9.4 9.4-9.4 24.6 0 33.9L143 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-95-95L488 280c13.3 0 24-10.7 24-24s-10.7-24-24-24L81.9 232l95-95c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z"/></svg>',
  ],
  autoplay: true,
  autoplayTimeout: 6000,
  autoplaySpeed: 1000,
  dots: true,
  responsive: {
    0: {
      items: 1,
    },
    576: {
      items: 2,
    },
    768: {
      items: 3,
    },
    992: {
      items: 1,
    },
  },
});

const itemFtour = document.querySelectorAll(".item-ftour");
itemFtour.forEach((element) => {
  element.addEventListener("click", function () {
    document.querySelector(".back-ftour").classList.add("click-back-ftour");
    element.children[2].classList.add("click-item-cnt-ftour");
  });
});

const container = document.querySelector("main"); // والد مناسب را انتخاب کنید

container.addEventListener("click", function (event) {
  if (event.target.classList.contains("back-ftour")) {
    event.target.parentElement.classList.remove("click-item-cnt-ftour");
    console.log(event.target.parentElement.classList);
  }
});


$(".select2").select2();


// hide #back-top first
$("#scroll-top").addClass('d-none');
// fade in #back-top
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-top').addClass('d-flex-fix-icon');
            $('#scroll-top').removeClass('d-none');
        } else {
            $('#scroll-top').removeClass('d-flex-fix-icon');
            $('#scroll-top').addClass('d-none');
        }
    });
    // scroll body to 0px on click
    $('#scroll-top').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 800);
    });
});


$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $('.header_area').addClass('scrolled');
        } else {
            $('.header_area').removeClass('scrolled');
        }
    });
});


//search_flight

$('.Flight_sec_Owl').owlCarousel({
    loop: true,
    rtl: true,
    margin: 10,
    nav: false,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 320 512\"><!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. --><path d=\"M305 239c9.4 9.4 9.4 24.6 0 33.9L113 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L79 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L305 239z\"/></svg>", "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 320 512\"><!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. --><path d=\"M15 239c-9.4 9.4-9.4 24.6 0 33.9L207 465c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9L65.9 256 241 81c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L15 239z\"/></svg>"],
    dots: true,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplaySpeed: 1000,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 3
        },
        1200: {
            items: 4
        }
    }
})

//hotel

$('.owl-hotel-ghods').owlCarousel({
    rtl: true,
    loop: true,
    margin: 30,
    nav: false,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M505 273c9.4-9.4 9.4-24.6 0-33.9L369 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l95 95L24 232c-13.3 0-24 10.7-24 24s10.7 24 24 24l406.1 0-95 95c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L505 273z\"/></svg>", "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L143 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-95-95L488 280c13.3 0 24-10.7 24-24s-10.7-24-24-24L81.9 232l95-95c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>"],
    autoplay: true,
    autoplayTimeout: 5000,
    autoplaySpeed: 1000,
    dots: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 3
        },
        1200: {
            items: 4
        }
    }
});


function clickSearchBox(id) {




    if (id === "item-search-box2" || id === "item-search-box3" || id === "item-search-box4" || id === "item-search-box5" || id === "item-search-box6" || id === "item-search-box7") {
        const navbar = document.querySelector('#navbar');
        if (navbar) navbar.style.backgroundColor = '#fafafa';
    }

    // تنظیمات هر جعبه جستجو بر اساس شناسه
    const settings = {
        "item-search-box1": { bg: ['.bg-airplane', '.bg-airplane-768' , '.bg-airplane-576', '.passport-unactive'], parent: '#Flight-parent', title: '#titleFlight', },
        "item-search-box2": { bg: ['.bg-rent', '.bg-rent-768' , '.bg-rent-576', '.passport-unactive'], parent: '#rent-parent', title: '#titleRent', },
        "item-search-box3": { bg: ['.bg-hotel', '.bg-hotel-768' , '.bg-hotel-576', '.passport-unactive'], parent: '#Hotel-parent', title: '#titleHotel', },
        "item-search-box4": { bg: ['.bg-bus', '.bg-bus-768' , '.bg-bus-576', '.passport-unactive'], parent: '#Bus-parent', title: '#titleBus', },
        "item-search-box5": { bg: ['.bg-insurance', '.bg-insurance-768' , '.bg-insurance-576', '.passport-unactive'], parent: '#Insurance-parent', title: '#titleInsurance', },
        "item-search-box6": { bg: ['.bg-train', '.bg-train-768' , '.bg-train-576', '.passport-unactive'], parent: '#Train-parent', title: '#titleTrain', },
        "item-search-box7": { bg: ['.passport-active', '.bg-passport', '.bg-passport-768' , '.bg-passport-576'], parent: '#Visa-parent', title: '#titleVisa', },
        "item-search-box8": { bg: ['.bg-package', '.bg-package-768' , '.bg-package-576', '.passport-unactive'], parent: '#Package-parent', title: '#titlePackage', },
        "item-search-box9": { bg: ['.bg-package', '.bg-package-768' , '.bg-package-576', '.passport-unactive'], parent: '#Tour-parent', title: '#titleTour', }
    };

    // بررسی تنظیمات بر اساس id
    if (settings[id]) {
        const config = settings[id];

        // نمایش پس‌زمینه‌ها
        config.bg.forEach(selector => {
            const element = document.querySelector(selector);
            if (element) element.style.opacity = '1';
        });

        // نمایش محتوای مربوط به جعبه جستجو
        const parentElement = document.querySelector(config.parent);
        if (parentElement) {
            parentElement.classList.add("d-flex");
            setTimeout(function() {
                parentElement.classList.add("width-search-box");
            }, 100)
        }

        setTimeout(() => {
            const title = document.querySelector(config.title);
            if (title) title.style.width = '90px';
        }, 800); // تاخیر به میلی‌ثانیه

        setTimeout(() => {
            const title = document.querySelector(config.title);
            title.style.transform = 'translate(0, 0)';
        }, 1100); // تاخیر به میلی‌ثانیه

        setTimeout(() => {
            const title = document.querySelector(config.title);
            title.children[0].style.transform = 'translateY(0)';
        }, 1400); // تاخیر به میلی‌ثانیه

        setTimeout(() => {
            document.querySelectorAll('.banner-safiran .select2-selection__arrow').forEach(element => {
                element.style.opacity = '1';
            });
        }, 1300); // تاخیر به میلی‌ثانیه

        // مخفی کردن جعبه جستجو اصلی و نمایش دکمه بازگشت
        document.querySelector('.search-box').style.display = 'none';
        document.querySelector('.back').style.opacity = '1';
        setTimeout(() => {
            document.querySelectorAll('.banner-safiran .form-group').forEach(element => {
                element.style.width = '100%';
            });
            document.querySelectorAll('.banner-safiran .box-of-count-passenger-boxes').forEach(element => {
                element.style.width = '100%';
            });
            document.querySelectorAll('.banner-safiran .switch_routs').forEach(element => {
                element.style.height = '28px';
            });
            document.querySelectorAll('.banner-safiran .theme-btn').forEach(element => {
                element.style.setProperty('height', '50px', 'important');
            });
            document.querySelectorAll('.banner-safiran .switch').forEach(element => {
                element.style.opacity = '1';
            });
            document.querySelectorAll('.banner-safiran .cntr').forEach(element => {
                element.style.opacity = '1';
            });
        }, 800); // تاخیر به میلی‌ثانیه
    } else {
        console.warn(`تنظیمات برای id ${id} پیدا نشد.`);
    }
}

function back() {
    // مخفی کردن دکمه بازگشت و نمایش جعبه جستجو
    document.querySelector('.back').style.opacity = '0';
    document.querySelector('.search-box').style.display = 'grid';
    document.querySelector('#navbar').style.backgroundColor = '#c1e7fa';
        document.querySelectorAll('.title-search-box').forEach(element => {
            element.style.transform = 'translate(15px, 15px)';
            element.children[0].style.transform = 'translateY(40px)';
        });
    setTimeout(() => {
        document.querySelectorAll('.title-search-box').forEach(element => {
            element.style.width = '0';
        });
    }, 300); // تاخیر به میلی‌ثانیه
    setTimeout(() => {
        document.querySelectorAll('.title-search-box').forEach(element => {
            element.style.width = '0';
        });
        document.querySelectorAll('.banner-safiran .select2-selection__arrow').forEach(element => {
            element.style.opacity = '0';
        });
    }, 800); // تاخیر به میلی‌ثانیه

    document.querySelectorAll('.banner-safiran .form-group').forEach(element => {
        element.style.width = '0';
    });
    document.querySelectorAll('.banner-safiran .box-of-count-passenger-boxes').forEach(element => {
        element.style.width = '0';
    });
    document.querySelectorAll('.banner-safiran .switch').forEach(element => {
        element.style.opacity = '0';
    });
    document.querySelectorAll('.banner-safiran .cntr').forEach(element => {
        element.style.opacity = '0';
    });
    document.querySelectorAll('.banner-safiran .theme-btn').forEach(element => {
        element.style.setProperty('height', '0', 'important');
    });
    document.querySelectorAll('.banner-safiran .switch_routs').forEach(element => {
        element.style.height = '0';
    });

    // مخفی کردن تمام محتوای جعبه‌های جستجو
    document.querySelectorAll('.searchBoxContent').forEach(element => {
        element.classList.remove("width-search-box")
        setTimeout(function() {
            element.classList.remove("d-flex")
        }, 800)
    });

    // پنهان کردن تمام پس‌زمینه‌ها
    document.querySelectorAll('.bg-airplane, .bg-airplane-768 , .bg-airplane-576 , .bg-rent, .bg-rent-768, .bg-rent-576 ,.bg-hotel, .bg-hotel-768, .bg-hotel-576 , .bg-bus, .bg-bus-768, .bg-bus-576 , .bg-insurance, .bg-insurance-768, .bg-insurance-576 , .bg-train, .bg-train-768 , .bg-train-576 , .bg-package , .bg-package-768, .bg-package-576 ,.passport-active ,.bg-passport ,.bg-passport-768 ,.bg-passport-576, .passport-unactive').forEach(element => {
        element.style.opacity = '0';
    });
}
