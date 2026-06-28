<div class="__box__ tab-pane {if  $smarty.const.GDS_SWITCH eq 'page'} active {/if} shadow-box search-background" id="Visa">
    <div class="parent-head-search-box">

            <div class="head-search-box-detail">
                <div class="w-100 mr-2">
                    <div class="d-flex gap-2 align-items-center" style="gap:5px">
                        <i class="fa-light fa-passport head-search-box-icon"></i>
                        <span class="head-search-box-title">ویزا</span>
                    </div>
                    <p class="mt-2 mb-0">پذیرش ویزا در ایران و سراسر جهان</p>
                </div>
                <div class="head-search-box-parent-img">
                    <img class="head-search-box-img" src="project_files/images/visa.png" alt="">
                </div>
            </div>

    <div class="d-flex flex-wrap gap-search-box mt-2 mt-lg-0">
        <div class="d-flex flex-wrap searchbox-style-visa">
            <form data-action="https://s360online.iran-tech.com/" method="post" name="gdsVisa"
                  id="gdsVisa" target="_blank" class="d_contents">
                <input type="hidden" name="distination_code" id="distination_code"
                       value="" />
                <input type="hidden" name="visaID" id="visaID" value="" />
                <input type="hidden" name="visa_type" id="visa_type" value="" />

                {include file="./sections/visa/active_visa.tpl"}
                <div class="col-lg-1 col-md-4 col-sm-6 col-12 btn_s col_search mx-auto p-1">
                    <button type="button" onclick="searchActiveVisa()" class="btn theme-btn seub-btn b-0  btn-visa-style">
                        <span>##Search##</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
    </div>
</div>