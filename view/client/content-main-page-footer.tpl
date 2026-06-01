{foreach $info_access_client_to_service as $service}
    {if file_exists("`$smarty.const.FRONT_CURRENT_CLIENT`assets/main-asset/js/{$service['MainService']|trim}.js")}
       <script  type="text/javascript" src="assets/main-asset/js/{$service['MainService']|trim}.js"></script>
    {/if}
{/foreach}

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

        // جایگزین کد جاوااسکریپت فعلی
        jQuery(function(){
            jQuery('#camera_wrap_1').camera({
                thumbnails: false,  // غیرفعال کنید تا تداخل نداشته باشد
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
    });

</script>