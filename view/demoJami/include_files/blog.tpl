{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'4']}
{assign var='blog' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$blog|count}
{if $blog[0]}
    {assign var='check_general' value=true}
{/if}

{if $check_general}
<section class="blogs i_modular_blog">
<div class="container">
<div class="title">
<h5>جدیدترین وبلاگ ها</h5>
</div>
<div class="owl-carousel owl-theme owl-blogs">
    {foreach $blog as $key => $item}

{*<div class="item __i_modular_nc_item_class_0">*}
{*<a class="retreat-card __link__" href="{$item['link']}">*}
{*<div class="card-image">*}
{*<img alt='{$item["alt"]}' class="__image_class__" src='{$item["image"]}'/>*}
{*<div class="image-overlay"></div>*}
{*</div>*}
{*<div class="card-content">*}
{*<div>*}
{*<h3 class="card-title __title_class__">{$item["title"]}</h3>*}
{*<p class="card-description __heading_class__">*}

{*    {$item["heading"]}*}
{*                                </p>*}
{*</div>*}
{*<button class="reserve-btn __link__" href="javascript:">مشاهده بیشتر</button>*}
{*</div>*}
{*</a>*}
{*</div>*}
        <div class="item">
            <a href="{$item['link']}" class="retreat-card">
                <div class="card-image">
                    <img alt='{$item["alt"]}' class="__image_class__" src='{$item["image"]}'>
                    <div class="image-overlay"></div>
                </div>
                <div class="card-content">
                    <div>
                        <h3 class="card-title">{$item["title"]}</h3>
                        <p class="card-description">
                            {$item["heading"]}                        </p>
                    </div>
                    <button class="reserve-btn">مشاهده بیشتر</button>
                </div>
            </a>
        </div>


    {/foreach}
</div>
</div>
</section>
{/if}