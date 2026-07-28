{assign var="obj_main_page" value=$obj_main_page }

<div class="tab-pane {if $client['order_number'] eq '1' || ($smarty.const.GDS_SWITCH eq 'page' && $active_tab eq $client['MainService'])}active{/if}"
     id="{$client['MainService']}"
     role="tabpanel" aria-labelledby="{$client['MainService']}-tab">
    {include file="./sections/train/btn-type-way.tpl"}
    <div class="row m-auto">
        <form class="d_contents"
              data-action="https://www.about.versagasht.com/trainResult/"
              method="post" name="gds_train" id="gds_train">
            {include file="./sections/train/origin_selection.tpl"}
            {include file="./sections/train/destination_selection.tpl"}
            {include file="./sections/train/date_train.tpl"}
            {include file="./sections/train/passenger_count.tpl"}
            <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search">
                <button type="button" onclick="searchVersaTrain(true)" class="btn theme-btn seub-btn b-0 btn_s">
                    <span>جستجو</span>
                </button>
            </div>
        </form>
    </div>
</div>
