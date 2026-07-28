{assign var="data_search_public" value=['service'=>'Public','limit'=> 20]}
{assign var='faqs' value=$obj_main_page->faqsPosition($data_search_public)}

{if $faqs|count > 0}
    <section class="your-question">
        <div class="container">
            <div class=" Titr-heading">
                <div class="icon-titr">
                    <!--                    <img src="./images/question.png" alt="icon">-->
                    <i class="fa-regular fa-circle-question"></i>
                </div>
                <div class=" d-flex align-items-center justify-content-center">
                    <h2>پرسش های شما</h2>
                </div>
            </div>
            <div id="accordion">
                {foreach $faqs as $key => $faq}
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0 parent-accordion">
                                <i class="fa-regular fa-question"></i>
                                <button class="btn btn-link collapsed w-100" data-toggle="collapse" data-target="#collapseOne-{$faq['id']}" aria-expanded="false" aria-controls="collapseOne-{$faq['id']}" autocomplete="off">
                                    {$faq['title']}
                                    <i class="far fa-angle-down mr-auto"></i>
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne-{$faq['id']}" class="collapse" aria-labelledby="headingOne-{$faq['id']}" data-parent="#accordion" style="">
                            <div class="card-body">
                                {$faq['content']}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </section>
{/if}

