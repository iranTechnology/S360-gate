$('.owl-banner-kanoun').owlCarousel({
    rtl:true,
    loop:true,
    margin:0,
    nav:true,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L143 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-95-95L488 280c13.3 0 24-10.7 24-24s-10.7-24-24-24L81.9 232l95-95c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M505 273c9.4-9.4 9.4-24.6 0-33.9L369 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l95 95L24 232c-13.3 0-24 10.7-24 24s10.7 24 24 24l406.1 0-95 95c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L505 273z\"/></svg>"],
    autoplay: true,
    autoplayTimeout:5000,
    autoplayHoverPause:true,
    dots:false,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
});

$('.owl-tour').owlCarousel({
    rtl:true,
    loop:true,
    margin:20,
    nav:false,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M505 273c9.4-9.4 9.4-24.6 0-33.9L369 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l95 95L24 232c-13.3 0-24 10.7-24 24s10.7 24 24 24l406.1 0-95 95c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L505 273z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L143 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-95-95L488 280c13.3 0 24-10.7 24-24s-10.7-24-24-24L81.9 232l95-95c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>"],
    autoplay: true,
    autoplayTimeout: 15000,
    autoplaySpeed:5000,
    dots:true,
    responsive:{
        0:{
            items:1,
        },
        600:{
            items:2,
        },
        1000:{
            items:3
        }
    }
});

$('.owl-hotels').owlCarousel({
    rtl:true,
    loop:true,
    margin:20,
    nav:false,
    navText: ["<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M505 273c9.4-9.4 9.4-24.6 0-33.9L369 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l95 95L24 232c-13.3 0-24 10.7-24 24s10.7 24 24 24l406.1 0-95 95c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L505 273z\"/></svg>","<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d=\"M7 239c-9.4 9.4-9.4 24.6 0 33.9L143 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-95-95L488 280c13.3 0 24-10.7 24-24s-10.7-24-24-24L81.9 232l95-95c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L7 239z\"/></svg>"],
    autoplay: true,
    autoplayTimeout: 15000,
    autoplaySpeed:5000,
    dots:true,
    responsive:{
        0:{
            items:1,
        },
        600:{
            items:2,
        },
        1000:{
            items:4
        }
    }
});

$('.owl-blogs').owlCarousel({
    rtl:true,
    loop:true,
    margin:20,
    dots:true,
    nav:false,
    navText: ["<span class='fas fa-chevron-right'></span>","<span class='fas fa-chevron-left'></span>"],
    autoplay: true,
    autoplayTimeout: 5000,
    autoplaySpeed:3000,
    responsive:{
        0:{
            items:1,
            nav:false,
            dots:true,
        },
        576:{
            items:2,
            nav:true,
            dots:false,
        },
        768:{
            items:3,
        },
        1200:{
            items:3,
        }
    }
})

$('.owl-airlines').owlCarousel({
    loop:true,
    rtl:true,
    margin:40,
    nav:false,
    dots:false,
    autoplay:true,
    autoplayTimeout:4000,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:4
        },
        576:{
            items:5
        },
        992:{
            items:8
        },
        1200:{
            items:8,
            margin:70
        }
    }
})

$('.Flight_sec_Owl').owlCarousel({
    loop:true,
    rtl:true,
    margin:10,
    nav:false,
    dots:true,
    autoplay:true,
    autoplayTimeout:3000,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:2
        },
        1000:{
            items:4
        }
    }
})

$('.owl-work-team-migration').owlCarousel({
    rtl:true,
    loop:true,
    margin:10,
    nav:false,
    dots: false,
    autoplay: true,
    autoplayTimeout: 8000,
    autoplaySpeed:5000,
    responsive:{
        0:{
            items:3
        },
        576:{
            items:5
        },
        992:{
            items:9
        }
    }
});



function clickScroll(e){
    $("html").animate({
        scrollTop: $(`#${e}`).offset().top - 30
    }, 1000);
}

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})

$(".select2").select2();


