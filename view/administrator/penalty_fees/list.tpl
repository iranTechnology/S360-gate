{load_presentation_object filename="penaltyFees" assign="ObjPenalty"}
{assign var="ListPenaltyFees" value=$ObjPenalty->getPenalty()}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li class="active">کارمزد جریمه </li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">کارمزد جریمه به ازای هر شخص (مبلغ به ریال)</h3>
                <form id="penaltyForm" method="post">
                    <div class="row align-items-end">

                        <div class="form-group col-md-4">
                            <input type="text" class="form-control" id="amount" name="amount" required  onkeypress="isDigitPenalty(this)" onkeyup="javascript:separatorPenalty(this);">
                        </div>

                        <div class="form-group col-md-2">
                            <button type="submit" class="btn btn-primary btn-block">
                                ثبت
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
                <table id="myTable" class="table table-striped ">
                    <thead>
                    <tr>
                        <th>ردیف</th>
                        <th>مبلغ به ریال</th>
                        <th>تاریخ ثبت</th>
                        <th>ساعت ثبت</th>
                        <th>عملیات</th>
                    </tr>
                    </thead>
                    <tbody>
                    {assign var="number" value=0}
                    {foreach from=$ListPenaltyFees item=item name=list}
                        {$number = $number+1}

                        {assign var="dt" value=" "|explode:$item.date_time}

                        <tr id="del-{$item.id}">
                            <td>{$number}</td>
                            <td>{$item.amount|number_format}</td>

                            <!-- ستون تاریخ -->
                            <td>{$dt[0]}</td>

                            <!-- ستون ساعت -->
                            <td>{$dt[1]}</td>

                            <td>
                                <a href="#" onclick="deleteAccess('{$item.id}')">
                                    <i class="fcbtn btn btn-outline btn-danger btn-1f tooltip-danger ti-trash"
                                       data-toggle="tooltip" data-placement="top"
                                       title="حذف"></i>
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
<script type="text/javascript" src="assets/JsFiles/penalty_fees.js"></script>
