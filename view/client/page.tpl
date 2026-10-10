{load_presentation_object filename="specialPages" assign="objSpecialPages"}
{assign var="page" value=$objSpecialPages->unSlugPage($smarty.const.PAGE_TITLE)}
{*{$page|var_dump}*}
<link rel="stylesheet" href="assets/modules/css/visa-page.css">

<link rel='stylesheet' href='assets/modules/css/special-pages.css'>
{if $page}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`modules/rich/breadcrumb/detail.tpl"}
    {if $page.files.main_file}

        <section class="baner-slider banner-slider banner-slider-display" style='background-image:url("{$page.files.main_file.src}")'></section>
    {/if}
    {if $page.position || $page.position neq '' }
        
        {assign var="page_search_tab" value=$page.position}
        {if $page.position eq 'internationalFlight' && !empty($page.flight_search_defaults)}
            {assign var="page_search_tab" value='internalFlight'}
        {/if}
        {include file="`$smarty.const.FRONT_CURRENT_THEME`include_files/search-box.tpl" active_tab=$page_search_tab}


    {/if}

    {if $page.page_type eq 'separate' && !empty($page.flight_search_defaults) && $page.position eq $page.flight_search_defaults.service}
        {assign var="flight_defaults" value=$objSpecialPages->flightDefaultsForPage($page)}
        <script type="application/json" id="special-page-flight-defaults">{$flight_defaults}</script>
        <script src="assets/modules/js/special-page-flight-defaults.js"></script>
    {/if}

    {*    item page*}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`modules/pages/item.tpl" page=$page objSpecialPages=$objSpecialPages}

    <link rel="stylesheet" href="assets/modules/css/jquery.fancybox.min.css">
    <script src="assets/modules/js/jquery.fancybox.min.js"></script>
    <script src="assets/modules/js/page.js"></script>
    <script src="assets/modules/js/visa-page.js"></script>
{else}
<section class="attachments-special-pages m-5 text-center bg-error">
    <div class="container">
    <div class='col-lg-12 p-5 one error'>
        <p>##NotResultsFound##</p>
    </div>
    </div>
</section>

{/if}
