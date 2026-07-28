{include file="include_files/header.tpl" }<!-- donwn -->

{assign var="data_search_public" value=['page_type'=>'attach',
'position'=> ['MainPage','internalFlight','Hotel' , 'Tour' , 'Train' , 'Bus']]}
{assign var='specialPageData' value=$obj_main_page->getSpecialPageData($data_search_public)}

<main>
    {include file="include_files/banner-slider.tpl"}
    {include file="include_files/advertising.tpl"}<!-- donwn -->
    {include file="include_files/video.tpl"}<!-- hold -->
    {include file="include_files/hotel.tpl"}<!-- hold -->
    {include file="include_files/appSection.tpl"}<!-- hold -->
    {include file="include_files/mag.tpl"}<!-- donwn -->
    {include file="include_files/newsletters.tpl"}<!-- donwn -->
</main>
{include file="include_files/footer.tpl"}<!-- donwn -->

</body>
{include file="include_files/script-footer.tpl"}<!-- donwn -->
