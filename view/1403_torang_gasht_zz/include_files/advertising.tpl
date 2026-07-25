{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="advertises" value=$objFunctions->getConfigContentByTitle('home_page_advertise')}

{if !empty($advertises) }
    <section class="ads container my-5">

        <div class="owl_ads">
            {foreach $advertises as $item}

                <a href="{$item['link']}">
                <img class="about-img" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$item['image']}" alt="{$item['title']}">
                </a>
            {/foreach}
        </div>
    </section>
{/if}