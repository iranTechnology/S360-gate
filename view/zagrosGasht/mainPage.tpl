<!DOCTYPE html>

<html dir="rtl" lang="fa">
{include file="include_files/header.tpl"}
<body>
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/other-links.tpl"}
    {include file="include_files/tours.tpl"}
    {include file="include_files/installment_calculator.tpl"}
    {include file="include_files/hotels-webservice.tpl"}
    {include file="include_files/airlines.tpl"}
    {include file="include_files/public-section.tpl"}
    {include file="include_files/newsletter.tpl"}
</main>
{include file="include_files/footer.tpl"}
</body>


{include file="include_files/footer_script.tpl"}
</html>