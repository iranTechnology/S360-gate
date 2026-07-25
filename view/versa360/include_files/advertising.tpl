{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="advertises" value=$objFunctions->getConfigContentByTitle('home_page_advertise')}
{if !empty($advertises) }

    <section class="advertising">
        <div class="container">
            <div class="owl-carousel owl-theme owl-tablighat">
                {foreach $advertises as $item}
                <div class="item">
                        <img class="about-img" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$item['image']}" alt="{$item['title']}">
                </div>
                {/foreach}
            </div>
        </div>
    </section>
{/if}