<div class="tab-pane {if $client['order_number'] eq '1'}active{/if}" id="Visa">
    <div class="col-md-12 col-12">
        <div class="empty-div"></div>
        <div class="row  ">
            <form data-action="https://s360online.iran-tech.com/" method="post" name="gdsVisa"
                  id="gdsVisa" target="_blank" class="d_contents">
                        {include file="./sections/visa/continent_visa.tpl"}
                        {include file="./sections/visa/country_visa.tpl"}
                        {include file="./sections/visa/type_visa.tpl"}
                        {include file="./sections/visa/passenger_count.tpl"}
                <div class="col-lg-2 col-md-3 col-sm-6 col-12 col_search search_btn_insuranc p-1">
                    <button type="button" onclick="searchVisa()" class="btn theme-btn seub-btn b-0 d-flex align-items-center justify-content-center">
                        <span>جستجو</span>
                        <i class="fa-light fa-magnifying-glass mr-1"></i>
                    </button>

                </div>
            </form>
        </div>
    </div>
</div>