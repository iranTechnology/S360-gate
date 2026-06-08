{load_presentation_object filename="galleryBanner" assign="objGalleryBanner"}

{assign var="list_galleryBanner" value=$objGalleryBanner->listGalleryBanner()}
{load_presentation_object filename="specialPages" assign="objSpecialPages"}
{assign var="checked_banner" value=$list_galleryBanner[0]['is_show_banner']}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li  class="active" ><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/galleryBanner/list">لیست گالری بنر</a></li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <div class="plans w-100">
                    <div class="d-flex gap-10 w-100">
                        <label class="plan basic-plan w-100 m-0" for="main_page">
                            <input  type="radio" {if $checked_banner === 1} checked {/if} onchange='toggleableBanner($(this) , 1);'
                                   value='main_page'
                                   name="page_type"
                                   id="main_page" />
                            <div class="plan-content w-100">
                                <i class="fa fa-images" style="font-size: 55px;color: #0855ce;margin: 0 10px 0 20px;"></i>
                                <div class="plan-details">
                                      <span>اسلایدر</span>
                                    <p> نمایش بنر به صورت اسلایدر</p>
                                </div>
                            </div>
                        </label>

                        <label class="plan complete-plan w-100 m-0" for="main_services">
                            <input type="radio" {if $checked_banner === 0} checked {/if} onchange='toggleableBanner($(this) , 0)'
                                   id="main_services"
                                   value='main_services'
                                   name="page_type" />
                            <div class="plan-content w-100">
                                <i class="fa fa-grip" style="font-size: 55px;color: #0855ce;margin: 0 10px 0 20px;"></i>
                                <div class="plan-details">
                                                                            <span>سرچ باکس</span>
                                    <p>
                                        نمایش بنر به صورت خدمات سرچ باکس
                                    </p>
                                </div>
                            </div>
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/galleryBanner/add"
                               class="btn btn-info waves-effect waves-light mb-5 main_page-toggleable" style="width: fit-content;" type="button">
                                <span class="btn-label"><i class="fa fa-plus"></i></span>
                                بنر جدید
                            </a>
                            <div class="w-100 main_page-toggleable flex-wrap">
                                <div class="table-responsive w-100">
                                    <table id="myTable" class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>ردیف</th>
                                              <th>عنوان</th>
                                                                        <th>زبان</th>
                                            <th>تصویر</th>
                                                                        <th>ترتیب</th>
                                                                      <th>وضعیت</th>
                                                                        <th>عملیات</th>
                                        </tr>
                                        </thead>
                                        {assign var="number" value="0"}
                                        {if $list_galleryBanner != ''}
                                        {foreach key=key item=item from=$list_galleryBanner}
                                        {$number=$number+1}
                                        <tr id="del-{$item.id}">
                                            <td class="align-middle"><span class="badge badge-info">{$number}</span></td>
                                            <td class="align-middle">{$item.title}</td>
                                            <td class="align-middle">{$languages[$item.language]}</td>

                                            {if $item.iframe_code==''}
                                                {if $item.type=='pic'}
                                                    <td class="align-middle"><img src='{$item.pic}' width='50' height='50'> </td>
                                                {else}
                                                    <td class="align-middle"><a href='{$item.pic}' target='_blank'><img src='assets/css/images/video.png' width='50' height='50'> </a></td>
                                                {/if}
                                            {else}
                                                <td class="align-middle">
                                                    ویدئو iframe
                                                </td>
                                            {/if}
                                            <td class="align-middle"  ><input type="number"  size="10" name="order[{$item.id}]" id="order" value="{$item.orders}" class="list-order"></td>

                                            <td class="align-middle">
                                                <a href="#"
                                                   onclick="updateStatusGalleryBanner('{$item.id}'); return false">
                                                    {if $item.is_active}
                                                        <input type="checkbox" class="js-switch" data-color="#99d683"
                                                               data-secondary-color="#f96262" data-size="small" checked/>
                                                    {else}
                                                        <input type="checkbox" class="js-switch" data-color="#99d683"
                                                               data-secondary-color="#f96262" data-size="small"/>
                                                    {/if}
                                                </a>
                                            </td>
                                            <td class="align-middle">
                                                <a href="edit&id={$item.id} " class=""><i
                                                            class="fcbtn btn btn-outline btn-primary btn-1c fa fa-edit tooltip-primary"
                                                            data-toggle="tooltip" data-placement="top" title=""
                                                            data-original-title="ویرایش بنر"></i></a>

                                                <button class="btn btn-sm btn-outline btn-danger deleteGalleryBanner"
                                                        data-id="{$item.id}">
                                                    <i class="fa fa-trash"></i> حذف
                                                </button>
                                </div>
                                </td>
                                </tr>
                                {/foreach}
                                {/if}
                                    </table>
                                <input   class="btn btn-info" type="button" onclick='change_order()' value="تغییر ترتیب"  title="حذف همه" style='margin: 20px 0 0 0;' />
                                </div>
                            </div>
                            <div class="w-100 main_services-toggleable  d-none flex-wrap">
                                <div class="table-responsive w-100">
                                    <table id="myTable" class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>ردیف</th>
                                            <th>نوع</th>
                                            <th>عنوان</th>
                                            <th>لینک صفحه در سایت</th>
                                            <th>زبان</th>
                                            <th>سرچ باکس</th>
                                            <th>عملیات</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        {assign var="rowNum" value=0}
                                        {assign var="main_special_pages" value=$objSpecialPages->getSpecialPagesWherePosition()}
                                        {foreach $main_special_pages as $page}
                                            {*<pre>{$faq|json_encode}</pre>*}
                                            {$rowNum=$rowNum+1}
                                            <tr>
                                                <td>{$rowNum}</td>
                                                <td>
                                                    {if $page.page_type eq 'separate'}
                                                        <img loading="lazy"
                                                             style='width: 25px;'
                                                             src="assets/images/git.png"
                                                             alt="" />
                                                        مجزا
                                                    {else}
                                                        <img loading="lazy"
                                                             style='width: 25px;'
                                                             src="assets/images/link.png"
                                                             alt="" />
                                                        وابسته
                                                    {/if}
                                                </td>
                                                <td>{$page.title}  /{$page.slug}</td>
                                                <td><a target='_blank' href='http://{$smarty.const.CLIENT_DOMAIN}/gds/{$page.language}/page/{$page.slug}'>
                                                        http://{$smarty.const.CLIENT_DOMAIN}/gds/{$page.language}/page/{$page.slug}
                                                    </a></td>
                                                <td>{$languages[$page.language]}</td>
                                                <td>
                                                    {if $page.page_type eq 'separate'}
                                                        {if $page.position neq NULL}
                                                            <span class='fa fa-check-square bg-success rounded-max p-3'></span>
                                                            {$objFunctions->Xmlinformation($page.position)}
                                                        {else}
                                                            <span class='fa fa-sticky-note bg-warning rounded-max p-3'></span>
                                                            بدون سرچ باکس
                                                        {/if}
                                                    {else}
                                                        {if $page.position eq 'MainPage'}
                                                            <span class='fa fa-home bg-primary rounded-max p-3'></span>
                                                            صفحه اصلی
                                                        {elseif $page.position eq NULL}
                                                            <span class='fa fa-sticky-note bg-warning rounded-max p-3'></span>
                                                            بدون سرچ باکس
                                                        {else}
                                                            <span class='fa fa-check-square bg-success rounded-max p-3'></span>
                                                            {$objFunctions->Xmlinformation($page.position)}
                                                        {/if}

                                                    {/if}
                                                </td>


                                                <td>
                                                    <a class="btn btn-sm btn-outline gap-4 btn-primary"
                                                       href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/special_page/edit?id={$page.id}&banner=1"><i
                                                                class="fa fa-edit" data-target="_blank" ></i>ویرایش </a>


                                                    <button class="btn btn-sm btn-outline btn-danger deleteSpecialPage"
                                                            data-id="{$page.id}">
                                                        <i class="fa fa-trash"></i> حذف
                                                    </button>
                                                </td>


                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                    <input   class="btn btn-info" type="button" onclick='change_order()' value="تغییر ترتیب"  title="حذف همه" style='margin: 20px 0 0 0;' />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


