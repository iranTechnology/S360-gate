<style>
    /* استایل‌های عمومی کارت‌ها */
    .service-card {
        border-radius: 16px;
        padding: 37px 20px;
        transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
        position: relative;
        overflow: hidden;
        border: 1px solid #e5e7eb !important;
        cursor: default;
        margin-bottom: 30px !important;
        height: 190px;
    }
    .service-card .box-title {
        font-size: 19px;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 12px;
    }

    .service-card .box-title i {
        font-size: 26px;
        width: 42px;
        height: 42px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 12px;
        flex-shrink: 0;
    }

    .service-card p {
        font-size: 14px;
        line-height: 1.8;
        color: #4b5563;
        margin-bottom: 6px;
    }

    .service-card p:last-child {
        margin-bottom: 0;
    }

    .service-card .highlight-text {
        font-weight: 700;
    }

    .service-card .badge-icon {
        position: absolute;
        top: 12px;
        right: 12px;
        font-size: 10px;
        font-weight: 700;
        padding: 3px 12px;
        border-radius: 50px;
        letter-spacing: 0.3px;
        opacity: 0.75;
    }

    /* ============================================ */
    /* 1. پرواز سیستمی - سبز (Green) */
    /* ============================================ */
    .card-system-flight {
        background: #f0fdf4;
        /*border-left: 5px solid #22c55e !important;*/
    }
    .card-system-flight .box-title {
        color: #15803d;
    }
    .card-system-flight .box-title i {
        background: #22c55e;
        color: #fff;
    }
    .card-system-flight .badge-icon {
        background: #22c55e;
        color: #fff;
    }
    .card-system-flight .highlight-text {
        color: #15803d;
    }

    /* ============================================ */
    /* 2. پرواز چارتری - آبی (Blue) */
    /* ============================================ */
    .card-charter-flight {
        background: #eff6ff;
        /*border-left: 5px solid #3b82f6 !important;*/
    }
    .card-charter-flight .box-title {
        color: #1d4ed8;
    }
    .card-charter-flight .box-title i {
        background: #3b82f6;
        color: #fff;
    }
    .card-charter-flight .badge-icon {
        background: #3b82f6;
        color: #fff;
    }
    .card-charter-flight .highlight-text {
        color: #1d4ed8;
    }

    /* ============================================ */
    /* 3. هتل - نارنجی (Orange) */
    /* ============================================ */
    .card-hotel {
        background: #fff7ed;
        /*border-left: 5px solid #f97316 !important;*/
    }
    .card-hotel .box-title {
        color: #c2410c;
    }
    .card-hotel .box-title i {
        background: #f97316;
        color: #fff;
    }
    .card-hotel .badge-icon {
        background: #f97316;
        color: #fff;
    }
    .card-hotel .highlight-text {
        color: #c2410c;
    }

    /* ============================================ */
    /* 4. اتوبوس - زرد (Yellow) */
    /* ============================================ */
    .card-bus {
        background: #fefce8;
        /*border-left: 5px solid #eab308 !important;*/
    }
    .card-bus .box-title {
        color: #a16207;
    }
    .card-bus .box-title i {
        background: #eab308;
        color: #fff;
    }
    .card-bus .badge-icon {
        background: #eab308;
        color: #fff;
    }
    .card-bus .highlight-text {
        color: #a16207;
    }

    /* ============================================ */
    /* 5. بیمه مسافرتی - صورتی (Pink) */
    /* ============================================ */
    .card-insurance {
        background: #fdf2f8;
        /*border-left: 5px solid #ec4899 !important;*/
    }
    .card-insurance .box-title {
        color: #be185d;
    }
    .card-insurance .box-title i {
        background: #ec4899;
        color: #fff;
    }
    .card-insurance .badge-icon {
        background: #ec4899;
        color: #fff;
    }
    .card-insurance .highlight-text {
        color: #be185d;
    }

    /* ============================================ */
    /* 6. تشریفات فرودگاهی - بنفش (Purple) */
    /* ============================================ */
    .card-airport-service {
        background: #f5f3ff;
        /*border-left: 5px solid #8b5cf6 !important;*/
    }
    .card-airport-service .box-title {
        color: #6d28d9;
    }
    .card-airport-service .box-title i {
        background: #8b5cf6;
        color: #fff;
    }
    .card-airport-service .badge-icon {
        background: #8b5cf6;
        color: #fff;
    }
    .card-airport-service .highlight-text {
        color: #6d28d9;
    }
    .box{
        background: #ffff;
        border-radius: 16px;
        border: solid 1px #ccc;
        padding:10px 30px;
        font-family: inherit;
        direction: rtl;
        margin-top: 5px;
        margin-bottom: 21px;
    }
    .box-detail{
        font-size: 12px;
    }

    /* ============================================ */
    /* ریسپانسیو */
    /* ============================================ */
    @media (max-width: 768px) {
        .service-card {
            padding: 18px 16px;
            border-radius: 14px;
        }
        .service-card .box-title {
            font-size: 17px;
        }
        .service-card .box-title i {
            font-size: 22px;
            width: 38px;
            height: 38px;
        }
        .service-card p {
            font-size: 13px;
        }
        .row > .col-12 {
            margin-bottom: 16px;
        }
    }

    @media (max-width: 576px) {
        .service-card {
            padding: 14px 12px;
            border-radius: 12px;
        }
        .service-card .box-title {
            font-size: 15px;
            gap: 8px;
        }
        .service-card .box-title i {
            font-size: 18px;
            width: 32px;
            height: 32px;
            border-radius: 8px;
        }
        .service-card p {
            font-size: 12px;
            line-height: 1.6;
        }
        .service-card .badge-icon {
            display: none;
        }
    }
