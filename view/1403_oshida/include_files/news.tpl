{assign var="main_articles" value=$obj_main_page->getNewsArticles()}
{assign var="first_item" value=$main_articles['data'][0]}
{assign var="othe_itmes" value=$main_articles['data']|array_slice:1}

{if $main_articles['count'] > 0 }
    <div class="section3">
        <div class="container-fluid">
            <h4 class="title"><span>  آخرین اخبار</span></h4>
            <div class="row">

                <div class="owl-carousel owl-carousel2 portfolio animated growIn">

                    {foreach $main_articles['data'] as $item}
                        <div class="item cloned" style="">
                            <article class="post-blog">
                                <a class="post-blog-image" href="{$item['link']}">
                                    <img src="{$item['image']}" alt="{$item['alt']}" width="570" height="415">
                                </a>
                                <div class="post-blog-caption">
                                    <div class="post-blog-caption-header">
                                        <ul class="post-blog-meta">
                                            <li><a href="{$item['link']}">{$item['heading']}</a></li>
                                        </ul>
                                    </div>
                                    <div class="post-blog-caption-body">
                                        <p>{$item['description']}</p>
                                    </div>
                                    <div class="post-blog-caption-footer">
                                        <time class="post-comment" href="{$item['link']}">
                                            <span class="icon novi-icon icon-md-middle icon-gray-1 fas fa-calendar-alt"></span>
                                            <span>{$item['created_at']}</span>
                                        </time>
                                        <a href="{$item['link']}" class="button button-secondary">اطلاعات بیشتر</a>
                                    </div>
                                </div>
                            </article>
                        </div>
                    {/foreach}


                </div>
            </div>

        </div>
    </div>

{/if}