<!DOCTYPE html>
<html lang="fa" dir="rtl">
{include file="include_files/header.tpl"}
<body>
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/advertisement.tpl"}
    {include file="include_files/tours-external.tpl"}
    {include file="include_files/tours-internal.tpl"}
    {include file="include_files/blog.tpl"}
{*    {include file="include_files/rent-car.tpl"}*}
</main>
{include file="include_files/footer.tpl"}
{include file="include_files/footer-second.tpl"}
</body>
{include file="include_files/footer_script.tpl"}
</html>


