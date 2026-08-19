<template>
  <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 parvaz-sidebar col-padding-5">
    <div class="parent_sidebar">
      <div class="currency-gds" v-if="data_search && data_search.is_currency > 0" @click="showListCurrencyExist()">
        <div class="currency-inner DivDefaultCurrency">
          <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/Iran.png`" alt="" id="IconDefaultCurrency"
               v-if="currency_info ===''">
          <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/${currency_info.CurrencyFlag}`" alt=""
               id="IconDefaultCurrency" v-else>
          <span class="TitleDefaultCurrency" id="TitleDefaultCurrency">  {{ currency_title}}</span>
          <span class="currency-arrow"></span>
        </div>

        <div class="change-currency show-currency" v-show="is_show_currency_list">
          <div class="change-currency-inner">
            <div class="change-currency-item main" @click="ConvertCurrency('0','Iran.png','ریال ایران')">
              <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/Iran.png`" alt="">
              <span>{{useXmltag('Rial')}}</span>
            </div>

            <template v-for="currency in list_currency">
              <div class="change-currency-item"
                   @click="ConvertCurrency(currency.CurrencyCode,currency.CurrencyFlag,currency.CurrencyTitle)">
                <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/${currency.CurrencyFlag}`"
                     alt="">
                <span>{{currency.CurrencyTitle}}</span>
              </div>
            </template>
            <!---->
          </div>
        </div>
      </div>
      <div class="filter_airline_flight">
        <div class="filtertip parvaz-filter-change site-bg-main-color site-bg-color-border-bottom ">
          <a v-if="today_date"
             :href="`${amadeusPathByLang()}search-flight/1/${data_search.origin}-${data_search.destination}/${dataSearch.prev}/Y/${data_search.adult}-${data_search.child}-${data_search.infant}`">
                       <span class=" chooseiconDay icons tooltipWeighDay right site-border-text-color">
                           <i class="zmdi zmdi-chevron-right iconDay site-secondary-text-color"></i>
                           <span class="tooltiptextWeightDay"> {{ useXmltag('Previousday') }} </span>
                       </span>
          </a>
          <a v-else v-on:click.prevent.stop="" href="#">
                           <span class=" chooseiconDay icons tooltipWeighDay right site-border-text-color">
                               <i class="zmdi zmdi-chevron-right iconDay site-secondary-text-color"></i>
                               <span class="tooltiptextWeightDay"> {{ useXmltag('Previousday') }} </span>
                            </span>
          </a>
          <div class="tip-content ">
            <p class="">
              <span class=" bold counthotel">{{ data_search.name_departure}}</span>
              {{ useXmltag('On') }}
              <span class=" bold counthotel">{{ data_search.name_arrival}}</span>
            </p>
            <p class="counthotel txt12 mt-2">{{data_search.DateFlightWithName}} </p>
            <p class="counthotel text-center txt12 dir-ltr" v-if="this.isPersianDate(data_search.departureDate)">{{this.formatDate(data_search.departure_date_en)}} </p>
            <p class="counthotel text-center text-sm-flight dir-ltr" v-else>{{this.formatDatePersian(data_search.departureDate)}}</p>

            <div class="silence_span ph-item2" v-if="countFlights > 0">{{ countFlights }} {{
              useXmltag('NumberFlightFound')}}
            </div>
          </div>
          <a v-if="today_date"
             :href="`${amadeusPathByLang()}search-flight/1/${data_search.origin}-${data_search.destination}/${dataSearch.next}/Y/${data_search.adult}-${data_search.child}-${data_search.infant}`">
                       <span class="chooseiconDay icons tooltipWeighDay left site-border-text-color">
                           <i class="zmdi zmdi-chevron-left iconDay site-secondary-text-color">
                           </i>
                               <span class="tooltiptextWeightDay">  {{ useXmltag('Nextday') }}  </span>
                       </span>
          </a>
          <a v-else v-on:click.prevent.stop="" href="#">
                     <span class="chooseiconDay icons tooltipWeighDay left site-border-text-color">
                       <i class="zmdi zmdi-chevron-left iconDay site-secondary-text-color">
                       </i>
                           <span class="tooltiptextWeightDay">  {{ useXmltag('Nextday') }}  </span>
                   </span>
          </a>
          <div class="open-sidebar-parvaz " @click="showSearchBoxTicket()">

            {{ useXmltag('ChangeSearchType') }}
          </div>
        </div>

      </div>
      <!-- search box -->
      <div class=" s-u-update-popup-change">
        <form class="search-wrapper" action="" method="post">
          <div class="displayib padr20 padl20">
            <div class="ways_btns">
              <div @click="changeWays_('Oneway')" class="radiobtn Oneway">
                <input type="radio" id="huey" name="drone" value="huey"
                       :checked="(multi_way==false) ? 'checked' : ''">
                <label class=" site-bg-main-color-before" for="huey">
                  <i v-html="svg_icon_2"></i>
                  {{ useXmltag('Oneway') }}
                </label>
              </div>
              <div @click="changeWays_('Twoway')" class="radiobtn Twoway  ">
                <input type="radio" id="dewey" name="drone" value="dewey"
                       :checked="(multi_way) ? 'checked' : ''"
                       :class="(multi_way) ? 'checked' : ''" class="multiWays">
                <label class="site-bg-main-color-before" for="dewey">
                  <i v-html="svg_icon_1"></i>
                  {{ useXmltag('Twoway') }}

                </label>
              </div>
            </div>
          </div>

          <div class="d-flex flex-wrap align-items-center position-relative">
            <div class="s-u-form-block s-u-num-inp s-u-num-inp-change position-relative">
               <div class="s-u-in-out-wrapper raft raft-change change-bor position-relative">

                  <!-- INPUT -->
                  <input
                     id="search_origin_local"
                     class="select option1 selectOneFlightVue search-box-selectOneFlightVue inputSearchForeign"
                     type="text"
                     ref="origin"
                     :lang="`${getLang()}`"
                     v-model="title_origin_city_search"
                     name="origin"
                     @keyup="searchCity"
                     @focus="focusSearchCity"
                     @click.stop="dropBox('origin')"
                  >

                  <!-- CLEAR (×) -->
                  <span
                     v-if="title_origin_city_search"
                     class="clear-input"
                     @click.stop="clearOriginInput"
                     title="Clear"
                  >
                   ×
                 </span>

                  <!-- LOADER -->
                  <img
                     :src="`${getUrlWithoutLang()}view/client/assets/images/load.gif`"
                     id="LoaderForeignDep"
                     name="LoaderForeignDep"
                     class="loaderSearch"
                     v-show="search_origin_loading"
                  >

                  <!-- HIDDEN IATA -->
                  <input
                     id="origin_local"
                     type="hidden"
                     v-model="iata_origin"
                     name="origin"
                  >

                  <!-- POPULAR / HISTORY -->
                  <div v-if="(cities_origin.length == 0 && title_origin_city_search == '') || show_popular">
                     <ul class="resultFlight_international search-box-resultFlight" v-show="is_search">

                        <div class="parent-titr" v-if="stored_origin_cities && stored_origin_cities.length > 0">
                           <span>{{ useXmltag('History') }}</span>
                           <span class="delete-pointer" @click.stop="clearSearchedCities('arrival')">
          {{ useXmltag('Clear') }}
        </span>
                        </div>

                        <li
                           v-for="city in stored_origin_cities"
                           :key="city.Departure_Code"
                           @click.stop="selectAirportOrigin(city, getLang())"
                        >
                           <i class="fa fa-clock-o my-icon-loction margin-left-5 margin-right-5"></i>
                           {{ city[`Departure_City${getLang().charAt(0).toUpperCase() + getLang().slice(1)}`] }}
                           ({{ city.Departure_Code }})
                        </li>

                        <span>{{ useXmltag('PopularRoutes') }}</span>

                        <li
                           v-for="city in $store.state.popular_internal_flights"
                           :key="city.Departure_Code"
                           @click.stop="selectAirportOrigin(city, getLang())"
                        >
                           <i class="fa fa-map-marker my-icon-loction margin-left-5 margin-right-5"></i>
                           {{ city[`Departure_City${getLang().charAt(0).toUpperCase() + getLang().slice(1)}`] }}
                           ({{ city.Departure_Code }})
                        </li>

                     </ul>
                  </div>

                  <!-- SEARCH RESULT -->
                  <div v-else>
                     <ul class="resultFlight_international search-box-resultFlight" v-show="is_search">
                        <li
                           v-for="city in cities_origin"
                           :key="city.Departure_Code"
                           @click.stop="selectAirportOrigin(city, getLang())"
                        >
                           <i class="fa fa-map-marker my-icon-loction margin-left-5 margin-right-5"></i>
                           {{ city[`Departure_City${getLang().charAt(0).toUpperCase() + getLang().slice(1)}`] }}
                           ({{ city.Departure_Code }})
                        </li>
                     </ul>
                  </div>

               </div>
            </div>
            <div class="swap-flight-box search-box-swap-flight-box" @click="reversDestinations()">
              <span class="swap-flight-search-box-new"><i class="zmdi zmdi-swap site-main-text-color"></i></span>
            </div>
            <div class="s-u-form-block s-u-num-inp s-u-num-inp-change bargasht bargasht-change change-bor position-relative">
              <div class="s-u-in-out-wrapper ">
                <input id="destination_city" class="inputSearchForeign search-box-inputSearchForeign" type="text"
                       v-model="title_arrival_city_search" :lang="`${getLang()}`"
                       ref='arrival' name="destination"
                       @keyup="searchCityArrival"  @focus="focusSearchArrivalCity"
                       @click.stop="dropBox('arrival')">
                    <span
                       v-if="title_arrival_city_search"
                       class="clear-input"
                       @click.stop="clearArrivalInput"
                       title="Clear"
                    >
                  ×
                  </span>
                <img :src="`${getUrlWithoutLang()}view/client/assets/images/load.gif`" id="LoaderForeignReturn" name="LoaderForeignReturn"
                     class="loaderSearch" v-if="search_arrival_loading">
                <input id="destination_local" class="" type="hidden" v-model="iata_arrival"
                       name="destination_local">
                <div v-if="(cities_arrival.length == 0 & title_arrival_city_search == '') || show_arrival_popular">

                  <ul class="resultFlight_international search-box-resultFlight" v-show="is_arrival_search">
                    <div class='parent-titr' v-if="stored_arrival_cities && stored_arrival_cities.length > 0 ">
                      <span> {{ useXmltag('History') }}</span>
                      <span class='delete-pointer' @click.stop="clearSearchedCities('origin')">
                         {{ useXmltag('Clear') }}
                      </span>
                    </div>
                    <li v-for="city in stored_arrival_cities" @click.stop="selectAirportArrival(city,getLang())">
                      <i class="fa fa fa-clock-o my-icon-loction   margin-left-5 margin-right-5"></i>
                      {{ city[`Departure_City${getLang().charAt(0).toUpperCase() + getLang().slice(1)}`] }}
                      ({{ city[`Departure_Code`] }})
                    </li>
                    <span>{{ useXmltag('PopularRoutes') }}</span>
                    <li v-for="city in $store.state.popular_internal_flights" @click.stop="selectAirportArrival(city,getLang())">
                      <i class="fa fa-map-marker my-icon-loction   margin-left-5 margin-right-5"></i>
                      {{ city[`Departure_City${getLang().charAt(0).toUpperCase() + getLang().slice(1)}`] }}
                      ({{ city[`Departure_Code`] }})
                    </li>
                  </ul>
                </div>
                <div v-else>
                  <ul class="resultFlight_international search-box-resultFlight" v-show="is_arrival_search">
                    <li v-for="city in cities_arrival" @click.stop="selectAirportArrival(city,getLang())">
                      <i class=" fa fa-map-marker my-icon-loction   margin-left-5 margin-right-5"></i>
                      {{ city[`Departure_City${getLang().charAt(0).toUpperCase() + getLang().slice(1)}`] }}
                      ({{ city[`Departure_Code`] }})
                    </li>
                  </ul>
                </div>

              </div>
            </div>
          </div>


          <div class="s-u-form-block s-u-num-inp s-u-num-inp-change width100 ">
            <div class="s-u-form-date-wrapper">
              <div class="s-u-date-pick">
                <div class="s-u-jalali s-u-jalali-change calender-overflow-inherit date-picker-internal-flight">
                  <i class="zmdi zmdi-calendar-note site-main-text-color"></i>

                  <template>
                    <date-picker v-model="date_departure" :inputFormat="!isPersianDate(data_search.departureDate) ? 'YYYY-MM-DD' : format_datepicker"
                                 :auto-submit="true" :locale="!isPersianDate(data_search.departureDate) ? 'en' : lang_datepicker"
                                 :from="dateNow('-')"
                                 mode="single"
                                 :column="1"
                                 name="dept_date"
                                 id="dept_date_local" :styles="styles"
                                 :position="'bottom'"
                                 :auto-position="false"

                    >
                      <template #icon></template>
                    </date-picker>
                    <div class="ml-2 flight-date-mildai" v-if="dateGregorianDept">

                      ({{dateGregorianDept }})


                    </div>


                  </template>

                </div>
              </div>
            </div>

          </div>


          <div class="s-u-form-block s-u-num-inp s-u-num-inp-change width100"
               :class="(multi_way) ? 'showHidden' :'hidden'">
            <div class="s-u-form-date-wrapper">
              <div class="s-u-date-pick">
                <div class="s-u-jalali s-u-jalali-change calender-overflow-inherit date-picker-international-flight ">
                  <i class="zmdi zmdi-calendar-note site-main-text-color"></i>

                  <template>
                    <date-picker v-model="date_return" :inputFormat="!isPersianDate(data_search.departureDate) ? 'YYYY-MM-DD' : format_datepicker"
                                 :auto-submit="true"
                                 :column="1"
                                 mode="single" :locale="!isPersianDate(data_search.departureDate) ? 'en' : lang_datepicker"
                                 :placeholder="`${useXmltag('Returndate')}`" name="dept_date_return"
                                 id="dept_date_local_return"  :styles="styles"
                                 :position="'bottom'"
                                 :auto-position="false"
                    >
                      <template #icon></template>

                    </date-picker>
                    <div class="ml-2 flight-date-mildai" v-if="dateGregorianReturn">
                      ({{ dateGregorianReturn }})
                    </div>



                  </template>
                </div>
              </div>
            </div>
          </div>
          <div class="number_passengers">
            <div class="s-u-form-block s-u-num-inp s-u-num-inp-change width100">
              <div class="s-u-form-input-wrapper">
                <p class="s-u-number-input  s-u-number-input-change  inp-adt inp-adt-change">
                  <i class="plus zmdi zmdi-plus-circle site-main-text-color-h "
                     id="add1"></i>
                  <span>
                      <input class="site-main-text-color-drck"
                      id="qty1" type="text"
                      v-model="data_search.adult"
                      name="adult" min="0" max="9">

                      {{ useXmltag('Adult') }}
                      </span>
                  <input type="hidden" name="adult_qty" id="adult_qty" v-model="data_search.adult">
                  <i class="minus zmdi zmdi-minus-circle site-main-text-color-h "
                     id="minus1"></i>
                </p>
              </div>
            </div>
            <div class="s-u-form-block s-u-num-inp s-u-num-inp-change width100">
              <div class="s-u-form-input-wrapper">
                <p class="s-u-number-input  s-u-number-input-change  inp-child inp-child-change">
                  <i class="plus zmdi zmdi-plus-circle site-main-text-color-h "
                     id="add2"></i>
                  <span>
                                                                          <input class="site-main-text-color-drck"
                                                                                 id="qty2" type="text"
                                                                                 v-model="data_search.child"
                                                                                 name="child" min="0" max="9">
                                                                               {{ useXmltag('Child') }}
                                                                           </span>
                  <input type="hidden" name="child_qty" id="child_qty" v-model="data_search.child">
                  <i class="minus zmdi zmdi-minus-circle site-main-text-color-h "
                     id="minus2"></i>
                </p>
              </div>
            </div>
            <div class="s-u-form-block s-u-num-inp s-u-num-inp-change width100">
              <div class="s-u-form-input-wrapper">
                <p class="s-u-number-input  s-u-number-input-change  inp-baby inp-baby-change">
                  <i class="plus zmdi zmdi-plus-circle site-main-text-color-h "
                     id="add3"></i>
                  <span>
                                                                               <input class="site-main-text-color-drck"
                                                                                      id="qty3" type="text"
                                                                                      v-model="data_search.infant"
                                                                                      name="infant" min="0" max="9">
                                                                               {{ useXmltag('Baby') }}
                                                                           </span>
                  <input type="hidden" name="infant_qty" id="infant_qty" v-model="data_search.infant">
                  <i class="minus zmdi zmdi-minus-circle site-main-text-color-h "
                     id="minus3"></i>
                </p>
              </div>
            </div>


          </div>


          <div class="s-u-search-wrapper s-u-num-inp s-u-num-inp-search-change">
            <a href="" @click="event.preventDefault()" class="f-loader-check f-loader-check-bar"
               id="loader_check_submit" style="display:none"></a>

            <button type="button" @click="submitLocalSide('local-flight')" id="sendFlight"

                    class="site-bg-main-color"> {{ useXmltag('Search') }}
            </button>
          </div>
        </form>
