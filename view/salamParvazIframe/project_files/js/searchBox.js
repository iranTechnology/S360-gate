
// Dropdown برای کلاس پرواز (اکونومی، پریمیوم، بیزنیس)
// استفاده از event delegation برای پشتیبانی از چندین dropdown
function toggleDropdownFlightClass(event) {
    // پیدا کردن المان dropdown که کلیک شده
    let clickedElement = null;
    let dropdownContent = null;

    if (event && event.target) {
        // پیدا کردن والد dropdown-toggle-cheng
        clickedElement = event.target.closest('.dropdown-toggle-cheng');
        if (clickedElement) {
            dropdownContent = clickedElement.querySelector('.money-filter_ul');
        }
    }

    if (!dropdownContent) {
        // fallback برای کد قبلی
        dropdownContent = document.getElementById('flight-class-dropdown');
    }

    if(dropdownContent) {
        dropdownContent.classList.toggle('activeDropdown');
    }
}

document.body.addEventListener('click', function(event) {
    // بستن تمام dropdown های باز اگر کلیک خارج از آنها بود
    const allDropdowns = document.querySelectorAll('.dropdown-toggle-cheng');
    allDropdowns.forEach(function(dropdown) {
        const dropdownContent = dropdown.querySelector('.money-filter_ul');
        if(dropdown && dropdownContent){
            if (!dropdown.contains(event.target)) {
                dropdownContent.classList.remove('activeDropdown');
            }
        }
    });
});

function selectFlightClass(optionText, classType, event) {
    // پیدا کردن dropdown والد
    let clickedElement = null;
    let dropdownParent = null;
    let toggleText = null;
    let dropdown = null;

    if (event && event.target) {
        clickedElement = event.target;
        dropdownParent = clickedElement.closest('.dropdown-toggle-cheng');
        if(dropdownParent) {
            toggleText = dropdownParent.querySelector('.dropdown-text');
            dropdown = dropdownParent.querySelector('.money-filter_ul');
        }
    }

    if (!toggleText) {
        toggleText = document.getElementById('toggle-text-class');
        dropdown = document.getElementById('flight-class-dropdown');
    }

    if(toggleText) {
        toggleText.innerText = optionText;
    }

    // حذف کلاس active از همه آیتم‌ها
    const allItems = dropdown.querySelectorAll('.switch-class-js');
    allItems.forEach(item => {
        item.classList.remove('active');
    });

    // اضافه کردن کلاس active به آیتم انتخاب شده
    if (clickedElement) {
        clickedElement.classList.add('active');
    }

    // ذخیره مقدار در input hidden
    const flightClassInternal = document.getElementById('flight_class_internal');
    const flightClassInternational = document.getElementById('flight_class_international');

    if(flightClassInternal) {
        flightClassInternal.value = classType;
    }
    if(flightClassInternational) {
        flightClassInternational.value = classType;
    }

    console.log('Selected flight class:', classType);

    // بستن dropdown بعد از انتخاب
    if(dropdown) {
        dropdown.classList.remove('activeDropdown');
    }
}


// تعیین گزینه اکتیو به صورت اولیه
window.onload = function() {
    let toggleTextElement = document.querySelector('toggle-text');
    let initialOption = null ;
    if (toggleTextElement) {
        initialOption = toggleTextElement.innerText;
    }

    // همیشه dropdown کلاس پرواز را نمایش بده
    const boxClass = document.querySelector('.parent-class-cheng');
    if(boxClass) {
        boxClass.style.display = 'flex';
    }

    if (initialOption !== null){
        if (initialOption === 'داخلی') {
            document.querySelector('.internal-content-flight').style.display = 'flex';
            document.querySelector('.external-content-flight').style.display = 'none';
        } else {
            document.querySelector('.internal-content-flight').style.display = 'none';
            document.querySelector('.external-content-flight').style.display = 'flex';
        }
    }
}




