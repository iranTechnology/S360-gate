{if $smarty.const.TYPE_ADMIN eq 1}
    {load_presentation_object filename="listCancel" assign="objCancel"}

    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
                <ol class="breadcrumb FloatRight">
                    <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                    <li class="active">مغایرت گیری پرواز</li>
                </ol>
            </div>
        </div>

        <div class="row">
            <form id="InsertExelReconciliation" method="post" enctype="multipart/form-data" class="w-100">
                <input type='hidden' value='InsertExelReconciliation' name='method'>
                <input type='hidden' value='listCancel' name='className'>

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="bg-white p-4 rounded">
                        <h4 class="mb-4">آپلود فایل اکسل</h4>
                        <div class="row align-items-end">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>نوع فایل</label>
                                    <select name="file_type" class="form-control" required>
                                        <option value="">انتخاب کنید</option>
                                        <option value="CityNet">سیتی نت</option>
                                        <option value="Charter_118">چارتری 118</option>
                                        <option value="System_118">سیستمی 118</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>انتخاب فایل اکسل</label>
                                    <input type="file" name="pnr_file" class="form-control" required>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <label>&nbsp;</label>
                                <button type="submit" class="btn btn-success btn-block">
                                    بارگذاری فایل
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <p class="text-muted m-b-30">
                        تمام پروازهای اختصاصی و اشتراکی موفق از تاریخ 1405/07/10 را نمایش می دهیم
                    </p>
                    <div class="table-responsive">
                        <table id="myTable" class="table table-striped text-center">
                            <thead>
                            <tr>
                                <th>ردیف</th>
                                <th>تاریخ رزرو</th>
                                <th>PNR</th>
                                <th>اشتراکی / اختصاصی </th>
                                <th>سیستمی / چارتری </th>
                                <th>تامین کننده</th>
                                <th>خرید از پرووایدر</th>
                                <th>فروش به آژانس</th>
                                <th>نتیجه</th>
                                <th>عملیات</th>
                            </tr>
                            </thead>
                            <tbody>
                            {assign var="number" value="0"}
                            {foreach key=key item=item from=$objCancel->ListTicketReconciliation()}
                                {$number=$number+1}
                                <tr class="{$item.row_class}{if $item.is_missing} bg-danger text-danger{/if}">
                                    <td>{$number}</td>
                                    <td>{$item.creation_date}</td>
                                    <td><strong>{$item.pnr}</strong></td>
                                    <td>{$item.serviceDisplay}</td>
                                    <td>{$item.flightTypeDisplay|default:'-'}</td>
                                    <td>{$item.provider_name|default:'نامشخص'}</td>
                                    <td>
                                        <!-- مبلغ خرید اصلی پرووایدر -->
                                        <div>{$item.BuyFromProvider|default:'0'}</div>

                                        <!-- مبلغ اکسل زیر مبلغ پرووایدر -->
                                        {if $item.cost_excel_formatted}
                                            <div style="margin-top: 3px;">
                                                <span class="badge" style="font-size: 13px; background-color: {$item.cost_excel_color};">
                                                    اکسل: {$item.cost_excel_formatted}
                                                </span>
                                            </div>
                                        {/if}
                                    </td>
                                    <td>{$item.AgencySale|default:'0'}</td>
                                    <td>{$item.Result}</td>
                                    <td>
                                        <button type="button"
                                                class="btn btn-xs btn-default btn-set-reconciled"
                                                onclick="changeStatusReconciliation('{$item.pnr}', this)"
                                                title="تایید و حذف از گزارش">
                                            <i class="fa fa-check text-success"></i> تایید نهایی
                                        </button>
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

{literal}
    <style>
        .align-middle {
            vertical-align: baseline !important;
        }
    </style>
{/literal}

    <script type="text/javascript" src="assets/JsFiles/listCancel.js"></script>
{/if}
