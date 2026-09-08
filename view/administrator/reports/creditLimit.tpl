<style>
    .text-info-new{
        font-size:13px;
        width: 75%;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .box-credit{
        display: flex;
        align-items: center;
        justify-content:space-around;
    }
    .text-info-new i{
        font-size:25px;
        color:#e3b628
    }
</style>

<div class="box box-credit mb-0" style="margin-top: 12px;margin-bottom: 11px !important;">
    <div class="text-info-new">
        <i class="fa fa-warning"></i>
        <p class="m-0">در زمانیکه سیستم شما به اندازه کافی شارژ ندارد، برای حفظ محرمانگی سیستم شما، ما به مشتری پیغام <strong>"متاسفانه سامانه در حال بروز رسانی می باشد لطفا کمی بعد مجددا تلاش نمائید"</strong> را نمایش می دهیم و این به آن معنا است که شما باید پنل خود را شارژ بفرمایید</p>
    </div>
    <div class="border border-ccc p-3 rounded-md d-flex justify-content-center" style="border-radius: 14px;font-size:13px">
        <span> میزان اعتبار حساب شما: </span>
        <p class="text-center m-0 p-0">
            {assign var="total_credit" value=$objTransaction->getCredit()}
            {$total_credit|number_format} ریال -{if $total_credit > 0}بستانکار{elseif $objAccountotal_credit< 0}بدهی{else}تسویه{/if}

        </p>

    </div>
</div>