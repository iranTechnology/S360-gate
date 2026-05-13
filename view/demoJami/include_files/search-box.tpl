
{assign var="services_array_json" value= '{"Train": "Train","Flight": "Flight", "Hotel": "Hotel", "Bus": "Bus", "Insurance": "Insurance", "Tour": "Tour", "Visa": "Visa"}'}
{assign var="services_array" value=$services_array_json|json_decode}
<section class="i_modular_banner_gallery banner-kanoun">
    {if $smarty.const.GDS_SWITCH eq 'mainPage'}
{/if}
    <div class="container">
        <div class="i_modular_searchBox search_box_div">

                <ul class="__search_box_tabs__ nav" id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>
                <div class="__search_boxes__ tab-content" id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>
         </div>
    </div>
</section>

{include file="include_files/banner-slider.tpl"}
