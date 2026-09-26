{load_presentation_object filename="passengerImport" assign="objPassengerImport"}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                {if $objAdmin->isLogin()}
                    <li><a href="agencyList">همکاران</a></li>
                {else}
                    <li>کاربران</li>
                {/if}
                <li><a href="counterList&id={$smarty.get.agencyID}">کانترها</a></li>
                <li><a href="passengerListCounter&id={$smarty.get.id}&agencyID={$smarty.get.agencyID}">مسافران</a></li>
                <li class="active">آپلود فایل اکسل مسافران</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">راهنمای فرمت فایل اکسل</h3>
                <p class="text-muted m-b-20">
                    هر ردیف فایل یک کاربر است. پس از تایید، هر ردیف با موبایل و رمز عبور وارد شده در سیستم ثبت نام می‌شود (در لیست کاربران اصلی نمایش داده می‌شود)، ایمیل در مشخصات کاربر ثبت می‌شود، اعتبار وارد شده به کیف پول کاربر اضافه می‌شود و به لیست مسافران این کانتر هم اضافه می‌شود.
                    <span class="pull-right">
                        <a href="{$smarty.const.SERVER_HTTP}{$smarty.const.CLIENT_DOMAIN}/gds/ajax?className=passengerImport&method=downloadSample"
                           class="btn btn-success waves-effect waves-light" type="button">
                            <span class="btn-label"><i class="fa fa-download"></i></span>دانلود فایل نمونه
                        </a>
                    </span>
                </p>

                <ul class="m-b-20">
                    <li>فایل فقط با پسوند <b>xlsx</b> و حداکثر حجم ۵ مگابایت قابل قبول است.</li>
                    <li>ردیف اول فایل باید <b>دقیقا</b> عنوان ستون‌های جدول زیر و به همان ترتیب باشد (بهترین راه استفاده از فایل نمونه است).</li>
                    <li>اطلاعات مسافران از ردیف دوم وارد شود. حداکثر {$objPassengerImport->getMaxRows()} مسافر در هر فایل مجاز است. فقط اولین شیت فایل خوانده می‌شود.</li>
                    <li>فقط ستون‌های نام، نام خانوادگی، موبایل و رمز عبور الزامی هستند. ستون‌های اختیاری را می‌توانید خالی بگذارید، اما اگر مقداری وارد شود باید معتبر باشد.</li>
                    <li>هر ردیف حتی بدون کد ملی یا شماره پاسپورت به لیست مسافران این کانتر اضافه می‌شود، اما برای استفاده در خرید بلیط بهتر است این اطلاعات کامل باشد.</li>
                    <li>اگر فقط یکی از تاریخ‌های تولد شمسی یا میلادی وارد شود، دیگری به صورت خودکار محاسبه می‌شود.</li>
                    <li>کد ملی (برای ایرانی) یا شماره پاسپورت (برای خارجی) نباید در فایل تکراری باشد یا قبلا در لیست مسافران این کانتر ثبت شده باشد.</li>
                    <li>موبایل و ایمیل نباید در فایل تکراری باشند یا قبلا برای کاربر دیگری در سیستم ثبت شده باشند.</li>
                    <li>اعتبار فقط به صورت افزایش ثبت می‌شود و نمی‌تواند منفی باشد. خالی یا صفر یعنی بدون اعتبار.</li>
                    <li>اگر حتی یک ردیف خطا داشته باشد <b>هیچ اطلاعاتی ثبت نمی‌شود</b>. خطاها زیر بخش آپلود نمایش داده می‌شوند. آن‌ها را در فایل اصلاح کنید و فایل را دوباره آپلود کنید.</li>
                </ul>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>ستون</th>
                            <th>عنوان ستون (ردیف اول)</th>
                            <th>الزامی</th>
                            <th>توضیحات</th>
                            <th>مثال (مسافر ایرانی)</th>
                            <th>مثال (مسافر خارجی)</th>
                        </tr>
                        </thead>
                        <tbody>
                        {assign var="columnNumber" value=0}
                        {foreach $objPassengerImport->getColumns() as $column}
                            {$columnNumber=$columnNumber+1}
                            <tr>
                                <td>{$columnNumber}</td>
                                <td><b>{$column.title}</b></td>
                                <td>{$column.required}</td>
                                <td>{$column.hint}</td>
                                <td dir="ltr" class="text-left">{$column.sample}</td>
                                <td dir="ltr" class="text-left">{$column.sample_foreign}</td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">آپلود فایل</h3>
                <p class="text-muted m-b-20">فایل را انتخاب کرده و دکمه بررسی فایل را بزنید. پس از بررسی و در صورت نداشتن خطا، با دکمه تایید اطلاعات ثبت می‌شوند.</p>

                <form id="passengerImportForm" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="className" value="passengerImport">
                    <input type="hidden" name="method" id="passengerImportMethod" value="checkExcel">
                    <input type="hidden" name="counter_id" id="passengerImportCounterId" value="{$smarty.get.id}">
                    <input type="hidden" id="passengerImportBackLink"
                           value="passengerListCounter&id={$smarty.get.id}{if $objsession->adminIsLogin()}&agencyID={$smarty.get.agencyID}{/if}">

                    <div class="form-group">
                        <label for="passengerImportFile" class="control-label">فایل اکسل مسافران</label>
                        <input type="file" class="form-control" name="excel_file" id="passengerImportFile"
                               accept=".xlsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" id="passengerImportCheckBtn">
                            <i class="fa fa-search"></i> بررسی فایل
                        </button>
                        <button type="button" class="btn btn-success" id="passengerImportApplyBtn" style="display: none">
                            <i class="fa fa-check"></i> تایید و ثبت نهایی
                        </button>
                    </div>
                </form>

                <div id="passengerImportResult"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="assets/JsFiles/passengerImport.js"></script>