<!--        <div class="mb-1 px-2 pb-2">-->
<!--          <div class="border rounded-md p-2" v-if="data_search.departure_date_en || data_search.departure_date">-->
<!--          <p>{{ useXmltag('Datetravelwent') }}</p>-->
<!--          <p class="counthotel ">{{this.formatDate(data_search.departure_date_en)}} </p>-->
<!--            <p class="counthotel text12">({{data_search.DateFlightWithName}})</p>-->
<!--          </div>-->
<!--          <div class="border rounded-md p-2 mt-1" v-if="data_search.arrival_date_en || data_search.arrival_date">-->
<!--            <p>{{ useXmltag('Datewentback') }}</p>-->
<!--            <p class="counthotel ">{{this.formatDate(data_search.arrival_date_en)}} </p>-->
<!--            <p class="counthotel text12">({{data_search.DateFlightReturnWithName}})</p>-->
<!--          </div>-->
<!--        </div>-->
        <div class="message_error_portal"></div>
      </div>
      <div class="s-u-filter-wrapper s-u-filter-wrapper-fo">
        <ul id="s-u-filter-wrapper-ul">
          <span class="s-u-close-filter"></span>


          <!-- pricefilter -->
<!--          <li class="s-u-filter-item" data-group="flight-price">-->
<!--                           <span class="s-u-filter-title">-->
<!--                           <i class="zmdi zmdi-money site-main-text-color-drck"></i>  {{ useXmltag('Price') }}</span>-->
<!--            <div class="s-u-filter-content slider_range_parent ">-->
<!--              <vue-slider v-model="value_price" :tooltip="'always'"  :min="min_price_props" :max="max_price_props" @change="priceRangeSlider(value_price)">-->
<!--                <template v-slot:tooltip="{value}">-->
<!--                  <div class="vue-slider-dot-tooltip-inner vue-slider-dot-tooltip-inner-top site-bg-main-color  site-border-main-color">{{ value| formatNumber }}</div>-->
<!--                </template>-->

