{load_presentation_object filename="safarBankController" assign="objReport"}
{assign var="agencies" value=$objReport->getReportData()}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li class="active">گزارش آمار آژانس‌ها</li>
            </ol>
        </div>
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12 text-left">
            <h4 class="page-title">گزارش عملکرد آژانس‌های مسافرتی</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="box-title m-b-0">فیلترهای جستجو</h4>
                        <p class="text-muted m-b-30">جستجو بر اساس تاریخ، نام آژانس و وضعیت سفربانک</p>
                    </div>
                </div>

                <form method="post" action="" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-6">
                            <label>تاریخ از</label>
                            <input type="text" class="form-control datepicker" name="date_of"
                                   value="{$smarty.post.date_of|default:$objFunctions->timeNow()}"
                                   placeholder="تاریخ شروع">
                        </div>
                        <div class="col-md-6">
                            <label>تاریخ تا</label>
                            <input type="text" class="form-control datepickerReturn" name="to_date"
                                   value="{$smarty.post.to_date|default:$objFunctions->timeNow()}"
                                   placeholder="تاریخ پایان">
                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-6">
                            <label>نام آژانس</label>
                            <input type="text" class="form-control" name="agency_name"
                                   value="{$smarty.post.agency_name}"
                                   placeholder="جستجوی نام آژانس">
                        </div>
                        <div class="col-md-6">
                            <label>وضعیت سفربانک</label>
                            <select class="form-control" name="safar_bank_status">
                                <option value="all">همه</option>
                                <option value="true"{if $smarty.post.safar_bank_status == 'true'} selected{/if}>فعال</option>
                                <option value="false"{if $smarty.post.safar_bank_status == 'false'} selected{/if}>غیرفعال</option>
                            </select>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-sm-12 text-left">
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-search"></i> جستجو
                            </button>
                            <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankTour" class="btn btn-default">
                                <i class="fa fa-refresh"></i> تنظیم مجدد
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="row">
                    <div class="col-sm-6">
                        <h4 class="box-title m-b-0">لیست آژانس‌ها</h4>
                        <p class="text-muted m-b-30">نمایش آمار بازدید و کلیک آژانس‌های مسافرتی</p>
                    </div>
                    <div class="pull-left" style="margin-left: 12px;">
                        <button class="btn btn-success btn-sm" onclick="openClickPriceModal()">
                            <i class="fa fa-dollar"></i> تنظیم نرخ
                        </button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table id="agenciesTable" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="20" class="text-center">ردیف</th>
                            <th class="text-right" width="50">نام آژانس</th>
                            <th width="100" class="text-center">وضعیت</th>
                            {*                            <th width="110" class="text-center">کل بازدید</th>*}
                            {*                            <th width="110" class="text-center">بازدید یکتا</th>*}
                            {*                            <th width="100" class="text-center">کل کلیک</th>*}
                            {*                            <th width="110" class="text-center">کلیک یکتا</th>*}
                            {*                            <th width="100" class="text-center">تعداد تور دیده شده</th>*}
                            <th width="100" class="text-center">تعداد تور فعال</th>
                            <th width="100" class="text-center">تعداد کل تور</th>
                            <th width="100" class="text-center">نرخ تبدیل</th>
                            <th width="100" class="text-center">عملیات</th>
                        </tr>
                        </thead>
                        <tbody>
                        {if $agencies|count > 0}
                            {foreach $agencies as $key => $item}
                                <tr class="{if $item.is_safar_bank}success-row{/if}">
                                    <td class="text-center">{$key+1}</td>
                                    <td class="text-right font-bold">{$item.name}</td>
                                    <td class="text-center">
                                        {if $item.is_safar_bank}
                                            <span class="label label-success" style="cursor: pointer;" onclick="changeSafarBankStatus({$item.id}, '{$item.name}', false)">
                                                <i class="fa fa-check"></i> فعال
                                            </span>
                                        {else}
                                            <span class="label label-danger" style="cursor: pointer;" onclick="changeSafarBankStatus({$item.id}, '{$item.name}', true)">
                                                <i class="fa fa-close"></i> غیرفعال
                                            </span>
                                        {/if}
                                    </td>
                                    {*                                    <td class="text-center">*}
                                    {*                                        <span class="badge badge-info">{$item.total_visits|number_format}</span>*}
                                    {*                                    </td>*}
                                    {*                                    <td class="text-center">{$item.unique_visits|number_format}</td>*}
                                    {*                                    <td class="text-center">*}
                                    {*                                        <span class="badge badge-warning">{$item.total_clicks|number_format}</span>*}
                                    {*                                    </td>*}
                                    {*                                    <td class="text-center">{$item.unique_clicks|number_format}</td>*}
                                    {*                                    <td class="text-center">{$item.tours_count|number_format}</td>*}
                                    <td class="text-center">{$item.total_safarBank_tour_count|number_format}</td>
                                    <td class="text-center">{$item.total_tour_count|number_format}</td>
                                    <td class="text-center">
                                        {if $item.conversion_rate > 10}
                                            <span class="label label-success">{$item.conversion_rate}%</span>
                                        {elseif $item.conversion_rate > 5}
                                            <span class="label label-warning">{$item.conversion_rate}%</span>
                                        {elseif $item.conversion_rate > 0}
                                            <span class="label label-danger">{$item.conversion_rate}%</span>
                                        {else}
                                            <span class="label label-default">0%</span>
                                        {/if}
                                    </td>
                                    <td class="text-center">
                                        <a href="javascript:void(0);"
                                           onclick="showWalletDetails({$item.id}, '{$item.name|escape:'javascript'}')"
                                           class="btn btn-info btn-sm waves-effect waves-light"
                                           data-toggle="tooltip" title="کیف پول و تراکنش‌ها">
                                            <i class="fa fa-wallet"></i>
                                        </a>
                                        <a href="javascript:void(0);"
                                           onclick="showAgencyDetails({$item.id}, '{$item.name|escape:'javascript'}')"
                                           class="btn btn-warning btn-sm waves-effect waves-light"
                                           data-toggle="tooltip" title="مشاهده جزئیات تورها">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="safarBankReport&id={$item.id}"
                                           class="btn btn-primary btn-sm waves-effect waves-light"
                                           data-toggle="tooltip" title="جزییات نرخ بازدید">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="11" class="text-center text-muted">
                                    <i class="fa fa-info-circle"></i> هیچ داده‌ای یافت نشد
                                </td>
                            </tr>
                        {/if}
                        </tbody>
                        <tfoot>
                        <tr class="active">
                            <th colspan="3" class="text-left">مجموع کل</th>
                            {*                            <th id="footerTotalVisits" class="text-center">0</th>*}
                            {*                            <th id="footerUniqueVisits" class="text-center">0</th>*}
                            {*                            <th id="footerTotalClicks" class="text-center">0</th>*}
                            {*                            <th id="footerUniqueClicks" class="text-center">0</th>*}
                            {*                            <th id="footerToursCount" class="text-center">0</th>*}
                            <th id="footerSafarBankToursCount" class="text-center">0</th>
                            <th id="footerTotalToursCount" class="text-center">0</th>
                            <th id="footerAvgConversion" class="text-center">0%</th>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- مودال تنظیم نرخ هر کلیک -->