$(document).ready(function () {
    $('input:radio[name="btn_switch_tour"]').change(
        function(){
            if (this.checked && this.value == '1') {


                $('#international_tour').css('display','flex');
                $('#internal_tour').hide();


            }
            else {
                $('#international_tour').hide();
                $('#internal_tour').css('display','flex');
            }
        });



    $(".select2 , .select-route-bus-js , .default-select2 , .gasht-type-js , .select2_in").select2();
    $('.switch-input-js').on('change', function() {
        if (this.checked && this.value === '1') {
            $('.international-flight-js').css('display', 'flex')
            $('.internal-flight-js').hide()
            $('.flight-multi-way-js').hide()
            $(this).attr('select_type','yes')
        } else {
            $('.internal-flight-js').css('display', 'flex')
            $('.international-flight-js').hide()
            $('.flight-multi-way-js').hide()
            $('.switch-input-js').removeAttr('select_type')
        }
    })
    $('.select-type-way-js').on('click', function () {
        let type = $(this).data('type');
        let class_element = $(`.${type}-one-way-js`);
        let arrival_date =  $(`.${type}-arrival-date-js`)
        if (class_element.is(':checked')) {
            arrival_date.attr("disabled", "disabled");
        } else {
            arrival_date.removeAttr("disabled");
        }
    });
    $('.click_flight_multi_way').on('click', function() {
        $('.flight-multi-way-js').css('display', 'flex')
        $('.internal-flight-js').hide()
        $('.international-flight-js').hide()
    })
    $('.click_flight_oneWay').on('click', function() {
        $('.international-flight-js').css('display', 'flex')
        $('.internal-flight-js').hide()
        $('.flight-multi-way-js').hide()
    })
    $('.click_flight_twoWay').on('click', function() {
        $('.international-flight-js').css('display', 'flex')
        $('.internal-flight-js').hide()
        $('.flight-multi-way-js').hide()
    })
    $(".switch-input-hotel-js").on("change", function () {
        $(".init-shamsi-datepicker").val("")
        $(".init-shamsi-return-datepicker").val("")
        $(".nights-hotel-js").val("")
        if (this.checked && this.value === "1") {
            $(".internal-hotel-js").css("display", "flex")
            $(".international-hotel-js").hide()
            $(".type-section-js").val("internal")
        } else {
            $(".internal-hotel-js").hide()
            $(".international-hotel-js").css("display", "flex")
            $(".type-section-js").val("international")
        }
    })

});


// کد برای انتخاب نفر در بیمه
document.addEventListener('DOMContentLoaded', function() {
    const dropdownToggleBime = document.querySelector('.dropdown-toggle-insurance');
    console.log(dropdownToggleBime)
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

// تابع برای تنظیم مقدار پیش‌فرض
// تابع برای تنظیم مقدار پیش‌فرض برای هر دو فرم
function initializeFlightClass() {
    // تنظیم عنوان و مقدار پیش‌فرض
    const dropdownTexts = document.querySelectorAll('.dropdown-text[id="toggle-text-class"]');
    const dropdowns = document.querySelectorAll('.money-filter_ul');

    dropdownTexts.forEach(dropdownText => {
        dropdownText.innerText = 'اکونومی';
    });

    // تنظیم active پیش‌فرض روی "اکونومی"
    dropdowns.forEach(dropdown => {
        const allItems = dropdown.querySelectorAll('.switch-class-js');
        allItems.forEach(item => {
            item.classList.remove('active');
            // اگر متن آیتم "اکونومی" بود، active کن
            if (item.textContent.trim() === 'اکونومی') {
                item.classList.add('active');
            }
        });
    });

    // تنظیم مقدار hidden inputs
    const flightClassInternal = document.getElementById('flight_class_internal');
    const flightClassInternational = document.getElementById('flight_class_international');

    if(flightClassInternal) {
        flightClassInternal.value = 'economy';
    }
    if(flightClassInternational) {
        flightClassInternational.value = 'economy';
    }

    console.log('Default flight class set to economy');
}

// اجرای تابع هنگام لود صفحه
document.addEventListener('DOMContentLoaded', function() {
    initializeFlightClass();
});
