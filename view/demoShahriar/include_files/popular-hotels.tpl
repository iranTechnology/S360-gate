{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{load_presentation_object filename="reservationHotel" assign="objHotelCity"}
{assign var="list_city_hotel" value=$objHotelCity->cityHotelMain()}


{if $list_city_hotel}

<section class="popular-hotels">
    <div class="container">
        <div class="title">
            <h5>هتل های محبوب</h5>
        </div>
        <div class="grid-popular-hotels">
            {foreach $list_city_hotel as $key=>$item}
                {if $key<8}

            <a href="{$smarty.const.ROOT_ADDRESS}/searchHotel&type=new&city={$item['id']}&startDate={$objDate->jtoday()}&nights=3&rooms=R:2-0-0">
                <div class="parent-img-popular-hotels">
                    <img alt="{$item['city_name']}" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/cityPic/{$item.city_name_en}.jpg"/>
                </div>
                <div class="parent-text-popular-hotels">
                    <h4>هتل های {$item['city_name']}</h4>
                    <span>رزرو آنلاین</span>
                </div>
            </a>
            {/if}
                {/foreach}
        </div>
    </div>
</section>
{/if}