<div class="modal fade" id="clickPriceModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document" style="width: 90%; max-width: 950px;">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #5cb85c; color: white;">
                <button type="button" class="close" data-dismiss="modal" style="color: white; opacity: 0.8;">&times;</button>
                <h4 class="modal-title">
                    <i class="fa fa-dollar"></i> تنظیم نرخ هر کلیک و بازدید
                </h4>
            </div>

            <div class="modal-body">
                <!-- تب ها -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#clickPricing" aria-controls="clickPricing" role="tab" data-toggle="tab">
                            <i class="fa fa-mouse-pointer"></i> کلیک معمولی
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#uniqueClickPricing" aria-controls="uniqueClickPricing" role="tab" data-toggle="tab">
                            <i class="fa fa-hand-pointer"></i> کلیک یکتا
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#visitPricing" aria-controls="visitPricing" role="tab" data-toggle="tab">
                            <i class="fa fa-eye"></i> بازدید معمولی
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#uniqueVisitPricing" aria-controls="uniqueVisitPricing" role="tab" data-toggle="tab">
                            <i class="fa fa-users"></i> بازدید یکتا
                        </a>
                    </li>
                </ul>

                <!-- محتوای تب ها -->
                <div class="tab-content" style="margin-top: 20px;">

                    <!-- تب 1: کلیک معمولی -->
                    <div role="tabpanel" class="tab-pane active" id="clickPricing">
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-primary btn-sm pull-left" onclick="addNewPricing('click')">
                                    <i class="fa fa-plus"></i> افزودن قیمت جدید
                                </button>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="table-responsive" style="margin-top: 15px;">
                            <table class="table table-bordered table-striped text-center" id="clickPricingTable">
                                <thead>
                                <tr>
                                    <th width="50" class="text-center">#</th>
                                    <th class="text-center">حداقل تعداد</th>
                                    <th class="text-center">حداکثر تعداد</th>
                                    <th class="text-center">قیمت در این بازه (ریال)</th>
                                    <th class="text-center">تخفیف</th>
                                    <th width="80" class="text-center">عملیات</th>
                                </tr>
                                </thead>
                                <tbody id="clickPricingBody"></tbody>
                            </table>
                        </div>
                    </div>

                    <!-- تب 2: کلیک یکتا -->
                    <div role="tabpanel" class="tab-pane" id="uniqueClickPricing">
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-primary btn-sm pull-left" onclick="addNewPricing('unique_click')">
                                    <i class="fa fa-plus"></i> افزودن قیمت جدید
                                </button>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="table-responsive" style="margin-top: 15px;">
                            <table class="table table-bordered table-striped text-center" id="uniqueClickPricingTable">
                                <thead>
                                <tr>
                                    <th width="50" class="text-center">#</th>
                                    <th class="text-center">حداقل تعداد</th>
                                    <th class="text-center">حداکثر تعداد</th>
                                    <th class="text-center">قیمت در این بازه (ریال)</th>
                                    <th class="text-center">تخفیف</th>
                                    <th width="80" class="text-center">عملیات</th>
                                </tr>
                                </thead>
                                <tbody id="uniqueClickPricingBody"></tbody>
                            </table>
                        </div>
                    </div>

                    <!-- تب 3: بازدید معمولی -->
                    <div role="tabpanel" class="tab-pane" id="visitPricing">
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-primary btn-sm pull-left" onclick="addNewPricing('visit')">
                                    <i class="fa fa-plus"></i> افزودن قیمت جدید
                                </button>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="table-responsive" style="margin-top: 15px;">
                            <table class="table table-bordered table-striped text-center" id="visitPricingTable">
                                <thead>
                                <tr>
                                    <th width="50" class="text-center">#</th>
                                    <th class="text-center">حداقل تعداد</th>
                                    <th class="text-center">حداکثر تعداد</th>
                                    <th class="text-center">قیمت در این بازه (ریال)</th>
                                    <th class="text-center">تخفیف</th>
                                    <th width="80" class="text-center">عملیات</th>
                                </tr>
                                </thead>
                                <tbody id="visitPricingBody"></tbody>
                            </table>
                        </div>
                    </div>

                    <!-- تب 4: بازدید یکتا -->
                    <div role="tabpanel" class="tab-pane" id="uniqueVisitPricing">
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-primary btn-sm pull-left" onclick="addNewPricing('unique_visit')">
                                    <i class="fa fa-plus"></i> افزودن قیمت جدید
                                </button>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="table-responsive" style="margin-top: 15px;">
                            <table class="table table-bordered table-striped text-center" id="uniqueVisitPricingTable">
                                <thead>
                                <tr>
                                    <th width="50" class="text-center">#</th>
                                    <th class="text-center">حداقل تعداد</th>
                                    <th class="text-center">حداکثر تعداد</th>
                                    <th class="text-center">قیمت در این بازه (ریال)</th>
                                    <th class="text-center">تخفیف</th>
                                    <th width="80" class="text-center">عملیات</th>
                                </tr>
                                </thead>
                                <tbody id="uniqueVisitPricingBody"></tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- ماشین حساب قیمت -->
                <div class="panel panel-default" style="margin-top: 20px;">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fa fa-calculator"></i> ماشین حساب قیمت
                        </h4>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label><i class="fa fa-mouse-pointer"></i> نوع:</label>
                                    <select class="form-control" id="calcType">
                                        <option value="click">کلیک معمولی</option>
                                        <option value="unique_click">کلیک یکتا</option>
                                        <option value="visit">بازدید معمولی</option>
                                        <option value="unique_visit">بازدید یکتا</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label><i class="fa fa-sort-numeric-desc"></i> تعداد:</label>
                                    <input type="number" class="form-control" id="calcQuantity" value="1000" placeholder="تعداد">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label><i class="fa fa-money"></i> نتیجه:</label>
                                    <div id="calculatedPrice" class="well well-sm text-center" style="margin-bottom: 0; background-color: #f9f9f9; min-height: 80px;">
                                        <span class="text-muted">لطفاً تعداد را وارد کنید</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <i class="fa fa-close"></i> بستن
                </button>
                <button type="button" class="btn btn-success" onclick="saveAllPricing()">
                    <i class="fa fa-save"></i> ذخیره همه تنظیمات
                </button>
            </div>
        </div>
    </div>
