{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'','limit'=> '3','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var="foreging_tour_params" value=['type'=>'','limit'=> '3','dateNow' => $dateNow, 'country' =>'external']}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}
{if !empty($internalTours)}

<section class="tour">
    <div class="container">
        <div class="title">
            <h2>شبکه</h2>
            <p>
                رحلة سياحية رائعة ومليئة بالمغامرات والاستكشاف في وجهات متميزة
            </p>
        </div>
        <div class="parent-tour">
            {foreach $internalTours as $item}
                <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="items-tour">
                    <img   src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                    <div class="parent-text-tour">
                        <div class="location-tour">
                            <h3>جولة {$item['tour_name']}</h3>
                            <div class="location-svg-name">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                <span>{$item['city']}</span>
                            </div>
                        </div>
                        <div class="price-tour">
                            <span>سعر البداية</span>
                            <h3>{$item['min_price_a']}  </h3>
                        </div>
                    </div>
                </a>
            {/foreach}



        </div>
        <div class="owl-carousel owl-theme owl-tour">
            {foreach $internalTours as $item}
            <div class="item">
                 <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}" class="items-tour">
                        <img   src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                        <div class="parent-text-tour">
                            <div class="location-tour">
                                <h3>جولة {$item['tour_name']}</h3>
                                <div class="location-svg-name">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M192 512s192-208 192-320C384 86 298 0 192 0S0 86 0 192C0 304 192 512 192 512zm0-384a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                                    <span>{$item['city']}</span>
                                </div>
                            </div>
                            <div class="price-tour">
                                <span>سعر البداية</span>
                                <h3>{$item['min_price_a']}  </h3>
                            </div>
                        </div>
                    </a>
            </div>
            {/foreach}

        </div>
    </div>
</section>
{/if}
