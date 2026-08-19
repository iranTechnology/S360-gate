{load_presentation_object filename="organizationalCategory" assign="ObjOrganization"}
{assign var="info" value=$ObjOrganization->getOrganizationByID($smarty.get.id)}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li>پنل سازمانی</li>
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/organizational">لیست دسته بندی سازمانی</a></li>
                <li class="active">ویرایش دسته بندی سازمانی</li>
            </ol>
        </div>
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <!--<h4 class="page-title FloatLeft">Dashboard 3</h4>-->
        </div>

        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">ویرایش دسته بندی سازمانی</h3>
                <form data-toggle="validator" id="organizationCategoryEdit" method="post">
                    <input type="hidden" name="flag" value="organizationalCategoryEdit">
                    <input type="hidden" name="id" value="{$info['id']}">

                    <div class="form-group col-sm-6 ">
                        <label for="title" class="control-label">عنوان</label>
                        <input type="text" class="form-control" id="title" name="title" value="{$info['title']}"
                               placeholder="عنوان را وارد نمائید">
                    </div>
                    <div class="form-group col-sm-6 ">
                        <label for="description" class="control-label">توضیحات</label>
                        <input type="text" class="form-control" id="description" name="description" value="{$info['description']}"
                               placeholder="توضیحات را وارد نمائید">
                    </div>
                    <div class="form-group col-sm-12 ">
                        <label for="job_guide" class="control-label">راهنمای شغلی</label>
                        <input type="text" class="form-control" id="job_guide" name="job_guide"
                               placeholder="راهنمای شغلی را وارد نمائید" value="{$info['job_guide']}">
                    </div>

                    <div class="form-group col-sm-12">
                        <label for="rules" class="control-label">قوانین</label>
                        <textarea name="rules" id="rules" class="form-control"
                                  placeholder="قوانین" >{$info['rules']}</textarea>
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
</div>

<script type="text/javascript" src="assets/JsFiles/organizational.js"></script>