</div>
<!-- مودال کیف پول -->
<div class="modal fade" id="walletModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document" style="width: 90%; max-width: 1000px;">
        <div class="modal-content">
            <div class="modal-header" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;">
                <button type="button" class="close" data-dismiss="modal" style="color: white; opacity: 0.8;">&times;</button>
                <h4 class="modal-title">
                    <i class="fa fa-wallet"></i> کیف پول سفربانک
                </h4>
            </div>

            <div class="modal-body">
                <!-- نمایش موجودی -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-info text-center" style="font-size: 20px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border: none;">
                            <i class="fa fa-money"></i> <strong>موجودی فعلی:</strong>
                            <span id="currentBalanceDisplay">0</span> <small>ریال</small>
                            <span style="font-size: 14px;">(<span id="currentBalanceToman">0</span> تومان)</span>
                        </div>
                    </div>
                </div>

                <!-- بخش عملیات شارژ و کسر -->
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #f5f5f5;">
                        <i class="fa fa-exchange"></i> عملیات مالی
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                    <input type="number" class="form-control" id="transactionAmount" placeholder="مبلغ به ریال">
                                    <span class="input-group-addon">ریال</span>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-file-text"></i></span>
                                    <input type="text" class="form-control" id="transactionDesc" placeholder="توضیحات (اختیاری)">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="btn-group btn-group-justified" role="group">
                                    <div class="btn-group" role="group">
                                        <button class="btn btn-success" onclick="chargeClient()">
                                            <i class="fa fa-plus-circle"></i> شارژ
                                        </button>
                                    </div>
                                    <div class="btn-group" role="group">
                                        <button class="btn btn-danger" onclick="deductClient()">
                                            <i class="fa fa-minus-circle"></i> کسر
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12">
                                <small class="text-muted">
                                    <i class="fa fa-info-circle"></i>
                                    مبلغ را به ریال وارد کنید. با کلیک روی "شارژ" مبلغ به موجودی اضافه و با کلیک روی "کسر" از موجودی کم می‌شود.
                                </small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- تاریخچه تراکنش‌ها -->
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #f5f5f5;">
                        <i class="fa fa-history"></i> تاریخچه تراکنش‌ها
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="transactionsTable" class="table table-bordered table-striped table-hover">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">تاریخ</th>
                                    <th class="text-center">نوع</th>
                                    <th class="text-center">مبلغ (ریال)</th>
                                    <th class="text-center">موجودی پس از تراکنش</th>
                                    <th class="text-center">توضیحات</th>
                                </tr>
                                </thead>
                                <tbody id="transactionsBody">
                                <tr><td colspan="6" class="text-center">در حال بارگذاری...</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <i class="fa fa-close"></i> بستن
                </button>
            </div>
        </div>
    </div>
