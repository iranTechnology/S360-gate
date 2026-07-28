{load_presentation_object filename="specialPages" assign="objSpecialPages"}

{assign var="searchServices" value=[
'flight-saadi'=>'specialFlightPic',
'hotel-saadi'=> 'specialHotelPic',
'train-saadi' => 'specialTrainPic',
'bus-saadi' =>'specialBusPic',
'tour-saadi' =>'specialTourPic',
'insurance-saadi' =>'specialInsurancePic',
'visa-saadi' =>'specialVisaPic',
'gasht-saadi' =>'specialGashtPic',
'package-saadi' =>'specialPackagePic',
'rentCar-saadi' =>'specialCarPic',
'entertainment-saadi' =>'specialEntertainmentPic',
'cip-saadi' =>'specialCipPic',
'mainPage' =>'MainPagePic']}
{foreach $searchServices as $key => $val}
    {assign var="homePage" value=$objSpecialPages->unSlugPage($key)}
    {if $homePage}
        {assign var=$val value=$homePage.files.main_file.src}
    {/if}
    {assign var="homePage" value=""}
{/foreach}

    <style>
    .banner-demo {
    {if $page.files.main_file.src && $smarty.const.GDS_SWITCH eq 'page'}
        background-image: url("{$page.files.main_file.src}");
    {else}
        background-image: url("{$specialHotelPic}");
    {/if}
    }
</style>

<script>
    {literal}
    if($(window).width() > 576){
        {/literal}
        {if $specialFlightPic}
        {literal}
        $('.Flight-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialFlightPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialHotelPic}
        {literal}
        $('.Hotel-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialHotelPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialTrainPic}
        {literal}
        $('.Train-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialTrainPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialBusPic}
        {literal}
        $('.Bus-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialBusPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialTourPic}
        {literal}
        $('.Tour-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialTourPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialInsurancePic}
        {literal}
        $('.Insurance-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialInsurancePic}{literal}")')});
        {/literal}
        {/if}
        {if $specialVisaPic}
        {literal}
        $('.Visa-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialVisaPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialGashtPic}
        {literal}
        $('.GashtTransfer-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialGashtPic}{literal}")')});
        {/literal}
        {/if}

        {if $specialCarPic}
        {literal}
        $('.Europcar-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialCarPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialPackagePic}
        {literal}
        $('.Package-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialPackagePic}{literal}")')});
        {/literal}
        {/if}
        {if $specialEntertainmentPic}
        {literal}
        $('.Entertainment-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialEntertainmentPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialCipPic}
        {literal}
        $('.Cip-tab-pic').click(function () {$('.banner-demo').css('background-image' , 'url("{/literal}{$specialCipPic}{literal}")')});
        {/literal}
        {/if}
        {literal}

    }
</script>
{/literal}