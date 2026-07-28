<!DOCTYPE html>

<html dir="rtl" lang="fa">
{include file="include_files/header.tpl"}
<body>
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
{include file="include_files/search-box.tpl"}
    {include file="include_files/other-links.tpl"}

    {include file="include_files/tours.tpl"}
{include file="include_files/tours-second.tpl"}
    {include file="include_files/latest-tour.tpl"}

    {include file="include_files/work-team-migration.tpl"}

    {include file="include_files/hotels-webservice.tpl"}
{include file="include_files/news.tpl"}
</main>
{include file="include_files/footer.tpl"}
{include file="include_files/select-theme.tpl"}
</body>







{include file="include_files/footer_script.tpl"}
</html>