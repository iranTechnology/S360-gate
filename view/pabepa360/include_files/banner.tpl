{assign var="type_data" value=['is_active'=>1 , 'limit' =>1]}
{assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
{assign var="banner" value=$banners[0]}
<section class="banner">
    <picture>
        <source media="(min-width:1200px)" srcset="{$banner['pic']}">
        <source media="(min-width:760px)" srcset="{$banner['pic_medium']}">
        <img src="{$banner['pic_thumb']}" alt="{$banner['title']}" style="width:100%;">
    </picture>
    <div class="titel-banner">
        <h3>آژانس هواپیمایی پا به پا سفر 🏝️ </h3>
        <span> تور خارجی و داخلی + رزرو بلیط و هتل </span>
{*        <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/1-all/all-all/all/15" class="more_banner">*}
{*            ناکجا*}
{*        </a>*}
    </div>

</section>
