<script type="text/javascript" src="project_files/js/bootstrap.min.js"></script>
<script type="text/javascript" src="project_files/js/scripts.js"></script>
{if $smarty.const.GDS_SWITCH eq 'mainPage' || $smarty.const.GDS_SWITCH eq 'page'}
    <script type="text/javascript" src="project_files/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="project_files/js/select2.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery-confirm.min.js"></script>
{else}
    {if $smarty.const.GDS_SWITCH neq 'app'}
        <script type="text/javascript" src="project_files/js/modernizr.js"></script>
        {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
    {/if}
{/if}
{literal}
<script type="text/javascript">
  if ($(window).width() > 576) {
      {/literal}
      {if isset($specialInternalFlight['files']['main_file']['src'])}


      {literal}
    $('#internalFlight-tab').click(function() {
      $('.baner-slider').css('background-image', 'url("{/literal}{$specialInternalFlight['files']['main_file']['src']}{literal}")')
    })
      {/literal}
      {/if}
      {if isset($specialInternationalFlight['files']['main_file']['src'])}

      {literal}


    $('#internationalFlight-tab').click(function() {
      $('.baner-slider').css('background-image', 'url("{/literal}{$specialInternationalFlight['files']['main_file']['src']}{literal}")')
    })
      {/literal}
      {/if}
      {literal}
  }
</script>
{/literal}

<script type="text/javascript" src="assets/main-asset/js/public-main.js"></script>
{if $smarty.const.GDS_SWITCH eq 'mainPage' || $smarty.const.GDS_SWITCH eq 'page'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`content-main-page-footer.tpl" info_access_client_to_service=$info_access_client_to_service}
{/if}
</html>
