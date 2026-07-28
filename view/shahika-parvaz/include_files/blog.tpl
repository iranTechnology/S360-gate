{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'6']}
{assign var='blog' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$blog|count}
{if $blog[0]}
    {assign var='check_general' value=true}
{/if}
{if $check_general}
<section class="articles">
    <div class="container d-flex flex-wrap">
        <h2 class="col-12 titr">مقالات مفید</h2>
        {foreach $blog as $key => $item}
        <div class="article_Box col-12 col-md-6 col-lg-4 p-1">

            <a class="article_a"  href="{$item['link']}">
                <div class="article_img"><img src='{$item["image"]}'  alt='{$item["alt"]}'></div>
                <div class="article_text">
                    <i class="article_i">{$item["created_at"]}</i>
                    <div class="article_box_star"><div class="article_box_starMain"><i class="fa fa-star"></i></div><span class="article_box_span"> امتیاز 5.00از 5 (1 رای) </span></div>
                    <h5 class="article_titel">{$item["title"]}</h5>
                    <p class="article_description">{$item["description"]}</p>
                </div>
            </a>

        </div>
        {/foreach}

    </div>
</section>
{/if}