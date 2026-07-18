{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="advertises" value=$objFunctions->getConfigContentByTitle('home_page_advertise')}
{if !empty($advertises) }

<section class="i_modular_adds advertising">
    <div class="container">
        <div class="advertising-parent">
            <div class="owl-carousel owl-theme owl-advertising">
                {foreach $advertises as $key => $item}
                        <div class="__i_modular_nc_item_class_0 item">
                            {$item['content']}
                        </div>
                {/foreach}
            </div>
        </div>
    </div>
</section>
{/if}
