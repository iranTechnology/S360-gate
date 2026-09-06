{load_presentation_object filename="safarBankController" assign="objReport"}

{* دریافت پارامترها *}
{assign var="agencyId" value=$smarty.get.id|default:0}
{assign var="country" value=$smarty.get.country|default:''}
{assign var="dateFrom" value=$smarty.get.date_from|default:''}
{assign var="dateTo" value=$smarty.get.date_to|default:''}

{* دریافت آمار *}
{assign var="statsData" value=$objReport->showCityStats()}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReport&id={$agencyId}">گزارش نرخ بازدید تور های مشتری</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReportImpression&id={$agencyId}">آمار تفکیکی کشور ها</a></li>
                <li class="active">آمار تفکیکی شهرها - {$country|default:''}</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="box-title m-b-0">
                            <i class="fa fa-map-marker"></i> آمار تفکیکی شهرها
                        </h4>
                        <p class="text-muted m-b-30">
                            نمایش آمار بازدید شهرها برای کشور
                            <strong>{$country|default:'انتخاب نشده'}</strong>
                            {if $statsData.agency.name}
                                - آژانس <strong>{$statsData.agency.name}</strong>
                            {/if}

                        </p>
                    </div>
                </div>

                {if $statsData.success && $statsData.count > 0}


                    <!-- جدول شهرها -->
                    <div class="table-responsive">
                        <table id="cityTable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="10" class="text-center">ردیف</th>
                                <th width="60" class="text-right">شهر</th>
                                <th width="50" class="text-center">امپرشین</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $statsData.data as $key => $item}
                                <tr>
                                    <td class="text-center">{$key+1}</td>
                                    <td class="text-right font-bold">
                                        {$item.city}
                                    </td>
                                    <td class="text-center">
                                        <a href="safarBankReportImpressionTour&id={$smarty.get.id}&city={$item.city}">
                                            <span class="badge badge-info">{$item.impression|default:0|number_format}</span>
                                        </a>
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
                            هیچ داده‌ای برای کشور <strong>{$country}</strong> در بازه زمانی انتخاب شده یافت نشد.
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
    .badge-primary {
        background-color: #007bff;
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
        text-align: right;
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

    #cityTable td,
    #cityTable th {
        vertical-align: middle !important;
        text-align: center !important;
    }
    #cityTable td:first-child,
    #cityTable th:first-child {
        text-align: center !important;
    }
    .font-bold {
        font-weight: 600;
    }
    .white-box {
        padding: 20px;
    }
</style>