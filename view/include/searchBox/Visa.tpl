<div class="__box__ tab-pane {if  $smarty.const.GDS_SWITCH eq 'page'} active {/if} shadow-box search-background" id="Visa">
    <div class="d-flex flex-wrap gap-search-box">
        <div class="d-flex flex-wrap searchbox-style-visa w-100">
            <form data-action="https://s360online.iran-tech.com/" method="post" name="gdsVisa"
                  id="gdsVisa" target="_blank" class="d_contents">
                <input type="hidden" name="distination_code" id="distination_code"
                       value="" />
                <input type="hidden" name="visaID" id="visaID" value="" />
                <input type="hidden" name="visa_type" id="visa_type" value="" />

                {include file="./sections/visa/active_visa.tpl"}
                <div class="col-lg-2 col-md-4 col-sm-4 col-12 btn_s col_search mr-auto  p-1">
                    <button type="button" onclick="searchActiveVisa()" class="btn theme-btn seub-btn b-0 btn-visa-style">
                        <span>##Search##</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>