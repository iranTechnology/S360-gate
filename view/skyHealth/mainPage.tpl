<!DOCTYPE html>

<html dir="rtl" lang="fa-IR">
{include file="include_files/header.tpl"}
<body>
{include file="include_files/dailyQuote.tpl"}
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
{include file="include_files/search-box.tpl"}
{include file="include_files/other_item_up.tpl"}
{include file="include_files/blog.tpl"}
{include file="include_files/advertisement.tpl"}
{include file="include_files/tours.tpl"}
{include file="include_files/box_main.tpl"}
{include file="include_files/hotel.tpl"}
{include file="include_files/fast_flight_search.tpl"}
{include file="include_files/faq.tpl"}
{include file="include_files/other_item_down.tpl"}
</main>
{include file="include_files/footer.tpl"}
</body>
{include file="include_files/footer_script.tpl"}
</html>