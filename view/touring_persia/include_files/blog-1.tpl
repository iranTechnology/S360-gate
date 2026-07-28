{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>14]}
                        {assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
                        {assign var='counter' value=0}
                        {assign var="article_count" value=$articles|count}
                        {if $articles}
<section class="i_modular_blog travelogue" id='Inspire-me'>
<div class="new-container">
<h3 class="title-center-travelogue">Get inspired</h3>
<div class="parent-travelogue">
{if $articles[0] }
<div class="__i_modular_c_item_class_0 item-col-travelogue">
<div class="box-travelogue">
<div class="parent-img-travelogue">
<img alt="img" class="__image_class__" src="{$articles[0]['image']}"/>
</div>
<div class="parent-text-travelogue">
<h3 class="__title_class__">{$articles[0]['title']}</h3>
<p class="__heading_class__">{$articles[0]['heading']}</p>
</div>
<div class="hover-travelogue">
<a class="btn-read" href="{$articles[0]['link']}">
                                Read online
                            </a>
</div>
</div>
</div>
{/if}
{if $articles[1] }
<div class="__i_modular_c_item_class_1 item-col-travelogue">
<div class="box-travelogue">
<div class="parent-img-travelogue">
<img alt="img" class="__image_class__" src="{$articles[1]['image']}"/>
</div>
<div class="parent-text-travelogue">
<h3 class="__title_class__">{$articles[1]['title']}</h3>
<p class="__heading_class__">{$articles[1]['heading']}</p>
</div>
<div class="hover-travelogue">
<a class="btn-read" href="{$articles[1]['link']}">
                                Read online
                            </a>
</div>
</div>
</div>
{/if}
{if $articles[2] }
<div class="__i_modular_c_item_class_2 item-col-travelogue item-col-travelogue-text">
<div class="box-travelogue-center">
<p>
                            Take a peek inside our inspiring brochures and let us whisk you away to distant lands. From the sun-dappled waters of the Mediterranean to the exotic jungles of Asia, we have an effortless adventure that’s perfect for you...
                        </p>
<div class="parent-btn-more2">
<a class="btn-more2" href="">
                                Submit
                            </a>
</div>
</div>
</div>
{/if}
{if $articles[3] }
<div class="__i_modular_c_item_class_3 item-col-travelogue">
<div class="box-travelogue">
<div class="parent-img-travelogue">
<img alt="img" class="__image_class__" src="{$articles[3]['image']}"/>
</div>
<div class="parent-text-travelogue">
<h3 class="__title_class__">{$articles[3]['title']}</h3>
<p class="__heading_class__">{$articles[3]['heading']}</p>
</div>
<div class="hover-travelogue">
<a class="btn-read" href="{$articles[3]['link']}">
                                Read online
                            </a>
</div>
</div>
</div>
{/if}
{if $articles[4] }
<div class="__i_modular_c_item_class_4 item-col-travelogue">
<div class="box-travelogue">
<div class="parent-img-travelogue">
<img alt="img" class="__image_class__" src="{$articles[4]['image']}"/>
</div>
<div class="parent-text-travelogue">
<h3 class="__title_class__">{$articles[4]['title']}</h3>
<p class="__heading_class__">{$articles[4]['heading']}</p>
</div>
<div class="hover-travelogue">
<a class="btn-read" href="{$articles[4]['link']}">
                                Read online
                            </a>
</div>
</div>
</div>
{/if}
</div>
</div>
</section>
{/if}