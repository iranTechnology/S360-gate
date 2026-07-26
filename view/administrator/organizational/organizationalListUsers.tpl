{load_presentation_object filename="organizationalCategory" assign="ObjOrganization"}
{assign var='organizationId' value=$smarty.get.organizationId}
<style>

    .file-label {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        border: 2px dashed #d1d5db;
        border-radius: 8px;
        padding: 30px;
        cursor: pointer;
        transition: all 0.3s ease;
        background: #f9fafb;
        width: 100%;
    }

    .file-label:hover {
        border-color: #6366f1;
        background: #f3f4ff;
    }

    .file-label i {
        font-size: 36px;
        color: #6366f1;
        margin-bottom: 10px;
    }

    .file-label span {
        color: #6b7280;
        font-size: 14px;
    }

    .file-label input {
        display: none;
    }

    .file-selected {
        display: flex;
        align-items: center;
        gap: 15px;
        padding: 10px 15px;
        background: #f0fdf4;
        border: 1px solid #86efac;
        border-radius: 8px;
        margin-top: 10px;
    }

    .file-selected .file-preview {
        flex-shrink: 0;
    }

    .file-selected .file-info {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .file-selected .file-info span {
        color: #166534;
        font-weight: 500;
    }

    .file-selected .file-info .file-size {
        font-size: 12px;
        color: #6b7280;
        font-weight: normal;
    }

    .file-selected button {
        flex-shrink: 0;
    }

</style>


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
        <!-- مودال آپلود فایل -->
        <div class="modal fade" id="uploadFileModal" tabindex="-1" role="dialog" aria-labelledby="uploadFileModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="uploadFileModalLabel">
                            <i class="fa fa-upload"></i> آپلود فایل 
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="uploadFileForm" enctype="multipart/form-data">
                            <input type="hidden" name="user_id" id="upload_user_id" value="">
                            <input type="hidden" name="flag" value="acceptUserOrganizationalCategory">

                            <div class="form-group">
                                <label for="upload_file" class="file-label">
                                    <i class="fa fa-cloud-upload"></i>
                                    <span>برای انتخاب فایل کلیک کنید</span>
                                    <input type="file" class="form-control-file" name="upload_file" id="upload_file" accept=".pdf,.jpg,.jpeg">
                                </label>

                                <div id="fileSelected" style="display:none;" class="file-selected">
                                    <div class="file-preview">
                                        <img id="filePreview" src="" alt="پیش‌نمایش فایل" style="display:none; max-width: 80px; max-height: 80px; border-radius: 8px;">
                                        <i id="fileIcon" class="fa fa-file-pdf-o" style="display:none; font-size: 40px; color: #dc3545;"></i>
                                    </div>
                                    <div class="file-info">
                                        <span id="selectedFileName"></span>
                                        <span id="selectedFileSize" class="file-size"></span>
                                    </div>
                                    <button type="button" class="btn btn-sm btn-link text-danger" onclick="removeSelectedFile();">
                                        <i class="fa fa-times"></i>
                                    </button>
                                </div>

                                <small class="form-text text-muted">
                                    <i class="fa fa-info-circle"></i> فرمت‌های مجاز: PDF, JPG, JPEG (حداکثر 5 مگابایت)
                                </small>
                                <div class="invalid-feedback" style="display:none;"></div>
                            </div>

                            <div id="uploadProgress" class="progress d-none mt-3">
                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 0%">0%</div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            <i class="fa fa-times"></i> انصراف
                        </button>
                        <button type="button" class="btn btn-success" id="submitUploadBtn">
                            <i class="fa fa-check"></i> تایید و آپلود
                        </button>
                    </div>
                </div>
            </div>
        </div>
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
                            <th>رده شغلی</th>
                            <th>کد پیگری</th>
                            <th>عملیات</th>
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
                                <td class="align-middle">{$item.job_category}</td>
                                <td class="align-middle">{$item.tracking_code}</td>
                                <td class="align-middle">
                                    {if $item.is_accept eq '2'}
                                        {* کاربر رد شده - فقط نمایش وضعیت *}
                                        <span class="badge badge-danger badge-pill">
        <i class="fa fa-times"></i> رد شده
    </span>
                                    {elseif $item.is_accept eq '1'}
                                        {* کاربر تایید شده - فقط نمایش وضعیت *}
                                        <span class="badge badge-success badge-pill">
        <i class="fa fa-check"></i> تایید شده
    </span>
                                    {else}
                                        {* کاربر در انتظار - نمایش دکمه‌ها *}
                                        <a href="#" onclick="acceptUser({$item.id}); return false;" class="">
                                            <i class="fcbtn btn btn-outline btn-success btn-1e fa fa-check tooltip-success"
                                               data-toggle="tooltip" data-placement="top" title="تایید کاربر"
                                               data-original-title="تایید"></i>
                                        </a>
                                        <a href="#" onclick="rejectUser({$item.id}); return false;" class="">
                                            <i class="fcbtn btn btn-outline btn-danger btn-1e fa fa-times tooltip-danger"
                                               data-toggle="tooltip" data-placement="top" title="رد کاربر"
                                               data-original-title="رد"></i>
                                        </a>
                                    {/if}
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
