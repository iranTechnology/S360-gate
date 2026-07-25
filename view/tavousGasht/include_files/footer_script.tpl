
<script src="assets/all-js/bootstrap.min.js"></script>

<script src="project_files/js/header.js"></script>
{if $smarty.const.GDS_SWITCH eq 'mainPage' || $smarty.const.GDS_SWITCH eq 'page'}
<script src="project_files/js/jquery.easy_slides.js"></script>
    <script src="project_files/js/easy_sl`ides.js"></script>
    <script src="project_files/https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
    <script src="project_files/https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.1/js/foundation.min.js"></script>
    <script src="project_files/https://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js"></script>
    <script src="project_files/https://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/plugins/ScrollToPlugin.min.js"></script>
    <script src="project_files/https://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/plugins/EaselPlugin.min.js"></script>
    <script src="project_files/js/animate-scroll.js"></script><script src="project_files/js/bubbles.js"></script>
    <script src="assets/all-js/owl.carousel.min.js"></script>
    <script src="project_files/js/searchBox.js"></script>
    <script src="assets/js/jquery-confirm.min.js" type="text/javascript"></script>
    <script src="assets/main-asset/js/public-main.js" type="text/javascript"></script>
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`content-main-page-footer.tpl" info_access_client_to_service=$info_access_client_to_service}
    {else}
        {if $smarty.const.GDS_SWITCH neq 'app'}
            {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
        {/if}
    {/if}
<div class="after__all"></div>
<script src="project_files/js/mega-menu.js"></script>
<script src="assets/all-js/select2.min.js"></script>
<script src="project_files/js/script.js" type="text/javascript"></script>