// hide #back-top first
$("#scroll-top").addClass('d-none');
// fade in #back-top
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-top').addClass('d-flex');
            $('#scroll-top').removeClass('d-none');
        } else {
            $('#scroll-top').removeClass('d-flex');
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


$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
            $('.bottom-header').addClass('scrolled');
        } else {
            $('.bottom-header').removeClass('scrolled');
        }
    });
});



document.addEventListener('DOMContentLoaded', () => {

    // --- Canvas Particle Animation ---
    // A much more performant way to handle particles
    const canvas = document.getElementById('particle-canvas');
    const ctx = canvas.getContext('2d');
    let particles = [];

    const setupCanvas = () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    };

    class Particle {
        constructor() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.size = Math.random() * 2 + 1;
            this.speedX = Math.random() * 2 - 1;
            this.speedY = Math.random() * 2 - 1;
            this.color = 'rgba(255, 255, 255, 0.5)';
        }

        update() {
            this.x += this.speedX;
            this.y += this.speedY;

            // Reset particle when it goes off screen
            if (this.size > 0.2) this.size -= 0.02;
            if (this.size <= 0.2) {
                this.x = Math.random() * canvas.width;
                this.y = Math.random() * canvas.height;
                this.size = Math.random() * 2 + 1;
                this.speedX = Math.random() * 2 - 1;
                this.speedY = Math.random() * 2 - 1;
            }
        }

        draw() {
            ctx.fillStyle = this.color;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    const initParticles = () => {
        particles = [];
        const numberOfParticles = (canvas.width * canvas.height) / 9000;
        for (let i = 0; i < numberOfParticles; i++) {
            particles.push(new Particle());
        }
    };

    const animateParticles = () => {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        for (const particle of particles) {
            particle.update();
            particle.draw();
        }
        requestAnimationFrame(animateParticles);
    };

    // --- Card Tilt Interaction ---
    const card = document.querySelector('.glass-card');
    const container = document.querySelector('.container');

    container.addEventListener('mousemove', (e) => {
        const xAxis = (window.innerWidth / 2 - e.pageX) / 20; // Divisor controls sensitivity
        const yAxis = (window.innerHeight / 2 - e.pageY) / 20;
        card.style.transform = `rotateY(${xAxis}deg) rotateX(${yAxis}deg)`;
    });

    // Reset effect when mouse leaves the container
    container.addEventListener('mouseleave', () => {
        card.style.transform = 'rotateY(0deg) rotateX(0deg)';
    });

    // --- Initialization ---
    setupCanvas();
    initParticles();
    animateParticles();

    window.addEventListener('resize', () => {
        setupCanvas();
        initParticles();
    });
});



// کد برای انتخاب نفر در بیمه
//----------------------start passenger Count js-----------------------------//
document.addEventListener('DOMContentLoaded', function() {
    const dropdownToggleBime = document.querySelector('.dropdown-toggle-insurance');
    const dropdownMenu = document.querySelector('.dropdown-menu-insurance');
    const increaseButtons = document.querySelectorAll('.increase');
    const decreaseButtons = document.querySelectorAll('.decrease');

    function updateTotalPassengers() {
        const counts = document.querySelectorAll('.counter-insurance span');
        let total = 0;
        counts.forEach((count ,index) => {
            const countValue = parseInt(count.textContent);
            total += countValue;
        });
        if(dropdownToggleBime != null) {
            if (total > 0 ) {
                dropdownToggleBime.textContent = total + ' مسافر';
            } else {
                dropdownToggleBime.textContent = 'تعداد مسافر';
            }
        }
        $('#passengers-count-js').val(total);
    }

    if (dropdownToggleBime != null) {
        // باز و بسته کردن منو با کلیک روی دکمه
        dropdownToggleBime.addEventListener('click', function(event) {
            event.stopPropagation(); // جلوگیری از انتشار رویداد به body
            dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
        });

        // بستن منو با کلیک خارج از آن
        document.addEventListener('click', function(event) {
            if (!dropdownMenu.contains(event.target) && !dropdownToggleBime.contains(event.target)) {
                dropdownMenu.style.display = 'none';
            }
        });
    }


    increaseButtons.forEach((button, index) => {
        button.addEventListener('click', function() {
            const countSpan = this.parentElement.querySelector('span');
            let group = this.getAttribute('data-age')
            let count = parseInt(countSpan.textContent);
            countSpan.textContent = count + 1;
            updateTotalPassengers();
            const newInput = createAgeInput(index + '-' + count , group);
            this.parentElement.parentElement.appendChild(newInput);
        });
    });

    decreaseButtons.forEach((button, index) => {
        button.addEventListener('click', function() {
            const countSpan = this.parentElement.querySelector('span');
            let count = parseInt(countSpan.textContent);
            if (count > 0) {
                countSpan.textContent = count - 1;
                updateTotalPassengers();
                const inputId = 'txt_birth_insurance' + index + '-' + (count - 1);
                const inputToRemove = document.getElementById(inputId);
                if (inputToRemove) {
                    inputToRemove.remove();
                }
            }
        });
    });

    updateTotalPassengers();
});

