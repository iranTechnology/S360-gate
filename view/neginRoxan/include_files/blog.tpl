{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'4']}
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
            <h2> آخرین مقالات</h2>
        </div>
        <div class="parent-blog">
            <div class="blog-box-link">
                {if $blog[0]}
                <a href="{$blog[0]['link']}" class=" blog-item blog-item2">
                    <img alt="{$blog[0]['alt']}" class="__image_class__" src="{$blog[0]['image']}"/>
                    <div class="text-blog">
                        <h3>{$blog[0]['title']}</h3>
                        <p>
                            {$blog[0]['tiny_text']|truncate:200}
                        </p>
                        <div class="parent-btn-blog">
                            <button>
                                <span>مشاهده بیشتر</span>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288 480 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-370.7 0 73.4-73.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-128 128z"></path></svg>
                            </button>
                        </div>
                    </div>
                </a>
                {/if}
                {if $blog[1]}
                <a href="{$blog[1]['link']}" class=" blog-item blog-item2">
                    <img src="{$blog[1]['image']}" alt="{$blog[1]['alt']}">
                    <div class="text-blog">
                        <h3>{$blog[1]['title']}</h3>
                        <p>
                            {$blog[1]['tiny_text']|truncate:200}
                        </p>
                        <div class="parent-btn-blog">
                            <button>
                                <span>مشاهده بیشتر</span>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288 480 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-370.7 0 73.4-73.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-128 128z"></path></svg>
                            </button>
                        </div>
                    </div>
                </a>
                {/if}
            </div>
            {if $blog[2]}
            <a href="{$blog[2]['link']}" class="blog-item">
                <img src="{$blog[2]['image']}" alt="{$blog[2]['alt']}">
                <div class="text-blog">
                    <h3>{$blog[2]['title']}</h3>
                    <p>
                        {$blog[2]['tiny_text']|truncate:200}
                    </p>
                    <div class="parent-btn-blog">
                        <button>
                            <span>مشاهده بیشتر</span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288 480 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-370.7 0 73.4-73.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-128 128z"></path></svg>
                        </button>
                    </div>
                </div>
            </a>
            {/if}
        </div>
        <div class="parent-more">
            <a href="{$smarty.const.ROOT_ADDRESS}/mag">
                <span>مشاهده بیشتر</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.3 288 480 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-370.7 0 73.4-73.4c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-128 128z"></path></svg>
            </a>
        </div>
    </div>
</section>
{/if}