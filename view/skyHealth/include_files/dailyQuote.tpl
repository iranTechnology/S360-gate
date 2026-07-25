
{assign var="type_data" value=['is_active'=>1 , 'limit' =>1 , 'check_date' =>1]}
{assign var='list_daily_quote' value=$obj_main_page->getDailyQuote($type_data)}
{*{$list_daily_quote|var_dump}*}
{if $list_daily_quote[0]}
<div class="alertC bg">
    <div class="alert_main container d-flex justify-content-center align-items-center">
        <span>  {$list_daily_quote[0]['text']} <a href="{$list_daily_quote[0]['link']}">مشاهده اطلاعیه‌ها</a> </span>
        <i class="far fa-times"></i>
    </div>
</div>
{/if}