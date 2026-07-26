{load_presentation_object filename="contactUs" assign="objcontact"}

{assign var="contactList" value=$objcontact->GetData()}

{load_presentation_object filename="requestServiceStatus" assign="objRequestStatus"}


<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin" id="Home">خانه</a></li>
                <li  class="active" ><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/contactUs/main" id="Contactus">تماس با ما</a></li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0" id="PA_CO_LIST">لیست تماس ها</h3>

                <p class="text-muted m-b-30" id="PA_CO_LISTTITLE"> در لیست زیر شما میتوانید لیست همه تماس های خود را مشاهده نمائید</p>
                <div class="table-responsive">
                    <table id="myTable" class="table table-striped ">
                        <thead>
                        <tr>
                            <th id="Code">کد</th>
                            <th id="Namefamily">نام و نام خانوادگی</th>
                            <th id="Language">زبان</th>
                            <th id="Mobile">موبایل</th>
                            <th id="TrackingCodeEnd">کد پیگیری</th>
                            <th id="Status">وضعیت</th>
                            {*                                <th id="Agency">آژانس</th>*}
                            <th id="Date">تاریخ</th>
                            <th id="Show">مشاهده</th>
                        </tr>
                        </thead>
                        <tbody>
                        {assign var="mapStatus" value=[
                        'not_seen' => 'PA_CO_STATUSNOTSEEN',
                        'seen'     => 'PA_CO_STATUSSEEN',
                        'accept'   => 'PA_CO_STATUSACCEPT',
                        'reject'   => 'PA_CO_STATUSREJECT'
                        ]}
                        {assign var="number" value="0"}
                        {if $contactList != ''}
                            {foreach key=key item=item from=$contactList}
                                {$number=$number+1}
                                <tr id="del-{$item.id}">
                                    <td class="align-middle"><span class="badge badge-info">{$number}</span></td>
                                    <td class="align-middle">{$item.name}</td>
                                    <td class="align-middle">{if $item['lang']}{$languages[$item['lang']]}{else}---{/if}</td>
                                    <td class="align-middle">{$item.mobile}</td>
                                    <td class="align-middle">{$item.tracking_code}</td>
                                    <td class="align-middle">
                                        {foreach $objRequestStatus->getRequestServiceStatusList() as $status}
                                            {if $item.status == $status.value}

                                                {assign var="xmlTagId" value=$mapStatus[$status.value]}

                                                <a class="{$status.btn}" style="color:#fff;">
                                                    <span class="{$xmlTagId}"></span>
                                                </a>

                                            {/if}
                                        {/foreach}
                                    </td>
                                    {*                                    <td class="align-middle">*}
                                    {*                                        {if $item.agency_id == 0}*}
                                    {*                                            آژانس اصلی*}
                                    {*                                        {else}*}
                                    {*                                            {$item.name_fa}*}
                                    {*                                        {/if}*}
                                    {*                                    </td>*}
                                    <td class="align-middle">{$objFunctions->ConvertToJalaliOfDateGregorian($item.created_at)}</td>

                                    <td class="align-middle">
                                        <div class="btn-group m-r-10">
                                            {*
                                            <a onclick="ModalShowContact('{$item.id}');return false"
                                               data-toggle="modal"
                                               data-target="#ModalPublic">
                                                <i id="seenContact-{$item.id}" class="fcbtn btn {if $item.seen_at != null } btn-outline {/if} btn-info btn-1c tooltip-info fa fa-eye"
                                                   data-toggle="tooltip"
                                                   data-placement="top" title=""
                                                   data-original-title="مشاهده جزییات"></i>
                                            </a>
                                            *}
                                            <a href="edit&id={$item.cId} " class="btn btn-sm btn-outline gap-4 btn-primary PA_CO_REQUESTDETAIL">جزییات درخواست</a>

                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                        {/if}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
    var PAGE_NAME = "ListContact";
    var LANG_XML_URL = "{$smarty.const.SERVER_HTTP}{$smarty.const.CLIENT_DOMAIN}/gds/langs/{$smarty.const.LANG_PANEL_ADMIN}_frontMaster.xml";
</script>
<script type="text/javascript" src="assets/JsFiles/contactUs.js"></script>