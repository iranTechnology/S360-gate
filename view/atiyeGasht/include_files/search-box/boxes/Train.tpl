{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane  active  {if  $smarty.const.GDS_SWITCH eq 'page'} active {/if}" id="Train">
    <h5 class="title_searchBox">رزرو بلیط قطار</h5>

{include file="./sections/train/btn-type-way.tpl"}
    <div class="row m-auto w-100">
        <div class='d_contents'>
            {include file="./sections/train/origin_selection.tpl"}
            {include file="./sections/train/destination_selection.tpl"}
            {include file="./sections/train/date_train.tpl"}
            {include file="./sections/train/passenger_count.tpl"}
            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search margin-center">
                <button type="button" onclick="searchTrain(false)" class="btn theme-btn seub-btn b-0">
                    <span>جستجو</span>
                </button>
            </div>
        </div>
    </div>
</div>