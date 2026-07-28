{assign var="data_search_public" value=['service'=>'Public','limit'=> 5]}
{assign var='faqs' value=$obj_main_page->faqsPosition($data_search_public)}

{if $faqs|count > 0}
    <section class="your-question">
        <div class="container">
            <div class="title-safiran">
                <div class="text-title-safiran">
                    <h2>سوالات متداول</h2>
                </div>
            </div>
            <div id="accordion">
                {foreach $faqs as $key => $faq}
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0 parent-accordion">
                                <i class="fa-regular fa-question"></i>
                                <button aria-controls="collapse{$faq['id']}"
                                        aria-expanded="false"
                                        autocomplete="off"
                                        class="btn btn-link collapsed w-100"
                                        data-target="#collapse{$faq['id']}"
                                        data-toggle="collapse">
                                    {$faq['title']}
                                    <i class="far fa-angle-down mL-auto"></i>
                                </button>
                            </h5>
                        </div>
                        <div aria-labelledby="heading{$faq['id']}"
                             class="collapse"
                             data-parent="#accordion"
                             id="collapse{$faq['id']}"
                             style="">
                            <div class="card-body">
                                {$faq['content']}
                            </div>
                        </div>
                    </div>
                {/foreach}

            </div>
            <div class="bg-btn-karvan mx-auto mt-4">
                <a class="btn-karvan" href="{$smarty.const.ROOT_ADDRESS}/faq">
                    <span>بیشتر</span>
                    <i class="fa-solid fa-arrow-left mr-3"></i>
                </a>
            </div>
        </div>
    </section>
{/if}