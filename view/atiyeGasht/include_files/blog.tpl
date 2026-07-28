
{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>'6']}
{assign var='blog' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='counter' value=0}
{assign var="article_count" value=$blog|count}
{if $blog[0]}
 {assign var='check_general' value=true}
{/if}
{if $check_general}
<section class="article my-5">
 <div class="container d-flex flex-wrap">
  <h3 class="title col-12 p-0">اطلاعات قطار</h3>

  {if $blog[0]}
  <div class="article_main col-lg-3 col-md-6 col-12 p-0">
   <a href="{$blog[0]['link']}">
    <div><div>
      <img alt="{$blog[0]['alt']}" class="__image_class__" src="{$blog[0]['image']}"/>
     </div></div>
    <div>
     <h4>{$blog[0]['title']}</h4>
     <span>{$blog[0]['created_at']}</span>
     <p>{$blog[0]['tiny_text']|truncate:200}</p>
    </div>
   </a>
  </div>
  {/if}

  {if $blog[1]}
  <div class="article_main col-lg-3 col-md-6 col-12 p-0">
   <a href="{$blog[1]['link']}">
    <div><div>
      <img alt="{$blog[1]['alt']}" class="__image_class__" src="{$blog[1]['image']}"/>
     </div></div>
    <div>
     <h4>{$blog[1]['title']}</h4>
     <span>{$blog[1]['created_at']}</span>
     <p>{$blog[1]['tiny_text']|truncate:200} </p>
    </div>
   </a>
  </div>
  {/if}

  {if $blog[2]}
  <div class="article_main col-lg-6 col-md-6 col-12 p-0">
   <a href="{$blog[2]['link']}">
    <div>
     <div>
      <img alt="{$blog[2]['alt']}" class="__image_class__" src="{$blog[2]['image']}"/>
     </div>
    </div>
    <div>
     <h4>{$blog[2]['title']}</h4>
     <span>{$blog[2]['created_at']}</span>
     <p>{$blog[2]['tiny_text']|truncate:200} </p>
    </div>
   </a>
  </div>
  {/if}
  {if $blog[3]}
   <div class="article_main col-lg-6 col-md-6 col-12 p-0">
    <a href="{$blog[3]['link']}" style='width: 100%;'>
     <div>
      <div>
       <img  alt="{$blog[3]['alt']}" class="__image_class__" src="{$blog[3]['image']}"/>
      </div>
     </div>
     <div>
      <h4>{$blog[3]['title']}</h4>
      <span>{$blog[3]['created_at']}</span>
      <p>{$blog[3]['tiny_text']|truncate:200} </p>
     </div>
    </a>
   </div>
  {/if}

  {if $blog[4]}
  <div class="article_main col-lg-3 col-md-6 col-12 p-0">
   <a href="{$blog[4]['link']}">
    <div><div>
      <img alt="{$blog[4]['alt']}" class="__image_class__" src="{$blog[4]['image']}"/>
     </div></div>
    <div>
     <h4>{$blog[4]['title']}</h4>
     <span>{$blog[4]['created_at']}</span>
     <p>{$blog[4]['tiny_text']|truncate:200} </p>
    </div>
   </a>
  </div>
  {/if}
  {if $blog[5]}
  <div class="article_main col-lg-3 col-md-6 col-12 p-0">
   <a href="{$blog[5]['link']}">
    <div><div>
      <img alt="{$blog[5]['alt']}" class="__image_class__" src="{$blog[5]['image']}"/>
     </div></div>
    <div>
     <h4>{$blog[5]['title']}</h4>
     <span>{$blog[5]['created_at']}</span>
     <p>{$blog[5]['tiny_text']|truncate:200} </p>
    </div>
   </a>
  </div>
  {/if}
 </div>
</section>

{/if}