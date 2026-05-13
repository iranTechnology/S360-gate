<!DOCTYPE html>

<html dir="rtl" lang="fa">
{include file="include_files/header.tpl"}
<body>

{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/tours.tpl"}
    {include file="include_files/hotels-webservice.tpl"}
{*    {include file="include_files/news-letters.tpl"}*}
    {include file="include_files/blog.tpl"}
    {include file="include_files/other.tpl"}
    {include file="include_files/your-question.tpl"}
    {include file="include_files/about-us.tpl"}
{*    {include file="include_files/comments.tpl"}*}
    {include file="include_files/blog-second.tpl"}
</main>
{include file="include_files/footer.tpl"}
{include file="include_files/social.tpl"}


</body>


<!--<script src="js/jquery.js"></script>-->

<!--<script src="js/jquery.mobile.customized.min.js"></script>-->


{include file="include_files/footer_script.tpl"}
</html>