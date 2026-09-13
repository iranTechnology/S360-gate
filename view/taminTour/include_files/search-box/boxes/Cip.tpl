{assign var="obj_main_page" value=$obj_main_page }
<div class="tab-pane search-background shadow-box" id="{$client['MainService']}">
    <div id="cip" class="d_flex flex-wrap  searchbox-style-cip">
        <form method="post" class="d_contents" target="_blank" id="cip_form" name="cip_form">
            {include file="./sections/Cip/origin_selection.tpl"}
            {include file="./sections/Cip/trip_type.tpl"}
            {include file="./sections/Cip/date_cip.tpl"}
            {include file="./sections/Cip/passenger_count.tpl"}
            <div class="col-md-2 col-sm-6 col-12 btn_s col_search margin-center" style="margin-left: 0;">
{*                <button type="button"*}
                <button type="button" onclick="searchCip()"
                        class="btn theme-btn seub-btn b-0 button05"><span>##Search##</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M368 208A160 160 0 1 0 48 208a160 160 0 1 0 320 0zM337.1 371.1C301.7 399.2 256.8 416 208 416C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208c0 48.8-16.8 93.7-44.9 129.1L505 471c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L337.1 371.1z"/></svg>
                </button>
            </div>
        </form>
    </div>

</div>
