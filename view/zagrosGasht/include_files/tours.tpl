

{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="special_tour_params" value=['type'=>'special','limit'=> '4','dateNow' => $dateNow]}

{assign var='special_tours' value=$obj_main_page->getToursReservation($special_tour_params)}

{assign var="internal_tour_params" value=['type'=>'','limit'=> '6','dateNow' => $dateNow, 'country' =>'internal']}
{assign var="foreging_tour_params" value=['type'=>'','limit'=> '6','dateNow' => $dateNow, 'country' =>'external']}

{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}
                    
<section class="tour-section i_modular_tours">
<div class="container">
<div class="title">
<h5>تورهای داخلی و خارجی</h5>
</div>
<div class="parent-data-tour-tab-demo __tour__">
<ul class="nav nav-pills" id="pills-tab" role="tablist">
<li class="nav-item" role="presentation">
<button aria-controls="tour-dakheli-demo" aria-selected="true" class="nav-link active" data-target="#tour-dakheli-demo" data-toggle="pill" id="tab-tour-dakheli-demo" role="tab" type="button"> داخلی

                        </button>
</li>
<li class="nav-item" role="presentation">
<button aria-controls="tour-khareji-demo" aria-selected="false" class="nav-link" data-target="#tour-khareji-demo" data-toggle="pill" id="tab-tour-khareji-demo" role="tab" type="button"> خارجی

                        </button>
</li>
</ul>
<div class="parent-tab-tour __tour__">
<div class="tab-content" id="pills-tabContent">
<div aria-labelledby="tab-tour-dakheli-demo" class="tab-pane fade show active" id="tour-dakheli-demo" role="tabpanel">
<div class="__tour__internal__ owl-carousel owl-theme owl-tour">

                        {foreach $internalTours as $item}

                        
<div class="__i_modular_nc_item_class_0 item">
<a class="__link__" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
<img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
<div class="box-location-price">
<div class="parent-location">
<h4 class="__title_class__">{$item['tour_name']}</h4>
<div class="city-tour">
<svg viewbox="0 0 384 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path></svg>
<span class="__city_class__">{$item['destination_city_name']}</span>
</div>
</div>
<div class="parent-price">
<div class="___price_class__ price-tour">{$item['min_price']['discountedMinPriceR']|number_format}</div>
<span class="night __night_class__">{$item['night']} شب</span>
</div>
</div>
</a>
</div>
                        {/foreach}

</div>
</div>
<div aria-labelledby="tab-tour-khareji-demo" class="tab-pane fade" id="tour-khareji-demo" role="tabpanel">
<div class="__tour__external__ owl-carousel owl-theme owl-tour">

                        {foreach $foreginTours as $item}

<div class="__i_modular_nc_item_class_0 item">
<a class="__link__" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
<img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
<div class="box-location-price">
<div class="parent-location">
<h4 class="__title_class__">{$item['tour_name']}</h4>
<div class="city-tour">
<svg viewbox="0 0 384 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 192c0-79.5-64.5-144-144-144S48 112.5 48 192c0 12.4 4.5 31.6 15.3 57.2c10.5 24.8 25.4 52.2 42.5 79.9c28.5 46.2 61.5 90.8 86.2 122.6c24.8-31.8 57.8-76.4 86.2-122.6c17.1-27.7 32-55.1 42.5-79.9C331.5 223.6 336 204.4 336 192zm48 0c0 87.4-117 243-168.3 307.2c-12.3 15.3-35.1 15.3-47.4 0C117 435 0 279.4 0 192C0 86 86 0 192 0S384 86 384 192zm-160 0a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zm-112 0a80 80 0 1 1 160 0 80 80 0 1 1 -160 0z"></path></svg>
<span class="__city_class__">{$item['destination_city_name']}</span>
</div>
</div>
<div class="parent-price">
<div class="___price_class__ price-tour">{$item['min_price']['discountedMinPriceR']|number_format}</div>
<span class="night __night_class__">{$item['night']} شب</span>
</div>
</div>
</a>
</div>
                        {/foreach}
                        




</div>
</div>
</div>
</div>
</div>
</div>
</section>
