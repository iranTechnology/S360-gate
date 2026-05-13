{assign var="data_search_recommendation" value=['limit' =>6]}
{assign var='recommendations' value=$obj_main_page->getRecommendationPosition($data_search_recommendation)}
<section class="Comments">
    <div class="newsletterMain">
        <div class="container">
            <div>
                <div class="parent-Comments">
                    <h2>نظرات</h2>
                    <div class="owl-carousel owl-theme owl-Comments">
                        {foreach $recommendations as $key => $recommendation}

                        <div class="item-Comments">
                            <i class="fa-solid fa-quote-left"></i>
                            <p>
                                {$recommendation['content']}
                            </p>
                        </div>
                        {/foreach}

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
