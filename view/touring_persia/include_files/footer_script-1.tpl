<link crossorigin="" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" rel="stylesheet">
<script src="project_files/js/bootstrap.min.js"></script>
{if $smarty.const.GDS_SWITCH eq 'mainPage' || $smarty.const.GDS_SWITCH eq 'page'}
    <script src="project_files/js/owl.carousel.min.js"></script>
    <script src="project_files/js/select2.min.js"></script>
    <script src="project_files/js/searchBox.js"></script>
    <script src="project_files/https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
    <script src="assets/js/jquery-confirm.min.js" type="text/javascript"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`content-main-page-footer.tpl" info_access_client_to_service=$info_access_client_to_service}
{else}
    {if $smarty.const.GDS_SWITCH neq 'app'}
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
    {/if}
{/if}
<div class="after__all"></div>
<script src="project_files/js/header.js"></script>
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
        integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
        crossorigin=""></script>
<script src="project_files/js/script.js" type="text/javascript"></script>
<script src="assets/main-asset/js/public-main.js" type="text/javascript"></script>