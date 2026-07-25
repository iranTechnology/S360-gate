
{assign var="params" value=['limit'=>'7','is_group'=>true , 'use_customer_db' => true]}
{assign var="cities" value=$obj_main_page->dataFastSearchInternalFlight($params)}
{assign var="foreign_cities" value=['IKA','DXBALL','ISTALL','KUL', 'MOWALL' , 'NJF' , 'TBS']}
{assign var="__local_max_var__" value=6}

<section class="i_modular_fast_search_flight search_flight d-flex">
    <div class="container">
        <div class="title">
            <div class="title-text">
                <h3>Safeer Aliraq</h3>
                <h2>QUICK FLIGHT SEARCH</h2>
            </div>
{*            <a class="read-more" href="{$smarty.const.ROOT_ADDRESS}">*}
{*                <span>View more</span>*}
{*                <svg viewbox="0 0 320 512" xmlns="http://www.w3.org/2000/svg">*}
{*                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->*}
{*                    <path d="M297 239c9.4 9.4 9.4 24.6 0 33.9L105 465c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l175-175L71 81c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L297 239z"></path>*}
{*                </svg>*}
{*            </a>*}
        </div>
        <div class="tab-content" id="search_flight-tabContent">
            <div aria-labelledby="search_flight_internal-tab" class="__fast_flight_search__internal__multi_city__ tab-pane fade show active" id="search_flight_internal" role="tabpanel">
                <ul class="__origin__cities__ nav nav-pills m-0 p-0" id="search_flight_internal-div-tab" role="tablist">
                    {assign var="i" value="1"}
                    {foreach $cities['cities_flight'] as $city}
                        {if $i < $__local_max_var__ }

                            <li class="__i_modular_nc_item_class_0 nav-item" role="presentation">
                                <button aria-controls="{$city['main']['Departure_CityEn']}" aria-selected="true" class="__button__ nav-link {if $i==1} show active {/if}" data-target="#{$city['main']['Departure_CityEn']}" data-toggle="pill" id="{$city['main']['Departure_CityEn']}-tab" role="tab" type="button">{$city['main']['Departure_CityEn']}</button>
                            </li>

                        {/if}
                        {$i =  $i + 1}
                    {/foreach}








                </ul>
                <div class="__destination__cities__ tab-content" id="search_flight_internal-div-tabContent">
                    {assign var="i" value="1"}
                    {foreach $cities['cities_flight'] as $city}
                        {if $i < $__local_max_var__ }

                            <div aria-labelledby="{$city['main']['Departure_CityEn']}-tab" class="__i_modular_nc_item_class_0 tab-pane fade {if $i==1} show active {/if}" id="{$city['main']['Departure_CityEn']}" role="tabpanel">
                                <div class="search_flight_grid">

                                    {foreach $city['sub_cities'] as $sub_city}

                                        <div class="__final_destination_0 flightSearchBox" data-target="#calenderBox" data-toggle="modal"
                                             onclick="calenderFlightSearch('{$city['main']['Departure_Code']}','{$sub_city['Departure_Code']}')">
                                            <h5 class="__origin__ col-4 text-right">{$city['main']['Departure_CityEn']}</h5>
                                            <div class="col-4 d-flex justify-content-center flex-row-reverse rot180">
                                                <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256z"></path></svg>
                                                <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256z"></path></svg>
                                                <svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256z"></path></svg>
                                                <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M576 256C576 305 502.1 336 464.2 336H382.2L282.4 496C276.4 506 266.4 512 254.4 512H189.5C179.5 512 169.5 508 163.5 500C157.6 492 155.6 480.1 158.6 471L201.5 336H152.5L113.6 388C107.6 396 98.61 400 88.62 400H31.7C22.72 400 12.73 396 6.74 388C.7485 380-1.248 370 1.747 360L31.7 256L.7488 152C-1.248 143 .7488 133 6.74 125C12.73 117 22.72 112 31.7 112H88.62C98.61 112 107.6 117 113.6 125L152.5 176H201.5L158.6 41C155.6 32 157.6 21 163.5 13C169.5 5 179.5 0 189.5 0H254.4C265.4 0 277.4 7 281.4 16L381.2 176H463.2C502.1 176 576 208 576 256H576zM527.1 256C525.1 246 489.1 224 463.2 224H355.3L245.4 48H211.5L266.4 224H128.6L80.63 160H53.67L81.63 256L53.67 352H80.63L128.6 288H266.4L211.5 464H245.4L355.3 288H463.2C490.1 288 526.1 267 527.1 256V256z"></path></svg>
                                            </div>
                                            <h5 class="__destination__ col-4">{$sub_city['Departure_CityEn']}</h5>
                                        </div>

                                    {/foreach}






                                </div>
                            </div>

                        {/if}
                        {$i =  $i + 1}
                    {/foreach}



                </div>
            </div>
        </div>
    </div>
</section>