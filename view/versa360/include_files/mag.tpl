{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>9]}
{assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=1}
{assign var="article_count" value=$articles|count}
<section class="blog">
    <div class="container">
        <div class="titr-section">
            <h4>اطلاعات گردشگری</h4>
        </div>
        <div class="parent-blog">
            {foreach $articles as $key => $article}
                <a href="{$article['link']}" class="blog-item-link">
                    <img src="{$article['image']}" alt="{$article['title']}">
                    <div class="text-blog">
                        <div class="titr-blog">
                            <h5>{$article['title']}</h5>
                        </div>
                        <div class="parent-calendar-blog">
                                <span class="blog-calendar">
                                    <span>{$article['created_at']}</span>
                                </span>
                            <span class="star-blog">
                                        <i class="fa-solid fa-star star-yellow"></i>
                                        <i class="fa-solid fa-star star-yellow"></i>
                                        <i class="fa-solid fa-star star-yellow"></i>
                                        <i class="fa-solid fa-star star-yellow"></i>
                                        <i class="fa-solid fa-star star-yellow"></i>
                                </span>
                        </div>
                    </div>
                </a>
            {/foreach}
        </div>
    </div>
</section>
