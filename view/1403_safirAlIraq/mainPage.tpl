<!DOCTYPE html>

<html lang="en">
{include file="include_files/header.tpl"}
<body>
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/fast_flight_search.tpl"}
    {include file="include_files/fast_flight_external_search.tpl"}
    {include file="include_files/about-us.tpl"}
    {include file="include_files/blog.tpl"}
    {include file="include_files/faq.tpl"}
</main>
{include file="include_files/footer.tpl"}
</body>
{include file="include_files/footer_script.tpl"}
</html>