function createAgeInput(index , ageGroup) {
    console.log('ageGroup' ,  ageGroup)
    const ageValue = generateBirthDate(ageGroup); // Generate random age between 18 and 60
    const input = document.createElement('input');
    input.setAttribute('autocomplete', 'off');
    input.setAttribute('class', 'form-control passengers-age-js shamsiBirthdayCalendar');
    input.setAttribute('id', 'txt_birth_insurance' + index);
    input.setAttribute('name', 'txt_birth_insurance' + index);
    input.setAttribute('type', 'hidden');
    input.setAttribute('value', ageValue);
    return input;
}

function generateBirthDate(ageGroup){

    const today = new Date(); // Get current date
    const currentYearShamsi = today.getFullYear() - 621; // Convert Gregorian to Shamsi approximately

    let minYear, maxYear;

    if (ageGroup === "0-12") {
        minYear = currentYearShamsi - 12; // Max 12 years old
        maxYear = currentYearShamsi;      // Min 0 years old
    } else if (ageGroup === "13-64") {
        minYear = currentYearShamsi - 64;
        maxYear = currentYearShamsi - 13;
    } else if (ageGroup === "65-70") {
        minYear = currentYearShamsi - 70; // Max 70 years old
        maxYear = currentYearShamsi - 65; // Min 65 years old
    } else if (ageGroup === "71-75") {
        minYear = currentYearShamsi - 75; // Max 75 years old
        maxYear = currentYearShamsi - 71; // Min 71 years old
    } else if (ageGroup === "76-85") {
        minYear = currentYearShamsi - 85; // Max 85 years old
        maxYear = currentYearShamsi - 76; // Min 76 years old
    } else if (ageGroup === "+81") {
        minYear = currentYearShamsi - 100; // Assume max age 100
        maxYear = currentYearShamsi - 81;  // Min 81 years old
    } else {
        throw new Error("Invalid age group");
    }

    const year = Math.floor(Math.random() * (maxYear - minYear + 1)) + minYear; // Random year within range
    const month = String(Math.floor(Math.random() * 12) + 1).padStart(2, '0'); // Random month 01-12
    const day = String(Math.floor(Math.random() * 29) + 1).padStart(2, '0'); // Random day 01-29

    return `${year}-${month}-${day}`; // Format: YYYY-MM-DD
}

//----------------------end passenger Count js-----------------------------//



function AdvancedInstallmentCalculatorBtn(){
    $(".AdvancedInstallmentCalculatorBox").toggle();
    $(".AdvancedInstallmentCalculatorBtn__open").toggle();
    $(".AdvancedInstallmentCalculatorBtn__close").toggle();
    $("#AdvancedInstallmentCalculatorBox_response_hide").hide();
    $("#AdvancedInstallmentCalculatorBox_response_hide_error").hide();

}

