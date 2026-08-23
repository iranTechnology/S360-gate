{load_presentation_object filename="errors" assign="objErrors"}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">

            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/errors/flight">خانه</a></li>
                <li class="active">لیست خطا های پرواز</li>
            </ol>
        </div>
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <!--<h4 class="page-title FloatLeft">Dashboard 3</h4>-->
        </div>

        <!-- /.col-lg-12 -->

        <div class="row" style="background: #f8f9fa; padding: 15px; border-radius: 5px; margin: 40px 0 0 15px">
            <div class="col-sm-12">
                <h5><i class="fa fa-plus-circle"></i> افزودن خطای جدید</h5>
            </div>
            <form id="addErrorForm" class="col-sm-12" onsubmit="return false;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                <textarea
                        id="newProviderError"
                        name="providerError"
                        class="form-control"
                        rows="2"
                        placeholder="متن خطا را وارد کنید..."
                        style="direction: ltr; font-family: monospace;"
                        required
                ></textarea>
                        </div>
                    </div>

                    <!-- اضافه کردن sourceCode -->
                    <div class="col-sm-2">
                        <input
                                type="text"
                                id="newSourceCode"
                                name="sourceCode"
                                class="form-control"
                                placeholder="سورس کد"
                                value=""
                        />
                    </div>
                    <div class="col-sm-2">
                        <select
                                id="methodData"
                                name="methodData"
                                class="form-control"
                        >
                            <option value="reserve">reserve</option>
                            <option value="book" selected>book</option>
                        </select>
                    </div>

                    <div class="col-sm-2">
                        <input
                                type="text"
                                id="newDisplayAdmin"
                                name="displayAdmin"
                                class="form-control"
                                placeholder="نمایش برای ادمین"
                                value=""
                        />
                    </div>
                    <div class="col-sm-2">
                        <input
                                type="text"
                                id="newDisplayAgency"
                                name="displayAgency"
                                class="form-control"
                                placeholder="نمایش برای آژانس"
                                value=""
                        />
                    </div>
                    <div class="col-sm-2">
                        <input
                                type="text"
                                id="newDisplayPassenger"
                                name="displayPassenger"
                                class="form-control"
                                placeholder="نمایش برای مسافر"
                                value=""
                        />
                    </div>
                    <div class="col-sm-2">
                        <button
                                type="button"
                                id="submitNewErrorBtn"
                                onclick="AddNewError()"
                                class="btn btn-success btn-block"
                        >
                            <i class="fa fa-check"></i> ثبت خطا
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">لیست خطا های پرواز </h3>
                <div class="row">

                    <div class="form-group col-sm-12 DynamicAdditionalData">

                        {assign var="listErrors" value=$objErrors->showAllErrors('flight')}

                        {assign var="counter" value='0'}
                        {foreach key=key item=item from=$listErrors}
                            <div class="col-sm-12 p-0 form-group">
                                <div class="col-md-3 pr-0">
                                <textarea
                                        id="providerError{$item.id}"
                                        style="background: #f8f9fa; padding: 0 5px; border-radius: 5px; direction: ltr;"
                                        placeholder="ارور"
                                        class="form-control"
                                        rows="1"
                                >{$item.providerError|htmlspecialchars}</textarea>

                                </div>
                                <div class="col-md-1">
                                    <p>{$item.creation_date_int}</p>
                                </div>
                                <div class="col-md-1">
                                    <p>{$item.sourceCode}</p>
                                </div>
                                <div class="col-md-2">
                                    <input id="displayAdmin{$item.id}" placeholder="نمایش برای ادمین" class="form-control"
                                           value="{$item.displayAdmin}" type="text">
                                </div>
                                <div class="col-md-2">
                                    <input id="displayAgency{$item.id}" placeholder="نمایش برای آژانس" class="form-control"
                                           value="{$item.displayAgency}" type="text">
                                </div>
                                <div class="col-md-2">
                                    <input id="displayPassenger{$item.id}" placeholder="نمایش برای مسافر" class="form-control"
                                           value="{$item.displayPassenger}" type="text">
                                </div>
                                <div class="col-md-1 pl-0">
                                    <div class="col-md-12 p-0">
                                        <button data-counter="{$item.id}" type="button" onclick='AddError($(this))' class="btn form-control btn-success">
                                            <span class="fa fa-check"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            {assign var="counter" value=$counter+1}
                        {/foreach}

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


{literal}
    <script type="text/javascript" src="assets/JsFiles/errors.js"></script>
{/literal}
