{load_presentation_object filename="smsPanel" assign="objSms"}
{assign var="reportsList" value=$objSms->getGroupReports($smarty.get.type)}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li>پنل پیامکی</li>
                <li class="active">گزارش پیامک های ارسالی به صورت {if $smarty.get.type eq 'manual'}دستی{else}خودکار{/if}</li>
            </ol>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <!--<h4 class="page-title FloatLeft">Dashboard 3</h4>-->
        </div>

        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box my-2">
                <h3 class="box-title m-b-0">جستجو براساس شماره درخواست</h3>
                <form id="SearchSmsReport" method="post" onsubmit="return false">
                    <input type="hidden" name="flag" id="flag" value="searchByReqeustNumberSmsReports">
                    <input type="hidden" name="type" id="searchType" value="{$smarty.get.type}">

                    <div class="form-group col-sm-12">
                        <label for="requestNumber" class="control-label">شماره درخواست</label>
                        <input type="text" class="form-control" name="request_number"
                               value="{$smarty.post.request_number}" id="requestNumber"
                               placeholder="شماره درخواست را وارد نمائید">
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group pull-right">
                                <button type="submit" class="btn btn-primary" id="btnSearchSms">
                                    <i class="fa fa-search"></i> شروع جستجو
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="table-responsive">
                    <table id="myTable" class="table table-striped ">
                        <thead>
                        <tr>
                            <th>ردیف</th>
                            <th>پیام ارسالی</th>
                            {if $smarty.get.type eq 'manual'}<th>ارسال به</th>{/if}
                            <th>تاریخ و ساعت ارسال</th>
                            <th>شماره درخواست</th>
                            <th>شماره Pnr</th>
                            <th>شماره ارسالی</th>
                            <th>وضعیت ارسال</th>
                            {*                            <th>تعداد کل</th>*}
                            {*<th>تعداد موفق</th>*}
                            {*<th>تعداد ناموفق</th>*}
                            {*                            <th>جرئیات</th>*}
                        </tr>
                        </thead>
                        <tbody>
                        {assign var="number" value="0"}
                        {foreach key=key item=item from=$reportsList}
                            {$number=$number+1}
                            <tr>
                                <td class="align-middle">{$number}</td>
                                <td class="align-middle">{$item.smsMessage}</td>
                                {if $smarty.get.type eq 'manual'}<td>{$item.sendTo}</td>{/if}
                                <td class="align-middle">{$objDate->jdate('Y-m-d (H:i:s)', $item.creationDateInt)}</td>
                                <td class="align-middle">{$item.request_number}</td>
                                <td class="align-middle">{$item.pnr_number}</td>
                                <td class="align-middle">{$item.receiverMobile}</td>
                                <td class="align-middle">
                                    {if $item.sendStatus == 1 || $item.sendStatus === true || $item.sendStatus == '1'}
                                        موفق
                                    {else}
                                        ناموفق
                                    {/if}
                                </td>
                                {*                                <td class="align-middle">{$item.totalSend}</td>*}
                                {*<td class="align-middle">{$item.succeedSend}</td>*}
                                {*<td class="align-middle">{$item.failedSend}</td>*}
                                {*                                <td class="align-middle">*}
                                {*                                    <a href="reportDetails&id={$item.sameID}" class=""><i*}
                                {*                                        class="fcbtn btn btn-outline btn-primary btn-1e fa fa-list-ul tooltip-primary"*}
                                {*                                        data-toggle="tooltip" data-placement="top" title=""*}
                                {*                                        data-original-title="جرئیات"></i></a>*}
                                {*                                </td>*}
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="i-section">
    <div class="i-info">
        <span> ویدیو آموزشی بخش  گزارش ارسال پیامک</span>
    </div>

    <a href="https://www.iran-tech.com/whmcs/knowledgebase/403/--.html" target="_blank" class="i-btn"></a>

</div>

<script type="text/javascript" src="assets/JsFiles/smsPanel.js"></script>