{load_presentation_object filename="airline" assign="objAirline"}
{load_presentation_object filename="reportAgenciesSearch" assign="objSearch"}
{load_presentation_object filename="airLinePriceController" assign="objPrice"}
{assign var=airLineiataCodes value=$objAirline->getAllIataCodes()}
{assign var=airLinePrices value=$objPrice->getAllPrices()}

<style>
    .select2-container {
        width: 100% !important;
        height: 100% !important;
    }
    .select2-container--default .select2-selection--single .select2-selection__arrow {
        height: 26px !important;
        width: 40px !important;
    }
    .select2-container--default .select2-selection--single {
        background: #eee !important;
        border: 1px solid #dcdcdc !important;
        height: 34px;
    }
    .price-input {
        width: 150px;
        text-align: center;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 5px;
        transition: all 0.3s;
    }
    .price-input:focus {
        border-color: #00c292;
        box-shadow: 0 0 5px rgba(0,194,146,0.5);
        outline: none;
    }
    .price-input.updating {
        background-color: #fff3cd;
        border-color: #ffc107;
    }
    .save-status {
        margin-left: 5px;
        font-size: 12px;
    }
    .save-success {
        color: #00c292;
    }
    .save-error {
        color: #e46a76;
    }
</style>

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li>تنظیمات</li>
                <li class="active">سقف قیمت پرواز ها</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <!-- فرم افزودن قیمت جدید -->
                <div class="panel panel-default m-b-20">
                    <div class="panel-heading">افزودن قیمت جدید</div>
                    <div class="panel-body">
                        <form id="airlinePriceCeilingForm" class="form-horizontal">
                            <div class="form-group">
                                <input type="hidden" name="flag" value="flightPriceCeiling">
                                <div class="col-sm-3">
                                    <label for="airline_iata_id" class="control-label">ایرلاین</label><span style="color:red">*</span>
                                    <select class="form-control select2" id="airline_iata_id" name="airline_uniqe_iata">
                                        <option value="">لطفا یاتا مورد نظر را انتخاب نمایید</option>
                                        {foreach $airLineiataCodes as $airLineiataCode}
                                            <option value="{$airLineiataCode.id}">{$airLineiataCode.airline_name} ({$airLineiataCode.airline_uniqe_iata})</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label for="origin" class="control-label">شهر مبدا</label>
                                    <select name="origin" id="origin" class="form-control select2">
                                        <option value="">شهر مبدا</option>
                                        <option value="all">همه</option>
                                        {foreach $objSearch->airportsTb() as $item }
                                            <option value="{$item.DepartureCode}" {if $smarty.post.origin eq $item.DepartureCode} selected {/if}>{$item.DepartureCityFa}({$item.DepartureCode})</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label for="destination" class="control-label">شهر مقصد</label>
                                    <select name="destination" id="destination" class="form-control select2">
                                        <option value="">شهر مقصد</option>
                                        <option value="all">همه</option>
                                        {foreach $objSearch->airportsTb() as $item }
                                            <option value="{$item.DepartureCode}" {if $smarty.post.destination eq $item.DepartureCode} selected {/if}>{$item.DepartureCityFa}({$item.DepartureCode})</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <label for="ceiling_price" class="control-label">سقف قیمت</label>
                                    <input type="text"
                                           class="form-control"
                                           name="ceiling_price"
                                           value="{$smarty.post.ceiling_price|number_format:0}"
                                           id="ceiling_price"
                                           onkeypress="return onlyNumberKey(event)"
                                           onkeyup="formatNumber(this)"
                                           placeholder="سقف قیمت">
                                </div>
                                <div class="col-sm-1 ">
                                    <button type="submit" class="btn btn-success" style="margin-top: 20px;" id="addAirlineBtn">
                                        <i class="fa fa-plus"></i> افزودن
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- جدول نمایش قیمت‌ها -->
                <div class="table-responsive">
                    <table id="myTable" class="table table-striped">
                        <thead>
                        <tr>
                            <th>ردیف</th>
                            <th>نام ایرلاین(یاتا)</th>
                            <th>شهر مبدا</th>
                            <th>شهر مقصد</th>
                            <th>سقف قیمت</th>
                            <th>حذف</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach key=key item=price from=$airLinePrices}
                            {assign var="number" value=$key+1}

                            {* پیدا کردن نام ایرلاین *}
                            {assign var="airlineInfo" value=null}
                            {foreach $airLineiataCodes as $airline}
                                {if $airline.id == $price.airline_iata_id}
                                    {assign var="airlineInfo" value=$airline}
                                {/if}
                            {/foreach}

                            {* پیدا کردن نام شهر مبدا و مقصد *}
                            {assign var="originCity" value=""}
                            {assign var="destCity" value=""}
                            {foreach $objSearch->airportsTb() as $airport}
                                {if $airport.DepartureCode == $price.origin}
                                    {assign var="originCity" value=$airport.DepartureCityFa}
                                {/if}
                                {if $airport.DepartureCode == $price.destination}
                                    {assign var="destCity" value=$airport.DepartureCityFa}
                                {/if}
                            {/foreach}

                            <tr id="price-row-{$price.id}">
                                <td>{$number}</td>
                                <td>
                                    {if $airlineInfo}
                                        {$airlineInfo.airline_name} ({$airlineInfo.airline_uniqe_iata})
                                    {else}
                                        نامشخص
                                    {/if}
                                </td>
                                <td>
                                    {if $price.origin == 'all'}
                                        همه
                                    {elseif $originCity}
                                        {$originCity} ({$price.origin})
                                    {else}
                                        {$price.origin}
                                    {/if}
                                </td>
                                <td>
                                    {if $price.destination == 'all'}
                                        همه
                                    {elseif $destCity}
                                        {$destCity} ({$price.destination})
                                    {else}
                                        {$price.destination}
                                    {/if}
                                </td>
                                <td>
                                    <div class="input-group" style="direction: ltr;">
                                        <input type="text"
                                               class="price-input"
                                               id="price-{$price.id}"
                                               value="{$price.ceiling_price|number_format:0}"
                                               data-price-id="{$price.id}"
                                               data-original-value="{$price.ceiling_price}"
                                               onchange="updatePrice(this, {$price.id})"
                                               onkeypress="return onlyNumberKey(event)">
                                        <span class="save-status" id="status-{$price.id}"></span>
                                    </div>
                                </td>
                                <td>
                                    <a onclick="removePrice({$price.id}); return false"
                                       class="popoverBox popover-danger"
                                       data-toggle="popover"
                                       title=""
                                       data-placement="right">
                                        <i class="fcbtn btn btn-outline btn-danger btn-1c fa fa-remove"></i>
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="assets/JsFiles/airline.js"></script>

