<div class="tab-pane  {if  $smarty.const.GDS_SWITCH eq 'page'} active {/if}"  id="{$client['MainService']}" role="tabpanel"
     aria-labelledby="{$client['MainService']}-tab" >
    <div class="col-md-12 col-12">
        <div class="row">
            <div class="empty-box"></div>
            <form data-action="https://s360online.iran-tech.com/" class="d_contents" method="post"
                  name="submit_tafrih_form" id="submit_tafrih_form">
                        {include file="./sections/entertainment/country_destination.tpl"}
                        {include file="./sections/entertainment/city_destination.tpl"}
                        {include file="./sections/entertainment/category_entertainment.tpl"}
                        {include file="./sections/entertainment/sub_category_entertainment.tpl"}


                <div class="col-lg-3 col-md-6 col-sm-6 col-12 btn_s col_search margin-center">
                    <button type="button" onclick="searchEntertainment()" class="btn theme-btn seub-btn b-0">
                        <span class="span-search">{$obj_main_page->nameButtonSearchBox($client['MainService'])}</span>
                        <span class="icon-search">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                                </span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>