{*                <h3 class="box-title m-b-0">لیست گالری بنر</h3>*}

{*                <p class="text-muted m-b-30"> در لیست زیر شما میتوانید لیست همه بنرهای وب سایت خود را مشاهده نمائید</p>*}
{*                <div class="table-responsive table-bordered">*}

{*                    <table id="myTable" class="table table-striped table-hover">*}

{*                        <thead class="thead-default">*}
{*                        <tr>*}
{*                            <th>ردیف</th>*}
{*                            <th>عنوان</th>*}
{*                            <th>زبان</th>*}
{*                            <th>تصویر</th>*}
{*                            <th>ترتیب</th>*}
{*                            <th>وضعیت</th>*}
{*                            <th>عملیات</th>*}
{*                        </tr>*}
{*                        </thead>*}
{*                        <tbody>*}
{*                        {assign var="number" value="0"}*}
{*                        {if $list_galleryBanner != ''}*}
{*                            {foreach key=key item=item from=$list_galleryBanner}*}
{*                                {$number=$number+1}*}
{*                                <tr id="del-{$item.id}">*}
{*                                    <td class="align-middle"><span class="badge badge-info">{$number}</span></td>*}
{*                                    <td class="align-middle">{$item.title}</td>*}
{*                                    <td class="align-middle">{$languages[$item.language]}</td>*}

