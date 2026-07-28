{assign var="type_data" value=['is_active'=>1 , 'limit' =>1 , 'check_date' =>1]}
{assign var='list_daily_quote' value=$obj_main_page->getDailyQuote($type_data)}
{if $list_daily_quote[0]}
<div class="text-day">
    <div class="parent-text-day">
        <div class="ticker">
            <ul class="ticker_list">
                <li class="ticker_item">{$list_daily_quote[0]['text']}</li>
            </ul>
        </div>
        <i onclick="removeElement()" class="fa-regular fa-xmark delete-text-day"></i>
    </div>
</div>
{/if}