function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1,$2");
    return x;
}

function Main_AdvancedInstallmentCalculatorBtn(){
    var priceAll = Number((document.getElementById("priceInput").value).replace(/\D+/g, ""));

    // alert(priceAll);
    if(priceAll == ""){
        $("#AdvancedInstallmentCalculatorBox_response_hide").hide();
        $("#error_show_price").show();
        $("#error_show_price").html(useXmltag('PleaseEnterTourPrice'));
    }else if(priceAll < 2000000){
        $("#AdvancedInstallmentCalculatorBox_response_hide").hide();
        $("#error_show_price").show();
        $("#error_show_price").html(useXmltag('MinimumAmountDivided'));
    }else {
        $("#AdvancedInstallmentCalculatorBox_response_hide").show();
        $("#error_show_price").hide();
        var anAmount_tour = $('#anAmount_tour').val();
        if(anAmount_tour==''){
            var persent_discount = document.getElementById("persent_discount").innerText; // دریافت درصد مثلا 20%
            var initialPayment = Number(persent_discount.slice(0, 2)); // گرفتن عبارت %
            var installments = Number(document.getElementById("number_installments").innerText);
            var installmentsPlus = Number(installments + 1);   // تعدا اقساط به اضافه یک
            var initialPaymentPrice = priceAll*(initialPayment/100);  // محاسبه مبلغ پیش پرداخت
            var priceWithOutInitial = ((priceAll-initialPaymentPrice)/installments)+(((priceAll-initialPaymentPrice)*installmentsPlus)/100);
            var amountEachInstallmentWithSoud = (priceWithOutInitial*installments)+initialPaymentPrice;
            $('#result_calculater').html(numberWithCommas(Math.round(initialPaymentPrice))); // پیش پرداخت
            $('#price_all_calculater').html(numberWithCommas(Math.round(amountEachInstallmentWithSoud))); // قیمت کل
            $('#amount_each_installment_calculater').html(numberWithCommas(Math.round(priceWithOutInitial))); // مبلغ هر قسط
        }else{
            var installments = Number(document.getElementById("number_installments").innerText);
            var installmentsPlus = Number(installments + 1);   // تعدا اقساط به اضافه یک
            var initialPaymentPrice = Number(anAmount_tour);  // محاسبه مبلغ پیش پرداخت
            var priceWithOutInitial = ((priceAll-initialPaymentPrice)/installments)+(((priceAll-initialPaymentPrice)*installmentsPlus)/100);
            var amountEachInstallmentWithSoud = (priceWithOutInitial*installments)+initialPaymentPrice;
            $('#result_calculater').html(numberWithCommas(Math.round(initialPaymentPrice))); // پیش پرداخت
            $('#price_all_calculater').html(numberWithCommas(Math.round(amountEachInstallmentWithSoud))); // قیمت کل
            $('#amount_each_installment_calculater').html(numberWithCommas(Math.round(priceWithOutInitial))); // مبلغ هر قسط
        }
    }
    // alert(totalMoney);
}

function getInfoCalculator() {
    var profitPercentage = Number($('#profit_percentage').val());  // درصد سود ماهانه
    var installments = Number($('#installments').val());          // تعداد اقساط
    var initialPayment = Number($('#initial_payment').val());     // درصد پیش پرداخت
    var price = Number($('#price').val());                         // قیمت تور به میلیون
    var priceAll = price * 1e6;                                   // تبدیل به ریال

    // محاسبه مبلغ پیش‌پرداخت
    var initialPaymentPrice = priceAll * (initialPayment / 100);

    // مبلغ باقی‌مانده بعد از کسر پیش‌پرداخت
    var remainingPrice = priceAll - initialPaymentPrice;

    // محاسبه سود کل (ساده ماهانه)
    var totalProfit = remainingPrice * (profitPercentage / 100) * installments;

    // کل مبلغ قابل پرداخت بعد از کسر پیش‌پرداخت و اضافه کردن سود
    var totalPrice = remainingPrice + totalProfit;

    // مبلغ هر قسط
    var installmentAmount = totalPrice / installments;

    // نمایش نتایج با کاما
    $('#result_calculate').html(numberWithCommas(Math.round(initialPaymentPrice))); // پیش‌پرداخت
    $('#price_all').html(numberWithCommas(Math.round(totalPrice + initialPaymentPrice))); // قیمت کل شامل پیش‌پرداخت
    $('#amount_each_installment').html(numberWithCommas(Math.round(installmentAmount))); // هر قسط
}

