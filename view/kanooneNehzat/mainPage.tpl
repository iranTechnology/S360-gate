<!DOCTYPE html>

<html dir="rtl" lang="fa">
{include file="include_files/header.tpl"}
<body>

{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/hotel-ghods.tpl"}
    {include file="include_files/news.tpl"}
{*    {include file="include_files/other.tpl"}*}
    {include file="include_files/about-us.tpl"}
</main>
{include file="include_files/footer.tpl"}
{include file="include_files/social.tpl"}


</body>


<!--<script src="js/jquery.js"></script>-->

<!--<script src="js/jquery.mobile.customized.min.js"></script>-->


{include file="include_files/footer_script.tpl"}
</html>