{load_presentation_object filename="faqs" assign="faqs"}
{assign var="getServices" value=$faqs->getServices(True)}

{assign var="selectedServices" value=[]}
{foreach $getServices as $key => $item}
    {if $key == 'Public' || $key == 'Flight' || $key == 'Hotel' || $key == 'Tour' || $key == 'Bus' || $key == 'Train'}
        {append var="selectedServices" value=$item index=$key}
    {/if}
{/foreach}

{assign var="data_search" value=['service'=>$selectedServices]}
{assign var='faqsList' value=$obj_main_page->faqsPositionMain($data_search)}


{if count($selectedServices) > 0}
    <section class="Terms_Conditions">
        <div class="container">

            <div class="titr_Terms_Conditions">
                <div class="title-safiran">
                    <div class="text-title-safiran">
                        <h2>سوالات متداول</h2>
                    </div>

                    <ul class="nav nav-pills" role="tablist">

                        {assign var="tabCount" value=0}

                        {foreach $selectedServices as $key => $service}

                            {if isset($faqsList[$key]) && count($faqsList[$key]) > 0 && $tabCount < 4}

                                <li class="nav-item">

                                    <button class="nav-link {if $tabCount == 0}active{/if}"
                                            id="tab-{$key}"
                                            data-toggle="pill"
                                            data-target="#pane-{$key}"
                                            type="button"
                                            role="tab">

                                        {$service.Title}

                                    </button>

                                </li>

                                {assign var="tabCount" value=$tabCount+1}

                            {/if}

                        {/foreach}

                    </ul>
                </div>
            </div>

            <div class="tab_Terms_Conditions">
                <div class="tab-content">

                    {assign var="paneCount" value=0}

                    {foreach $selectedServices as $key => $service}

                        {if isset($faqsList[$key]) && count($faqsList[$key]) > 0 && $paneCount < 4}

                            <div class="tab-pane fade {if $paneCount == 0}show active{/if}"
                                 id="pane-{$key}"
                                 role="tabpanel">

                                <div class="accordion my_accordion" id="accordion-{$key}">

                                    {foreach $faqsList[$key] as $index => $item}

                                        {if $index < 6}

                                            <div class="card">

                                                <div class="card-header" id="heading-{$key}-{$index}">

                                                    <h2 class="mb-0">

                                                        <button class="btn btn-link btn-block text-right btn_accordion btn_questions collapsed"
                                                                type="button"
                                                                data-toggle="collapse"
                                                                data-target="#collapse-{$key}-{$index}">

                                                            {$item.title}

                                                            <i class="far fa-angle-down rot_revers"></i>

                                                        </button>

                                                    </h2>

                                                </div>

                                                <div id="collapse-{$key}-{$index}"
                                                     class="collapse"
                                                     data-parent="#accordion-{$key}">

                                                    <div class="card-body">

                                                        <div style="text-align:right;">
<span style="font-size:12pt;">
{$item.content}
</span>
                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        {/if}

                                    {/foreach}

                                </div>
                            </div>

                            {assign var="paneCount" value=$paneCount+1}

                        {/if}

                    {/foreach}

                </div>
            </div>

        </div>
    </section>
{/if}
