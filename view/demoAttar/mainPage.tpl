<!doctype html>
<html lang="fa" dir="rtl">
{include file="include_files/header.tpl"}
<body>
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/services.tpl"}
    {include file="include_files/advertisement.tpl"}
    {include file="include_files/hotel.tpl"}
    {include file="include_files/app.tpl"}
    {include file="include_files/faq.tpl"}
    {include file="include_files/tour.tpl"}
    {include file="include_files/blog.tpl"}
    {include file="include_files/airlines.tpl"}
    {include file="include_files/newsletter.tpl"}
    {include file="include_files/select-theme.tpl"}
</main>
{include file="include_files/footer.tpl"}
</body>
{include file="include_files/footer_script.tpl"}
</html>