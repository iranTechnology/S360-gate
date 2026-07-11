{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'4']}
{assign var='blog' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$blog|count}
{if $blog[0]}
    {assign var='check_general' value=true}
{/if}
{assign var='number' value=1}

{if $check_general}
<section class="blogs i_modular_blog">
<div class="container">
<div class="title">
<h5>جدیدترین وبلاگ ها</h5>
</div>
<div class="grid-blogs">
    {foreach $blog as $key => $item}
    {if $number<4}
    <a class="__link__ __i_modular_nc_item_class_0 {$number == 3 || $number == 4} tab-mobile" href="{$item['link']}">
<div class="parent-img-blogs">
<img alt="{$item["alt"]}" class="__image_class__" src="{$item["image"]}"/>
</div>
<div class="parent-text-blogs">
<h3 class="__title_class__">{$item["title"]}</h3>
<p class="__heading_class__">

    {$item["heading"]}
                        </p>
<button class="__link__">مشاهده </button>
</div>
</a>
        {/if}
    {/foreach}

</div>
</div>
</section>
{/if}