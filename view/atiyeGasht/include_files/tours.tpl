{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['limit'=> '10', 'type' =>'internal']}
{assign var="foreging_tour_params" value=['limit'=> '10','type' =>'external']}

{assign var='internalTours' value=$obj_main_page->citiesWithTour($internal_tour_params)}
{assign var='foregingTours' value=$obj_main_page->citiesWithTour($foreging_tour_params)}

{if $internalTours|count > 0 || $foregingTours|count > 0}
<section class="tour py-5">
 <div class="container d-flex flex-wrap">
  <h3 class="title col-12 p-0 mt-0">تور</h3>

  <nav class="w-100">
   <div class="nav nav-tabs" id="nav-tab_two" role="tablist">
    <a class="active" id="tour_d-tab" data-toggle="tab" href="#tour_d" role="tab" aria-controls="tour_d" aria-selected="true">داخلی</a>
    <a id="tour_kh-tab" data-toggle="tab" href="#tour_kh" role="tab" aria-controls="tour_kh" aria-selected="false">خارجی</a>
   </div>
  </nav>
  <div class="tab-content w-100" id="nav-tabContent">
   <div class="tab-pane w-100 fade show active" id="tour_d" role="tabpanel" aria-labelledby="tour_d-tab">
    <div class="col-lg-3 col-12 p-1 pt-2">
     <ul class="sidebarTour nav nav-pills m-0 p-0" id="pills-tab1" role="tablist">
      {foreach $internalTours as $key => $city}
       {if $city['tour_list']|count > 0 }
      <li class="nav-item">
       <a class=" active " id="tour_d-{$city['city']['id']}-tab" data-toggle="pill"
          href="#tour_d-{$city['city']['id']}"
          role="tab" aria-controls="tour_d-{$city['city']['id']}" aria-selected="true">
        <i class="fa-solid fa-location-dot"></i>
        {$city['city']['name']}
       </a>

      </li>
      {/if}
      {/foreach}
     </ul>
    </div>
    <div class="col-lg-9 col-12 p-1">
     <div class="tab-content" id="pills-tabContent1">
      {foreach $internalTours as $key => $city}
      <div class="mainTourDiv w-100 h-100 tab-pane fade show active" id="tour_d-{$city['city']['id']}"
           role="tabpanel" aria-labelledby="tour_d-{$city['city']['id']}-tab">

       {foreach $city['tour_list'] as $tour}

        <div class="col-lg-4 p-1">
         <a class="tour_link" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$tour['tour_slug']}">
          <div class="img_tour">
           <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$tour['tour_pic']}" alt=""></div>
          <div class="text_tour">
           <h4>{$tour['tour_name']}</h4>
           <span><i>تومان </i> {$item['min_price']|number_format} </span>
           <button> جزئیات تور <i class="fa-duotone fa-angle-left"></i></button>
          </div>
         </a>
       </div>

        {/foreach}
      </div>
      {/foreach}
     </div>
    </div>
   </div>
   <div class="tab-pane w-100 fade" id="tour_kh" role="tabpanel" aria-labelledby="tour_kh-tab">
    <div class="col-lg-3 col-12 p-1 pt-2">
     <ul class="sidebarTour nav nav-pills m-0 p-0" id="pills-tab" role="tablist">
      {foreach $foregingTours as $key => $country}
       {if $country['tour_list']|count > 0 }
       <li class="nav-item">
        <a class="active" id="pills-{$country['country']['id']}-tab" data-toggle="pill" href="#pills-{$country['country']['id']}" role="tab" aria-controls="pills-{$country['country']['id']}" aria-selected="true">
         <i class="fa-solid fa-location-dot"></i>
         {$country['country']['name']}
        </a>
       </li>
       {/if}
      {/foreach}
     </ul>
    </div>
    <div class="col-lg-9 col-12 p-1">
     <div class="tab-content" id="pills-tabContent">
      {foreach $foregingTours as $key => $country}
      <div class="mainTourDiv w-100 h-100 tab-pane fade show active"
           id="pills-{$country['country']['id']}" role="tabpanel" aria-labelledby="pills-{$country['country']['id']}-tab">
       {foreach $country['tour_list'] as $key => $tour}
       <div class="col-lg-4 p-1">
        <a class="tour_link" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$tour['tour_slug']}">
         <div class="img_tour"><img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$tour['tour_pic']}" alt=""></div>
         <div class="text_tour">
          <h4>{$tour['tour_name']}</h4>
          <span><i>تومان </i>  {$item['min_price']|number_format}</span>
          <button> جزئیات تور <i class="fa-duotone fa-angle-left"></i></button>
         </div>
        </a>
       </div>
       {/foreach}
      </div>
      {/foreach}
     </div>
    </div>
   </div>
  </div>


 </div>
</section>
{/if}