function formatPrice() {
    let priceInput = document.getElementById('priceInput');
    let price = priceInput.value.replace(/\D/g, '');
    if (!isNaN(price)) {
        let formattedPrice = price.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        priceInput.value = formattedPrice;
    }
}

let percentage = 20;
let NumberOfInstallments = 4;

function plus_box_percentage(e){
    if (percentage < 100 ){
        e.currentTarget.parentNode.querySelector('span').innerText = percentage + 10 + '%';
        percentage = percentage + 10;
    }
}

function minus_box_percentage(e){
    if (percentage > 20 ){
        e.currentTarget.parentNode.querySelector('span').innerText = percentage - 10 + '%';
        percentage = percentage - 10;
    }
}

function plus_box_NumberOfInstallments(e){
    if (NumberOfInstallments < 12 ) {
        e.currentTarget.parentNode.querySelector('span').innerText = NumberOfInstallments + 1;
        NumberOfInstallments = NumberOfInstallments + 1;
    }
}

function minus_box_NumberOfInstallments(e){
    if (NumberOfInstallments > 4 ) {
        e.currentTarget.parentNode.querySelector('span').innerText = NumberOfInstallments - 1;
        NumberOfInstallments = NumberOfInstallments - 1;
    }
}

$(document).ready(function () {
    $('[data-rangeslider]').rangeslider({
        polyfill:false,
        rangeClass:'rangeslider',
        disabledClass:'rangeslider--disabled',
        activeClass:'rangeslider--active',
        horizontalClass:'rangeslider--horizontal',
        verticalClass:'rangeslider--vertical',
        fillClass:'rangeslider__fill',
        handleClass:'rangeslider__handle',
        onSlide:function(position, value) {
            console.log("onSlide" , position , value);
            $(".div-rangeslider > h6").text(value)
        }
    });
    $('[data-rangeslider2]').rangeslider({
        polyfill:false,
        rangeClass:'rangeslider',
        disabledClass:'rangeslider--disabled',
        activeClass:'rangeslider--active',
        horizontalClass:'rangeslider--horizontal',
        verticalClass:'rangeslider--vertical',
        fillClass:'rangeslider__fill',
        handleClass:'rangeslider__handle',
        onSlide:function(position, value) {
            console.log("onSlide" , position , value)
            $(".div-rangeslider2 > h6").text(value)
        }
    })
    $('[data-rangeslider3]').rangeslider({
        polyfill:false,
        rangeClass:'rangeslider',
        disabledClass:'rangeslider--disabled',
        activeClass:'rangeslider--active',
        horizontalClass:'rangeslider--horizontal',
        verticalClass:'rangeslider--vertical',
        fillClass:'rangeslider__fill',
        handleClass:'rangeslider__handle',
        onSlide:function(position, value) {
            $(".div-rangeslider3 > h6").text(value)
        }
    })
    setTimeout(function () {
        getInfoCalculator();
    }, 100);
    $(".anAmount_btn").click(() => {
        $(".percentage").hide()
        $(".anAmount").show()
        $(".anAmount_btn").addClass("active")
        $(".percentage_btn").removeClass("active")
        console.log("test")
    })
    $(".percentage_btn").click(() => {
        $(".percentage").show()
        $(".anAmount").hide()
        $(".percentage_btn").addClass("active")
        $(".anAmount_btn").removeClass("active")
        $('#anAmount_tour').val('');


    })
});