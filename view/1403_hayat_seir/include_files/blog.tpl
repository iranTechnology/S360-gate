{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>14]}
                        {assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
                        {assign var='counter' value=0}
                        {assign var="article_count" value=$articles|count}
                        {if $articles}
<section class="i_modular_blog blog_section d-flex">
<div class="container">
<h3 class="title">وبلاگ حیات سیر پاژ</h3>
<div class="mainBlog">
{if $articles[0] }
<a class="__i_modular_c_item_class_0" href="{$articles[0]['link']}"><img alt="article1" class="__image_class__" src="{$articles[0]['image']}"/>
<div><h2 class="__title_class__">{$articles[0]['title']}</h2>
<p class="__heading_class__">{$articles[0]['heading']}</p>
</div>
</a>
{/if}
<div>
{if $articles[1] }
<a class="__i_modular_c_item_class_1" href="{$articles[1]['link']}"><img alt="article2" class="__image_class__" src="{$articles[1]['image']}"/>
<div><h2 class="__title_class__">{$articles[1]['title']}</h2>
<p class="__heading_class__">{$articles[1]['heading']}</p></div>
</a>
{/if}
{if $articles[2] }
<a class="__i_modular_c_item_class_2" href="{$articles[2]['link']}"><img alt="article3" class="__image_class__" src="{$articles[2]['image']}"/>
<div><h2 class="__title_class__">{$articles[2]['title']}</h2>
<p class="__heading_class__">{$articles[2]['heading']}</p></div>
</a>
{/if}
</div>
{if $articles[3] }
<a class="__i_modular_c_item_class_3" href="{$articles[3]['link']}"><img alt="article1" class="__image_class__" src="{$articles[3]['image']}"/>
<div><h2 class="__title_class__">{$articles[3]['title']}</h2>
<p class="__heading_class__">{$articles[3]['heading']}</p>
</div>
</a>
{/if}
{if $articles[4] }
<a class="__i_modular_c_item_class_4" href="{$articles[4]['link']}"><img alt="article2" class="__image_class__" src="{$articles[4]['image']}"/>
<div><h2 class="__title_class__">{$articles[4]['title']}</h2>
<p class="__heading_class__">{$articles[4]['heading']}</p></div>
</a>
{/if}
</div>
<div class="d-flex justify-content-center mt-5"><a class="button" href="{$smarty.const.ROOT_ADDRESS}/mag">همه وبلاگ ها</a></div>
</div>
</section>
{/if}