</style>

<!-- ============================================ -->
<!-- HTML -->
<!-- ============================================ -->

<div class="box">
    <div>
        <h3 class="mb-1">راهنمای دریافت سود از فروش خدمات</h3>
        <p class="box-detail">در تنظیم مارک آپ و تخفیف خدمات خود دقت بفرمایید تا اختلاف قیمت فاحشی با رقبا نداشته باشید. در نظر داشته باشید سود شما برای پروازهای چارتری همان مارک آپی است که انجام داده اید و در پروازهای سیستمی داخلی 80% کمیسیون ایرلاین و در پروازهای خارجی مارک آپی است که انجام داده اید</p>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-system-flight">
                <span class="badge-icon">کمیسیون استاندارد ایرلاین</span>
                <h3 class="box-title">
                    <i class="fa fa-plane"></i> پرواز سیستمی داخلی
                </h3>
                <p>سیستم به صورت اتوماتیک کمیسیون هر ایرلاین را به عنوان سود به شما برگشت می‌دهد</p>
                <p>مثلا بلیط ۱۰۰/۰۰۰/۰۰۰ ریال فروش می‌رود اما از اعتبار شما پس از کسر کمیسیون ایرلاین <span class="highlight-text">۹۵/۰۰۰/۰۰۰</span> ریال کسر می‌شود.</p>
            </div>
        </div>

        <!-- 2. پرواز چارتری - آبی -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-charter-flight">
                <span class="badge-icon">مارکاپ دستی</span>
                <h3 class="box-title">
                    <i class="fa fa-plane"></i> پرواز چارتری داخلی
                </h3>
                <p>سیستم به شما قیمت نت تحویل می‌دهد پس برای آن که سود داشته باشید از <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/ticket/flightPriceChanges" target="_blank" style="color: #1d4ed8; font-weight: 600; text-decoration: none;">اینجا</a> مارکاپ کنید.</p>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-charter-flight">
                <span class="badge-icon">مارکاپ دستی</span>
                <h3 class="box-title">
                    <i class="fa fa-plane"></i>پرواز چارتری سیستمی و چارتری خارجی
                </h3>
                <p>سیستم به شما قیمت نت تحویل می‌دهد پس برای آن که سود داشته باشید از <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/ticket/flightPriceChanges" target="_blank" style="color: #1d4ed8; font-weight: 600; text-decoration: none;">اینجا</a> مارکاپ کنید.</p>
            </div>
        </div>

        <!-- 4. اتوبوس - زرد -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-bus">
                <span class="badge-icon">کمیسیون ۱-۲٪</span>
                <h3 class="box-title">
                    <i class="fa fa-bus"></i> اتوبوس داخلی
                </h3>
                <p>سیستم به صورت اتوماتیک بین ۱ یا ۲ درصد به شما کمیسیون می‌دهد و به عنوان سود برگشت می‌دهد</p>
                <p>مثلا بلیط ۱۰/۰۰۰/۰۰۰ ریال فروش می‌رود اما از اعتبار شما <span class="highlight-text">۹/۸۰۰/۰۰۰</span> ریال کسر می‌شود.</p>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-hotel">
                <span class="badge-icon">مارکاپ دستی</span>
                <h3 class="box-title">
                    <i class="fa fa-bed"></i> هتل داخلی
                </h3>
                <p>سیستم به شما قیمت نت تحویل می‌دهد پس برای آن که سود داشته باشید از <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/hotel/changePriceHotel" target="_blank" style="color: #c2410c; font-weight: 600; text-decoration: none;">اینجا</a> مارکاپ کنید.</p>
            </div>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-hotel">
                <span class="badge-icon">مارکاپ دستی</span>
                <h3 class="box-title">
                    <i class="fa fa-bed"></i> هتل خارجی
                </h3>
                <p>سیستم به شما قیمت نت تحویل می‌دهد پس برای آن که سود داشته باشید از <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/hotel/changePriceExternalHotel" target="_blank" style="color: #c2410c; font-weight: 600; text-decoration: none;">اینجا</a> مارکاپ کنید.</p>
            </div>
        </div>
    </div>
    <div class="row">

        <!-- 5. بیمه مسافرتی - صورتی -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-insurance mb-0">
                <span class="badge-icon">اختصاصی دریافت کنید</span>
                <h3 class="box-title">
                    <i class="fa fa-suitcase"></i> بیمه مسافرتی
                </h3>
                <p>پیشنهاد می‌کنیم به صورت مستقیم از بیمه سامان یوزرنیم و پسورد اختصاصی دریافت کنید تا سود استاندارد شرکت بیمه به شما تخصیص داده شود.</p>
            </div>
        </div>

        <!-- 6. تشریفات فرودگاهی - بنفش -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="white-box service-card card-airport-service mb-0">
                <span class="badge-icon">اختصاصی دریافت کنید</span>
                <h3 class="box-title">
                    <i class="ti-money"></i> تشریفات فرودگاهی
                </h3>
                <p>پیشنهاد می‌کنیم به صورت مستقیم از شرکت واران یوزرنیم و پسورد اختصاصی دریافت کنید تا سود استاندارد شرکت واران به شما تخصیص داده شود.</p>
            </div>
        </div>
    </div>
</div>