{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="advertises" value=$objFunctions->getConfigContentByTitle('home_page_advertise')}
{if !empty($advertises) }
<section class="discount">
    <div class="container">
        <div class="parent-discount">
            {foreach $advertises as $item}
                <a class='item-discount' href="javascript:">
                    <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$item['image']}" alt="{$item['title']}">
                </a>
            {/foreach}
        </div>
    </div>
</section>
{/if}