<script>
    $(document).ready(function() {
        $('#myTable').DataTable({
            language: {
                emptyTable: "هیچ داده‌ای یافت نشد"
            }
        });
    });
    // تابع فقط عدد
    function onlyNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }

    function updatePrice(element, priceId) {
        var newPrice = element.value.replace(/,/g, '');
        var originalValue = element.getAttribute('data-original-value');
        var statusSpan = document.getElementById('status-' + priceId);
        if (newPrice == originalValue) {
            return;
        }
        element.classList.add('updating');
        statusSpan.innerHTML = '<i class="fa fa-spinner fa-spin"></i> در حال بروزرسانی...';
        var xhr = new XMLHttpRequest();
        xhr.open('POST', amadeusPath + 'user_ajax.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.onload = function() {
            element.classList.remove('updating');
            if (xhr.status == 200) {
                try {
                    var response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        element.setAttribute('data-original-value', newPrice);
                        statusSpan.innerHTML = '<i class="fa fa-check save-success"></i> ذخیره شد';
                        setTimeout(function() {
                            statusSpan.innerHTML = '';
                        }, 3000);
                    } else {
                        // برگردوندن مقدار قبلی
                        element.value = Number(originalValue).toLocaleString();
                        statusSpan.innerHTML = '<i class="fa fa-exclamation-circle save-error"></i> خطا در ذخیره';

                        setTimeout(function() {
                            statusSpan.innerHTML = '';
                        }, 3000);
                    }
                } catch(e) {
                    element.value = Number(originalValue).toLocaleString();
                    statusSpan.innerHTML = '<i class="fa fa-exclamation-circle save-error"></i> خطا';
                }
            } else {
                element.value = Number(originalValue).toLocaleString();
                statusSpan.innerHTML = '<i class="fa fa-exclamation-circle save-error"></i> خطا';
            }
        };
        element.value = Number(newPrice).toLocaleString();
        var params = 'flag=updatePriceCeiling&id=' + priceId + '&ceiling_price=' + newPrice;
        xhr.send(params);
    }
    document.querySelectorAll('.price-input').forEach(function(input) {
        input.addEventListener('keyup', function(e) {
            if (e.keyCode != 13) { // انتر نباشه
                var value = this.value.replace(/,/g, '');
                if (!isNaN(value) && value != '') {
                    this.value = Number(value).toLocaleString();
                }
            }
        });
    });
    function formatNumber(input) {
        let value = input.value.replace(/\D/g, '');

        if (value === '') {
            input.value = '';
            return;
        }
        input.value = Number(value).toLocaleString('en-US');
    }

    // فقط اجازه ورود عدد
    function onlyNumberKey(evt) {
        let charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    function removePrice(priceId) {
        if (confirm('آیا از حذف این آیتم اطمینان دارید؟')) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', amadeusPath + 'user_ajax.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
            xhr.onload = function() {
                if (xhr.status == 200) {
                    try {
                        var response = JSON.parse(xhr.responseText);
                        if (response.success) {
                            $.toast({
                                heading: 'حذف با موفقیت انجام شد',
                                position: 'top-right',
                                loaderBg: '#fff',
                                icon: 'success',
                                hideAfter: 3500,
                                textAlign: 'right',
                                stack: 6
                            });
                            location.reload();
                        } else {
                            alert('خطا در حذف آیتم');
                        }
                    } catch(e) {
                        alert('خطا در حذف آیتم');
                    }
                } else {
                    alert('خطا در ارتباط با سرور');
                }
            };

            xhr.send('flag=deletePriceCeiling&id=' + priceId);
        }
    }
</script>