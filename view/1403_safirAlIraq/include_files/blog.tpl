

{*with category*}
{*{assign var="search_array" value=['section'=>'mag','category'=>1,'limit'=>'3']}*}
{*{assign var='blog' value=$obj_main_page->getCategoryArticles($search_array)}*}
{*{assign var='counter' value=0}*}
{*{assign var="article_count" value=$blog|count}*}

{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'3']}
{assign var='blog' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$blog|count}
{if $blog[0]}
    {assign var='check_general' value=true}
{/if}

{if $check_general}
    <section class="i_modular_blog blog">
        <div class="container">
            <div class="title">
                <div class="title-text">
                    <h3>Safeer Aliraq</h3>
                    <h2>RECENT BLOG POSTS</h2>
                </div>
                <a class="{$smarty.const.ROOT_ADDRESS}/page/blog read-more" href="{$smarty.const.ROOT_ADDRESS}/mag">
                    <span>View more</span>
                    <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg">
                        <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                        <path d="M297 239c9.4 9.4 9.4 24.6 0 33.9L105 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L71 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L297 239z"></path>
                    </svg>
                </a>
            </div>
            <div class="parent-blog">

                {foreach $blog as $key => $item}
                    <a class="__i_modular_nc_item_class_0 blog-item" href="{$item['link']}">
                        <div class="parent-img-blog">
                            <img alt='{$item["alt"]}' class="__image_class__" src='{$item["image"]}' />
                        </div>
                        <div class="parent-text-blog">
                            <span class="__date_class__ data-blog">{$item["created_at"]}</span>
                            <h2 class="__title_class__">{$item["title"]}</h2>
                            <p class="__heading_class__">{$item["tiny_text"]}</p>
                            <button>
                                <span>Read More</span>
                                <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                    <path d="M243 239l17 17-17 17L51 465l-17 17L.1 448l17-17 175-175L17 81 .1 64 34 30.1 51 47 243 239zm192 0l17 17-17 17L243 465l-17 17L192.1 448l17-17 175-175L209 81l-17-17L226 30.1l17 17L435 239z"></path>
                                </svg>
                            </button>
                        </div>
                    </a>
                {/foreach}


            </div>
        </div>
    </section>
{/if}