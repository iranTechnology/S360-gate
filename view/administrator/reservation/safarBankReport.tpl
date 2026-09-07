{load_presentation_object filename="safarBankController" assign="objReport"}

{* دریافت ID آژانس از پارامتر *}
{assign var="agencyId" value=$smarty.get.id|default:0}

{* دریافت تاریخ‌ها از POST یا GET *}
{assign var="dateFrom" value=$smarty.post.date_of|default:$smarty.get.date_of|default:''}
{assign var="dateTo" value=$smarty.post.to_date|default:$smarty.get.to_date|default:''}

{* اگر تاریخ انتخاب نشده، از تابع timeNow استفاده کن *}
{if empty($dateFrom)}
    {assign var="dateFrom" value=$objFunctions->timeNow()}
{/if}
{if empty($dateTo)}
    {assign var="dateTo" value=$objFunctions->timeNow()}
{/if}

{* فراخوانی متد برای گرفتن داده‌ها *}
{assign var="reportData" value=$objReport->getAgencyReportData($agencyId, $dateFrom, $dateTo)}
{assign var="agency" value=$reportData.agency}
{assign var="stats" value=$reportData.stats}
{assign var="tourCount" value=$reportData.tour_count}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li class="active">گزارش بازدید تور های مشتری</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="box-title m-b-0">فیلترهای جستجو</h4>
                    </div>
                </div>

                <form method="post" action="" class="form-horizontal mt-3">
                    <div class="row">
                        <div class="col-md-6">
                            <label>تاریخ از</label>
                            <input type="text" class="form-control datepicker" name="date_of"
                                   value="{$dateFrom}"
                                   placeholder="تاریخ شروع">
                        </div>
                        <div class="col-md-6">
                            <label>تاریخ تا</label>
                            <input type="text" class="form-control datepickerReturn" name="to_date"
                                   value="{$dateTo}"
                                   placeholder="تاریخ پایان">
                        </div>
                    </div>

                    <div class="row" style="margin-top: 20px;">
                        <div class="col-sm-12 text-left">
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-search"></i> جستجو
                            </button>
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
                        <h4 class="box-title m-b-0">لیست نرخ بازدید</h4>
                        <p class="text-muted m-b-30">
                            نمایش آمار بازدید و کلیک آژانس
                            <strong>{$agency.AgencyName|default:'انتخاب نشده'}</strong>
                        </p>
                    </div>
                </div>

                <div class="table-responsive">
                    <table id="agenciesTable" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="20" class="text-center">ردیف</th>
                            <th class="text-center" width="50">ایمپرشن</th>
                            <th width="100" class="text-center">کلیک جزییات</th>
                            <th width="100" class="text-center">refer site</th>
                            <th width="100" class="text-center">refer tour</th>

                        </tr>
                        </thead>
                        <tbody>
                        {if $reportData.success && $agency}
                            <tr class="success-row">
                                <td class="text-center">1</td>
                                <td class="text-center">
                                    <a href="safarBankReportImpression&id={$smarty.get.id}">
                                        <span class="badge badge-info">{$stats.impression|default:0|number_format}</span>
                                    </a>
                                </td>
                                <td class="text-center">
                                    <a href="safarBankReportDetailView&id={$smarty.get.id}">
                                        <span class="badge badge-warning">{$stats.detail_view|default:0|number_format}</span>
                                    </a>
                                </td>
                                <td class="text-center">
                                    <a href="safarBankReportReferSite&id={$smarty.get.id}">
                                        <span class="badge badge-danger">{$stats.refer_site|default:0|number_format}</span>
                                    </a>
                                </td>
                                <td class="text-center">
                                    <a href="">
                                        <span class="badge badge-success">{$stats.refer_tour|default:0|number_format}</span>
                                    </a>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="7" class="text-center text-muted">
                                    <i class="fa fa-info-circle"></i>
                                    مجموع رویدادها: <strong>{$stats.total_events|default:0|number_format}</strong> |
                                    جلسات یکتا: <strong>{$stats.unique_sessions|default:0|number_format}</strong> |
                                    آی‌پی‌های یکتا: <strong>{$stats.unique_ips|default:0|number_format}</strong>
                                    <br>
                                    {*                                    <small>بازه زمانی: <span class="text-primary">{$dateFrom}</span> تا <span class="text-primary">{$dateTo}</span></small>*}
                                </td>
                            </tr>
                        {else}
                            <tr>
                                <td colspan="7" class="text-center text-muted">
                                    <i class="fa fa-info-circle"></i>
                                    {if $agencyId == 0}
                                        لطفاً شناسه آژانس را در پارامتر id وارد کنید
                                        <br>
                                        <small>مثال: ?id=123</small>
                                    {elseif !$reportData.success}
                                        <span class="text-danger">{$reportData.message|default:'خطا در دریافت داده‌ها'}</span>
                                    {else}
                                        هیچ داده‌ای یافت نشد
                                    {/if}
                                </td>
                            </tr>
                        {/if}
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .badge-info { background-color: #36a2eb; padding: 5px 10px; border-radius: 4px; color: white; font-size: 12px; }
    .badge-warning { background-color: #ffc107; padding: 5px 10px; border-radius: 4px; color: #212529; font-size: 12px; }
    .badge-danger { background-color: #dc3545; padding: 5px 10px; border-radius: 4px; color: white; font-size: 12px; }
    .badge-success { background-color: #28a745; padding: 5px 10px; border-radius: 4px; color: white; font-size: 12px; }
    .label-success { background-color: #5cb85c; padding: 5px 12px; border-radius: 4px; font-size: 12px; color: white; }
    .label-primary { background-color: #337ab7; padding: 5px 12px; border-radius: 4px; font-size: 12px; color: white; }
    .success-row { background-color: #f0f8ff; }
    #agenciesTable td, #agenciesTable th { vertical-align: middle !important; text-align: center !important; }
    .white-box { padding: 20px; }
    .form-group { margin-bottom: 15px; }
</style>