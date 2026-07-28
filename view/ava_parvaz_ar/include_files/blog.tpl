{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>13]}
{assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$articles|count}
{if $articles}
    <section class="i_modular_blog blog my-5 py-5">
    <div class="container">
    <div class="blog-grid">
    {if $articles[0] }
    <div class="__i_modular_c_item_class_0 div1">
    <a href="{$articles[0]['link']}">
    <img alt="" class="__image_class__" src="{$articles[0]['image']}"/>
    <div>
    <div>
    <h4 class="__title_class__">{$articles[0]['title']}</h4>
    <span class="__heading_class__">{$articles[0]['heading']}</span>
    </div>
    <i><svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M315.3 411.3C312.2 414.4 308.1 416 304 416s-8.188-1.562-11.31-4.688L32 150.6v184.6c0 8.844-7.156 16-16 16s-16-7.156-16-16V111.9c0-8.812 7.141-15.97 15.95-16c0 0 224-.6562 224-.6562c8.812 0 15.97 7.125 16 15.97c.0313 8.812-7.109 16-15.95 16.03l-185.6 .5547l260.9 260.9C321.6 394.9 321.6 405.1 315.3 411.3z"></path></svg></i>
    </div>
    </a>
    </div>
    {/if}
    {if $articles[1] }
    <div class="__i_modular_c_item_class_1 div2">
    <a href="{$articles[1]['link']}">
    <img alt="" class="__image_class__" src="{$articles[1]['image']}"/>
    <div>
    <div>
    <h4 class="__title_class__">{$articles[1]['title']}</h4>
    <span class="__heading_class__">{$articles[1]['heading']}</span>
    </div>
    <i><svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M315.3 411.3C312.2 414.4 308.1 416 304 416s-8.188-1.562-11.31-4.688L32 150.6v184.6c0 8.844-7.156 16-16 16s-16-7.156-16-16V111.9c0-8.812 7.141-15.97 15.95-16c0 0 224-.6562 224-.6562c8.812 0 15.97 7.125 16 15.97c.0313 8.812-7.109 16-15.95 16.03l-185.6 .5547l260.9 260.9C321.6 394.9 321.6 405.1 315.3 411.3z"></path></svg></i>
    </div>
    </a>
    </div>
    {/if}
    {if $articles[2] }
    <div class="__i_modular_c_item_class_2 div3">
    <a href="{$articles[2]['link']}">
    <img alt="" class="__image_class__" src="{$articles[2]['image']}"/>
    <div>
    <div>
    <h4 class="__title_class__">{$articles[2]['title']}</h4>
    <span class="__heading_class__">{$articles[2]['heading']}</span>
    </div>
    <i><svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M315.3 411.3C312.2 414.4 308.1 416 304 416s-8.188-1.562-11.31-4.688L32 150.6v184.6c0 8.844-7.156 16-16 16s-16-7.156-16-16V111.9c0-8.812 7.141-15.97 15.95-16c0 0 224-.6562 224-.6562c8.812 0 15.97 7.125 16 15.97c.0313 8.812-7.109 16-15.95 16.03l-185.6 .5547l260.9 260.9C321.6 394.9 321.6 405.1 315.3 411.3z"></path></svg></i>
    </div>
    </a>
    </div>
    {/if}
    {if $articles[3] }
    <div class="__i_modular_c_item_class_3 div4">
    <a href="{$articles[3]['link']}">
    <img alt="" class="__image_class__" src="{$articles[3]['image']}"/>
    <div>
    <div>
    <h4 class="__title_class__">{$articles[3]['title']}</h4>
    <span class="__heading_class__">{$articles[3]['heading']}</span>
    </div>
    <i><svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M315.3 411.3C312.2 414.4 308.1 416 304 416s-8.188-1.562-11.31-4.688L32 150.6v184.6c0 8.844-7.156 16-16 16s-16-7.156-16-16V111.9c0-8.812 7.141-15.97 15.95-16c0 0 224-.6562 224-.6562c8.812 0 15.97 7.125 16 15.97c.0313 8.812-7.109 16-15.95 16.03l-185.6 .5547l260.9 260.9C321.6 394.9 321.6 405.1 315.3 411.3z"></path></svg></i>
    </div>
    </a>
    </div>
    {/if}
    </div>
    </div>
    </section>
{/if}