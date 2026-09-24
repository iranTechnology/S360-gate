{foreach $info_access_client_to_service as $service}
    {if file_exists("`$smarty.const.FRONT_CURRENT_CLIENT`assets/main-asset/js/{$service['MainService']|trim}.js")}
       <script  type="text/javascript" src="assets/main-asset/js/{$service['MainService']|trim}.js"></script>
    {/if}
{/foreach}


{load_presentation_object filename="reservationSetting" assign="ObjSetting"}
{assign var="IsLoginBeforeSearch" value=$ObjSetting->getReservationSettingByTitleService('IsLoginBeforeSearch' , "public")}


{if $IsLoginBeforeSearch[0]['enable'] == 1}
    <!-- login and register popup -->

    {assign var="useType" value="searchResume"}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentLoginRegister.tpl"}
    <script type="text/javascript" src="assets/js/custom.js"></script>
    <script src='assets/js/sweetalert2.all.min.js' type='application/javascript'></script>
    <!-- login and register popup -->
{/if}
<script>
    window.IS_LOGIN_BEFORE_SEARCH = {if $IsLoginBeforeSearch[0]['enable'] == 1}true{else}false{/if};
</script>
<script type="text/javascript" src="assets/js/popup.js"></script>
<script src="assets/plugins/camera/camera.min.js"></script>
<script>
    $(document).ready(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 200) {
                $('.header_area').addClass('scrolled');
            } else {
                $('.header_area').removeClass('scrolled');
            }
        });

        if ($('#camera_wrap_1').length) {
            jQuery(function(){
            jQuery('#camera_wrap_1').camera({
                thumbnails: false,
                barPosition: 'top',
                hover: true,
                loader: "bar",
                loaderColor: '#fff',
                loaderBgColor: '#222222',
                playPause: false,
                pauseOnClick: false,
                width: '100%',
                navigation: true,
                pagination: true,
                autoAdvance: true,
                mobileAutoAdvance: true,
            });
            });
        }
    });

</script>