{load_presentation_object filename="members" assign="objCounter"}
{load_presentation_object filename="counterType" assign="objCounterType"}
<style>
    .tooltip-wide .tooltip-inner {
        max-width: 200px !important;
        min-width: 100px;
    }
</style>
<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                {if $objsession->adminIsLogin()}
                    <li><a href="agencyList">همکاران</a></li>
                {else}
                    <li>کاربران</li>
                {/if}
                <li class="active">کانترها</li>
            </ol>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <!--<h4 class="page-title FloatLeft">Dashboard 3</h4>-->
        </div>

        <!-- /.col-lg-12 -->
    </div>
    <div class="row">

        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">لیست کانتر</h3>
                <div class="table-responsive"  style="padding-bottom: 90px;">
                    <table id="myTable" class="table table-striped ">
                        <thead>
                        <tr>
                            <th>ردیف</th>
                            <th>نام کانتر</th>
                            <th>نام کاربری کانتر</th>
                            <th>نوع کانتر</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>
                        <tbody>

                        {assign var="number" value="0"}
                        {$objCounter->getCounters('1','1')}
                        {foreach key=key item=item from=$objCounter->list} {*نمایش اسامی
                        کانترها*}
                            {$objCounterType->get($item.fk_counter_type_id)} {*گرفتن عنوان از جدول نوع کانتر*}
                            {$number=$number+1}
                            <tr id="del-{$item.id}">
                                <td>{$number}</td>
                                <td>{$item.name} {$item.family}</td>
                                <td>{$item.user_name}</td>
                                <td>{$objCounterType->list['name']}</td>
                                <td>
                                    <div class="btn-group m-r-10">
                                        <a onclick="loginMember('{$item.user_name}','{$item.password}')"
                                           class="tooltip-wide"
                                           target="_blank">
                                            <i class="fcbtn btn btn-outline btn-success btn-1e fa fa-sign-in tooltip-success"
                                               data-toggle="tooltip"
                                               data-placement="top"
                                               title="ورود برای ثبت تور"
                                               style="font-size: 15px;">
                                            </i>
                                        </a>
                                    </div>
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
<script type="text/javascript" src="assets/JsFiles/counter.js"></script>
<script>
    var clientMainDomain = '{$smarty.const.CLIENT_MAIN_DOMAIN}';
    function loginMember(userName, password) {
        const ajaxData = {
            className: "members",
            entry:userName,
            password:password,
            method:  "AdmincallMemberLogin"
        }
        $.ajax({
            url: amadeusPath + "ajax",
            type: "POST",
            data: JSON.stringify(ajaxData),
            dataType: 'json',
            success: function (resp) {
                if (resp) {
                    var targetUrl =  clientMainDomain;
                    var newWin = window.open('https://' + clientMainDomain +`/gds/fa/tourList`, '_blank');
                } else {
                    alert(resp.message || 'خطا در ورود');
                }
            },
            error: function (xhr) {
                console.error('AJAX error:', xhr);
                alert('خطای ارتباط با سرور');
            }
        });

    }
</script>
