{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="foregin_tour_params" value=['type'=>'','limit'=> '3','dateNow' => $dateNow,'category' => '40']}
{assign var='foregin_tours' value=$obj_main_page->getToursReservation($foregin_tour_params)}

{if !empty($internal_tours) || !empty($foregin_tours)}
<section class="special_tour_banner pb-5 my-5 mt-4">
    <div class="container">
        <!--            <h2 class="title"> تور های ویژه </h2>-->
        <h3> تورهای پاییزه ترنج گشت </h3>
        <div class="special_tour_main_banner mt-4">
            {foreach $foregin_tours as $item}

                <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
                    <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"
                         alt="{$item['tour_name']}" >
                </a>
            {/foreach}
        </div>
    </div>
</section>
{/if}