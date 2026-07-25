{assign var="countries" value=$obj_main_page->countryInsurance()}
<div class="tab-pane {if $client['order_number'] eq '1' || $active_tab eq $client['MainService']}active{/if}" id="Insurance">
    <div class="col-md-12 col-12">
        <div class="  ">
            <form method="post" target="_blank" name="gdsInsurance" id="gdsInsurance" class="d_contents">
                {include file="./sections/insurance/destination_selection.tpl"}
                {include file="./sections/insurance/date.tpl"}
                {include file="./sections/insurance/passenger_count.tpl"}


                <div class="col-md-12 col-xs-12 float-right p-0">
                    <div class="search_btn_div">
                        <button type="button" onclick="searchInsurance()" class="button  search_button">جستجوی بیمه
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>