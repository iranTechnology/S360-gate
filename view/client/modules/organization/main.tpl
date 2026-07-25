{assign var='list_organization' value=$objOrganization->ListAllClient()}
{assign var='currentYear' value=dateTimeSetting::jdate('Y', time(), '', '', 'en')}
{assign var='years' value=range($currentYear, 1300)}


{if $smarty.const.SOFTWARE_LANG eq 'en'}
    <link rel='stylesheet' href='assets/styles/css/modules-en/faq-en.css'>
{else}
    <link rel='stylesheet' href='assets/modules/css/organization.css'>
{/if}
{*<div class="container">*}
{*    <div class="my-breadcrumbs">*}
{*        <nav aria-label="breadcrumb" class="w-100">*}
{*            <ol class="parent-breadcrumb-item">*}

{*                <li class="breadcrumb-item">*}
{*                    <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">*}
{*                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->*}
{*                        <path d="M272.5 5.7c9-7.6 22.1-7.6 31.1 0L464 141.9V56c0-13.3 10.7-24 24-24s24 10.7 24 24V182.6l55.5 47.1c10.1 8.6 11.4 23.7 2.8 33.8s-23.7 11.3-33.8 2.8L512 245.5V432c0 44.2-35.8 80-80 80H144c-44.2 0-80-35.8-80-80V245.5L39.5 266.3c-10.1 8.6-25.3 7.3-33.8-2.8s-7.3-25.3 2.8-33.8l264-224zM112 204.8V432c0 17.7 14.3 32 32 32h48V312c0-22.1 17.9-40 40-40H344c22.1 0 40 17.9 40 40V464h48c17.7 0 32-14.3 32-32V204.8L288 55.5 112 204.8zM336 320H240V464h96V320z"></path>*}
{*                    </svg>*}
{*                    <a class="font-13 text-dark" href="https://safar360.com">صفحه اصلی</a>*}
{*                </li>*}

{*                <li class="breadcrumb-item active align-items-center d-flex">*}
{*                    <h1 class="d-flex font-13 mb-0 site-main-text-color"*}
{*                        href="https://safar360.com/gds/fa/organization/">ثبت نام سازمانی</h1>*}
{*                </li>*}
{*            </ol>*}
{*        </nav>*}
{*    </div>*}
{*</div>*}
<section class="org-section-wrapper">
    <div class="container">
        {*        <div class="org-section-header">*}
        {*            <h2 class="org-section-title">*}
        {*                <i class="fas fa-building"></i>*}
        {*                <span>سازمان ها</span>*}
        {*            </h2>*}
        {*            <p class="org-section-description">*}
        {*                لطفاً سازمان مورد نظر خود را انتخاب کنید و مراحل ثبت نام را تکمیل نمایید*}
        {*            </p>*}
        {*        </div>*}

        <div class="row g-4">
            {foreach $list_organization as $index => $item}
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="org-card">
                        {*                        <div class="org-counter-badge">*}
                        {*                            <i class="fas fa-hashtag"></i> {$index+1}*}
                        {*                        </div>*}


                        <h3 class="org-card-title">{$item.title}</h3>

                        <p class="org-card-description">
                            {$item.description|truncate:500:"..."}
                        </p>
                        <button class="org-register-btn"
                                onclick="orgRegisterModule.openModal(this,{$item.id}, '{$item.title}' , '{$item.job_guide}')"
                                data-rules="{$item.rules|escape:'html'}">
                            <span>ثبت نام</span>
                            <i class="fas fa-arrow-left"></i>
                        </button>
                    </div>
                </div>
                {foreachelse}
                <div class="col-12">
                    <div class="alert alert-warning text-center">
                        <i class="fas fa-exclamation-triangle"></i>
                        هیچ سازمانی یافت نشد
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</section>
<!-- مودال قوانین -->
<div id="orgTermsModal" class="org-custom-modal-terms">
    <div class="org-custom-modal-content" style="max-width: 700px;">
        <div class="org-custom-modal-header">
            <h5 class="org-custom-modal-title">
                <i class="fas fa-gavel"></i>
                قوانین ثبت نام </h5>
            <button type="button" class="org-custom-modal-close" onclick="orgRegisterModule.closeTermsModal()">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div class="org-custom-modal-body" style="max-height: 700px; overflow-y: auto;">
            <div class="org-terms-content" id="org-terms-content">

            </div>
        </div>
        <div class="org-custom-modal-footer">
            <button type="button" class="org-btn-main-color" onclick="orgRegisterModule.closeTermsModal()">
                <i class="fas fa-check"></i> متوجه شدم
            </button>
        </div>
    </div>
</div>
<div id="orgTermsOverlay" onclick="orgRegisterModule.closeTermsModal()"></div>
<!-- مودال ثبت نام با کلاس یونیک -->
<div id="orgCustomModal" class="org-custom-modal">
    <div class="org-custom-modal-content">
        <div class="org-custom-modal-header">
            <h5 class="org-custom-modal-title">
                <i class="fas fa-user-plus"></i>
                ثبت نام در <span id="org_organization_name_display"></span>
            </h5>
            <button type="button" class="org-custom-modal-close" onclick="orgRegisterModule.closeModal()">
                <i class="fas fa-times"></i>
            </button>
        </div>

        <form id="orgRegisterForm" method="post">
            <div class="org-custom-modal-body">
                <input type="hidden" name="organization_id" id="org_organization_id">
                <input type="hidden" name="action" value="register_organization">
                <input type="hidden" name="flag" value="organizationRegisterUser">


                <div class="org-form-group">
                    <label for="org_first_name" class="org-form-label">
                        <i class="fas fa-user"></i>
                        نام <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="org-form-control" id="org_first_name" name="first_name"
                           placeholder="نام خود را وارد کنید" required>
                    <div class="org-error-message" id="org_first_name_error"></div>
                </div>

                <div class="org-form-group">
                    <label for="org_last_name" class="org-form-label">
                        <i class="fas fa-user"></i>
                        نام خانوادگی <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="org-form-control" id="org_last_name" name="last_name"
                           placeholder="نام خانوادگی خود را وارد کنید" required>
                    <div class="org-error-message" id="org_last_name_error"></div>
                </div>

                <div class="org-form-group">
                    <label for="org_national_code" class="org-form-label">
                        <i class="fas fa-id-card"></i>
                        کد ملی <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="org-form-control" id="org_national_code" name="national_code"
                           placeholder="کد ملی خود را وارد کنید" maxlength="10" required>
                    <div class="org-error-message" id="org_national_code_error">کد ملی نامعتبر است</div>
                </div>
                <div class="org-form-group">
                    <label for="org_national_code" class="org-form-label">
                        <i class="fas fa-phone"></i>
                        شماره موبایل<span class="text-danger">*</span>
                    </label>
                    <input type="text" class="org-form-control" id="org_mobile" name="mobile"
                           placeholder="شماره موبایل خود را وارد کنید" maxlength="11" required>
                    <div class="org-error-message" id="org_mobile_error">شماره موبایل نامعتبر است</div>

                </div>
                <div class="org-form-group">
                    <label for="org_national_code" class="org-form-label">
                        <i class="fas fa-user-tie"></i>
                        شاغل در<span class="text-danger">*</span>
                    </label>
                    <input type="text" class="org-form-control" id="org_job_category" name="job_category"
                           placeholder="شغل خود را وارد کنید" required>
                    <div class="mt-1" id="org_organization_category_job_display"></div>
                    <div class="org-error-message" id="org_job_category_error"></div>

                </div>
                <div class="org-form-group">
                    <label class="org-form-label">
                        <i class="fas fa-calendar-alt"></i>
                        تاریخ تولد <span class="text-danger">*</span>
                    </label>
                    <div class="org-birthday-row">
                        <div class="org-birthday-col">
                            <select class="org-form-control org-birthday-select" id="org_birthday_year"
                                    name="birthday_year" required>
                                <option value="">سال</option>
                                {foreach $years as $year}
                                    <option value="{$year}">{$year}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="org-birthday-col">
                            <select class="org-form-control org-birthday-select" id="org_birthday_month"
                                    name="birthday_month" required>
                                <option value="">ماه</option>
                                <option value="01">فروردین</option>
                                <option value="02">اردیبهشت</option>
                                <option value="03">خرداد</option>
                                <option value="04">تیر</option>
                                <option value="05">مرداد</option>
                                <option value="06">شهریور</option>
                                <option value="07">مهر</option>
                                <option value="08">آبان</option>
                                <option value="09">آذر</option>
                                <option value="10">دی</option>
                                <option value="11">بهمن</option>
                                <option value="12">اسفند</option>
                            </select>
                        </div>
                        <div class="org-birthday-col">
                            <select class="org-form-control org-birthday-select" id="org_birthday_day"
                                    name="birthday_day" required>
                                <option value="">روز</option>
                                {for $day=1 to 31}
                                    <option value="{$day}">{$day}</option>
                                {/for}
                            </select>
                        </div>
                    </div>
                    <div class="org-error-message" id="org_birthday_error"></div>
                </div>

                <div class="org-form-group">
                    <div class="org-terms-checkbox">
                        <input type="checkbox" id="org_terms_agree" name="terms_agree" value="1">
                        <label for="org_terms_agree" class="org-terms-label">
                            <span>
                <a href="javascript:void(0)" onclick="orgRegisterModule.openTermsModal()" class="org-terms-link">
                    قوانین
                </a>
                را مطالعه کردم و آن را می‌پذیرم
            </span>
                        </label>
                    </div>
                    <div class="org-error-message" id="org_terms_error">لطفاً قوانین را بپذیرید</div>
                </div>
            </div>
            <div class="org-custom-modal-footer">
                <button type="button" class="org-btn-secondary" onclick="orgRegisterModule.closeModal()">
                    <i class="fas fa-times"></i> انصراف
                </button>
                <button type="submit" class="org-btn-main-color" id="org_submitBtn">
                    <i class="fas fa-check"></i> ثبت نام
                </button>
            </div>
        </form>
    </div>
</div>
<div id="orgModalOverlay" class="org-modal-overlay" onclick="orgRegisterModule.closeModal()"></div>


{literal}
    <script>
        // آبجکت اختصاصی برای ماژول سازمان
        const orgRegisterModule = {

            openTermsModal: function () {
                document.getElementById('orgTermsOverlay').style.display = 'block';
                document.getElementById('orgTermsModal').style.display = 'block';
                document.body.style.overflow = 'hidden';
            },

            // بستن مودال قوانین
            closeTermsModal: function () {
                document.getElementById('orgTermsOverlay').style.display = 'none';
                document.getElementById('orgTermsModal').style.display = 'none';
                document.body.style.overflow = 'auto';
            },
            // تابع اعتبارسنجی کد ملی
            validateNationalCode: function (code) {
                if (!/^\d{10}$/.test(code)) return false;
                let check = parseInt(code[9]);
                let sum = 0;
                for (let i = 0; i < 9; i++) {
                    sum += parseInt(code[i]) * (10 - i);
                }
                let remainder = sum % 11;
                return remainder < 2 ? check === remainder : check === 11 - remainder;
            },

            getBirthday: function () {
                const year = document.getElementById('org_birthday_year').value;
                const month = document.getElementById('org_birthday_month').value;
                const day = document.getElementById('org_birthday_day').value;

                if (year && month && day) {
                    return year + '-' + month + '-' + String(day).padStart(2, '0');
                }
                return '';
            },
            // باز کردن مودال
            openModal: function (button, organizationId, organizationTitle, jobGuid = null) {
                const termsText = button.dataset.rules;
                document.getElementById('org_organization_id').value = organizationId;
                document.getElementById('org_organization_name_display').innerHTML = organizationTitle;
                document.getElementById('org_organization_category_job_display').innerHTML = jobGuid;
                document.getElementById('org-terms-content').innerHTML = termsText;
                document.getElementById('orgRegisterForm').reset();

                // حذف کلاس‌های خطا
                document.querySelectorAll('.org-form-control').forEach(input => {
                    input.classList.remove('is-invalid');
                });

                document.getElementById('orgModalOverlay').style.display = 'block';
                document.getElementById('orgCustomModal').style.display = 'block';
                document.body.style.overflow = 'hidden';
            },

            // بستن مودال
            closeModal: function () {
                document.getElementById('orgModalOverlay').style.display = 'none';
                document.getElementById('orgCustomModal').style.display = 'none';
                document.body.style.overflow = 'auto';
            },

            // ارسال فرم با ajaxSubmit
            submitForm: function (form) {
                let isValid = true;
                const birthday = this.getBirthday();
                const firstName = document.getElementById('org_first_name').value.trim();
                const lastName = document.getElementById('org_last_name').value.trim();
                const nationalCode = document.getElementById('org_national_code').value.trim();
                const mobile = document.getElementById('org_mobile') ? document.getElementById('org_mobile').value.trim() : '';
                const birthdayYear = document.getElementById('org_birthday_year').value;
                const birthdayMonth = document.getElementById('org_birthday_month').value;
                const birthdayDay = document.getElementById('org_birthday_day').value;
                // اعتبارسنجی نام
                if (firstName === '') {
                    document.getElementById('org_first_name').classList.add('is-invalid');
                    document.getElementById('org_first_name_error').innerHTML = 'نام الزامی است';
                    document.getElementById('org_first_name_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_first_name').classList.remove('is-invalid');
                    document.getElementById('org_first_name_error').style.display = 'none';
                }

                // اعتبارسنجی نام خانوادگی
                if (lastName === '') {
                    document.getElementById('org_last_name').classList.add('is-invalid');
                    document.getElementById('org_last_name_error').innerHTML = 'نام خانوادگی الزامی است';
                    document.getElementById('org_last_name_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_last_name').classList.remove('is-invalid');
                    document.getElementById('org_last_name_error').style.display = 'none';
                }

                if (lastName === '') {
                    document.getElementById('org_last_name').classList.add('is-invalid');
                    document.getElementById('org_last_name_error').innerHTML = 'نام خانوادگی الزامی است';
                    document.getElementById('org_last_name_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_last_name').classList.remove('is-invalid');
                    document.getElementById('org_last_name_error').style.display = 'none';
                }

                if (lastName === '') {
                    document.getElementById('org_job_category').classList.add('is-invalid');
                    document.getElementById('org_job_category_error').innerHTML = 'شغل الزامی است';
                    document.getElementById('org_job_category_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_job_category').classList.remove('is-invalid');
                    document.getElementById('org_job_category_error').style.display = 'none';
                }


                // اعتبارسنجی کد ملی
                if (!this.validateNationalCode(nationalCode)) {
                    document.getElementById('org_national_code').classList.add('is-invalid');
                    document.getElementById('org_national_code_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_national_code').classList.remove('is-invalid');
                    document.getElementById('org_national_code_error').style.display = 'none';
                }

                // اعتبارسنجی تاریخ تولد
                if (birthdayYear === '' && birthdayMonth === '' && birthdayDay === '') {
                    document.getElementById('org_birthday_error').innerHTML = 'تاریخ تولد نامعتبر است ';
                    document.getElementById('org_birthday_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_birthday_error').style.display = 'none';
                }

                // اعتبارسنجی موبایل (اختیاری)
                if (mobile !== '' && !/^09[0-9]{9}$/.test(mobile)) {
                    document.getElementById('org_mobile').classList.add('is-invalid');
                    document.getElementById('org_mobile_error').innerHTML = 'شماره موبایل نامعتبر است';
                    document.getElementById('org_mobile_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_mobile').classList.remove('is-invalid');
                    document.getElementById('org_mobile_error').style.display = 'none';
                }
                const termsAgree = document.getElementById('org_terms_agree').checked;
                if (!termsAgree) {
                    document.getElementById('org_terms_agree').classList.add('is-invalid');
                    document.getElementById('org_terms_error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('org_terms_agree').classList.remove('is-invalid');
                    document.getElementById('org_terms_error').style.display = 'none';
                }
                if (isValid) {
                    $(form).append('<input type="hidden" name="birthday" value="' + birthday + '">');
                    // غیرفعال کردن دکمه ثبت
                    const submitBtn = document.getElementById('org_submitBtn');
                    submitBtn.disabled = true;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> در حال ثبت نام...';

                    // استفاده از ajaxSubmit مانند نمونه اول
                    $(form).ajaxSubmit({
                        url: amadeusPath + 'user_ajax.php',
                        type: 'POST',
                        dataType: 'JSON',
                        success: function (response) {
                            let displayIcon = (response.result_status == 'success') ? 'success' : 'error';

                            Swal.fire({
                                title: 'موفق!',
                                text: 'ثبت نام شما با موفقیت انجام شد',
                                icon: 'success',
                                confirmButtonText: 'باشه'
                            })

                            if (response.result_status == 'success') {
                                orgRegisterModule.closeModal();
                                submitBtn.disabled = false;
                                submitBtn.innerHTML = '<i class="fas fa-check"></i> ثبت نام';
                            }
                        },
                        error: function (xhr, status, error) {
                            Swal.fire({
                                title: 'خطا!',
                                text: 'خطا در ثبت نام لطفا مجدد تلاش نمایید',
                                icon: 'error',
                                confirmButtonText: 'تلاش مجدد'
                            });
                            submitBtn.disabled = false;
                            submitBtn.innerHTML = '<i class="fas fa-check"></i> ثبت نام';
                        }
                    });
                }
            }
        };

        // رویدادهای فرم
        $(document).ready(function () {
            $('#orgRegisterForm').on('submit', function (e) {
                e.preventDefault();
                orgRegisterModule.submitForm(this);
            });

            // اعتبارسنجی بلادرنگ کد ملی
            $('#org_national_code').on('input', function () {
                const code = this.value;
                if (code.length === 10) {
                    if (!orgRegisterModule.validateNationalCode(code)) {
                        $(this).addClass('is-invalid');
                        $('#org_national_code_error').show();
                    } else {
                        $(this).removeClass('is-invalid');
                        $('#org_national_code_error').hide();
                    }
                }
            });

            // اعتبارسنجی بلادرنگ موبایل
            $('#org_mobile').on('input', function () {
                const mobile = this.value;
                if (mobile !== '' && !/^09[0-9]{9}$/.test(mobile)) {
                    $(this).addClass('is-invalid');
                    $('#org_mobile_error').show();
                } else {
                    $(this).removeClass('is-invalid');
                    $('#org_mobile_error').hide();
                }
            });
        });

        // بستن مودال با کلید ESC
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
                orgRegisterModule.closeModal();
            }
        });


    </script>
{/literal}