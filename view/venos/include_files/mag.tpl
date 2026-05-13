{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>8]}
{assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=1}
{assign var="article_count" value=$articles|count}

{if $articles}
<section class="blog">
    <div class="container">
        <div class="title">
            <h2>مجله ونوس</h2>
            <p>
                آخرین وبلاگ و مقالات و اخبار مهاجرتی، گردشگری , علمی ، فرهنگی ، هنری و ورزشی.
            </p>
        </div>
        <div class="parent-blog">
            {assign var="count" value="1"}
            {foreach $articles as $key => $article}
                <a href="{$article['link']}" class="{if $count > 4} display-none-mobile {/if} item-blog">
                    <div class="parent-img-blog">
                        <img  src="{$article['image']}" alt="{$article['title']}">
                    </div>
                    <div class="text-blog">
                        <h2>{$article['title']}</h2>
                    </div>
                </a>
                {$count = $count + 1}
            {/foreach}
        </div>
        <a href="{$smarty.const.ROOT_ADDRESS}/mag" class="btn-more">
            ورود به دنیای گردشگری
            <i class="fa-solid fa-arrow-left"></i>
        </a>

    </div>
</section>
{/if}