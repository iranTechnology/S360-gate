{load_presentation_object filename="specialPages" assign="objSpecialPages"}

{assign var="searchServices" value=['flight'=>'specialFlightPic','hotel'=> 'specialHotelPic','train' => 'specialTrainPic',
'bus' =>'specialBusPic', 'tour' =>'specialTourPic', 'insurance' =>'specialInsurancePic', 'visa' =>'specialVisaPic', 'gasht' =>'specialGashtPic',
'mainPage' =>'MainPagePic']}
{foreach $searchServices as $key => $val}
    {assign var="homePage" value=$objSpecialPages->unSlugPage($key)}
    {if $homePage}
        {assign var=$val value=$homePage.files.main_file.src}
    {/if}
    {assign var="homePage" value=""}
{/foreach}
{*{if $smarty.const.GDS_SWITCH neq 'mainPage' }*}
{*    *}
{*{/if}*}
{*{$page.files.main_file.src}*}


<style>
    .__banner_tabs__ {
    {if $page.files.main_file.src && $smarty.const.GDS_SWITCH eq 'page'}
    {if $page['slug'] eq 'flight'}
        background-image: url("project_files/images/{$specialFlightPic}");
    {elseif $page['slug'] eq 'hotel'}
        background-image: url("project_files/images/{$specialHotelPic}");
    {elseif $page['slug'] eq 'bus'}
        background-image: url("project_files/images/{$specialBusPic}");
    {elseif $page['slug'] eq 'tour'}
        background-image: url("project_files/images/{$specialTourPic}");
    {elseif $page['slug'] eq 'insurance'}
        background-image: url("project_files/images/{$specialInsurancePic}");
    {elseif $page['slug'] eq 'visa'}
        background-image: url("project_files/images/{$specialVisaPic}");
    {elseif $page['slug'] eq 'tafrih'}
        background-image: url("project_files/images/{$specialTafrihPic}");
    {/if}
    {else}
        background-image: url("{$specialFlightPic}");
    {/if}
    }
</style>

<script>
    {literal}
    if($(window).width() > 576){
        {/literal}
        {if $specialFlightPic}
        {literal}
      $('.Flight-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialFlightPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialHotelPic}
        {literal}
      $('.Hotel-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialHotelPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialTrainPic}
        {literal}
      $('.Train-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialTrainPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialBusPic}
        {literal}
      $('.Bus-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialBusPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialTourPic}
        {literal}
      $('.Tour-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialTourPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialInsurancePic}
        {literal}
      $('.Insurance-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialInsurancePic}{literal}")')});
        {/literal}
        {/if}
        {if $specialVisaPic}
        {literal}
      $('.Visa-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialVisaPic}{literal}")')});
        {/literal}
        {/if}
        {if $specialGashtPic}
        {literal}
      $('.GashtTransfer-tab-pic').click(function () {$('.__banner_tabs__').css('background-image' , 'url("{/literal}{$specialGashtPic}{literal}")')});
        {/literal}
        {/if}
        {literal}

    }
</script>
{/literal}

<style>
    .__banner_tabs__ {
    {if $page.files.main_file.src && $smarty.const.GDS_SWITCH eq 'page'}
        background-image: url("{$page.files.main_file.src}");
    {else}
        {*background-image: url("{$specialFlightPic}");*}
    {/if}
    }
    {if $page.files.main_file.src && $smarty.const.GDS_SWITCH eq 'page' &&
    ($specialFlightPic || $specialHotelPic || $specialTrainPic ||
     $specialBusPic || $specialTourPic || $specialInsurancePic || $specialVisaPic || $specialGashtPic)}
    .banner-slider {
        display: none;
    }
    {/if}
</style>