{*                                    {if $item.iframe_code==''}*}
{*                                    {if $item.type=='pic'}*}
{*                                    <td class="align-middle"><img src='{$item.pic}' width='50' height='50'> </td>*}
{*                                    {else}*}
{*                                    <td class="align-middle"><a href='{$item.pic}' target='_blank'><img src='assets/css/images/video.png' width='50' height='50'> </a></td>*}
{*                                    {/if}*}
{*                                    {else}*}
{*                                        <td class="align-middle">*}
{*                                             ویدئو iframe*}
{*                                        </td>*}
{*                                    {/if}*}
{*                                    <td class="align-middle"  ><input type="number"  size="10" name="order[{$item.id}]" id="order" value="{$item.orders}" class="list-order"></td>*}

{*                                    <td class="align-middle">*}
{*                                        <a href="#"*}
{*                                           onclick="updateStatusGalleryBanner('{$item.id}'); return false">*}
{*                                            {if $item.is_active}*}
{*                                                <input type="checkbox" class="js-switch" data-color="#99d683"*}
{*                                                       data-secondary-color="#f96262" data-size="small" checked/>*}
{*                                            {else}*}
{*                                                <input type="checkbox" class="js-switch" data-color="#99d683"*}
{*                                                       data-secondary-color="#f96262" data-size="small"/>*}
{*                                            {/if}*}
{*                                        </a>*}
{*                                    </td>*}
{*                                    <td class="align-middle">*}
{*                                        <a href="edit&id={$item.id} " class=""><i*}
{*                                                    class="fcbtn btn btn-outline btn-primary btn-1c fa fa-edit tooltip-primary"*}
{*                                                    data-toggle="tooltip" data-placement="top" title=""*}
{*                                                    data-original-title="ویرایش بنر"></i></a>*}

{*                                        <button class="btn btn-sm btn-outline btn-danger deleteGalleryBanner"*}
{*                                                data-id="{$item.id}">*}
{*                                            <i class="fa fa-trash"></i> حذف*}
{*                                        </button>*}
{*                                        </div>*}
{*                                    </td>*}
{*                                </tr>*}
{*                            {/foreach}*}
{*                        {/if}*}
{*                        </tbody>*}
{*                    </table>*}
{*                <input   class="btn btn-info" type="button" onclick='change_order()' value="تغییر ترتیب"  title="حذف همه" style='margin: 20px 0 0 0;' />*}

{*            </div>*}
            </div>
        </div>

    </div>
</div>

<script type="text/javascript" src="assets/JsFiles/galleryBanner.js"></script>

