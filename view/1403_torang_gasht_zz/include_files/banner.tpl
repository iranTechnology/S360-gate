{assign var="data_search_public" value=['page_type'=>'attach',
'position'=> ['MainPage','Flight','Hotel'  , 'Insurance']]}
{assign var='specialPageData' value=$obj_main_page->getSpecialPageData($data_search_public)}
<section class="search"></section>

{foreach $specialPageData as $specialPage}
    {if $specialPage['position'] eq 'Flight'}
        {assign var='specialFlight' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Hotel'}
        {assign var='specialHotel' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Insurance'}
        {assign var='specialInsurance' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'MainPage'}
        {assign var='specialMainPage' value=$specialPage}
    {/if}
{/foreach}
{if $smarty.const.GDS_SWITCH eq 'Flight'}
    <style>.search{ background-image: url("{$specialFlight['files']['main_file']['src']}");}</style>
{/if}
{if $smarty.const.GDS_SWITCH eq 'Hotel'}
    <style>.search{ background-image: url("{$specialHotel['files']['main_file']['src']}");}</style>
{/if}
{if $smarty.const.GDS_SWITCH eq 'Insurance'}
    <style>.search{ background-image: url("{$specialInsurance['files']['main_file']['src']}");}</style>
{/if}
{if $smarty.const.GDS_SWITCH eq 'mainPage'}
    <style>.search{ background-image: url("{$specialMainPage['files']['main_file']['src']}");}</style>
{/if}
<script>
    {literal}
    function change_bg(e){
      console.log(`/project_files/images/${e}.jpg`);
      $(".search").css({"background-image" : `url('project_files/images/${e}.jpg')`})
    };
    $(document).ready(function(){
      if($(window).width() > 576){
        {/literal}
        {if $specialFlight['files']['main_file']['src']}
        {literal}
        $('#flight-tab').click(function () {
           $('.search').css('background-image' , 'url("{/literal}{$specialFlight['files']['main_file']['src']}{literal}")')
        });
        {/literal}
        {/if}
        {if $specialHotel['files']['main_file']['src']}
        {literal}
        $('#hotel-tab').click(function () {

            $('.search').css('background-image' , 'url("{/literal}{$specialHotel['files']['main_file']['src']}{literal}")')});
        {/literal}
        {/if}
        {if $specialInsurance['files']['main_file']['src']}
        {literal}
        $('#insurance-tab').click(function () {$('.search').css('background-image' , 'url("{/literal}{$specialInsurance['files']['main_file']['src']}{literal}")')});
        {/literal}
        {/if}
        {literal}

    }
    })

</script>
{/literal}

