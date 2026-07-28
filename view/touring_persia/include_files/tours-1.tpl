{assign var=dateNow value=$objFunctions->dateNowMiladi()}
{assign var="tour_params_external" value=['type'=>'special','limit'=> '4','dateNow' => $dateNow, 'country' =>'internal']}
{assign var='tour_external_special' value=$obj_main_page->getToursReservation($tour_params_external)}

{assign var="min_external_external" value=0}
{assign var="max_external_external" value=4}

{if $tour_external_special|count > 0}
    <section class="i_modular_tours tour">
        <div class="container">
            <div class="title">
                <h2>Top Iran Tours</h2>
            </div>
            <div class="__tour__external__special__ parent-tour">

                {foreach $tour_external_special as $item}
                    {if $min_external_external <= $max_external_external}

                        <div class="__i_modular_nc_item_class_0 item-tour">
                            <div class="parent-video-tour">
{*                                 <video controls="" loop="loop" src="{$item['tour_video']}" type="video/mp4"></video>*}
                                {if $item['tour_video']}
                                <iframe src="{$item['tour_video']}" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                            {else}
                            <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}">
                            {/if}
                             </div>
                            <a class="parent-text-tour" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                <h3 class="__title_class__">{$item['tour_name']}</h3>
                                <p class="">

                                    {$item['description']}

                                </p>
                                <div class="data-tour">
                                    <span><span class="__day_class__">{$item['night'] + 1}</span>  days from </span>
                                    <strong> <span class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</span> rial</strong>
                                    <span class="__date_class__">{assign var="year" value=substr($item['start_date'], 0, 4)}
                                        {assign var="month" value=substr($item['start_date'], 4, 2)}
                                        {assign var="day" value=substr($item['start_date'], 6)}
                                        {$year}/{$month}/{$day}
                                                </span>
                                </div>
                                <button>

                                    See holiday details

                                </button>
                            </a>
                        </div>

                        {$min_external_external = $min_external_external + 1}
                    {/if}
                {/foreach}





            </div>
            <div class="__tour__external__special__ owl-carousel owl-theme tour-owl">

                {foreach $tour_external_special as $item}
                    {if $min_external_external <= $max_external_external}

                        <div class="__i_modular_nc_item_class_0 item">
                            <div class="item-tour">
                                <div class="parent-video-tour">
                                    <video controls="" loop="loop" src="project_files/video/japon.mp4" type="video/mp4"></video>
                                </div>
                                <a class="parent-text-tour" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                                    <h3 class="__title_class__">{$item['tour_name']}</h3>
                                    <p class="__description_class__">

                                        The tranquillity of Lake Kariba is enhanced by an exclusive boat cruise and a lantern-lit dinner beside a vintage safari tram.

                                    </p>
                                    <div class="data-tour">
                                        <span><span class="__day_class__">{$item['night'] + 1}</span>  days from </span>
                                        <strong> <span class="___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</span> $</strong>
                                        <span class="__date_class__">{assign var="year" value=substr($item['start_date'], 0, 4)}
                                            {assign var="month" value=substr($item['start_date'], 4, 2)}
                                            {assign var="day" value=substr($item['start_date'], 6)}
                                            {$year}/{$month}/{$day}
                                                </span>
                                    </div>
                                    <button>

                                        See holiday details

                                    </button>
                                </a>
                            </div>
                        </div>

                        {$min_external_external = $min_external_external + 1}
                    {/if}
                {/foreach}





            </div>
            <div class="parent-btn-more">
                <a class="btn-more" href="{$smarty.const.ROOT_ADDRESS}/page/tour">

                    See more

                </a>
            </div>
        </div>
    </section>
{/if}