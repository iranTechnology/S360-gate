{load_presentation_object filename="safarBankController" assign="objReport"}

{* دریافت پارامترها *}
{assign var="agencyId" value=$smarty.get.id|default:0}
{assign var="dateFrom" value=$smarty.get.date_from|default:''}
{assign var="dateTo" value=$smarty.get.date_to|default:''}

{* دریافت آمار *}
{assign var="statsData" value=$objReport->showDetailViewTours()}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/reservation/safarBankReport&id={$agencyId}">گزارش نرخ بازدید تور های مشتری</a></li>
                <li class="active">جزئیات کلیک تورها</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="box-title m-b-0">
                            <i class="fa fa-mouse-pointer"></i> جزئیات کلیک و Refer Tour
                        </h4>
                        <p class="text-muted m-b-30">
                            نمایش تورهایی که کاربران روی آنها کلیک کرده‌اند
                            {if $statsData.agency.name}
                                - آژانس <strong>{$statsData.agency.name}</strong>
                            {/if}
                        </p>
                    </div>
                </div>

                {if $statsData.success && $statsData.data|count > 0}
                    <!-- جدول تورها -->
                    <div class="table-responsive">
                        <table id="detailViewTable" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="10" class="text-center">ردیف</th>
                                <th width="150" class="text-right">نام تور</th>
                                <th width="80" class="text-center">تاریخ تور</th>
                                <th width="80" class="text-center">کلیک جزییات</th>
                                <th width="80" class="text-center">Refer Tour</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $statsData.data as $key => $item}

                                <tr>
                                    <td class="text-center">{$key+1}</td>
                                    <td class="text-right font-bold">
                                        {$item.tour_name}
                                    </td>
                                    <td class="text-center">
                                        <span class="label label-default">{$item.start_date}</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge badge-primary">{$item.detail_count|default:0|number_format}</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge badge-success">{$item.refer_count|default:0|number_format}</span>
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
                            هیچ داده‌ای برای این آژانس در بازه زمانی انتخاب شده یافت نشد.
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
    .label-default {
        background-color: #6c757d;
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
    .info-box-icon.bg-primary { background-color: #007bff; }
    .info-box-icon.bg-success { background-color: #28a745; }
    .info-box-icon.bg-info { background-color: #17a2b8; }

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

    #detailViewTable td,
    #detailViewTable th {
        vertical-align: middle !important;
        text-align: center !important;
    }
    #detailViewTable td:nth-child(2),
    #detailViewTable th:nth-child(2) {
        text-align: center !important;
    }
    .font-bold {
        font-weight: 600;
    }
    .white-box {
        padding: 20px;
    }
</style>