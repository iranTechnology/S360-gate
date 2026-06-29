{load_presentation_object filename="organizationalCategory" assign="ObjOrganization"}
{assign var='organizationId' value=$smarty.get.organizationId}
<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li><a href="#">پنل سازمانی</a></li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/organizational/categoryList">دسته بندی سازمانی</a></li>
                <li class="active">کاربران</li>
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
                <h3 class="box-title m-b-0">کابران این دسته بندی سازمانی</h3>

                <div class="table-responsive">
                    <table id="myTable" class="table table-striped ">
                        <thead>
                        <tr>
                            <th>ردیف</th>
                            <th>نام</th>
                            <th>نام خانوادگی</th>
                            <th>شماره موبایل</th>
                            <th>کدملی</th>
                            <th>تاریخ تولد</th>
                        </tr>
                        </thead>
                        <tbody>
                        {assign var="number" value="0"}
                        {foreach key=key item=item from=$ObjOrganization->ListOrganizationUsers($organizationId)}
                            {$number=$number+1}
                            <tr id="del-{$item.id}">
                                <td class="align-middle">{$number}</td>
                                <td class="align-middle">{$item.first_name}</td>
                                <td class="align-middle">{$item.last_name}</td>
                                <td class="align-middle">{$item.mobile}</td>
                                <td class="align-middle">{$item.national_code}</td>
                                <td class="align-middle">{$item.birthday}</td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

{*<div class="i-section">*}
{*    <div class="i-info">*}
{*        <span> ویدیو آموزشی بخش سطح سازمانی</span>*}
{*    </div>*}

{*    <a href="https://www.iran-tech.com/whmcs/knowledgebase/397/-.html" target="_blank" class="i-btn"></a>*}

{*</div>*}
<script type="text/javascript" src="assets/JsFiles/organizational.js"></script>