<!--                <template v-slot:process="{ start, end, style, index }">-->
<!--                  <div class="vue-slider-process vue-slider-dot-tooltip-inner site-bg-main-color" :style="[style]">-->
<!--                    &lt;!&ndash; Can add custom elements here &ndash;&gt;-->
<!--                  </div>-->
<!--                </template>-->
<!--              </vue-slider>-->

<!--            </div>-->
<!--          </li>-->
          <li class="s-u-filter-item" data-group="flight-price">
                           <span class="s-u-filter-title">
                           <i class="zmdi zmdi-money site-main-text-color-drck"></i>  {{ useXmltag('Price') + ' (' + useXmltag('Rial') + ')' }}</span>
            <div class="s-u-filter-content slider_range_parent ">
              <div class="text-center d-flex justify-content-between align-items-center m-auto w-100">
                <span>{{value_price[1] | formatNumber }}</span>
                <span>-</span>
                <span>{{value_price[0] | formatNumber }}</span>
              </div>
              <vue-slider v-model="value_price" :tooltip="'none'" :min="min_price_props" :max="max_price_props"
                          @change="priceRangeSlider(value_price)">
              </vue-slider>
            </div>
          </li>

           <li class="s-u-filter-item p-2 py-3">
              <div class="form-check form-switch p-0">
                 <div class="d-flex align-items-center justify-content-between p-0 w-100">
                    <label for="duplicateFlightSwitch" style="margin:0 !important;">
                       <i class="fa fa-eraser FlightRepetitionCount site-main-text-color-drck" style="font-size:13px !important"></i>
                       <span class="" style="font-weight:500 !important;font-size:13px">{{ useXmltag('FlightRepetitionShow') }}</span>
                    </label>

                    <span

                       :class="[
    'tzCBPart',
    'site-bg-filter-color',
    'filter-to-check',
    'duplicateFlightSwitch',
    !duplicateFlight ? 'checked' : ''
  ]"                    @click="toggleDuplicateFlights">
    </span>


                 </div>
                 <input
                    type="checkbox"
                    id="duplicateFlightSwitch"
                    class="check-switch"
                    v-model="duplicateFlight"
                    style="display:none;" />


                 <p :class="[
                    duplicateFlight ? 'd-none' : 'd-block','small','mt-2'
                 ]" style="font-weight:500 !important;font-size:11px">
                    {{removedCount}} {{ useXmltag('FlightRepetitionCount') }}
                 </p>
              </div>
           </li>


          <!-- flight type filter -->
          <li class="s-u-filter-item" data-group="flight-type">

                        <span class="s-u-filter-title"><i
                          class="zmdi zmdi-flight-takeoff site-main-text-color-drck"></i> {{ useXmltag('Typeflight') }} </span>

            <div class="s-u-filter-content">

              <ul class="s-u-filter-item-time filter-type-ul filter-type-ul-f">

                <li>
                  <label for="filter-type">
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span

                        class="tzCBPart site-bg-filter-color checked filter-to-check type_flight all_type_flight"
                        @click="typeFilterFlight('all_type_flight')"></span>
                  <input class="check-switch" type="checkbox" id="filter-type" value="allFlightType"
                         checked="checked" />

                </li>

                <li v-for="filter_flight in typeFlightFilter">
                  <label :for="`filter-${filter_flight.name_en}`">
                    <span>{{filter_flight.name_fa }}</span>
                  </label>
                  <span

                        class="tzCBPart site-bg-filter-color type_flight"
                        @click="typeFilterFlight(filter_flight.name_en)"
                        :class="`${filter_flight.name_en}`"></span>
                  <input class="check-switch" type="checkbox" :id="`filter-${filter_flight.name_en}`"
                         :value="`${filter_flight.name_en}`" />
                </li>
              </ul>
            </div>
          </li>
          <!-- seat class filter -->
          <li class="s-u-filter-item" data-group="flight-seat">

                       <span class="s-u-filter-title"><i class="zmdi zmdi-airline-seat-recline-extra site-main-text-color-drck"></i>
                          {{ useXmltag('Classflight') }}
                       </span>

            <div class="s-u-filter-content">

              <ul class="s-u-filter-item-time filter-seat-ul filter-seat-ul-f">

                <li>
                  <label for="filter-seat">
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span

                        class="tzCBPart site-bg-filter-color checked filter-to-check all_seat_class"
                        @click="seatClassFilterFlight('all_seat_class')"></span>
                  <input class="check-switch" type="checkbox" id="filter-seat" value="allSeatClass"
                         checked="checked" />
                </li>

                <li v-for="seat_class in seatClassFilter">
                  <label :for="`filter-${seat_class.name_en}`">
                    <span>{{ seat_class.name_fa }}</span>
                  </label>
                  <span
                        class="tzCBPart site-bg-filter-color seat_class"
                        @click="seatClassFilterFlight(seat_class.name_en)"
                        :class="`${seat_class.name_en}`"></span>
                  <input class="check-switch" type="checkbox" :id="`filter-${seat_class.name_en}`"
                         :value="`${seat_class.name_en}`" />
                </li>
              </ul>
            </div>
          </li>
          <li class="s-u-filter-item" data-group="flight-airline">
            <span class="s-u-filter-title"><i class="zmdi zmdi-local-airport site-main-text-color-drck"></i> {{ useXmltag('Airline') }}</span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-airline-ul filter-airline-ul-f">
                <li>
                  <label for="filter-airline" >
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span
                        class="tzCBPart site-bg-filter-color checked filter-to-check  all_airline"
                        @click="airlineFilterFlight('all_airline')"></span>
                  <input class="check-switch" type="checkbox" id="filter-airline" value="allAirline"
                         checked="checked" />

                </li>

                <template v-for="data_each_airline in minPriceAirline">
                  <li :id="`${data_each_airline.name_en}-filter`">
                    <label :for="`filter-${data_each_airline.name_en}`" class="justify-content-between">
                      <i :id="`${data_each_airline.name_en}-minPrice`">{{data_each_airline.price}}</i>
                      <span class='text-start'>{{ data_each_airline.name}}</span>
                    </label>
                    <span
                          class="tzCBPart site-bg-filter-color airline"
                          @click="airlineFilterFlight(data_each_airline.name_en)"
                          :class="`${data_each_airline.name_en}`"></span>
                    <input class="check-switch" type="checkbox"
                           :id="`filter-${data_each_airline.name_en}`"
                           v-model="data_each_airline.name_en" />
                  </li>
                </template>
              </ul>
            </div>
          </li>

          <!-- time filter -->
          <li class="s-u-filter-item" data-group="flight-time">
            <span class="s-u-filter-title "><i class="zmdi zmdi-time site-main-text-color-drck"></i>{{ useXmltag('RunTime') }} </span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-time-ul filter-time-ul-f">
                <li>
                  <label for="filter-time">
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span
                        class="tzCBPart site-bg-filter-color checked filter-to-check all_time"
                        id="allTime"
                        v-on:click="timeFilterFlightForeign('all_time')"></span>
                  <input class="check-switch" type="checkbox" id="filter-time" value="allTime"
                         checked="checked" />

                </li>
                <template v-for="each_time in timeFilter">
                  <li>
                    <label :for="`filter-${each_time.name_en}`" class="justify-content-between">
                      <i>{{each_time.value}}</i>
                      <span>{{each_time.name_fa}}</span>
                    </label>
                    <span
                          class="tzCBPart site-bg-filter-color time"
                          @click="timeFilterFlightForeign(each_time.time)"
                          :class="`${each_time.time}`"></span>
                    <input class="check-switch" type="checkbox" :id="`filter-${each_time.time}`"
                           v-model="each_time.time" />
                  </li>
                </template>
              </ul>
            </div>
          </li>

          <div class="articles-list d-none">
            <h6>{{ useXmltag('RelatedArticles') }}</h6>
            <ul></ul>
          </div>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  import VueSlider from 'vue-slider-component'
  import 'vue-slider-component/theme/default.css'
  import vSelect from 'vue-select'
  import 'vue-select/dist/vue-select.css'
  import datePicker from '@alireza-ab/vue-persian-datepicker'
  // import select2Jq from './select2-jq'


  export default {
    name: 'sidebar',
    props: ['dataSearch', 'price', 'timeFilter', 'typeFlightFilter', 'seatClassFilter', 'minPriceAirline', 'countFlights'],
    data() {
      return {
         duplicateFlight: true,
         originalDeptFlights: [],
         originalReturnFlights: [],
         firstTimeApplied: false,
         removedCount:0,
        search_origin_loading : false ,
        search_arrival_loading : false ,
        departure_code: '',
        is_show_currency_list: false,
        show_popular : false,
        show_arrival_popular : false,
        currency_title: '',
        value_price: [0, 0],
        title_origin_city: '',
        title_arrival_city: '',
        title_origin_city_search : '',
        title_arrival_city_search : '',
        iata_origin: '',
        iata_arrival: '',
        stored_origin_cities : [] ,
        stored_arrival_cities : [] ,
        cities_origin: [],
        popular_cities_origin : [],
        cities_arrival: [],
        min_price_props: 0,
        max_price_props: 0,
        data_search: {},
        currency_info: '',
        error_currency_info: '',
        list_currency: [],
        today_date: true,
        date_picker_departure: '',
        date_picker_return: '',
        multi_way: '',
        multi_way_check: false,
        is_search: false,
        is_arrival_search: false,
        dateGregorianDept: null,
        dateGregorianReturn: null,
        format_datepicker: 'jYYYY-jMM-jDD',
        lang_datepicker: 'fa',
        is_persion_date:false,
        svg_icon_1: `<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:svgjs='http://svgjs.com/svgjs' version='1.1' x='0' y='0' viewBox='0 0 907.62 907.619' style='enable-background:new 0 0 512 512' xml:space='preserve' class=''><g><g xmlns='http://www.w3.org/2000/svg'><path d='M591.672,907.618c28.995,0,52.5-23.505,52.5-52.5V179.839l42.191,41.688c10.232,10.11,23.567,15.155,36.898,15.155   c13.541,0,27.078-5.207,37.347-15.601c20.379-20.625,20.18-53.865-0.445-74.244L626.892,15.155C617.062,5.442,603.803,0,589.993,0   c-0.104,0-0.211,0-0.314,0.001c-13.923,0.084-27.244,5.694-37.03,15.6l-129.913,131.48c-20.379,20.625-20.18,53.865,0.445,74.244   c20.626,20.381,53.866,20.181,74.245-0.445l41.747-42.25v676.489C539.172,884.113,562.677,907.618,591.672,907.618z'></path><path d='M315.948,0c-28.995,0-52.5,23.505-52.5,52.5v676.489l-41.747-42.25c-20.379-20.625-53.62-20.825-74.245-0.445   c-20.625,20.379-20.825,53.619-0.445,74.244l129.912,131.479c9.787,9.905,23.106,15.518,37.029,15.601   c0.105,0.001,0.21,0.001,0.315,0.001c13.81,0,27.07-5.442,36.899-15.155L484.44,760.78c20.625-20.379,20.824-53.619,0.445-74.244   c-20.379-20.626-53.62-20.825-74.245-0.445l-42.192,41.688V52.5C368.448,23.505,344.943,0,315.948,0z' style=''></path></g></g></svg>`,
        svg_icon_2: `<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' version='1.1' x='0' y='0' viewBox='0 0 512 512' style='enable-background:new 0 0 512 512' xml:space='preserve' class=''><g transform='matrix(-1,-1.2246467991473532e-16,1.2246467991473532e-16,-1,512,512)'><g xmlns='http://www.w3.org/2000/svg'><g><path d='M374.108,373.328c-7.829-7.792-20.492-7.762-28.284,0.067L276,443.557V20c0-11.046-8.954-20-20-20    c-11.046,0-20,8.954-20,20v423.558l-69.824-70.164c-7.792-7.829-20.455-7.859-28.284-0.067c-7.83,7.793-7.859,20.456-0.068,28.285    l104,104.504c0.006,0.007,0.013,0.012,0.019,0.018c7.792,7.809,20.496,7.834,28.314,0.001c0.006-0.007,0.013-0.012,0.019-0.018    l104-104.504C381.966,393.785,381.939,381.121,374.108,373.328z' style='' class=''></path></g></g></g></svg>`,
        styles: {
          'primary-color': main_color,
          '--dp-menu-offset': '0px',
          '--dp-menu-position': 'bottom',
          '--dp-menu-transform': 'translateY(0)',
          '--dp-menu-transition': 'none',
          '--dp-menu-z-index': '9999',
          '--dp-menu-box-shadow': '0 2px 4px rgba(0,0,0,0.1)',
          '--dp-menu-background-color': '#fff',
          '--dp-menu-border-radius': '4px',
          '--dp-menu-padding': '8px',
          '--dp-menu-width': '300px',
          '--dp-menu-height': 'auto',
          '--dp-menu-max-height': 'none',
          '--dp-menu-overflow': 'visible',
          '--dp-menu-position-fixed': 'true'
        },
        date_departure:'',
        date_return:'',
         column: {
            1: 1,
         }
      }
    },
    methods: {

      isPersianDate(dateStr) {

        const cleanDate = dateStr;

        // 2) تطابق الگوی YYYY-MM-DD
        const regex = /^(\d{4})-(\d{2})-(\d{2})$/;
        const match = cleanDate.match(regex);
        if (!match) return false;

        const year  = parseInt(match[1], 10);
        const month = parseInt(match[2], 10);
        const day   = parseInt(match[3], 10);

        // 3) محدوده سال (قابل تنظیم)
        if (year < 1200 || year > 1600) return false;

        // 4) محدوده ماه
        if (month < 1 || month > 12) return false;

        // 5) تشخیص دقیق سال کبیسهٔ جلالی (محاسبه نجومی رسمی ایران)
        const isLeapJalali = (jy) => {
          // الگوریتم دقیق موسسه ژئوفیزیک
          const breaks = [
            -61, 9, 38, 199, 426, 686, 756, 818,
            1111, 1181, 1210, 1635, 2060, 2097,
            2192, 2262, 2324, 2394, 2456, 3178
          ];
          let bl = breaks.length;
          let gy = jy + 621;
          let leapJ = -14;
          let jp = breaks[0];

          let jm, jump, leap, n, i;

          for (i = 1; i < bl; i++) {
            jm = breaks[i];
            jump = jm - jp;
            if (jy < jm) {
              leapJ += Math.floor((jy - jp) / 33) * 8 + Math.floor(((jy - jp) % 33) / 4);
              leap = (jump % 33 === 4 && jump - (jump / 33) * 33 === 4) ? 1 : 0;
              if ((jump % 33) === 4) leap++;
              break;
            }
            leapJ += Math.floor(jump / 33) * 8 + Math.floor((jump % 33) / 4);
            jp = jm;
          }
          n = jy - jp;
          leapJ += Math.floor(n / 33) * 8 + Math.floor((n % 33) / 4);
          if ((n % 33) === 4) leapJ++;
          const leapG = Math.floor(gy / 4) - Math.floor((gy / 100)) + Math.floor((gy / 400));
          return ((leapJ + 1) % 33 === 1);
        };

        const leap = isLeapJalali(year);

        // 6) تعداد روزهای هر ماه
        const daysInMonth = [
          31, 31, 31, 31, 31, 31, // فروردین تا شهریور
          30, 30, 30, 30, 30,     // مهر تا بهمن
          leap ? 30 : 29          // اسفند
        ];

        // 7) چک نهایی تعداد روز
        if (day < 1 || day > daysInMonth[month - 1]) return false;

        return true;
      },
      formatDatePersian(gDateStr) {
        const toJalali = (gy, gm, gd) => {
          const g_d_m = [0,31,59,90,120,151,181,212,243,273,304,334];
          let jy = (gy <= 1600) ? 0 : 979;
          gy -= (gy <= 1600) ? 621 : 1600;
          const gy2 = (gm > 2) ? (gy + 1) : gy;

          let days = (365 * gy) + Math.floor((gy2 + 3) / 4)
              - Math.floor((gy2 + 99) / 100)
              + Math.floor((gy2 + 399) / 400)
              - 80 + gd + g_d_m[gm - 1];

          jy += 33 * Math.floor(days / 12053);
          days %= 12053;

          jy += 4 * Math.floor(days / 1461);
          days %= 1461;

          if (days > 365) {
            jy += Math.floor((days - 1) / 365);
            days = (days - 1) % 365;
          }

          const jm = (days < 186) ? 1 + Math.floor(days / 31)
              : 7 + Math.floor((days - 186) / 30);

          const jd = 1 + ((days < 186) ? (days % 31)
              : ((days - 186) % 30));

          return [jy, jm, jd];
        };

        const daysOfWeek = [
          "یکشنبه",
          "دوشنبه",
          "سه‌شنبه",
          "چهارشنبه",
          "پنج‌شنبه",
          "جمعه",
          "شنبه"
        ];

        const months = [
          "فروردین","اردیبهشت","خرداد","تیر","مرداد","شهریور",
          "مهر","آبان","آذر","دی","بهمن","اسفند"
        ];

        const englishToPersianDigits = (str) =>
            str.replace(/\d/g, (d) => "۰۱۲۳۴۵۶۷۸۹"[d]);

        // تبدیل تاریخ میلادی به آبجکت Date
        const [y, m, d] = gDateStr.split("-").map(Number);
        const date = new Date(y, m - 1, d);

        const weekday = daysOfWeek[date.getDay()];

        // تبدیل به جلالی
        const [jy, jm, jd] = toJalali(y, m, d);

        return `${weekday}, ${englishToPersianDigits(jd.toString())} ${months[jm - 1]} ${englishToPersianDigits(jy.toString())}`;
      },
      formatDate(dateString) {
    const date = new Date(dateString);
    const year = date.getFullYear();
    const month = date.toLocaleString('en-US', { month: 'short' });
    const day = date.getDate();
    return `${day} ${month} ${year}`;
  },
      convertPersianDateToGregorian(persianDateString) {
        // جدا کردن سال، ماه و روز از تاریخ شمسی
        const parts = persianDateString.split('-');
        const persianYear = parseInt(parts[0]);
        const persianMonth = parseInt(parts[1]);
        const persianDay = parseInt(parts[2]);

        // تبدیل تاریخ شمسی به میلادی (این قسمت نیاز به پیاده‌سازی دقیق دارد)
        // این یک پیاده‌سازی ساده است و ممکن است برای همه تاریخ‌ها دقیق نباشد
        const gregorianDate = new Date(
            persianYear,
            persianMonth - 1, // ماه در جاوااسکریپت از 0 شروع می‌شود
            persianDay
        );

        return gregorianDate;
      },
      convertGregorianToPersian(gDate) {
        // ورودی مثلاً: "2024-04-10"
        const [year, month, day] = gDate.split('-').map(Number);

        const date = new Date(year, month - 1, day);
        const time = date.getTime();

        // تبدیل زمان به شمسی با استفاده از toLocaleDateString
        const persianString = new Date(time).toLocaleDateString('fa-IR', {
          year: 'numeric',
          month: '2-digit',
          day: '2-digit'
        });

        // خروجی فارسی مثل "۱۴۰۳/۰۱/۲۱" → تبدیل به اعداد عربی (1403-01-21)
        return persianString
            .replace(/\u0660/g, '0').replace(/\u0661/g, '1').replace(/\u0662/g, '2')
            .replace(/\u0663/g, '3').replace(/\u0664/g, '4').replace(/\u0665/g, '5')
            .replace(/\u0666/g, '6').replace(/\u0667/g, '7').replace(/\u0668/g, '8')
            .replace(/\u0669/g, '9')
            .replace(/\//g, '-');
      },
      detectDateTypeFromDateFlightWithName(dateFlightWithName) {
        if (!dateFlightWithName) {
          return false // اگر فیلد خالی بود
        }

        // لیست نام ماه‌های شمسی
        const persianMonths = ["فروردین", "اردیبهشت", "خرداد", "تیر", "مرداد", "شهریور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند"];
        // لیست نام ماه‌های میلادی
        const gregorianMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        // لیست نام روزهای هفته میلادی (برای اطمینان بیشتر)
        const gregorianWeekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        // لیست نام روزهای هفته شمسی (برای اطمینان بیشتر)
        const persianWeekDays = ["شنبه", "یکشنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنج‌شنبه", "جمعه"];


        // بررسی وجود نام ماه‌های شمسی
        for (const month of persianMonths) {
          if (dateFlightWithName.includes(month)) {
            return true;
          }
        }

        // بررسی وجود نام ماه‌های میلادی
        for (const month of gregorianMonths) {
          if (dateFlightWithName.includes(month)) {
            return false;
          }
        }

        // بررسی وجود نام روزهای هفته میلادی (اگر ماه پیدا نشد)
        for (const day of gregorianWeekDays) {
          if (dateFlightWithName.includes(day)) {
            return false;
          }
        }

        // بررسی وجود نام روزهای هفته شمسی (اگر ماه پیدا نشد)
        for (const day of persianWeekDays) {
          if (dateFlightWithName.includes(day)) {
            return true;
          }
        }


        return false;
      },
       clearArrivalInput() {
          this.title_arrival_city_search = '';
          this.iata_arrival = null;
          this.cities_arrival = [];
          this.show_arrival_popular = true;
          this.is_arrival_search = false;
          this.$refs.arrival?.focus();
       },
       clearOriginInput() {
          this.title_origin_city_search = '';
          this.iata_origin = null;
          this.cities_origin = [];
          this.show_popular = true;
          this.is_search = false;
          this.$refs.origin?.focus();
       },
      dropBox(type){
        if(type == 'origin'){
          this.is_search = !this.is_search ;
          this.is_arrival_search = false
        }else if(type == 'arrival'){
          this.is_arrival_search = !this.is_arrival_search ;
          this.is_search = false
        }

      },
      clearSearchedCities(type) {

        if(type == 'origin') {
            this.stored_arrival_cities = []
        }else {
          this.stored_origin_cities = []
        }
        let getSearchedCities = JSON.parse(localStorage.getItem('internalSearchedCities'))
        console.log(getSearchedCities)
        localStorage.setItem('internalSearchedCities' , JSON.stringify({[type] : getSearchedCities[type]}));
      },
      setSearchedStorage() {
        let storage_searched_cities =  localStorage.getItem('internalSearchedCities')

        if(storage_searched_cities == null || storage_searched_cities == "null" || Object.keys(JSON.parse(storage_searched_cities)).length == 0 ) {
          let storage_origin_cities = []
          let storage_arrival_cities = []
          storage_origin_cities.push({
            Departure_Code : this.iata_origin  ,
            [`Departure_City${this.getLang().charAt(0).toUpperCase() + this.getLang().slice(1)}`] : this.data_search.name_departure
          })
          storage_arrival_cities.push({
            Departure_Code : this.iata_arrival  ,
            [`Departure_City${this.getLang().charAt(0).toUpperCase() + this.getLang().slice(1)}`] : this.data_search.name_arrival
          })

          this.stored_origin_cities = storage_origin_cities
          this.stored_arrival_cities = storage_arrival_cities

          localStorage.setItem("internalSearchedCities", JSON.stringify( { origin :  storage_origin_cities , arrival :storage_arrival_cities } ));
        }
        else {
          let storage_searched_cities =  JSON.parse(localStorage.getItem('internalSearchedCities'))
          let storage_origin_cities = []
          let storage_arrival_cities = []
          if(!storage_searched_cities['origin']){
            storage_origin_cities.push({
              Departure_Code : this.iata_origin  ,
              [`Departure_City${this.getLang().charAt(0).toUpperCase() + this.getLang().slice(1)}`] : this.data_search.name_departure
            })
            this.stored_origin_cities = storage_origin_cities
          }else {
            this.stored_origin_cities = storage_searched_cities.origin
            if(storage_searched_cities.origin && storage_searched_cities.origin.length > 0 ) {
              let has_stored = storage_searched_cities.origin.find(city => {
                return city.Departure_Code == this.iata_origin
              })
              if (!has_stored) {
                if (storage_searched_cities.origin.length == 5) {
                  storage_searched_cities.origin.shift()
                }
                storage_searched_cities.origin.push({
                  Departure_Code: this.iata_origin,
                  [`Departure_City${this.getLang().charAt(0).toUpperCase() + this.getLang().slice(1)}`]: this.data_search.name_departure
                })
              }
            }
            storage_origin_cities = storage_searched_cities.origin
          }

          if(!storage_searched_cities['arrival']) {
            storage_arrival_cities.push({
              Departure_Code : this.iata_arrival  ,
              [`Departure_City${this.getLang().charAt(0).toUpperCase() + this.getLang().slice(1)}`] : this.data_search.name_arrival
            })
            this.stored_arrival_cities = storage_arrival_cities
          }
          else {
            this.stored_arrival_cities = storage_searched_cities.arrival
            if(storage_searched_cities.arrival && storage_searched_cities.arrival.length > 0){
              let has_stored = storage_searched_cities.arrival.find(city => {
                return city.Departure_Code == this.iata_arrival
              })
              if (!has_stored) {
                if (storage_searched_cities.arrival.length == 5) {
                  storage_searched_cities.arrival.shift()
                }
                storage_searched_cities.arrival.push({
                  Departure_Code: this.iata_arrival,
                  [`Departure_City${this.getLang().charAt(0).toUpperCase() + this.getLang().slice(1)}`]: this.data_search.name_arrival
                })
              }
            }
            storage_arrival_cities = storage_searched_cities.arrival
          }
          localStorage.setItem("internalSearchedCities", JSON.stringify({ origin : storage_origin_cities , arrival :storage_arrival_cities}));
        }
      },
      showListCurrencyExist() {
        this.is_show_currency_list = !this.is_show_currency_list

        if (document.querySelector('.show-currency').classList.contains('d-block')) {
          document.getElementsByClassName('show-currency')[0].classList.remove('d-block')

        } else {
          document.getElementsByClassName('show-currency')[0].classList.add('d-block')
        }
      },
      ConvertCurrency(code, Icon, Title) {
        let _this = this
        document.getElementById('IconDefaultCurrency').setAttribute('src', rootMainPath + '/gds/pic/flagCurrency/' + Icon)
        _this.currency_title = Title
        axios.post(amadeusPath + 'ajax', {
          className: 'currencyEquivalent',
          method: 'CurrencyEquivalent',
          code: code,
          is_json: true,
        }, {
          'Content-Type': 'application/json',
        }).then(function(response) {

          _this.is_show_currency_list = false
          _this.$store.commit('setPriceCurrency', response.data)
        }).catch(function(error) {
          console.log(error)
        })
      },
      searchCityBackup: function(lang) {
        let _this = this
        axios.post(amadeusPath + 'ajax', {
          className: 'newApiFlight',
          method: 'getCitiesFlightInternal',
          iata_city: value_city,
          language: lang,
        }, {
          'Content-Type': 'application/json',
        }).then(function(response) {

          console.log(response)
          // _this.cities_origin = response.data.data

          let cities = response.data.data;
          let obj_cities;

          Object.keys(cities).forEach(key => {
            obj_cities = {}
            obj_cities.id = cities[key].Departure_Code;
            obj_cities.text = `${cities[key].Departure_City}(${cities[key].Departure_Code})`;
            _this.cities_origin.push(obj_cities);

          });
          console.log('bf object push==>' + JSON.stringify(_this.cities_origin))

          _this.searchCityArrival({
            target: {
              value: _this.iata_origin,
              lang: _this.data_search.software_lang,
            },
          })

          _this.iata_arrival = _this.data_search.destination
        }).catch(function(error) {
          console.log(error)
        })
      },
      focusSearchCity(){
        let _this = this
        _this.show_popular = true
      },
      focusSearchArrivalCity(){
        let _this = this
        _this.show_arrival_popular = true
      },
      searchCity: function(lang) {
        let _this = this

        _this.show_popular = false
        _this.is_search = true
        if(_this.title_origin_city_search != '') {
          _this.search_origin_loading = true
            axios.post(amadeusPath + 'ajax', {
              className: 'newApiFlight',
              method: 'searchCitiesFlightInternal',
              value: _this.title_origin_city_search,
            }, {
              'Content-Type': 'application/json',
            }).then(function(response) {
              _this.cities_origin = response.data.data
              _this.search_origin_loading = false
            }).catch(function(error) {
              _this.search_origin_loading = false
              console.log(error)
            })
        }else {
          _this.cities_origin = []
        }

      },
      selectAirportOrigin(city, lang) {
        lang = (lang !== 'fa') ? 'en' : 'fa'
        this.dataSearch.name_departure = city[`Departure_City${lang.charAt(0).toUpperCase() + lang.slice(1)}`]
        this.dataSearch.origin = city.Departure_Code
        this.cities_origin = []
        this.is_search = false
        this.iata_origin = city.Departure_Code
        this.title_origin_city_search = city[`Departure_City${lang.charAt(0).toUpperCase() + lang.slice(1)}`]
        if( this.iata_origin == this.iata_arrival) {
          this.$refs.arrival.focus();
          this.is_arrival_search = true
          this.iata_arrival = ''
          this.dataSearch.name_arrival = ''
          this.dataSearch.destination =  ''
          this.title_arrival_city_search = ''
        }
      },
      selectAirportArrival(city, lang) {
        lang = (lang !== 'fa') ? 'en' : 'fa'
        this.dataSearch.name_arrival = city[`Departure_City${lang.charAt(0).toUpperCase() + lang.slice(1)}`]
        this.dataSearch.destination =  city.Departure_Code
        this.cities_arrival = []
        this.is_arrival_search = false
        this.iata_arrival = city.Departure_Code
        this.title_arrival_city_search = city[`Departure_City${lang.charAt(0).toUpperCase() + lang.slice(1)}`]
        if( this.iata_origin == this.iata_arrival) {
          this.$refs.origin.focus();
          this.is_search = true
          this.iata_origin = ''
          this.dataSearch.name_departure = ''
          this.dataSearch.origin = ''
          this.title_origin_city_search =''
        }
      },
      searchCityArrivalBackup: function(event) {

        let value_city = event.target.value
        let _this = this
        this.iata_arrival = 0
        let lang = (event.target.lang !== 'fa') ? 'en' : 'fa'
        axios.post(amadeusPath + 'ajax', {
          className: 'newApiFlight',
          method: 'getCitiesFlightInternal',
          iata_city: value_city,
        }, {
          'Content-Type': 'application/json',
        }).then(function(response) {
          _this.cities_arrival = response.data.data
        }).catch(function(error) {
          console.log(error)
        })

      },
      searchCityArrival: function(event) {

        let value_city = event.target.value
        let _this = this
        _this.show_arrival_popular = false
        _this.is_arrival_search = true
        let lang = (event.target.lang !== 'fa') ? 'en' : 'fa'
        if(_this.title_arrival_city_search != '') {
          _this.search_arrival_loading = true
          axios.post(amadeusPath + 'ajax', {
            className: 'newApiFlight',
            method: 'searchCitiesFlightInternal',
            value: _this.title_arrival_city_search,
          }, {
            'Content-Type': 'application/json',
          }).then(function(response) {
            _this.search_arrival_loading = false
            _this.cities_arrival = response.data.data
          }).catch(function(error) {
            _this.search_arrival_loading = false
            console.log(error)
          })
        }else {
          _this.cities_arrival = []
        }

      },
      getCurrencyInfo() {
        let _this = this
        axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'infoCurrency',
            is_json: true,
          },
          {
            'Content-Type': 'application/json',
          }).then(function(response) {
          _this.currency_info = response.data.data
          if (_this.dataSearch.dataSearch.software_lang !== 'fa') {
            _this.currency_title = _this.currency_info.CurrencyTitleEn
          } else {
            _this.currency_title = _this.currency_info.CurrencyTitleFa
          }

        }).catch(function(error) {
          _this.error_currency_info = error.message
        })

      },
      listCurrency() {
        let _this = this
        axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'listCurrency',
            is_json: true,
          },
          {
            'Content-Type': 'application/json',
          }).then(function(response) {
          _this.list_currency = response.data.data
        }).catch(function(error) {
          _this.list_currency = null
        })
      },
      async checkToDayDate() {
        let _this = this
        await axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'checkToDayDate',
            dateSearch: _this.dataSearch.dataSearch.departureDate,
          },
          {
            'Content-Type': 'application/json',
          }).then(function(response) {
          console.log(_this.dataSearch.MultiWay);
          _this.today_date = response.data.data
          _this.multi_way = (_this.dataSearch.MultiWay == 'TwoWay') ? true : false

        }).catch(function(error) {
          _this.today_date = error.message
        })
      },
      timeFilterFlightForeign(value) {
        this.$emit('filterFlights', value, 'time')
      },
      typeFilterFlight(value) {
        this.$emit('filterFlights', value, 'type_flight')
      },
      airlineFilterFlight(value) {
        this.$emit('filterFlights', value, 'airline')
      },
      seatClassFilterFlight(value) {
          this.$emit('filterFlights', value, 'seat_class')
      },
      priceRangeSlider(value) {
        this.$emit('filterPriceFlights', value, 'price_sidebar')
      },
      reversDestinations() {
        let title_origin = this.title_origin_city_search
        let iata_origin = this.iata_origin
        let title_arrival = this.title_arrival_city_search
        let iata_arrival = this.iata_arrival
        this.title_origin_city_search = title_arrival
        this.iata_origin = iata_arrival

        this.title_arrival_city_search = title_origin
        this.iata_arrival = iata_origin
      },
      getPopularFlightList() {
        let _this = this
        this.$store.dispatch('getPopularInternalFlight', {method: 'searchCitiesFlightInternal'})
      },
      activateSeatClassFilter(classFlight) {
        console.log('🔵 [SIDEBAR-ACTIVATE] activateSeatClassFilter called with:', classFlight);
        // DO NOT emit to parent if this is initial load from URL
        // The parent (main.vue) already set the filter in created()
        // Emitting here would cause the filter to toggle off!

        // Only update UI - Remove checked from "همه" (All)
        let allSeatClassElements = document.getElementsByClassName('all_seat_class');
        console.log('🔍 [SIDEBAR-ACTIVATE] Found all_seat_class elements:', allSeatClassElements.length);

        if (allSeatClassElements.length > 0) {
          // Force remove checked class multiple times to ensure it's removed
          for (let i = 0; i < allSeatClassElements.length; i++) {
            allSeatClassElements[i].classList.remove("checked");
          }
          console.log('✅ [SIDEBAR-ACTIVATE] Removed checked from all_seat_class');
        }

        // Find and activate the specific class
        let specificClassElements = document.getElementsByClassName(classFlight);
        console.log('🔍 [SIDEBAR-ACTIVATE] Found', classFlight, 'elements:', specificClassElements.length);

        if (specificClassElements.length > 0) {
          for (let i = 0; i < specificClassElements.length; i++) {
            if (specificClassElements[i].classList.contains('seat_class')) {
              specificClassElements[i].classList.add("checked");
              console.log('✅ [SIDEBAR-ACTIVATE] Added checked to', classFlight);
              break;
            }
          }
        }
      },
       initFlights() {
          // فقط اولین بار
          this.firstTimeApplied = true;

          // نسخه اصلی را ذخیره کن
          this.originalDeptFlights = structuredClone(this.$store.state.flights.dept);
          this.originalReturnFlights = structuredClone(this.$store.state.flights.return);

          // فیلتر اولین بار
          this.toggleDuplicateFlights();
       },
       // toggleDuplicateFlights() {
       //    this.duplicateFlight = !this.duplicateFlight;
       //
       //    if (this.duplicateFlight) {
       //
       //       // ذخیره نسخه اصلی
       //       if (!Array.isArray(this.originalDeptFlights) || this.originalDeptFlights.length === 0) {
       //          this.originalDeptFlights = structuredClone(this.$store.state.flights.dept);
       //       }
       //       if (!Array.isArray(this.originalReturnFlights) || this.originalReturnFlights.length === 0) {
       //          this.originalReturnFlights = structuredClone(this.$store.state.flights.return);
       //       }
       //
       //       // const removeDuplicates = (arr) => {
       //       //    if (!Array.isArray(arr)) return [];
       //       //    const keys = new Set();
       //       //    return arr.filter(f => {
       //       //       const key = `${f.departure_time}|${f.flight_type}|${f.cabin_type}|${f.flight_number}|${f.airline}|${f.price?.adult?.price}`;
       //       //       if (keys.has(key)) return false;
       //       //       keys.add(key);
       //       //       return true;
       //       //    });
       //       // };
       //
       //       const removeDuplicates = (arr) => {
       //          if (!Array.isArray(arr)) return [];
       //
       //          const map = new Map();
       //
       //          arr.forEach(f => {
       //             const key = `${f.departure_time}|${f.flight_type}|${f.cabin_type}|${f.flight_number}|${f.airline}`;
       //
       //             const currentPrice = f.price?.adult?.price ?? Infinity;
       //
       //             if (!map.has(key)) {
       //                map.set(key, f);
       //             } else {
       //                const existing = map.get(key);
       //                const existingPrice = existing.price?.adult?.price ?? Infinity;
       //
       //                // اگر قیمت جدید کمتر بود جایگزین کن
       //                if (currentPrice < existingPrice) {
       //                   map.set(key, f);
       //                }
       //             }
       //          });
       //
       //          return Array.from(map.values());
       //       };
       //       const removedCounts = this.originalDeptFlights.length - removeDuplicates(this.originalDeptFlights).length;
       //       this.removedCount = removedCounts;
       //       // اجرای مستقیم
       //       this.$store.commit("updateDeptFlights", removeDuplicates(this.originalDeptFlights));
       //       this.$store.commit("updateReturnFlights", removeDuplicates(this.originalReturnFlights));
       //
       //
       //    } else {
       //       // بازگشت به حالت اولیه
       //       this.$store.commit("updateDeptFlights", structuredClone(this.originalDeptFlights));
       //       this.$store.commit("updateReturnFlights", structuredClone(this.originalReturnFlights));
       //
       //    }
       // },
       initFirstFilter() {
          this.firstInitDone = true;

          // ذخیره اصل داده قبل از فیلتر
          this.originalDeptFlights = structuredClone(this.$store.state.flights.dept);
          this.originalReturnFlights = structuredClone(this.$store.state.flights.return);

          // 🔥 فیلتر اولیه
          this.applyFilter(true);
       },
       toggleDuplicateFlights() {
          this.duplicateFlight = !this.duplicateFlight;
          this.applyFilter(this.duplicateFlight);
       },

       applyFilter(isOn) {

          const removeDuplicates = (arr) => {
             // Add safety check for undefined/null array
             if (!Array.isArray(arr) || !arr || arr.length === 0) {
                return [];
             }

             const map = new Map();

             arr.forEach(f => {

                const isSpecialSeat =
                   f.seat_class_en === 'business' || f.seat_class_en === 'premium_economy';

                const cabinPart = isSpecialSeat ? f.cabin_type : '';

                const key =
                   `${f.departure_time}|${f.flight_type}|${cabinPart}|${f.seat_class_en}|${f.airline_name_en}`;

                const price = f.price?.adult?.price ?? Infinity;


                if (!price || price === 0) return;


                if (!map.has(key)) {
                   map.set(key, f);
                } else {
                   const old = map.get(key);
                   const oldPrice = old.price?.adult?.price ?? Infinity;

                   if (price < oldPrice) {
                      map.set(key, f);
                   }
                }
             });

             return [...map.values()];
          };

          // 🔥 اگر روشن بود → فیلتر کن
          if (isOn) {
             const deptFiltered = removeDuplicates(this.originalDeptFlights);
             this.removedCount = this.originalDeptFlights.length - deptFiltered.length;

             this.$store.commit("updateDeptFlights", deptFiltered);
             this.$store.commit("updateReturnFlights", removeDuplicates(this.originalReturnFlights));
          }

          // 🔥 اگر خاموش بود → داده اصلی را برگردان
          else {
             this.$store.commit("updateDeptFlights", structuredClone(this.originalDeptFlights));
             this.$store.commit("updateReturnFlights", structuredClone(this.originalReturnFlights));
          }
       }
      ,

    },
    created: function() {

      this.enableCross = false;
      let self = this;
      window.addEventListener('click', function(e){
        // close dropdown when clicked outside
        if (!self.$el.contains(e.target)){
          self.is_search = false
          self.is_arrival_search = false
        }
      })


    },
    watch: {
        date_departure(newVal) {

        if (!newVal) {
          this.dateGregorianDept = null;
          return;
        }

        // تشخیص: آیا میلادی است؟

        if (!this.detectDateTypeFromDateFlightWithName(this.data_search.DateFlightWithName)) {

          // ورودی میلادی است → تبدیل به شمسی
          this.dateGregorianDept = this.convertGregorianToPersian(newVal);
        } else {
          // ورودی شمسی است → تبدیل به میلادی
          const gregorianDate = this.convertPersianDateToGregorian(newVal);
          const year = gregorianDate.getFullYear();
          const month = String(gregorianDate.getMonth() + 1).padStart(2, '0'); // 01, 02, ...
          const day = String(gregorianDate.getDate()).padStart(2, '0'); // 01, 02, ...

          this.dateGregorianDept = `${year}-${month}-${day}`;
        }


      },
      date_return(newVal) {
        if (!newVal) {
          this.dateGregorianReturn = null;
          return;
        }

        if (!this.detectDateTypeFromDateFlightWithName(this.data_search.DateFlightWithName)) {
          // ورودی میلادی است → تبدیل به شمسی
          this.dateGregorianReturn = this.convertGregorianToPersian(newVal);
        } else {
          // ورودی شمسی است → تبدیل به میلادی
          const gregorianDate = this.convertPersianDateToGregorian(newVal);
          const year = gregorianDate.getFullYear();
          const month = String(gregorianDate.getMonth() + 1).padStart(2, '0'); // 01, 02, ...
          const day = String(gregorianDate.getDate()).padStart(2, '0'); // 01, 02, ...

          this.dateGregorianReturn = `${year}-${month}-${day}`;
        }


      },
      'dataSearch': {
        handler: function(after, before) {
          if (after) {
            let _this = this

              if (this.dataSearch) {
                this.data_search = this.dataSearch.dataSearch

                this.title_origin_city_search = this.data_search.name_departure
                this.title_arrival_city_search = this.data_search.name_arrival

                this.iata_origin = this.data_search.origin
                this.iata_arrival = this.data_search.destination
                this.date_departure = this.data_search.departure_date_en
                this.date_return = this.data_search.arrival_date_en

                this.setSearchedStorage()

                this.checkToDayDate()
                this.getCurrencyInfo()
                this.listCurrency()
                this.getPopularFlightList()
                // this.searchCity(this.dataSearch.dataSearch.software_lang)

                if (this.dataSearch.dataSearch.software_lang != 'fa') {
                  this.format_datepicker = 'YYYY-MM-DD'
                  this.lang_datepicker = 'en'
                }

                // Activate seat class filter based on URL parameter
                console.log('🔵 [SIDEBAR-DATASEARCH] Checking classFlight from dataSearch watcher:', this.data_search.classFlight);
                console.log('🔵 [SIDEBAR-DATASEARCH] Current seatClassFilter:', this.seatClassFilter);
                if (this.data_search.classFlight && this.data_search.classFlight !== 'all') {
                  console.log('🟢 [SIDEBAR-DATASEARCH] Will try to activate seat class filter for:', this.data_search.classFlight);
                  // The actual activation will happen in seatClassFilter watcher when filters are loaded
                }
              }
            }
        },
        deep: true,
        immediate: true,

      },
      price() {
        if (this.price) {
          this.min_price_props = this.price.min_price
          this.max_price_props = this.price.max_price
          this.value_price = [this.price.min_price, this.price.max_price]
        }
      },
      seatClassFilter: {
        handler: function(newVal, oldVal) {
          console.log('🔵 [SIDEBAR-WATCH] seatClassFilter changed!');
          console.log('🔵 [SIDEBAR-WATCH] Old value:', oldVal);
          console.log('🔵 [SIDEBAR-WATCH] New value:', newVal);
          console.log('🔵 [SIDEBAR-WATCH] data_search.classFlight:', this.data_search?.classFlight);

          // Check if we have a classFlight parameter in URL and filters are now loaded
          // seatClassFilter can be either an Array or an Object
          const hasFilters = newVal && (
            (Array.isArray(newVal) && newVal.length > 0) ||
            (typeof newVal === 'object' && Object.keys(newVal).length > 0)
          );
          console.log('🔵 [SIDEBAR-WATCH] hasFilters:', hasFilters);

          if (hasFilters && this.data_search && this.data_search.classFlight) {
            const classFlight = this.data_search.classFlight;
            console.log('🟢 [SIDEBAR-WATCH] Will activate filter for:', classFlight);

            // Give DOM more time to render the filter items
            setTimeout(() => {
              this.activateSeatClassFilter(classFlight);
            }, 800);
          }
        },
        deep: true,
        immediate: true
      },
       '$store.state.flights.dept'(val) {
          if (val?.length && !this.firstInitDone) {
             this.initFirstFilter();
          }
       },
       '$store.state.flights.return'(val) {
          if (val?.length && !this.firstInitDone) {
             this.initFirstFilter();
          }
       }
    },
    components: {
      'VueSlider': VueSlider,
      'v-select': vSelect,
      'date-picker': datePicker,
      'date-picker-return': datePicker

    },
    mounted() {
      if (this.price) {
        this.min_price_props = this.price.min_price
        this.max_price_props = this.price.max_price
        this.value_price = [this.price.min_price, this.price.max_price]

      }

      console.log('dataaaaa: ' , this.data_search)
    },

    computed:{
  /*    date_departure(){

          let data_store = JSON.parse(JSON.stringify(this.dataSearch.dataSearch));
          console.log(data_store.departure_date_en);
          return data_store.departure_date_en;

      },
      date_return(){

        let data_store_return = JSON.parse(JSON.stringify(this.dataSearch.dataSearch));
        console.log(data_store_return.arrival_date_en);
        return data_store_return.arrival_date_en;

      },*/

    },



  }
</script>
<style>

/* همیشه تقویم را پایین input باز کن */
.dp__menu, .ui-datepicker {
   top: 100% !important;
   bottom: auto !important;
   left: 0 !important;
   right: auto !important;
   transform: none !important;
   /* اگر absolute جواب نداد، position: fixed را هم تست کن */
}
.pdp-picker{
   top: 100% !important;
   bottom: auto !important;
   left: 0 !important;
   right: auto !important;
   transform: none !important;
}
.text-sm-flight{
  font-size:12px !important;
}
</style>
