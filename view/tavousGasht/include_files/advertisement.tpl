{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="advertises" value=$objFunctions->getConfigContentByTitle('home_page_advertise')}
{if !empty($advertises) }
<section class="banner-ads">
    {foreach $advertises as $key => $item}
    {if $key == 0}
        <div class="container">
            {$item['content']}
        </div>
    {/if}
    {/foreach}

</section>
{/if}