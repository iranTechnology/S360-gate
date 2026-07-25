{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>3]}
{assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=1}
{assign var="article_count" value=$articles|count}

{if $articles}


    <section class="blog">
        <div class="container">
            <div class="title">
                <div class="title-text">
                    <!--                        <h3>دوکاتور</h3>-->
                    <h2>وبلاگ</h2>
                </div>
                <a href="{$smarty.const.ROOT_ADDRESS}/mag" class="read-more">
                    <span>بیشتر</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M297 239c9.4 9.4 9.4 24.6 0 33.9L105 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L71 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L297 239z"/></svg>
                </a>
            </div>
            <div class="parent-blog">
                {assign var="count" value="1"}
                {foreach $articles as $key => $article}
                    <a href="{$article['link']}" class="blog-item">
                        <div class="parent-img-blog">
                            <img  src="{$article['image']}" alt="{$article['title']}">
                        </div>
                        <div class="parent-text-blog">
                                <span class="data-blog">
                                {$article['created_at']}
                                </span>
                            <h2>
                                {$article['title']}
                            </h2>
                            <p>
                                {$article['heading']}
                            </p>
                            <button>
                                <span>ادامه مطلب</span>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M243 239l17 17-17 17L51 465l-17 17L.1 448l17-17 175-175L17 81 .1 64 34 30.1 51 47 243 239zm192 0l17 17-17 17L243 465l-17 17L192.1 448l17-17 175-175L209 81l-17-17L226 30.1l17 17L435 239z"/></svg>
                            </button>
                        </div>
                    </a>
                {/foreach}
            </div>
        </div>
    </section>


{/if}

