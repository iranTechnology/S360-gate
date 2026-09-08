{load_presentation_object filename="safarBankController" assign="objReport"}

{* دریافت پارامترها *}
{assign var="agencyId" value=$smarty.get.id|default:0}
{assign var="tourName" value=$smarty.get.tour_name|default:''}
{assign var="city" value=$smarty.get.city|default:''}
{assign var="dateFrom" value=$smarty.get.date_from|default:''}
{assign var="dateTo" value=$smarty.get.date_to|default:''}

{* دریافت آمار *}
{assign var="statsData" value=$objReport->showTourDailyStats()}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReport&id={$agencyId}">گزارش نرخ بازدید تور های مشتری</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReportImpression&id={$agencyId}">آمار تفکیکی مقصدها</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReportImpressionDestCity&id={$agencyId}&country={$country}">آمار تفکیکی شهرها</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReportImpressionTour&id={$agencyId}&city={$city}">آمار تفکیکی تورها</a></li>
                <li class="active">آمار روزانه تور - {$tourName|default:''}</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="box-title m-b-0">
                            <i class="fa fa-calendar"></i> آمار روزانه تور
                        </h4>
                        <p class="text-muted m-b-30">
                            نمایش آمار بازدید روزانه تور
                            <strong>{$tourName|default:'انتخاب نشده'}</strong>
                            {if $statsData.agency.name}
                                - آژانس <strong>{$statsData.agency.name}</strong>
                            {/if}
                            {if $statsData.tour.city}
                                - شهر <strong>{$statsData.tour.city}</strong>
                            {/if}

                        </p>
                    </div>
                </div>

                {if $statsData.success && $statsData.data|count > 0}
                    <!-- کارت‌های خلاصه -->


                    <!-- جدول تاریخ‌های بازدید -->
                    <div class="table-responsive" style="margin-top: 20px;">
                        <table id="dailyTable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="10" class="text-center">ردیف</th>
                                <th width="120" class="text-center">تاریخ</th>
                                <th width="100" class="text-center">تعداد بازدید</th>

                            </tr>
                            </thead>
                            <tbody>
                            {foreach $statsData.data as $key => $item}
                                {* تبدیل تاریخ میلادی به شمسی *}
                                {assign var="dateOnly" value=$item.visit_date|substr:0:10}
                                {assign var="shamsiDate" value=$objFunctions->ConvertToJalali($dateOnly)}
                                <tr>
                                    <td class="text-center">{$key+1}</td>
                                    <td class="text-center font-bold">
                                        <span class="label label-primary">{$shamsiDate}</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge badge-info">{$item.total_count|default:0|number_format}</span>
                                    </td>

                                </tr>
                            {/foreach}
                            </tbody>

                        </table>
                    </div>


                {else}
                    <div class="alert alert-warning text-center">
                        <i class="fa fa-exclamation-triangle"></i>
                        {if $statsData.success}
                            هیچ بازدیدی برای تور <strong>{$tourName}</strong> در بازه زمانی انتخاب شده یافت نشد.
                        {else}
                            {$statsData.message|default:'خطا در دریافت داده‌ها'}
                        {/if}
                    </div>
                {/if}


            </div>
        </div>
    </div>
</div>

<style>
    .badge-info {
        background-color: #36a2eb;
        padding: 5px 10px;
        border-radius: 4px;
        color: white;
        font-size: 12px;
    }
    .badge-success {
        background-color: #28a745;
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
    .label-primary {
        background-color: #007bff;
        padding: 5px 10px;
        border-radius: 4px;
        color: white;
        font-size: 11px;
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
    .info-box-icon.bg-info { background-color: #17a2b8; }
    .info-box-icon.bg-primary { background-color: #007bff; }
    .info-box-icon.bg-success { background-color: #28a745; }
    .info-box-icon.bg-warning { background-color: #ffc107; }

    .info-box-content {
        padding: 10px 15px;
        flex: 1;
        text-align: center !important;
    }
    .info-box-text {
        display: block;
        font-size: 14px;
        text-transform: uppercase;
        font-weight: 600;
        color: #6c757d;
    }
    .info-box-number {
        display: block;
        font-size: 22px;
        font-weight: bold;
        color: #333;
    }

    #dailyTable td,
    #dailyTable th {
        vertical-align: middle !important;
        text-align: center !important;
    }
    .font-bold {
        font-weight: 600;
    }
    .white-box {
        padding: 20px;
    }
</style>
