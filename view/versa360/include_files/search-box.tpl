{assign var="info_access_client_to_service" value=$info_access_client_to_service}
{assign var="data_search_public" value=['page_type'=>'attach',
'position'=> ['MainPage','internalFlight','Hotel' , 'Tour' , 'Train' , 'Bus' , 'Insurance']]}
{assign var='specialPageData' value=$obj_main_page->getSpecialPageData($data_search_public)}

<section class="baner-searchbox">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-12 col-sm-12 col-12">
            <div class="parent-searchbox">
                <section class="searchBox">
                    <div class="container p-0">
                        <div class="searchBoxMain">
                            {include file="./search-box/tabs-search-box.tpl" active_tab=$active_tab}
                            {include file="./search-box/boxs-search.tpl" active_tab=$active_tab}
                        </div>
                    </div>
                </section>
            </div>
    </div>
            {include file="include_files/tour-last-second.tpl"}<!-- hold -->
        </div>
    </div>
</section>

{foreach $specialPageData as $specialPage}

    {if $specialPage['position'] eq 'internalFlight'}
        {assign var='specialFlight' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Hotel'}
        {assign var='specialHotel' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Train'}
        {assign var='specialTrain' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Bus'}
        {assign var='specialBus' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Tour'}
        {assign var='specialTour' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'Insurance'}
        {assign var='specialInsurance' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'MainPage'}
        {assign var='specialMainPage' value=$specialPage}
    {/if}
{/foreach}


{if $smarty.const.PAGE_TITLE eq 'flight'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialFlight['files']['main_file']['src']}");}
        }
    </style>
{/if}
{if $smarty.const.PAGE_TITLE eq 'hotel'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialHotel['files']['main_file']['src']}");}
        }
    </style>
{/if}
{if $smarty.const.PAGE_TITLE eq 'train'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialTrain['files']['main_file']['src']}");}
        }
    </style>
{/if}
{if $smarty.const.PAGE_TITLE eq 'bus'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialBus['files']['main_file']['src']}");}
        }

    </style>
{/if}
{if $smarty.const.PAGE_TITLE eq 'tour'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialTour['files']['main_file']['src']}");}
        }

    </style>
{/if}
{if $smarty.const.PAGE_TITLE eq 'insurance'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialInsurance['files']['main_file']['src']}");}
        }
    </style>
{/if}
{if $smarty.const.PAGE_TITLE eq 'mainPage'}
    <style>
        @media (min-width: 576px) {
            .baner-searchbox{ background-image: url("{$specialFlight['files']['main_file']['src']}");}
        }
    </style>
{/if}
