{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>3]}
{assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=1}
{assign var="article_count" value=$articles|count}

{if $articles}
<section class="i_modular_blog blog container mt-4">
    <div class="blog_slider owl-carousel owl-theme owl-rtl owl-loaded owl-drag">
        {foreach $articles as $key => $article}
        <div class="__i_modular_nc_item_class_0 item">
            <a href="{$article['link']}">
                <img src="{$article['image']}" alt="{$article['title']}">
                <div>
                    <h2 class='__title_class__'>{$article['title']}</h2>
                    <p class='__heading_class__'>{$article['tiny_text']}</p>
                    <button>ادامه</button>
                </div>
            </a>
        </div>
        {/foreach}

    </div>

</section>
{/if}