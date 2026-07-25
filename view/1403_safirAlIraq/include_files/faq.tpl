{assign var="data_search_public" value=['service'=> [['MainService' => 'Public']]]}
{assign var='faqs' value=$obj_main_page->faqsPositionMain($data_search_public)}

{if count($faqs) > 0}
<section class="your-question">
    <div class="container">
        <div class="title">
            <div class="title-text">
                <h3>Safeer Aliraq</h3>
                <h2>FREQUENTLY QUESTIONS</h2>
            </div>
            <a class="read-more" href="{$smarty.const.ROOT_ADDRESS}/faq">
                <span>View more</span>
                <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M297 239c9.4 9.4 9.4 24.6 0 33.9L105 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L71 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L297 239z"></path></svg>
            </a>
        </div>
        <div id="accordion">
            {foreach $faqs['Public'] as  $key => $item}
            <div class="card">
                <div class="card-header" id="heading{$key}">
                    <h5 class="mb-0 parent-accordion">
                        <i class="fa-regular fa-question"></i>
                        <button aria-controls="collapse{$key}" aria-expanded="false" autocomplete="off" class="btn btn-link collapsed w-100" data-target="#collapse{$key}" data-toggle="collapse">

                            {$item.title}
                            <i class="far fa-angle-down mL-auto"></i>
                        </button>
                    </h5>
                </div>
                <div aria-labelledby="heading{$key}" class="collapse" data-parent="#accordion" id="collapse{$key}" style="">
                    <div class="card-body">

                        {$item.content}
                </div>
                </div>

                {/foreach}


        </div>
    </div>
</section>
{/if}