</div>

<style>
    /* استایل جدول تراکنش‌ها - مرکزچین کامل */
    #transactionsTable th,
    #transactionsTable td {
        vertical-align: middle !important;
        text-align: center !important;
    }

    /* استایل بج‌های شارژ و کسر */
    .label-charge {
        background-color: #28a745;
        color: white;
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 11px;
        display: inline-block;
    }

    .label-consume {
        background-color: #dc3545;
        color: white;
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 11px;
        display: inline-block;
    }

    /* استایل مودال */
    .modal-header {
        border-radius: 5px 5px 0 0;
    }

    .alert-info {
        border-radius: 10px;
        margin-bottom: 20px;
    }

    /* استایل دکمه‌ها */
    .btn-group-justified {
        display: flex;
        gap: 5px;
    }

    .btn-group-justified .btn-group {
        flex: 1;
    }

    .btn-group-justified .btn {
        width: 100%;
        border-radius: 5px !important;
    }
</style>

<style>
    .badge-info {
        background-color: #36a2eb;
        padding: 5px 10px;
        border-radius: 4px;
        color: white;
        font-size: 12px;
    }
    .badge-warning {
        background-color: #ffc107;
        padding: 5px 10px;
        border-radius: 4px;
        color: #212529;
        font-size: 12px;
    }
    .label-success {
        background-color: #5cb85c;
        padding: 5px 12px;
        border-radius: 4px;
        font-size: 12px;
    }
    .label-danger {
        background-color: #d9534f;
        padding: 5px 12px;
        border-radius: 4px;
        font-size: 12px;
    }
    .label-warning {
        background-color: #f0ad4e;
        padding: 5px 12px;
        border-radius: 4px;
        font-size: 12px;
    }
    .label-default {
        background-color: #777;
        padding: 5px 12px;
        border-radius: 4px;
        font-size: 12px;
    }
    .success-row {
        background-color: #f0f8ff;
    }
    .font-bold {
        font-weight: 600;
    }
    .table tfoot th {
        background-color: #f9f9f9;
        font-weight: bold;
    }
    .btn-sm {
        padding: 4px 10px;
    }

    /* وسط چین کردن ستون‌ها */
    #agenciesTable td,
    #agenciesTable th {
        vertical-align: middle !important;
    }

    /* ستون‌های عددی وسط */
    #agenciesTable td:not(:nth-child(3)),
    #agenciesTable th:not(:nth-child(3)) {
        text-align: center !important;
    }
    #agenciesTable td:not(:nth-child(2)),
    #agenciesTable th:not(:nth-child(2)) {
        text-align: center !important;
    }

    /* فوتر وسط */
    #agenciesTable tfoot th {
        text-align: center !important;
    }
    #agenciesTable tfoot th:first-child {
        text-align: center !important;
    }

    /* فاصله بین فیلترها */
    .form-group {
        margin-bottom: 15px;
    }
    .white-box {
        padding: 20px;
    }

    /* استایل‌های مودال برای وسط چین شدن */
    #toursDetailsTable th,
    #toursDetailsTable td {
        vertical-align: middle !important;
        text-align: center !important;
    }

    /* استایل برای بج‌ها */
    #toursDetailsTable .badge {
        font-size: 11px;
        padding: 4px 8px;
        border-radius: 4px;
    }

    /* استایل هدر مودال */
    .modal-header {
        background-color: #f5f5f5;
        border-bottom: 1px solid #ddd;
    }

    /* استایل فوتر مودال */
    .modal-footer {
        border-top: 1px solid #ddd;
    }

    /* انیمیشن برای لودینگ */
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    .fa-pulse {
        animation: spin 1s steps(8) infinite;
    }

    /* استایل برای جداول قیمت‌گذاری */
    #clickPricingTable th,
    #clickPricingTable td,
    #visitPricingTable th,
    #visitPricingTable td,
    #uniqueVisitPricingTable th,
    #uniqueVisitPricingTable td {
        vertical-align: middle !important;
        text-align: center !important;
    }

    /* وسط چین کردن اینپوت‌های داخل جدول */
    #clickPricingTable input,
    #visitPricingTable input,
    #uniqueVisitPricingTable input {
        text-align: center !important;
        margin: 0 auto !important;
        display: inline-block !important;
    }

    /* تنظیم سلول‌های جدول */
    #clickPricingTable td,
    #visitPricingTable td,
    #uniqueVisitPricingTable td {
        vertical-align: middle !important;
        text-align: center !important;
    }

    /* استایل هدر جدول */
    #clickPricingTable thead th,
    #visitPricingTable thead th,
    #uniqueVisitPricingTable thead th {
        text-align: center !important;
        vertical-align: middle !important;
        background-color: #f5f5f5;
    }

    /* استایل اینپوت‌ها */
    #clickPricingTable .form-control,
    #visitPricingTable .form-control,
    #uniqueVisitPricingTable .form-control {
        text-align: center;
        display: inline-block;
        width: auto;
        min-width: 80px;
    }

    /* استایل گروه اینپوت */
    #clickPricingTable .input-group,
    #visitPricingTable .input-group,
    #uniqueVisitPricingTable .input-group {
        display: inline-flex;
        width: auto;
    }
