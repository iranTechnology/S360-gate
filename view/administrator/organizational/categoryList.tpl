{load_presentation_object filename="organizationalCategory" assign="ObjOrganization"}



<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li>پنل سازمانی</li>
                <li class="active">دسته بندی سازمانی</li>
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
                <h3 class="box-title m-b-0">دسته بندی جدید</h3>
                <form data-toggle="validator" id="organizationCategoryAdd" method="post">
                    <input type="hidden" name="flag" value="organizationalCategoryAdd">
                    <div class="form-group col-sm-6 ">
                        <label for="title" class="control-label">عنوان</label>
                        <input type="text" class="form-control" id="title" name="title"
                               placeholder="عنوان را وارد نمائید">
                    </div>
                    <div class="form-group col-sm-6 ">
                        <label for="description" class="control-label">توضیحات</label>
                        <input type="text" class="form-control" id="description" name="description"
                               placeholder="توضیحات را وارد نمائید">
                    </div>

                    <div class="form-group col-sm-12 ">
                        <label for="job_guide" class="control-label">راهنمای شغلی</label>
                        <input type="text" class="form-control" id="job_guide" name="job_guide"
                               placeholder="راهنمای شغلی را وارد نمائید">
                    </div>

                    <div class="form-group col-sm-12">
                        <label for="rules" class="control-label">قوانین</label>
                        <textarea name="rules" id="rules" class=" form-control"
                                  placeholder="قوانین"></textarea>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary pull-right">ارسال اطلاعات</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">دسته بندی سازمانی</h3>

                <div class="table-responsive">
                    <table id="myTable" class="table table-striped ">
                        <thead>
                        <tr>
                            <th>ردیف</th>
                            <th>عنوان</th>
                            <th>توضیحات</th>
                            <th>راهنمای شغلی</th>
{*                            <th>قوانین</th>*}
                            <th>وضیعت</th>
                            <th>ویرایش</th>
                            <th>لیست ثبت نامی ها</th>
                        </tr>
                        </thead>
                        <tbody>
                        {assign var="number" value="0"}
                        {foreach key=key item=item from=$ObjOrganization->ListAll()}
                            {$number=$number+1}
                            <tr id="del-{$item.id}">
                                <td class="align-middle">{$number}</td>
                                <td class="align-middle">{$item.title}</td>
                                <td class="align-middle">{$item.description}</td>
                                <td class="align-middle">{$item.job_guide}</td>
{*                                <td class="align-middle rules">{$item.rules|escape:'html'}</td>*}
                                <td class="align-middle">
                                    <a href="#" onclick="activate('{$item.id}'); return false;">
                                        {if $item.status eq '1'}
                                            <input type="checkbox" class="js-switch" data-color="#99d683"
                                                   data-secondary-color="#f96262" data-size="small" checked="checked" />

                                        {else}
                                            <input type="checkbox" class="js-switch" data-color="#99d683"
                                                   data-secondary-color="#f96262" data-size="small"/>
                                        {/if}
                                    </a>
                                </td>
                                <td class="align-middle">
                                    <a href="cateogryEdit&id={$item.id}" class=""><i
                                                class="fcbtn btn btn-outline btn-primary btn-1e fa fa-pencil tooltip-primary"
                                                data-toggle="tooltip" data-placement="top" title=""
                                                data-original-title="ویرایش"></i></a>
                                </td>
                                <td class="align-middle">
                                    <a href="organizationalListUsers&organizationId={$item.id}" class=""><i
                                                class="fcbtn btn btn-outline btn-success btn-1e fa fa-user tooltip-success"
                                                data-toggle="tooltip" data-placement="top" title=""
                                                data-original-title="لیست ثبت نامی ها"></i></a>
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

{*<div class="i-section">*}
{*    <div class="i-info">*}
{*        <span> ویدیو آموزشی بخش سطح سازمانی</span>*}
{*    </div>*}

{*    <a href="https://www.iran-tech.com/whmcs/knowledgebase/397/-.html" target="_blank" class="i-btn"></a>*}

{*</div>*}
<script type="text/javascript" src="assets/JsFiles/organizational.js"></script>