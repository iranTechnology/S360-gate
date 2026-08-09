{assign var="main_articles" value=$obj_main_page->getNewsArticles()}
{assign var="othe_itmes" value=$main_articles['data']}
{assign var="i" value="2"}
{assign var='counter' value=0}

{if $othe_itmes }
<section class="news-section i_modular_news">
<div class="container">
<div class="title">
<h5>آخرین اخبار</h5>
</div>
<div class="news-section-grid">

    {if $othe_itmes[0] }
<div class="news-section-big">
<a class="__link__" href="{$othe_itmes[0]['link']}">
<div class="parent-img">
<img alt="{$othe_itmes[0]['alt']}" class="__image_class__" src="{$othe_itmes[0]['image']}"/>
</div>
<div class="parent-data">
<h4 class="__title_class__"> {$othe_itmes[0]['title']}</h4>
<p class="__heading_class__">

    {$othe_itmes[0]['tiny_text']}
                            </p>
<div class="parent-data-cate-news">
<div class="item-data-news-demo">
<svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
<span class="__date_class__">{$othe_itmes[0]["created_at"]}</span>
</div>
<div class="item-data-cate-news-demo">

    {if isset($othe_itmes[0]['categories_array'])}
        {foreach $othe_itmes[0]['categories_array'] as $category}
            {*                                        <a href='{$category['link']}' >*}
            {$category['title']}
            {*                                        </a>*}
        {/foreach}
    {/if}

                                </div>
</div>
</div>
</a>
</div>

    {/if}

<div class="news-section-center">
    {if $othe_itmes[1] }
<a class="__link__" href="{$othe_itmes[1]['link']}">
<div class="parent-img">
<img alt="{$othe_itmes[1]['alt']}" class="__image_class__" src="{$othe_itmes[1]['image']}"/>
</div>

<div class="parent-data">
<h4 class="__title_class__"> {$othe_itmes[1]['title']}</h4>
<p class="__heading_class__">

    {$othe_itmes[1]['tiny_text']}

                            </p>
<div class="parent-data-cate-news">
<div class="item-data-news-demo">
<svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
<span class="__date_class__">{$othe_itmes[1]["created_at"]}</span>
</div>
<div class="item-data-cate-news-demo">

    {if isset($othe_itmes[1]['categories_array'])}
        {foreach $othe_itmes[1]['categories_array'] as $category}
            {*                                        <a href='{$category['link']}' >*}
            {$category['title']}
            {*                                        </a>*}
        {/foreach}
    {/if}

                                </div>
</div>
</div>
</a>
    {/if}
    {if $othe_itmes[2] }
<a class="__link__" href="{$othe_itmes[2]['link']}">
<div class="parent-img">
<img alt="{$othe_itmes[2]['alt']}" class="__image_class__" src="{$othe_itmes[2]['image']}"/>
</div>
<div class="parent-data">
<h4 class="__title_class__">

    {$othe_itmes[2]['title']}
                            </h4>
<p class="__heading_class__">
    {$othe_itmes[2]['tiny_text']}


                            </p>
<div class="parent-data-cate-news">
<div class="item-data-news-demo">
<svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
<span class="__date_class__">{$othe_itmes[2]["created_at"]}</span>
</div>
<div class="item-data-cate-news-demo">

    {if isset($othe_itmes[2]['categories_array'])}
        {foreach $othe_itmes[2]['categories_array'] as $category}
            {*                                        <a href='{$category['link']}' >*}
            {$category['title']}
            {*                                        </a>*}
        {/foreach}
    {/if}
                                </div>
</div>
</div>
</a>
    {/if}
</div>






<div class="news-section-small">
<a class="__link__" href=" {$othe_itmes[3]['title']}">
<div class="parent-img">
<img alt="{$othe_itmes[3]['alt']}" class="__image_class__" src="{$othe_itmes[3]['image']}"/>
</div>
<div class="parent-data">
<h4 class="__title_class__">

    {$othe_itmes[3]['title']}

                            </h4>
<p class="__heading_class__">

    {$othe_itmes[3]['tiny_text']}

                            </p>
<div class="parent-data-cate-news">
<div class="item-data-news-demo">
<svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
<span class="__date_class__">{$othe_itmes[3]["created_at"]}</span>
</div>
<div class="item-data-cate-news-demo">

    {if isset($othe_itmes[3]['categories_array'])}
        {foreach $othe_itmes[3]['categories_array'] as $category}
            {*                                        <a href='{$category['link']}' >*}
            {$category['title']}
            {*                                        </a>*}
        {/foreach}
    {/if}

                                </div>
</div>
</div>
</a>
    <a class="__link__" href=" {$othe_itmes[4]['title']}">
        <div class="parent-img">
            <img alt="{$othe_itmes[4]['alt']}" class="__image_class__" src="{$othe_itmes[3]['image']}"/>
        </div>
        <div class="parent-data">
            <h4 class="__title_class__">

                {$othe_itmes[4]['title']}

            </h4>
            <p class="__heading_class__">

                {$othe_itmes[4]['tiny_text']}

            </p>
            <div class="parent-data-cate-news">
                <div class="item-data-news-demo">
                    <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
                    <span class="__date_class__">{$othe_itmes[4]["created_at"]}</span>
                </div>
                <div class="item-data-cate-news-demo">

                    {if isset($othe_itmes[4]['categories_array'])}
                        {foreach $othe_itmes[4]['categories_array'] as $category}
                            {*                                        <a href='{$category['link']}' >*}
                            {$category['title']}
                            {*                                        </a>*}
                        {/foreach}
                    {/if}

                </div>
            </div>
        </div>
    </a>
    <a class="__link__" href=" {$othe_itmes[5]['title']}">
        <div class="parent-img">
            <img alt="{$othe_itmes[5]['alt']}" class="__image_class__" src="{$othe_itmes[5]['image']}"/>
        </div>
        <div class="parent-data">
            <h4 class="__title_class__">

                {$othe_itmes[5]['title']}

            </h4>
            <p class="__heading_class__">

                {$othe_itmes[5]['tiny_text']}

            </p>
            <div class="parent-data-cate-news">
                <div class="item-data-news-demo">
                    <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192H400V448c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V192z"></path></svg>
                    <span class="__date_class__">{$othe_itmes[5]["created_at"]}</span>
                </div>
                <div class="item-data-cate-news-demo">

                    {if isset($othe_itmes[5]['categories_array'])}
                        {foreach $othe_itmes[5]['categories_array'] as $category}
                            {*                                        <a href='{$category['link']}' >*}
                            {$category['title']}
                            {*                                        </a>*}
                        {/foreach}
                    {/if}

                </div>
            </div>
        </div>
    </a>

</div>
</div>
</div>
</section>
{/if}
