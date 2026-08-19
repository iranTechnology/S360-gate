{assign var="data_search_public" value=['service'=>'Public','limit'=> 20]}
{assign var='faqs' value=$obj_main_page->faqsPosition($data_search_public)}
{if $faqs|count > 0}
<section class="container mt-5 accordion_sec">
 <h6>پرسش های شما</h6>
 <div class="">
  <div id="accordion">
   {foreach $faqs as $key => $faq}
   <div class="card">
    <div class="card-header" id="headingOne{$faq['id']}">
     <h5 class="mb-0">
      <button aria-controls="collapseOne{$faq['id']}" aria-expanded="true" class="btn btn-link" data-target="#collapseOne{$faq['id']}" data-toggle="collapse">
       {$faq['title']}
       <i class="far fa-angle-down"></i>
      </button>
     </h5>
    </div>
    <div aria-labelledby="headingOne{$faq['id']}" class="collapse {if $key==0} show {/if}" data-parent="#accordion" id="collapseOne{$faq['id']}">
     <div class="card-body">
       {$faq['content']}
      </div>
   </div>
    {/foreach}
  </div>
 </div>
</section>
{/if}