</style>
<style>
    /* استایل ماشین حساب قیمت */
    .pricing-details {
        margin-right: 0;
        margin-left: 0;
    }

    .info-box {
        display: flex;
        min-height: 90px;
        background: #fff;
        width: 100%;
        box-shadow: 0 1px 1px rgba(0,0,0,0.1);
        border-radius: 2px;
        margin-bottom: 15px;
    }

    .info-box-icon {
        border-radius: 2px 0 0 2px;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 70px;
        height: 90px;
        font-size: 30px;
        text-align: center;
        color: #fff;
    }

    .info-box-icon.bg-info {
        background-color: #17a2b8;
    }
    .info-box-icon.bg-primary {
        background-color: #007bff;
    }
    .info-box-icon.bg-warning {
        background-color: #ffc107;
    }
    .info-box-icon.bg-danger {
        background-color: #dc3545;
    }
    .info-box-icon.bg-success {
        background-color: #28a745;
    }

    .info-box-content {
        padding: 10px 15px;
        flex: 1;
        text-align: right;
    }

    .info-box-text {
        display: block;
        font-size: 14px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        text-transform: uppercase;
        font-weight: 600;
        color: #6c757d;
    }

    .info-box-number {
        display: block;
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }

    .info-box-number small {
        font-size: 12px;
        font-weight: normal;
    }

    /* استایل برای موبایل */
    @media (max-width: 768px) {
        .info-box-icon {
            width: 50px;
            height: 70px;
            font-size: 20px;
        }

        .info-box-number {
            font-size: 14px;
        }

        .info-box-text {
            font-size: 11px;
        }

        .info-box-content {
            padding: 5px 10px;
        }

        .bg-success .info-box-number {
            font-size: 18px !important;
        }
    }


</style>

<script type="text/javascript" src="assets/JsFiles/safarBank.js"></script>

