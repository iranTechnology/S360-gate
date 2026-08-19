{load_presentation_object filename="contactUs" assign="objContactUs"}
{assign var="contactUs" value=$objContactUs->getContactUs($smarty.get.id)}
{load_presentation_object filename="requestServiceStatus" assign="objRequestStatus"}


<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">

                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin" id="Home">خانه</a></li>
                <li>
                    <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/contactUs/main" id="PA_CO_PAGEEDIT">
                        لیست درخواست تماس با ما
                    </a>
                </li>
                <li class='active'>
                    <span id="PA_CO_REQUESTDETAIL"> جزییات درخواست تماس با ما </span>
                    <span class='font-bold underdash'>{$contactUs['name']}</span>
                </li>
            </ol>
        </div>
    </div>

    <div class="row employment">


        <div class="container">
            <h2><span id="PA_CO_REQUESTDETAIL_H2">جزییات درخواست </span> {$contactUs['name']}</h2>
            <p id="PA_CO_TITLEDETAIL">همه اطلاعات ارسالی را در این قسمت مشاهده نمائید</p>
            <table class="table table-bordered request-table">
                <thead>
                <tr>
                    <th id="TitleTd">عنوان</th>
                    <th id="BodyTD">متن </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td id="NamefamilyTd">نام و نام خانوادگی</td>
                    <td>{if $contactUs['name']}{$contactUs['name']}{else}---{/if}</td>
                </tr>
                <tr>
                    <td id="LanguageTd">زبان</td>
                    <td >{if $contactUs['lang']}{$languages[$contactUs['lang']]}{else}---{/if}</td>

                </tr>

                <tr>
                    <td id="MobileTd">موبایل</td>
                    <td>{$contactUs['mobile']}</td>
                </tr>
                <tr>
                    <td id="EmailTd">ایمیل</td>
                    <td>{$contactUs['email']}</td>
                </tr

                <tr>
                    <td id="PA_CO_REQUESTTEXT">متن درخواست</td>
                    <td>{$contactUs['comment']}</td>
                </tr>



                </tbody>
            </table>


        </div>


        <form data-toggle="validator" method="post" id="editContactUs" enctype='multipart/form-data'>
            <input type="hidden" name="className" value="contactUs">
            <input type="hidden" name="method" value="updateContactUs">
            <input type="hidden" name="contact_id" value="{$contactUs.id}">


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="d-flex flex-wrap gap-10">
                    <div class="bg-white d-flex flex-wrap rounded w-100 ">
                        <div class='d-flex justify-content-between align-content-center flex-wrap w-100'>
                            <h4 class='d-flex flex-wrap font-bold m-0 py-3 px-4' id="PA_CO_ADMINRESULT">نتیجه بررسی ادمین</h4>
                        </div>

                        <hr class='m-0 mb-4 w-100'>

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label class="control-label" for="created_at" id="PA_CO_REQUESTDATE">تاریخ ثبت این درخواست</label>
                                <input type="text" class="form-control" name="created_at" id="created_at"
                                       disabled value="{$contactUs.created_at}">
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label class="control-label" for="status_id" id="RequestStatus">وضعیت درخواست</label>
                                <select  value="{$contactUs.status}" name="status_id" id="status_id" class="form-control select2">
                                    <option value="">انتخاب کنید</option>
                                    {foreach $objRequestStatus->getRequestServiceStatusList() as $status}
                                        <option value="{$status['id']}"  {if $contactUs['status']==$status['value']} selected{/if} {if $status['value']=='seen' || $status['value']=='not_seen'} disabled="disabled"{/if}>{$status['title']}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label class="control-label" for="admin_response" id="PA_CO_ADMINNOTE">یادداشت ادمین </label>
                                <textarea name="admin_response" class="form-control" id="admin_response"
                                          placeholder="یادداشت ادمین">{$contactUs['admin_response']}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class=' col-12 d-flex  align-items-center justify-content-center w-100 parentbtn-btn-fixed'>
                <button class="btn btn-success btn-block btn-fixed" type="submit" id="submit-button">ذخیره</button>
            </div>
        </form>


    </div>
</div>
<script>
    var PAGE_NAME = "EditContact";
    var LANG_XML_URL = "{$smarty.const.SERVER_HTTP}{$smarty.const.CLIENT_DOMAIN}/gds/langs/{$smarty.const.LANG_PANEL_ADMIN}_frontMaster.xml";
</script>
<script type="text/javascript" src="assets/JsFiles/contactUs.js">
