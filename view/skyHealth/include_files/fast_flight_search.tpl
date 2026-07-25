

{assign var="params" value=['limit'=>'6','is_group'=>true]}
{assign var="cities" value=$obj_main_page->dataFastSearchInternalFlight($params)}
{assign var="foreign_cities" value=['IKA','DXBALL','ISTALL','KUL', 'MOWALL' , 'NJF' , 'TBS']}
{assign var="__local_max_var__" value=6}
<section class="tour_ttitr container mt-4 mb-3">
    <div>جستجوی سریع پرواز</div>
</section>
<section class="i_modular_fast_search_flight first_sec container">
<div class="main_sec mt-2">

{assign var="i" value="1"}
{foreach $cities['cities_flight'] as $city}
{if $i < $__local_max_var__ }
<div class="box_sec_first flex-column align-items-start justify-content-center p-{$city['Departure_Code']}">
    <h6>بلیط هواپیما از مبدأ  {$city['main']['Departure_CityFa']}</h6>
    {foreach $city['sub_cities'] as $sub_city}
    <a class=" flightSearchBox" href="javascript:" data-target="#calenderBox" data-toggle="modal" onclick="calenderFlightSearch('{$city['main']['Departure_Code']}','{$sub_city['Departure_Code']}')">پرواز به {$sub_city['Departure_CityFa']}</a>
    {/foreach}
</div>
{/if}
    {$i =  $i + 1}
{/foreach}

</div>
</section>