<template>
  <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 parvaz-sidebar col-padding-5">
    <div class="parent_sidebar">
      <div class="currency-gds" v-if="data_search.is_currency > 0" @click="showListCurrencyExist()">
        <div class="currency-inner DivDefaultCurrency">
          <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/Iran.png`" alt="" id="IconDefaultCurrency"
               v-if="currency_info ===''">
          <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/${currency_info.CurrencyFlag}`" alt=""
               id="IconDefaultCurrency" v-else>
          <span class="TitleDefaultCurrency" id="TitleDefaultCurrency">  {{ currency_title }}</span>
          <span class="currency-arrow"></span>
        </div>
        <div class="change-currency show-currency" v-show="is_show_currency_list">
          <div class="change-currency-inner">
            <div class="change-currency-item main" @click="ConvertCurrency('0','Iran.png','ریال ایران')">
              <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/Iran.png`" alt="">
              <span>{{ useXmltag('Rial') }}</span>
            </div>

            <template v-for="currency in list_currency">
              <div class="change-currency-item"
                   @click="ConvertCurrency(currency.CurrencyCode,currency.CurrencyFlag,currency.CurrencyTitle)">
                <img :src="`${getUrlWithoutLang()}/pic/flagCurrency/${currency.CurrencyFlag}`"
                     alt="">
                <span>{{ currency.CurrencyTitle }}</span>
              </div>
            </template>
            <!---->
          </div>
        </div>
      </div>
      <!-- Result search -->
      <div class="filtertip parvaz-filter-change site-bg-main-color site-bg-color-border-bottom">
        <a v-if="today_date"
           :href="`${amadeusPathByLang()}international/1/${data_search.origin}-${data_search.destination}/${dataSearch.prev}/Y/${data_search.adult}-${data_search.child}-${data_search.infant}`">
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
            <span class=" bold counthotel">{{ data_search.name_departure }}</span>
            {{ useXmltag('On') }}
            <span class=" bold counthotel">{{ data_search.name_arrival }}</span>
          </p>
          <p class="counthotel txt12 mt-2">{{ data_search.DateFlightWithName }} </p>
          <p class="counthotel text-center txt12 dir-ltr" v-if="isPersianDate(data_search.departureDate)">
            {{ formatDate(data_search.departure_date_en) }} </p>
          <p class="counthotel text-center text-sm-flight dir-ltr" v-else>
            {{ this.formatDatePersian(data_search.departureDate) }}</p>

          <div class="silence_span ph-item2" v-if="countFlights > 0">{{ countFlights }} {{
              useXmltag('NumberFlightFound')
            }}
          </div>
        </div>
        <a v-if="today_date"
           :href="`${amadeusPathByLang()}international/1/${data_search.origin}-${data_search.destination}/${dataSearch.next}/Y/${data_search.adult}-${data_search.child}-${data_search.infant}`">
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
      <!-- search box -->
      <main-sidebar :dataSearch='dataSearch' :countFlights='countFlights'></main-sidebar>
      <div class="s-u-filter-wrapper s-u-filter-wrapper-fo">
        <ul id="s-u-filter-wrapper-ul">
          <span class="s-u-close-filter"></span>

          <!-- pricefilter -->
          <!--               <li class="s-u-filter-item" data-group="flight-price">-->
          <!--                           <span class="s-u-filter-title">-->
          <!--                           <i class="zmdi zmdi-money site-main-text-color-drck"></i>  {{ useXmltag('Price') }}</span>-->
          <!--                  <div class="s-u-filter-content slider_range_parent ">-->
          <!--                     <vue-slider v-model="value_price" :tooltip="'always'"  :min="min_price_props" :max="max_price_props" @change="priceRangeSlider(value_price)">-->
          <!--                        <template v-slot:tooltip="{value}">-->
          <!--                           <div class="vue-slider-dot-tooltip-inner vue-slider-dot-tooltip-inner-top site-bg-main-color  site-border-main-color">{{ value| formatNumber }}</div>-->
          <!--                        </template>-->

          <!--                        <template v-slot:process="{ start, end, style, index }">-->
          <!--                           <div class="vue-slider-process vue-slider-dot-tooltip-inner site-bg-main-color" :style="[style]">-->
          <!--                              &lt;!&ndash; Can add custom elements here &ndash;&gt;-->
          <!--                           </div>-->
          <!--                        </template>-->
          <!--                     </vue-slider>-->

          <!--                  </div>-->
          <!--               </li>-->


          <li class="s-u-filter-item" data-group="flight-price">
                           <span class="s-u-filter-title">
                           <i class="zmdi zmdi-money site-main-text-color-drck"></i>  {{
                               useXmltag('Price') + ' (' + useXmltag('Rial') + ')'
                             }}</span>
            <div class="s-u-filter-content slider_range_parent ">
              <div class="text-center d-flex justify-content-between align-items-center m-auto w-100">
                <span>{{ value_price[1] | formatNumber }}</span>
                <span>-</span>
                <span>{{ value_price[0] | formatNumber }}</span>
              </div>
              <vue-slider v-model="value_price" :tooltip="'none'" :min="min_price_props" :max="max_price_props"
                          @change="priceRangeSlider(value_price)">
              </vue-slider>
            </div>
          </li>
          <!-- flight duplicate filter -->

          <li class="s-u-filter-item p-2 py-3">
            <div class="form-check form-switch p-0">
              <div class="d-flex align-items-center justify-content-between p-0 w-100">
                <label for="duplicateFlightSwitch" style="margin:0 !important;">
                  <i class="fa fa-eraser FlightRepetitionCount site-main-text-color-drck"
                     style="font-size:13px !important"></i>
                  <span class="" style="font-weight:500 !important;font-size:13px">{{
                      useXmltag('FlightRepetitionShow')
                    }}</span>
                </label>

                <span
                    :class="[
    'tzCBPart',
    'site-bg-filter-color',
    'filter-to-check',
    'duplicateFlightSwitch',
    !duplicateFlight ? 'checked' : ''
  ]" @click="toggleDuplicateFlights">
    </span>


              </div>
              <input
                  type="checkbox"
                  id="duplicateFlightSwitch"
                  class="check-switch"
                  v-model="duplicateFlight"
                  style="display:none;"/>


              <p :class="[
                    duplicateFlight ? 'd-none' : 'd-block','small','mt-2'
                 ]" style="font-weight:500 !important;font-size:11px">
                {{ removedCount }} {{ useXmltag('FlightRepetitionCount') }}
              </p>
            </div>
          </li>
          <!-- flight Interrupt filter -->
          <li class="s-u-filter-item" data-group="flight-interrupt">

            <span class="s-u-filter-title"><i
                class="zmdi zmdi-filter-list site-main-text-color-drck"></i>{{ useXmltag('Stop') }}  </span>

            <div class="s-u-filter-content">

              <ul class="s-u-filter-item-time filter-interrupt-ul filter-interrupt-ul-f">

                <li>
                  <label for="filter-interrupt">
                    <span>{{ useXmltag('All') }} </span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color checked filter-to-check all_stop"
                      @click="stopFilterFlight('all_stop')" filtered="all_stop"></span>
                  <input class="check-switch" type="checkbox" id="filter-interrupt" value="allStop"
                         checked="checked"/>

                </li>

                <li v-for="turn_interrupt in interrupt">
                  <label :for="`filter-${turn_interrupt.name_en}`">
                    <span>{{ turn_interrupt.name_fa }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color stop"
                      @click="stopFilterFlight(turn_interrupt.name_en)"
                      :class="`${turn_interrupt.name_en}`"></span>
                  <input class="check-switch" type="checkbox" :id="`filter-${turn_interrupt.name_en}`"
                         :value="`${turn_interrupt.name_en}`"/>

                </li>

              </ul>
            </div>
          </li>
          <!-- flight type filter -->
          <li class="s-u-filter-item" data-group="flight-type">

                        <span class="s-u-filter-title"><i
                            class="zmdi zmdi-flight-takeoff site-main-text-color-drck"></i> {{
                            useXmltag('Typeflight')
                          }} </span>

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
                         checked="checked"/>

                </li>

                <li v-for="filter_flight in typeFlightFilter">
                  <label :for="`filter-${filter_flight.name_en}`">
                    <span>{{ filter_flight.name_fa }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color type_flight"
                      @click="typeFilterFlight(filter_flight.name_en)"
                      :class="`${filter_flight.name_en}`"></span>
                  <input class="check-switch" type="checkbox" :id="`filter-${filter_flight.name_en}`"
                         :value="`${filter_flight.name_en}`"/>
                </li>
              </ul>
            </div>
          </li>
          <!-- seat class filter -->
          <li class="s-u-filter-item" data-group="flight-seat">

                       <span class="s-u-filter-title"><i class="zmdi zmdi-airline-seat-recline-extra"></i>
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
                         checked="checked"/>
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
                         :value="`${seat_class.name_en}`"/>
                </li>
              </ul>
            </div>
          </li>
          <li class="s-u-filter-item" data-group="flight-airline">
            <span class="s-u-filter-title"><i
                class="zmdi zmdi-local-airport site-main-text-color-drck"></i> {{ useXmltag('Airline') }}</span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-airline-ul filter-airline-ul-f">
                <li>
                  <label for="filter-airline">
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color checked filter-to-check  all_airline"
                      @click="airlineFilterFlight('all_airline')"></span>
                  <input class="check-switch" type="checkbox" id="filter-airline" value="allAirline"
                         checked="checked"/>

                </li>

                <template v-for="data_each_airline in minPriceAirline">
                  <li :id="`${data_each_airline.name_en}-filter`">
                    <label :for="`filter-${data_each_airline.name_en}`" class='align-items-center justify-content-between'>
                      <i :id="`${data_each_airline.name_en}-minPrice`">{{ data_each_airline.price }}</i>
                      <span class='text-left'>{{ data_each_airline.name }}</span>
                    </label>
                    <span
                        class="tzCBPart site-bg-filter-color airline"
                        @click="airlineFilterFlight(data_each_airline.name_en)"
                        :class="`${data_each_airline.name_en}`"></span>
                    <input class="check-switch" type="checkbox"
                           :id="`filter-${data_each_airline.name_en}`"
                           v-model="data_each_airline.name_en"/>
                  </li>
                </template>
              </ul>
            </div>
          </li>

          <li class="s-u-filter-item" data-group="flight-baggage">
      <span class="s-u-filter-title">
         <i class="zmdi zmdi-case site-main-text-color-drck"></i>
         {{ useXmltag('BaggageAllowance') }}
      </span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-baggage-ul">
                <!-- گزینه همه -->
                <li>
                  <label for="filter-baggage-all">
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color checked filter-to-check all_baggage"
                      @click="baggageFilterFlight('all_baggage')">
               </span>
                  <input
                      class="check-switch"
                      type="checkbox"
                      id="filter-baggage-all"
                      value="allBaggage"
                      checked="checked"/>
                </li>
                <li v-for="(baggage, key) in baggageFilter" :key="key">
                  <!-- ✅ key اصلی برای شناسایی -->
                  <!-- برای id و کلاس، key را نرمال‌سازی کن -->
                  <label :for="`filter-baggage-${key.replace(/\s/g, '_')}`">
                    <span class="filter-baggage-label">{{ baggage.name_fa }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color baggage"
                      :class="['baggage_' + key.replace(/\s/g, '_')]"
                      @click="baggageFilterFlight(key)">
   </span>
                  <input
                      class="check-switch"
                      type="checkbox"
                      :id="`filter-baggage-${key.replace(/\s/g, '_')}`"
                      :value="key"/>
                </li>
              </ul>
            </div>
          </li>
          <!-- time filter -->
          <li class="s-u-filter-item" data-group="flight-time">
  <span class="s-u-filter-title">
    <i class="zmdi zmdi-time site-main-text-color-drck"></i>
    {{ useXmltag('RunTime') }}
  </span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-time-ul filter-time-ul-f departure-time-wrapper">
                <!-- گزینه همه -->
                <li class="departure-time-all-item d-none">
                  <label for="filter-time" class="departure-time-all-label">
                    <span class="departure-time-all-text">{{ useXmltag('All') }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color checked filter-to-check all_time"
                      id="allTime"
                      @click="timeFilterFlightForeign('all_time')">
        </span>
                  <input class="check-switch" type="checkbox" id="filter-time" value="allTime"
                         checked="checked"/>
                </li>

                <!-- گزینه‌های زمان رفت -->
                <template v-for="(each_time, key) in timeFilter">
                  <li
                      :key="key"
                      class="departure-time-grid-item"
                      :class="{ 'departure-time-grid-item-selected': each_time.checked }"
                      @click.stop="toggleDepartureTime(each_time)"
                  >
                    <label :for="`filter-${each_time.time}`" class="departure-time-grid-label" @click.stop>
                      <i class="departure-time-grid-icon" v-html="getDepartureIcon(each_time.time)"></i>
                      <span class="departure-time-grid-name">{{ each_time.name_fa }}</span>
                      <span class="departure-time-grid-range">{{ each_time.value }}</span>
                    </label>
                    <span
                        class="tzCBPart site-bg-filter-color time"
                        :class="`${each_time.time}`">
          </span>
                    <input class="check-switch" type="checkbox" :id="`filter-${each_time.time}`"
                           v-model="each_time.checked"/>
                  </li>
                </template>
              </ul>
            </div>
          </li>
          <li class="s-u-filter-item" data-group="flight-transit-duration">
    <span class="s-u-filter-title">
        <i class="zmdi zmdi-timer site-main-text-color-drck"></i>
        {{ useXmltag('TransitDuration') }}
    </span>
            <div class="s-u-filter-content slider_range_parent">
              <div class="text-center d-flex justify-content-between align-items-center m-auto w-100">
                <span>{{ transitDurationValue[1] }} {{ useXmltag('Hour') }}</span>
                <span>-</span>
                <span>{{ transitDurationValue[0] }} {{ useXmltag('Hour') }}</span>
              </div>
              <vue-slider
                  v-model="transitDurationValue"
                  :tooltip="'none'"
                  :min="transitDurationMin"
                  :max="transitDurationMax"
                  :step="1"
                  :direction="rtl"
                  @change="transitDurationFilterFlight(transitDurationValue)">
              </vue-slider>
            </div>
          </li>
          <li class="s-u-filter-item" data-group="flight-arrival-time">
  <span class="s-u-filter-title">
    <i class="zmdi zmdi-time site-main-text-color-drck"></i>
    {{ useXmltag('ArrivingTime') }}
  </span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-arrival-time-ul filter-arrival-time-ul-f arrival-time-wrapper">
                <!-- گزینه همه - بدون هیچ تغییری -->
                <li class="arrival-time-all-item">
                  <label for="filter-arrival-time" class="arrival-time-all-label">
                    <span class="arrival-time-all-text">{{ useXmltag('All') }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color checked filter-to-check all_arrival_time"
                      id="allArrivalTime"
                      @click="arrivalTimeFilterFlight('all_arrival_time')">
        </span>
                  <input class="check-switch" type="checkbox" id="filter-arrival-time" value="allArrivalTime"
                         checked="checked"/>
                </li>

                <!-- گزینه‌های زمان رسیدن -->
                <template v-for="(each_time, key) in timeArrivalFilter">
                  <li
                      :key="key"
                      class="arrival-time-grid-item"
                      :class="{ 'arrival-time-grid-item-selected': each_time.checked }"
                      @click.stop="toggleArrivalTime(each_time)"
                  >
                    <label :for="`filter-${each_time.time}`" class="arrival-time-grid-label" @click.stop>
                      <i class="arrival-time-grid-icon" v-html="getArrivalIcon(each_time.time)"></i>
                      <span class="arrival-time-grid-name">{{ each_time.name_fa }}</span>
                      <span class="arrival-time-grid-range">{{ each_time.value }}</span>
                    </label>
                    <span
                        class="tzCBPart site-bg-filter-color arrival_time"
                        :class="`${each_time.time}`">
          </span>
                    <input class="check-switch" type="checkbox" :id="`filter-${each_time.time}`"
                           v-model="each_time.checked"/>
                  </li>
                </template>
              </ul>
            </div>
          </li>
          <li class="s-u-filter-item" data-group="flight-transit-airports">
    <span class="s-u-filter-title">
        <i class="zmdi zmdi-pin-drop site-main-text-color-drck"></i>
        {{ useXmltag('LayoverAirportsOutboundFlight') }}
    </span>
            <div class="s-u-filter-content">
              <ul class="s-u-filter-item-time filter-transit-airports-ul filter-transit-airports-ul-f">
                <!-- گزینه همه -->
                <li>
                  <label for="filter-transit-airports">
                    <span>{{ useXmltag('All') }}</span>
                  </label>
                  <span
                      class="tzCBPart site-bg-filter-color checked filter-to-check all_transit_airports"
                      @click="transitAirportsFilterFlight('all_transit_airports')">
                </span>
                  <input class="check-switch" type="checkbox" id="filter-transit-airports" value="allTransitAirports"
                         checked="checked"/>
                </li>

                <!-- گزینه‌های فرودگاه‌های توقف -->
                <template v-for="(airport, index) in transitAirports">
                  <li>
                    <label :for="`filter-transit-${airport.code}`" class="justify-content-between">
                      <i>{{ airport.code }}</i>
                      <span>{{ airport.airport_name || airport.name }}</span>
                    </label>
                    <span
                        class="tzCBPart site-bg-filter-color transit_airport"
                        @click="transitAirportsFilterFlight(airport.code)"
                        :class="airport.code">
        </span>
                    <input class="check-switch" type="checkbox" :id="`filter-transit-${airport.code}`"
                           :value="airport.code"/>
                  </li>
                </template>

                <!-- پیام "بدون توقف" -->
                <li v-if="transitAirports && transitAirports.length === 0">
                  <span class="text-muted">{{ useXmltag('NoTransitFlights') }}</span>
                </li>
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
import mainSidebar from './mainSidebar'

export default {
  name: "sidebar",
  props: ['dataSearch', 'price', 'interrupt', 'timeFilter', 'timeArrivalFilter', 'typeFlightFilter', 'seatClassFilter', 'minPriceAirline', 'countFlights', 'baggageFilter', 'transitAirports', 'transitDurationFilter'],
  data() {
    return {
      is_show_currency_list: false,
      currency_title: '',
      value_price: [0, 0],
      title_origin_city: '',
      title_arrival_city: '',
      iata_origin: '',
      iata_arrival: '',
      cities_origin: [],
      cities_arrival: [],
      min_price_props: 0,
      max_price_props: 0,
      data_search: [],
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
      format_datepicker: 'jYYYY-jMM-jDD',
      duplicateFlight: true,
      originalDeptFlights: [],
      originalReturnFlights: [],
      firstTimeApplied: false,
      removedCount: 0,
      isOfferFilterActive: false,
      lang_datepicker: 'fa',
      baggageOptions: [],
      selectedBaggage: 'all_baggage',
      originalBaggageFlights: [],
      allFlights: [],
      transitDurationValue: [0, 24],
      transitDurationMin: 0,
      transitDurationMax: 24,
      localTimeFilter: [],
      localTimeArrivalFilter: [],
      svg_icon_1: `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" version="1.1" x="0" y="0" viewBox="0 0 907.62 907.619" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><g xmlns="http://www.w3.org/2000/svg"><path d="M591.672,907.618c28.995,0,52.5-23.505,52.5-52.5V179.839l42.191,41.688c10.232,10.11,23.567,15.155,36.898,15.155   c13.541,0,27.078-5.207,37.347-15.601c20.379-20.625,20.18-53.865-0.445-74.244L626.892,15.155C617.062,5.442,603.803,0,589.993,0   c-0.104,0-0.211,0-0.314,0.001c-13.923,0.084-27.244,5.694-37.03,15.6l-129.913,131.48c-20.379,20.625-20.18,53.865,0.445,74.244   c20.626,20.381,53.866,20.181,74.245-0.445l41.747-42.25v676.489C539.172,884.113,562.677,907.618,591.672,907.618z"></path><path d="M315.948,0c-28.995,0-52.5,23.505-52.5,52.5v676.489l-41.747-42.25c-20.379-20.625-53.62-20.825-74.245-0.445   c-20.625,20.379-20.825,53.619-0.445,74.244l129.912,131.479c9.787,9.905,23.106,15.518,37.029,15.601   c0.105,0.001,0.21,0.001,0.315,0.001c13.81,0,27.07-5.442,36.899-15.155L484.44,760.78c20.625-20.379,20.824-53.619,0.445-74.244   c-20.379-20.626-53.62-20.825-74.245-0.445l-42.192,41.688V52.5C368.448,23.505,344.943,0,315.948,0z" style=""></path></g></g></svg>`,
      svg_icon_2: `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g transform="matrix(-1,-1.2246467991473532e-16,1.2246467991473532e-16,-1,512,512)"><g xmlns="http://www.w3.org/2000/svg"><g><path d="M374.108,373.328c-7.829-7.792-20.492-7.762-28.284,0.067L276,443.557V20c0-11.046-8.954-20-20-20    c-11.046,0-20,8.954-20,20v423.558l-69.824-70.164c-7.792-7.829-20.455-7.859-28.284-0.067c-7.83,7.793-7.859,20.456-0.068,28.285    l104,104.504c0.006,0.007,0.013,0.012,0.019,0.018c7.792,7.809,20.496,7.834,28.314,0.001c0.006-0.007,0.013-0.012,0.019-0.018    l104-104.504C381.966,393.785,381.939,381.121,374.108,373.328z" style="" class=""></path></g></g></g></svg>`,
    }
  },
  methods: {
    getDepartureIcon(time) {
      const icons = {
        'early': `
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 10V3M12 3L9 6M12 3L15 6M6 12L5 11M18 12L19 11M3 18H21M5 21H19M7 18C7 15.2386 9.23858 13 12 13C14.7614 13 17 15.2386 17 18" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      `,
        'morning': `
       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" width="35" height="35"><path d="M 24.90625 3.96875 C 24.863281 3.976563 24.820313 3.988281 24.78125 4 C 24.316406 4.105469 23.988281 4.523438 24 5 L 24 11 C 23.996094 11.359375 24.183594 11.695313 24.496094 11.878906 C 24.808594 12.058594 25.191406 12.058594 25.503906 11.878906 C 25.816406 11.695313 26.003906 11.359375 26 11 L 26 5 C 26.011719 4.710938 25.894531 4.433594 25.6875 4.238281 C 25.476563 4.039063 25.191406 3.941406 24.90625 3.96875 Z M 10.65625 9.84375 C 10.28125 9.910156 9.980469 10.183594 9.875 10.546875 C 9.769531 10.914063 9.878906 11.304688 10.15625 11.5625 L 14.40625 15.8125 C 14.648438 16.109375 15.035156 16.246094 15.410156 16.160156 C 15.78125 16.074219 16.074219 15.78125 16.160156 15.410156 C 16.246094 15.035156 16.109375 14.648438 15.8125 14.40625 L 11.5625 10.15625 C 11.355469 9.933594 11.054688 9.820313 10.75 9.84375 C 10.71875 9.84375 10.6875 9.84375 10.65625 9.84375 Z M 39.03125 9.84375 C 38.804688 9.875 38.59375 9.988281 38.4375 10.15625 L 34.1875 14.40625 C 33.890625 14.648438 33.753906 15.035156 33.839844 15.410156 C 33.925781 15.78125 34.21875 16.074219 34.589844 16.160156 C 34.964844 16.246094 35.351563 16.109375 35.59375 15.8125 L 39.84375 11.5625 C 40.15625 11.265625 40.246094 10.800781 40.0625 10.410156 C 39.875 10.015625 39.460938 9.789063 39.03125 9.84375 Z M 24.90625 15 C 24.875 15.007813 24.84375 15.019531 24.8125 15.03125 C 24.75 15.035156 24.6875 15.046875 24.625 15.0625 C 24.613281 15.074219 24.605469 15.082031 24.59375 15.09375 C 19.289063 15.320313 15 19.640625 15 25 C 15 30.503906 19.496094 35 25 35 C 30.503906 35 35 30.503906 35 25 C 35 19.660156 30.746094 15.355469 25.46875 15.09375 C 25.433594 15.09375 25.410156 15.0625 25.375 15.0625 C 25.273438 15.023438 25.167969 15.003906 25.0625 15 C 25.042969 15 25.019531 15 25 15 C 24.96875 15 24.9375 15 24.90625 15 Z M 24.9375 17 C 24.957031 17 24.980469 17 25 17 C 25.03125 17 25.0625 17 25.09375 17 C 29.46875 17.050781 33 20.613281 33 25 C 33 29.421875 29.421875 33 25 33 C 20.582031 33 17 29.421875 17 25 C 17 20.601563 20.546875 17.035156 24.9375 17 Z M 4.71875 24 C 4.167969 24.078125 3.78125 24.589844 3.859375 25.140625 C 3.9375 25.691406 4.449219 26.078125 5 26 L 11 26 C 11.359375 26.003906 11.695313 25.816406 11.878906 25.503906 C 12.058594 25.191406 12.058594 24.808594 11.878906 24.496094 C 11.695313 24.183594 11.359375 23.996094 11 24 L 5 24 C 4.96875 24 4.9375 24 4.90625 24 C 4.875 24 4.84375 24 4.8125 24 C 4.78125 24 4.75 24 4.71875 24 Z M 38.71875 24 C 38.167969 24.078125 37.78125 24.589844 37.859375 25.140625 C 37.9375 25.691406 38.449219 26.078125 39 26 L 45 26 C 45.359375 26.003906 45.695313 25.816406 45.878906 25.503906 C 46.058594 25.191406 46.058594 24.808594 45.878906 24.496094 C 45.695313 24.183594 45.359375 23.996094 45 24 L 39 24 C 38.96875 24 38.9375 24 38.90625 24 C 38.875 24 38.84375 24 38.8125 24 C 38.78125 24 38.75 24 38.71875 24 Z M 15 33.875 C 14.773438 33.90625 14.5625 34.019531 14.40625 34.1875 L 10.15625 38.4375 C 9.859375 38.679688 9.722656 39.066406 9.808594 39.441406 C 9.894531 39.8125 10.1875 40.105469 10.558594 40.191406 C 10.933594 40.277344 11.320313 40.140625 11.5625 39.84375 L 15.8125 35.59375 C 16.109375 35.308594 16.199219 34.867188 16.039063 34.488281 C 15.882813 34.109375 15.503906 33.867188 15.09375 33.875 C 15.0625 33.875 15.03125 33.875 15 33.875 Z M 34.6875 33.875 C 34.3125 33.941406 34.011719 34.214844 33.90625 34.578125 C 33.800781 34.945313 33.910156 35.335938 34.1875 35.59375 L 38.4375 39.84375 C 38.679688 40.140625 39.066406 40.277344 39.441406 40.191406 C 39.8125 40.105469 40.105469 39.8125 40.191406 39.441406 C 40.277344 39.066406 40.140625 38.679688 39.84375 38.4375 L 35.59375 34.1875 C 35.40625 33.988281 35.148438 33.878906 34.875 33.875 C 34.84375 33.875 34.8125 33.875 34.78125 33.875 C 34.75 33.875 34.71875 33.875 34.6875 33.875 Z M 24.90625 37.96875 C 24.863281 37.976563 24.820313 37.988281 24.78125 38 C 24.316406 38.105469 23.988281 38.523438 24 39 L 24 45 C 23.996094 45.359375 24.183594 45.695313 24.496094 45.878906 C 24.808594 46.058594 25.191406 46.058594 25.503906 45.878906 C 25.816406 45.695313 26.003906 45.359375 26 45 L 26 39 C 26.011719 38.710938 25.894531 38.433594 25.6875 38.238281 C 25.476563 38.039063 25.191406 37.941406 24.90625 37.96875 Z"/></svg>
      `,
        'afternoon': `
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M4 18H2M6.31412 12.3141L4.8999 10.8999M17.6858 12.3141L19.1 10.8999M22 18H20M7 18C7 15.2386 9.23858 13 12 13C14.7614 13 17 15.2386 17 18M22 22H2M16 5L12 9M12 9L8 5M12 9V2" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      `,
        'night': `
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21C16.9706 21 21 16.9706 21 12C21 11.5 20.95 11.01 20.85 10.54C19.86 12.08 18.14 13.1 16.18 13.1C13.08 13.1 10.56 10.58 10.56 7.48C10.56 5.52 11.58 3.8 13.12 2.81C12.76 2.64 12.38 2.5 12 2.5" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
      `
      };
      return icons[time] || icons['morning'];
    },

    toggleDepartureTime(each_time) {
      if (!each_time) return;

      // غیرفعال کردن "همه"
      const allCheckbox = document.getElementById('filter-time');
      const allSpan = document.getElementById('allTime');

      if (allCheckbox && allCheckbox.checked) {
        allCheckbox.checked = false;
        if (allSpan) allSpan.classList.remove('checked');
      }

      // تغییر وضعیت انتخاب
      each_time.checked = !each_time.checked;

      // اگر هیچ گزینه‌ای انتخاب نشد، "همه" رو فعال کن
      const anySelected = this.localTimeFilter.some(item => item.checked === true);

      if (!anySelected) {
        if (allCheckbox) {
          allCheckbox.checked = true;
          if (allSpan) allSpan.classList.add('checked');
        }
      }

      // فراخوانی متد فیلتر
      this.timeFilterFlightForeign(each_time.time);
    },

    timeFilterFlightForeign(value) {
      if (value === 'all_time') {
        this.localTimeFilter.forEach(item => {
          item.checked = false;
        });
      }

      this.$emit('filterFlights', value, 'time');
    },
    getArrivalIcon(time) {
      const icons = {
        // بامداد (00:00 - 04:59) - ماه و ستاره
        'arrival_early': `
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 10V3M12 3L9 6M12 3L15 6M6 12L5 11M18 12L19 11M3 18H21M5 21H19M7 18C7 15.2386 9.23858 13 12 13C14.7614 13 17 15.2386 17 18" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    `,

        // صبح (05:00 - 11:59) - خورشید طلوع
        'arrival_morning': `
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" width="35" height="35"><path d="M 24.90625 3.96875 C 24.863281 3.976563 24.820313 3.988281 24.78125 4 C 24.316406 4.105469 23.988281 4.523438 24 5 L 24 11 C 23.996094 11.359375 24.183594 11.695313 24.496094 11.878906 C 24.808594 12.058594 25.191406 12.058594 25.503906 11.878906 C 25.816406 11.695313 26.003906 11.359375 26 11 L 26 5 C 26.011719 4.710938 25.894531 4.433594 25.6875 4.238281 C 25.476563 4.039063 25.191406 3.941406 24.90625 3.96875 Z M 10.65625 9.84375 C 10.28125 9.910156 9.980469 10.183594 9.875 10.546875 C 9.769531 10.914063 9.878906 11.304688 10.15625 11.5625 L 14.40625 15.8125 C 14.648438 16.109375 15.035156 16.246094 15.410156 16.160156 C 15.78125 16.074219 16.074219 15.78125 16.160156 15.410156 C 16.246094 15.035156 16.109375 14.648438 15.8125 14.40625 L 11.5625 10.15625 C 11.355469 9.933594 11.054688 9.820313 10.75 9.84375 C 10.71875 9.84375 10.6875 9.84375 10.65625 9.84375 Z M 39.03125 9.84375 C 38.804688 9.875 38.59375 9.988281 38.4375 10.15625 L 34.1875 14.40625 C 33.890625 14.648438 33.753906 15.035156 33.839844 15.410156 C 33.925781 15.78125 34.21875 16.074219 34.589844 16.160156 C 34.964844 16.246094 35.351563 16.109375 35.59375 15.8125 L 39.84375 11.5625 C 40.15625 11.265625 40.246094 10.800781 40.0625 10.410156 C 39.875 10.015625 39.460938 9.789063 39.03125 9.84375 Z M 24.90625 15 C 24.875 15.007813 24.84375 15.019531 24.8125 15.03125 C 24.75 15.035156 24.6875 15.046875 24.625 15.0625 C 24.613281 15.074219 24.605469 15.082031 24.59375 15.09375 C 19.289063 15.320313 15 19.640625 15 25 C 15 30.503906 19.496094 35 25 35 C 30.503906 35 35 30.503906 35 25 C 35 19.660156 30.746094 15.355469 25.46875 15.09375 C 25.433594 15.09375 25.410156 15.0625 25.375 15.0625 C 25.273438 15.023438 25.167969 15.003906 25.0625 15 C 25.042969 15 25.019531 15 25 15 C 24.96875 15 24.9375 15 24.90625 15 Z M 24.9375 17 C 24.957031 17 24.980469 17 25 17 C 25.03125 17 25.0625 17 25.09375 17 C 29.46875 17.050781 33 20.613281 33 25 C 33 29.421875 29.421875 33 25 33 C 20.582031 33 17 29.421875 17 25 C 17 20.601563 20.546875 17.035156 24.9375 17 Z M 4.71875 24 C 4.167969 24.078125 3.78125 24.589844 3.859375 25.140625 C 3.9375 25.691406 4.449219 26.078125 5 26 L 11 26 C 11.359375 26.003906 11.695313 25.816406 11.878906 25.503906 C 12.058594 25.191406 12.058594 24.808594 11.878906 24.496094 C 11.695313 24.183594 11.359375 23.996094 11 24 L 5 24 C 4.96875 24 4.9375 24 4.90625 24 C 4.875 24 4.84375 24 4.8125 24 C 4.78125 24 4.75 24 4.71875 24 Z M 38.71875 24 C 38.167969 24.078125 37.78125 24.589844 37.859375 25.140625 C 37.9375 25.691406 38.449219 26.078125 39 26 L 45 26 C 45.359375 26.003906 45.695313 25.816406 45.878906 25.503906 C 46.058594 25.191406 46.058594 24.808594 45.878906 24.496094 C 45.695313 24.183594 45.359375 23.996094 45 24 L 39 24 C 38.96875 24 38.9375 24 38.90625 24 C 38.875 24 38.84375 24 38.8125 24 C 38.78125 24 38.75 24 38.71875 24 Z M 15 33.875 C 14.773438 33.90625 14.5625 34.019531 14.40625 34.1875 L 10.15625 38.4375 C 9.859375 38.679688 9.722656 39.066406 9.808594 39.441406 C 9.894531 39.8125 10.1875 40.105469 10.558594 40.191406 C 10.933594 40.277344 11.320313 40.140625 11.5625 39.84375 L 15.8125 35.59375 C 16.109375 35.308594 16.199219 34.867188 16.039063 34.488281 C 15.882813 34.109375 15.503906 33.867188 15.09375 33.875 C 15.0625 33.875 15.03125 33.875 15 33.875 Z M 34.6875 33.875 C 34.3125 33.941406 34.011719 34.214844 33.90625 34.578125 C 33.800781 34.945313 33.910156 35.335938 34.1875 35.59375 L 38.4375 39.84375 C 38.679688 40.140625 39.066406 40.277344 39.441406 40.191406 C 39.8125 40.105469 40.105469 39.8125 40.191406 39.441406 C 40.277344 39.066406 40.140625 38.679688 39.84375 38.4375 L 35.59375 34.1875 C 35.40625 33.988281 35.148438 33.878906 34.875 33.875 C 34.84375 33.875 34.8125 33.875 34.78125 33.875 C 34.75 33.875 34.71875 33.875 34.6875 33.875 Z M 24.90625 37.96875 C 24.863281 37.976563 24.820313 37.988281 24.78125 38 C 24.316406 38.105469 23.988281 38.523438 24 39 L 24 45 C 23.996094 45.359375 24.183594 45.695313 24.496094 45.878906 C 24.808594 46.058594 25.191406 46.058594 25.503906 45.878906 C 25.816406 45.695313 26.003906 45.359375 26 45 L 26 39 C 26.011719 38.710938 25.894531 38.433594 25.6875 38.238281 C 25.476563 38.039063 25.191406 37.941406 24.90625 37.96875 Z"/></svg>
    `,

        // بعد از ظهر (12:00 - 17:59) - خورشید غروب
        'arrival_afternoon': `
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M4 18H2M6.31412 12.3141L4.8999 10.8999M17.6858 12.3141L19.1 10.8999M22 18H20M7 18C7 15.2386 9.23858 13 12 13C14.7614 13 17 15.2386 17 18M22 22H2M16 5L12 9M12 9L8 5M12 9V2" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    `,

        // شب (18:00 - 23:59) - ماه کامل
        'arrival_night': `
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21C16.9706 21 21 16.9706 21 12C21 11.5 20.95 11.01 20.85 10.54C19.86 12.08 18.14 13.1 16.18 13.1C13.08 13.1 10.56 10.58 10.56 7.48C10.56 5.52 11.58 3.8 13.12 2.81C12.76 2.64 12.38 2.5 12 2.5" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    `
      };
      return icons[time] || icons['arrival_morning'];
    },
    toggleArrivalTime(each_time) {
      if (!each_time) return;

      // غیرفعال کردن "همه"
      const allCheckbox = document.getElementById('filter-arrival-time');
      const allSpan = document.getElementById('allArrivalTime');

      if (allCheckbox && allCheckbox.checked) {
        allCheckbox.checked = false;
        if (allSpan) allSpan.classList.remove('checked');
      }

      // تغییر وضعیت انتخاب
      each_time.checked = !each_time.checked;

      // اگر هیچ گزینه‌ای انتخاب نشد، "همه" رو فعال کن
      const anySelected = this.localTimeArrivalFilter.some(item => item.checked === true);

      if (!anySelected) {
        if (allCheckbox) {
          allCheckbox.checked = true;
          if (allSpan) allSpan.classList.add('checked');
        }
      }

      // فراخوانی متد فیلتر
      this.arrivalTimeFilterFlight(each_time.time);
    },
    arrivalTimeFilterFlight(value) {
      if (value === 'all_arrival_time') {
        this.localTimeArrivalFilter.forEach(item => {
          item.checked = false;
        });
      }

      this.$emit('filterFlights', value, 'arrival_time');
    },
    formatDate(dateString) {
      const date = new Date(dateString);
      const year = date.getFullYear();
      const month = date.toLocaleString('en-US', {month: 'short'});
      const day = date.getDate();
      return `${day} ${month} ${year}`;
    },
    isPersianDate(dateStr) {
      if (dateStr === undefined || dateStr === null || typeof dateStr !== 'string') {
        dateStr = dateNow('-')
      }
      const cleanDate = dateStr;

      // 2) تطابق الگوی YYYY-MM-DD
      const regex = /^(\d{4})-(\d{2})-(\d{2})$/;
      const match = cleanDate.match(regex);
      if (!match) return false;

      const year = parseInt(match[1], 10);
      const month = parseInt(match[2], 10);
      const day = parseInt(match[3], 10);

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
        const g_d_m = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
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
        "فروردین", "اردیبهشت", "خرداد", "تیر", "مرداد", "شهریور",
        "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند"
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
    baggageFilterFlight(value) {
      this.selectedBaggage = value;

      // غیرفعال کردن همه گزینه‌ها
      document.querySelectorAll('.baggage').forEach(el => {
        el.classList.remove('checked');
      });
      document.querySelectorAll('.all_baggage').forEach(el => {
        el.classList.remove('checked');
      });

      if (value === 'all_baggage') {
        document.querySelectorAll('.all_baggage').forEach(el => {
          el.classList.add('checked');
        });
        this.applyBaggageFilter(null);
      } else {
        // ✅ نرمال‌سازی value برای کلاس (جایگزینی فاصله با _)
        const sanitizedKey = value.replace(/\s/g, '_');
        const selector = `.baggage_${sanitizedKey}`;


        document.querySelectorAll(selector).forEach(el => {
          el.classList.add('checked');
        });

        this.applyBaggageFilter(value);
      }
    },
    applyBaggageFilter(selectedKey) {

      // دریافت لیست پروازها از Vuex
      let flights = this.$store.state.flights || [];

      // ذخیره پروازهای اصلی (اولین بار)
      if (this.originalBaggageFlights.length === 0 && flights.length > 0) {
        this.originalBaggageFlights = JSON.parse(JSON.stringify(flights));
      }

      // اگر هیچ پروازی نیست، از اصلی استفاده کن
      if (flights.length === 0) {
        flights = this.originalBaggageFlights;
      }

      let filteredFlights = [...this.originalBaggageFlights];

      // اگر "همه" نبود، فیلتر اعمال کن
      if (selectedKey !== null && selectedKey !== 'all_baggage') {


        // ============================================
        // 🔥 مقایسه مستقیم با رشته
        // ============================================
        filteredFlights = filteredFlights.filter(flight => {
          const baggageDisplay = this.getFlightBaggageDisplay(flight);


          // مقایسه مستقیم رشته‌ها
          const result = baggageDisplay === selectedKey;

          return result;
        });


      } else {
        console.log('🔄 "All" selected - showing all flights');
      }


      // به‌روزرسانی Vuex با پروازهای فیلتر شده
      this.$store.commit("updateInternationalFlights", filteredFlights);
    },
    getFlightBaggageDisplay(flight) {

      let baggageDisplay = '';

      // ============================================
      // مسیر 1: بررسی output_routes_detail
      // ============================================
      if (flight.output_routes_detail && Array.isArray(flight.output_routes_detail)) {
        for (let i = 0; i < flight.output_routes_detail.length; i++) {
          const route = flight.output_routes_detail[i];

          // 1.1 بررسی baggage.charge
          if (route.baggage && route.baggage.charge) {
            baggageDisplay = String(route.baggage.charge).trim();
            return baggageDisplay;
          }

          // 1.2 بررسی baggage_statement
          if (route.baggage_statement) {
            baggageDisplay = String(route.baggage_statement).trim();
            return baggageDisplay;
          }

          // 1.3 بررسی baggage (اگر رشته بود)
          if (route.baggage && typeof route.baggage === 'string') {
            baggageDisplay = String(route.baggage).trim();
            return baggageDisplay;
          }

          // 1.4 بررسی baggage (اگر آبجکت بود و charge داشت)
          if (route.baggage && typeof route.baggage === 'object' && route.baggage.charge) {
            baggageDisplay = String(route.baggage.charge).trim();
            return baggageDisplay;
          }
        }
      }

      // ============================================
      // مسیر 2: بررسی مستقیم baggage در flight
      // ============================================
      if (flight.baggage) {
        if (typeof flight.baggage === 'string') {
          baggageDisplay = String(flight.baggage).trim();
          return baggageDisplay;
        }
        if (typeof flight.baggage === 'object' && flight.baggage.charge) {
          baggageDisplay = String(flight.baggage.charge).trim();
          return baggageDisplay;
        }
      }

      return '';
    },
    getFlightBaggage(flight) {


      let baggageValue = 0;

      // ============================================
      // مسیر 1: بررسی output_routes_detail
      // ============================================
      if (flight.output_routes_detail && Array.isArray(flight.output_routes_detail)) {


        for (let i = 0; i < flight.output_routes_detail.length; i++) {
          const route = flight.output_routes_detail[i];


          // 1.1 بررسی baggage (آبجکت)
          if (route.baggage && typeof route.baggage === 'object') {
            const value = this.extractBaggageValue(route.baggage);
            if (value !== null && value > 0) {
              baggageValue = value;
              break;
            }
          }

          // 1.2 بررسی baggage (رشته)
          if (route.baggage && typeof route.baggage === 'string') {
            const match = route.baggage.match(/(\d+)/);
            if (match) {
              baggageValue = parseInt(match[1]);
              break;
            }
          }

          // 1.3 بررسی baggage_statement
          if (route.baggage_statement) {
            const match = String(route.baggage_statement).match(/(\d+)/);
            if (match) {
              baggageValue = parseInt(match[1]);
              break;
            }
          }

          // 1.4 بررسی baggage.charge
          if (route.baggage && route.baggage.charge) {
            const match = String(route.baggage.charge).match(/(\d+)/);
            if (match) {
              baggageValue = parseInt(match[1]);
              break;
            }
          }

          // 1.5 بررسی charge مستقیم در route
          if (route.charge) {
            const match = String(route.charge).match(/(\d+)/);
            if (match) {
              baggageValue = parseInt(match[1]);
              break;
            }
          }
        }
      }

      // ============================================
      // مسیر 2: بررسی return_routes
      // ============================================
      if (baggageValue === 0 && flight.return_routes) {

        if (flight.return_routes.return_route_detail && Array.isArray(flight.return_routes.return_route_detail)) {
          for (let i = 0; i < flight.return_routes.return_route_detail.length; i++) {
            const route = flight.return_routes.return_route_detail[i];

            if (route.baggage && typeof route.baggage === 'object') {
              const value = this.extractBaggageValue(route.baggage);
              if (value !== null && value > 0) {
                baggageValue = value;
                break;
              }
            }

            if (route.baggage && typeof route.baggage === 'string') {
              const match = route.baggage.match(/(\d+)/);
              if (match) {
                baggageValue = parseInt(match[1]);
                break;
              }
            }

            if (route.baggage && route.baggage.charge) {
              const match = String(route.baggage.charge).match(/(\d+)/);
              if (match) {
                baggageValue = parseInt(match[1]);
                break;
              }
            }
          }
        }
      }

      // ============================================
      // مسیر 3: بررسی مستقیم baggage در flight
      // ============================================
      if (baggageValue === 0 && flight.baggage) {
        if (typeof flight.baggage === 'object') {
          const value = this.extractBaggageValue(flight.baggage);
          if (value !== null && value > 0) {
            baggageValue = value;
          }
        } else if (typeof flight.baggage === 'string') {
          const match = flight.baggage.match(/(\d+)/);
          if (match) {
            baggageValue = parseInt(match[1]);
          }
        }
      }

      return baggageValue;
    },
    extractBaggageValue(baggage) {
      if (!baggage) return null;

      // اگر رشته است
      if (typeof baggage === 'string') {
        const match = baggage.match(/(\d+)/);
        return match ? parseInt(match[1]) : null;
      }

      // اگر آبجکت است
      if (typeof baggage === 'object') {
        // از charge
        if (baggage.charge) {
          const match = String(baggage.charge).match(/(\d+)/);
          if (match) return parseInt(match[1]);
        }
        // از baggage_statement
        if (baggage.baggage_statement) {
          const match = String(baggage.baggage_statement).match(/(\d+)/);
          if (match) return parseInt(match[1]);
        }
        // از code
        if (baggage.code) {
          const match = String(baggage.code).match(/(\d+)/);
          if (match) return parseInt(match[1]);
        }
        // از allowanceAmount
        if (baggage.allowanceAmount) {
          const match = String(baggage.allowanceAmount).match(/(\d+)/);
          if (match) return parseInt(match[1]);
        }
        // از baggageTextDisplay
        if (baggage.baggageTextDisplay) {
          const match = String(baggage.baggageTextDisplay).match(/(\d+)/);
          if (match) return parseInt(match[1]);
        }
      }

      return null;
    },
    extractBaggageValueFromString(str) {
      if (!str) return null;
      const match = String(str).match(/(\d+)/);
      const result = match ? parseInt(match[1]) : null;
      return result;
    },
    activateSeatClassFilter(classFlight) {
      // DO NOT emit to parent if this is initial load from URL
      // The parent (main.vue) already set the filter in created()
      // Emitting here would cause the filter to toggle off!

      // Only update UI - Remove checked from "همه" (All)
      let allSeatClassElements = document.getElementsByClassName('all_seat_class');

      if (allSeatClassElements.length > 0) {
        // Force remove checked class multiple times to ensure it's removed
        for (let i = 0; i < allSeatClassElements.length; i++) {
          allSeatClassElements[i].classList.remove("checked");
        }
      }

      // Find and activate the specific class
      let specificClassElements = document.getElementsByClassName(classFlight);

      if (specificClassElements.length > 0) {
        for (let i = 0; i < specificClassElements.length; i++) {
          if (specificClassElements[i].classList.contains('seat_class')) {
            specificClassElements[i].classList.add("checked");
            break;
          }
        }
      }
    },
    showListCurrencyExist() {
      this.is_show_currency_list = !this.is_show_currency_list;

      if (document.querySelector(".show-currency").classList.contains("d-block")) {
        document.getElementsByClassName('show-currency')[0].classList.remove("d-block");

      } else {
        document.getElementsByClassName('show-currency')[0].classList.add("d-block");
      }
    },
    async ConvertCurrency(code, Icon, Title) {
      let _this = this;
      document.getElementById('IconDefaultCurrency').setAttribute('src', rootMainPath + '/gds/pic/flagCurrency/' + Icon);
      _this.currency_title = Title;
      await axios.post(amadeusPath + 'ajax', {
        className: 'currencyEquivalent',
        method: 'CurrencyEquivalent',
        code: code,
        is_json: true
      }, {
        'Content-Type': 'application/json'
      }).then(function (response) {

        _this.is_show_currency_list = false;
        _this.$store.commit('setPriceCurrency', response.data);
      }).catch(function (error) {
      });

    },
    async getCurrencyInfo() {
      let _this = this;
      await axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'infoCurrency',
            is_json: true
          },
          {
            'Content-Type': 'application/json'
          }).then(function (response) {
        _this.currency_info = response.data.data;
        if (_this.dataSearch.dataSearch.software_lang !== 'fa') {
          _this.currency_title = _this.currency_info.CurrencyTitleEn;
        } else {
          _this.currency_title = _this.currency_info.CurrencyTitleFa;
        }
      }).catch(function (error) {
        _this.error_currency_info = error.message
      });
    },
    async listCurrency() {
      let _this = this;
      await axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'listCurrency',
            is_json: true
          },
          {
            'Content-Type': 'application/json'
          }).then(function (response) {
        _this.list_currency = response.data.data
      }).catch(function (error) {
        _this.list_currency = null
      });
    },
    async checkToDayDate() {
      let _this = this;
      await axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'checkToDayDate',
            dateSearch: _this.dataSearch.dataSearch.departureDate
          },
          {
            'Content-Type': 'application/json'
          }).then(function (response) {
        _this.today_date = response.data.data;
        _this.multi_way = (_this.dataSearch.dataSearch.MultiWay == 'TwoWay') ? true : false;

      }).catch(function (error) {
        _this.today_date = error.message
      });
    },
    transitDurationFilterFlight(value) {
      this.$emit('filterTransitDuration', value);
    },
    transitAirportsFilterFlight(value) {
      this.$emit('filterFlights', value, 'transit_airports');
    },
    stopFilterFlight(value) {
      this.$emit('filterFlights', value, 'stop');
    },
    typeFilterFlight(value) {
      this.$emit('filterFlights', value, 'type_flight');
    },
    airlineFilterFlight(value) {
      this.$emit('filterFlights', value, 'airline');
    },
    seatClassFilterFlight(value) {
      this.$emit('filterFlights', value, 'seat_class');
    },
    priceRangeSlider(value) {
      this.$emit('filterPriceFlights', value, 'price_sidebar');
    },

    toggleDuplicateFlights() {
      this.duplicateFlight = !this.duplicateFlight;
      this.applyFilter(this.duplicateFlight);
    },

    applyFilter(isOn) {
      const removeDuplicates = (arr) => {
        if (!arr || arr.length === 0) return [];

        const map = new Map();

        arr.forEach(f => {
          const isSpecialSeat =
              f.seat_class_en === 'business' || f.seat_class_en === 'premium_economy';

          const cabinPart = isSpecialSeat ? f.cabin_type : '';
          const key =
              `${f.departure_time}|${f.flight_type}|${cabinPart}|${f.airline_name_en}`;

          const price = f.price?.adult?.price ?? Infinity;

          if (price === 0) return;

          // فقط اگر قیمت معتبر نباشد، از آن صرف‌نظر کن
          if (price === null || price === undefined || price === Infinity) {
            return;
          }
          // console.log('price -> >>>>>> ' , price)
          if (!map.has(key)) {
            map.set(key, f);
          } else {
            const old = map.get(key);
            const oldPrice = old.price?.adult?.price ?? Infinity;
            if (price < oldPrice) map.set(key, f);
          }
        });

        return [...map.values()];
      };

      // دریافت داده اصلی (با یا بدون فیلتر پیشنهاد ویژه)
      let baseData = this.isOfferFilterActive
          ? this.originalDeptFlights.filter(f => f.is_private === 'private')
          : this.originalDeptFlights;

      if (isOn) {
        // فیلتر تکراری فعال: حذف تکراری‌ها
        const deptFiltered = removeDuplicates(baseData);
        this.$store.commit("updateInternationalFlights", deptFiltered);
      } else {
        // فیلتر تکراری غیرفعال: نمایش همه
        const deptFiltered = removeDuplicates(baseData);

        const originalNoZero = baseData.filter(f => {
          const price = f?.price?.adult?.price ?? 0;
          return price !== 0;
        });

        const filteredNoZero = deptFiltered.filter(f => {
          const price = f?.price?.adult?.price ?? 0;
          return price !== 0;
        });

        this.removedCount = originalNoZero.length - filteredNoZero.length;

        this.$store.commit("updateInternationalFlights",
            JSON.parse(JSON.stringify(baseData))
        );
      }
    },

    updateOfferFilterStatus(isActive) {
      this.isOfferFilterActive = isActive;
      this.applyFilter(this.duplicateFlight);
    }


  },
  computed: {
    flights() {
      return this.$store.state.flights;
    }
  },
  created: function () {
    this.enableCross = false

  },
  watch: {
    timeFilter: {
      handler(newVal) {
        if (newVal && typeof newVal === 'object') {
          this.localTimeFilter = Object.keys(newVal).map(key => ({
            ...newVal[key],
            key: key,
            checked: false
          }));
        } else {
          this.localTimeFilter = [];
        }
      },
      immediate: true,
      deep: true
    },
    timeArrivalFilter: {
      handler(newVal) {
        if (newVal && typeof newVal === 'object') {
          // تبدیل object به array و اضافه کردن checked
          this.localTimeArrivalFilter = Object.keys(newVal).map(key => ({
            ...newVal[key],
            key: key,
            checked: false
          }));
        } else {
          this.localTimeArrivalFilter = [];
        }
      },
      immediate: true,
      deep: true
    },
    flights: {
      handler(newFlights) {
        if (newFlights && newFlights.length > 0 && !this.firstTimeApplied) {
          this.originalDeptFlights = JSON.parse(JSON.stringify(newFlights));
          this.firstTimeApplied = true;
          this.applyFilter(true);
        }
      },
      immediate: true
    },
    dataSearch() {
      let _this = this;
      if (_this.dataSearch) {
        _this.data_search = _this.dataSearch.dataSearch;
        _this.title_origin_city = `${_this.data_search.airport_departure}-${_this.data_search.country_departure}-${_this.data_search.name_departure}-${_this.data_search.origin}`;
        _this.iata_origin = _this.data_search.origin;
        _this.title_arrival_city = `${_this.data_search.airport_arrival}-${_this.data_search.country_arrival}-${_this.data_search.name_arrival}-${_this.data_search.destination}`;
        _this.iata_arrival = _this.data_search.destination;
        // _this.checkToDayDate();
        _this.getCurrencyInfo();
        _this.listCurrency();

      }

    },
    price() {
      if (this.price) {
        this.min_price_props = this.price.min_price;
        this.max_price_props = this.price.max_price;
        this.value_price = [this.price.min_price, this.price.max_price];
      }
    },
    seatClassFilter: {
      handler: function (newVal, oldVal) {
        // Check if we have a classFlight parameter in URL and filters are now loaded
        // seatClassFilter can be either an Array or an Object
        const hasFilters = newVal && (
            (Array.isArray(newVal) && newVal.length > 0) ||
            (typeof newVal === 'object' && Object.keys(newVal).length > 0)
        );

        if (hasFilters && this.data_search && this.data_search.classFlight) {
          const classFlight = this.data_search.classFlight;

          // Give DOM more time to render the filter items
          setTimeout(() => {
            this.activateSeatClassFilter(classFlight);
          }, 800);
        }
      },
      deep: true,
      immediate: true
    }
  },
  components: {
    'VueSlider': VueSlider,
    'mainSidebar': mainSidebar
  },
  mounted() {
    if (this.transitDurationFilter) {
      this.transitDurationValue = this.transitDurationFilter;
    }
    if (this.price) {
      this.min_price_props = this.price.min_price;
      this.max_price_props = this.price.max_price;
      this.value_price = [this.price.min_price, this.price.max_price];

    }

    // گوش دادن به تغییرات فیلتر پیشنهاد ویژه از header
    this.$root.$on('offerFilterChanged', (isActive) => {
      this.updateOfferFilterStatus(isActive);
    });

  },

  beforeDestroy() {
    // حذف event listener برای جلوگیری از memory leak
    this.$root.$off('offerFilterChanged');
  }

}
</script>
<style>
.text-sm-flight {
  font-size: 12px !important;

}
</style>