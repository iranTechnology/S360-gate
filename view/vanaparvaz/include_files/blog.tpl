

{*with category*}
{*{assign var="search_array" value=['section'=>'mag','category'=>1,'limit'=>'4']}*}
{*{assign var='blog' value=$obj_main_page->getCategoryArticles($search_array)}*}
{*{assign var='counter' value=0}*}
{*{assign var="article_count" value=$blog|count}*}

{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'4']}
{assign var='blog' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$blog|count}
{if $blog[0]}
    {assign var='check_general' value=true}
{/if}
{if $check_general}

        <!--
    <section class="i_modular_blog section_articles">
        <div class="container">
            <div class="title_article">
                <h3>مقالات</h3>
            </div>
            <div class="parent-blog-new">

                {foreach $blog as $key => $item}
                    <a class="__i_modular_nc_item_class_{$key} card_art card_art-number{$key}" href="{$item['link']}">
                        <img alt='{$item["alt"]}' class="__image_class__ img_article" src='{$item["image"]}' />
                        <div class="featured-title">
                            <h2 class="__title_class__">{$item["title"]}</h2>
                            <p class="__heading_class__">{$item["heading"]}</p>
                        </div>
                    </a>
                {/foreach}


            </div>
        </div>
    </section>
    -->

{/if}