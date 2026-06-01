{load_presentation_object filename="admin" assign="objAdmin"}
<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li class="active">
                    منوهای زبان های عربی و خارجی
                </li>
            </ol>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <form id="AccessMenuForm" method="post">
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <div class="card border p-3">
                                {assign var="menus" value=$objAdmin->ListAllMenuForManagers()}
                                {assign var=menuIndex value=0}
                                {foreach from=$menus item=menu}
                                    {assign var=menuIndex value=$menuIndex+1}
                                    {assign var=bgColor value=($menuIndex % 2 == 0) ? '#f2f2f2' : '#fafafa'} <!-- خاکستری روشن و پررنگ -->

                                    <!-- سطح 1 -->
                                    <div class="card mb-4 p-3 shadow-sm border-primary" style="background-color: {$bgColor};">
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <h5 class="fw-bold fs-5" style="font-size: 16px;">{$menu.title}</h5>
                                            <input type="checkbox" class="parent-checkbox js-switch" data-id="{$menu.id}" {if $menu.other_lang == 'Yes'}checked{/if}>
                                        </div>
                                        <hr style="margin-top:0.25rem; margin-bottom:2rem;">

                                        {if $menu.children|@count > 0}
                                            <div class="level-2 ms-3 mt-2">  {* لایه دوم *}
                                                {foreach from=$menu.children item=child}
                                                    {if $child.children|@count > 0}
                                                        <div class="mb-3 p-2 border rounded level-2-box">
                                                            <div class="form-check d-inline-block me-3 mb-2">
                                                                <input type="checkbox" class="child-checkbox js-switch" data-id="{$child.id}" name="menus[{$child.id}]" value="1" id="child{$child.id}" {if $child.other_lang == 'Yes'}checked{/if}>
                                                                <label for="child{$child.id}" class="fw-semibold fs-6" style="font-size: 15px;">{$child.title}</label>
                                                            </div>

                                                            <!-- سطح 3 -->
                                                            <div class="level-3 ms-4 d-flex flex-wrap mt-2">
                                                                {foreach from=$child.children item=subChild name=subLoop}
                                                                <div class="form-check me-4 mb-3 level-3-box" style="min-width: 195px !important;">
                                                                    <input type="checkbox" class="subchild-checkbox js-switch" data-id="{$subChild.id}" name="menus[{$subChild.id}]" value="1" id="subchild{$subChild.id}" {if $subChild.other_lang == 'Yes'}checked{/if}>
                                                                    <label for="subchild{$subChild.id}" class="fs-7" >{$subChild.title}</label>
                                                                </div>
                                                                {if $smarty.foreach.subLoop.index+1 % 5 == 0}</div><div class="level-3 ms-4 d-flex flex-wrap mt-2">{/if}
                                                                {/foreach}
                                                            </div>
                                                        </div>
                                                    {else}
                                                        <!-- بلوک child بدون زیرمجموعه -->
                                                        <div class="form-check d-inline-block me-3 mb-3 level-2-box">
                                                            <input type="checkbox" class="child-checkbox js-switch" data-id="{$child.id}" name="menus[{$child.id}]" value="1" id="child{$child.id}" {if $child.other_lang == 'Yes'}checked{/if}>
                                                            <label for="child{$child.id}" class="fw-semibold fs-6" style="min-width: 195px !important;font-size: 14px;">{$child.title}</label>
                                                        </div>
                                                    {/if}
                                                {/foreach}
                                            </div>
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="assets/JsFiles/menuAdmin_0therLang.js"></script>
<style>
    .level-2 {
        margin-right: 20px;  /* کمی تو بره */
        border-right: 2px dashed #ccc; /* خط راهنما برای درختی بودن */
        padding-right: 10px;
    }
    .level-3 {
        margin-right: 40px;  /* بیشتر تو بره */
        border-right: 1px dotted #bbb;
        padding-right: 10px;
    }
</style>