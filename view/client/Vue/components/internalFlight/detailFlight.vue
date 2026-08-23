<template>
  <div class="w-100">
    <div v-if="showSidebarInternal">
      <div class="sidebar-overlay" @click="closeSidebar"></div>
      <transition name="sidebar-slide">
        <div class="sidebar-panel" :class="{ open: showSidebarInternal }">
          <div class="sidebar-header">
            <h3 class="sidebar-header-title d-flex align-items-center gap-2">  <button class="sidebar-close-btn" @click="closeSidebar"><i  class="fa fa-arrow-right mt-1"></i></button> جزئیات پرواز</h3>
            <button class="sidebar-close-btn sidebar-close-btn-times" @click="closeSidebar"><i class="fa fa-times"></i></button>
          </div>
          <div class="sidebar-content">
  <div class="international-available-details border-0">
    <div>
      <div class=" international-available-panel-min">
        <ul class="tabs">
          <li data-tab="tab-1-0" class="tab-link current ">
            {{useXmltag('Informationflight')}}
          </li>
          <li data-tab="tab-2-0" class="tab-link detailShow">
            {{useXmltag('Price')}}
          </li>
          <li data-tab="tab-3-0" class="tab-link " @click="getFeeCancel(`${flight.flight_type_li}`,`${flight.airline}`,`${flight.cabin_type}`)">
            {{useXmltag('TermsandConditions')}}
          </li>
          <li class="tab-link"  :data-tab="`tab-4-0`"
              @click="getAirRules()" v-show="flight.source_id=='14'">
            {{ useXmltag('Ticketrules')}}
          </li>
        </ul>
        <div id="tab-1-0" class="tab-content current">
          <div class="international-available-airlines-detail-tittle">
                        <span
                            class="iranB  lh25 displayb txtRight" style="font-size:1.1rem !important">
                            <i class="fa fa-circle site-main-text-color "></i>
<!--                                                  {{useXmltag('Flight')}}-->
<!--                                                  {{flight.departure_name}}-->
<!--                                                   {{useXmltag('On')}}-->
<!--                                                 {{flight.arrival_name}}-->
{{flightTitle }}
                                                   </span>
            <div class="international-available-airlines-details mt-3" style="font-size: 0.85rem;">
            <div class=" international-available-airlines-detail">
              <div class="d-flex align-items-center gap-4 w-100">
              <div class="international-available-airlines-logo-detail international-available-airlines-logo-detail-internal logo-airline-ico"></div>
              <div class="international-available-airlines-info-detail my-info-detail">
                                 <span class="airline_s">
                                        {{flight.airline_name}} ({{flight.airline}})

                                 </span>

                <!--                                 <span class="capacity_s " v-if="flight.capacity > 0">-->
                <!--                                        <i>{{useXmltag('Capacity')}} : </i>-->
                <!--                                        {{flight.capacity}}-->
                <!--                                        <em>-</em>-->
                <!--                                 </span>-->

<!--                <span class="flighttime_s">-->
<!--                                            {{useXmltag('Flighttime')}} :-->
<!--                                            {{flight.duration_time}}-->
<!--                                 </span>-->
              </div>
            </div>
            <div class="d-flex align-items-center justify-content-center justify-content-md-start detail-flight-internal gap-10 w-100 mt-2">
              <span class="" >
                <i> {{useXmltag('FlightNumber')}} : </i>
                {{flight.flight_number}}
                <i class="openL"></i>
                <em>|</em>
                <i class="openL"></i>

              </span>
              <span class="padt0 iranL  lh18 displayb" v-if="flight.cabin_type !=''">
                                    {{useXmltag('Classrate')}} :
                                    <i class="openL"></i>
                <i> {{flight.cabin_type}}</i>
                <i class="openL"></i>
                  <em>|</em>
                                </span>
              <span class="seatClass_s">
                                        {{flight.seat_class}}

                                 </span>
            </div>
            </div>
            <div class="international-available-airlines-detail   site-border-right-main-color">
              <div class="d-flex align-items-center w-100 justify-content-center text-center">
              <div class="airlines-detail-box ">
                <span class="airlines-detail-box-color">{{flight.departure_name}}</span>
<!--                <span class="airlines-detail-box-color openB">{{flight.departure_date}} </span>-->
                <span class="airlines-detail-box-color openB ">{{flight.departure_time}}</span>
              </div>
                <span data-v-ba52cdde=""><svg data-v-ba52cdde="" id="Capa_1" viewBox="0 0 24 24" width="30px" height="30px" fill="currentColor" data-v-5483aaca=""><path data-v-ba52cdde="" d="M.601 12.008c0 .929.297 1.545 1.003 1.857.392.172.802.226 1.46.22l.362-.009 5.656-.24.26.368.326.493.42.659.87 1.41 1.573 2.626 1.678 2.855a2.204 2.204 0 0 0 1.858 1.155.9.9 0 0 0 .878-1.198l-3.018-8.582c-.008-.021-.002-.03.006-.03l6.447-.29.79 2.114.035.13c.257.593.77.862 1.287.761.61-.12 1.008-.711.889-1.322l-.005-.09.009-5.947c.05-.488-.338-1.007-.9-1.12-.546-.107-1.029.189-1.246.665l-.832 2.22-6.446-.29a.013.013 0 0 1-.011-.017l3.179-8.595a.9.9 0 0 0-.92-1.209l-.161.014c-.69.02-1.352.4-1.754 1.013L12.426 4.8l-1.21 2.02-.8 1.308-.54.86-.45.693-.238.347-.107.149-5.602-.264h-.623l-.16.007-.206.016c-1.287.127-1.889.767-1.889 2.072Z" fill-rule="evenodd"></path></svg></span>
              <div class="airlines-detail-box ">
                <span class="airlines-detail-box-color">{{flight.arrival_name}}</span>
<!--                <span class="airlines-detail-box-color openB">{{flight.arrival_date}} </span>-->
                <span class="airlines-detail-box-color openB ">{{flight.arrival_time}}</span>
              </div>
              </div>
              <div class="airlines-detail-box-2 mt-2">
                                <span class="padt0 iranb  lh18 displayb" v-if="flight.baggage !=''">
                                    {{useXmltag('Permissible')}} :
                                    <span class="iranNum ">{{flight.baggage}} </span>
                                </span>

                <span class="padt0 iranb  lh18 displayb" v-if="flight.aircraft !=''">
                                    {{useXmltag('Typeairline')}} :
                                    <i class="iranNum">{{flight.aircraft}} </i>
                                </span>
              </div>
            </div>
            </div>
          </div>
        </div>
        <div id="tab-2-0" class="tab-content price-Box-Tab" >
          <div class="pop-up-h">
            <span>{{ useXmltag('TicketDetailsBasedPriceID')}}</span>
          </div>
          <div class="price-Content site-border-main-color" style="position: relative; overflow: visible">
                                                  <span class="hidden-data" style="top: -10px">
                              fare: {{ flight.price.adult.p_fare_for_test.toLocaleString() }}
                              tax: {{ flight.price.adult.p_tax_for_test.toLocaleString() }}
                           </span>
            <p id="AlertPanelHTC"></p>
            <div class="tblprice">

              <!-- MOBILE PRICE TABS -->
              <div class="price-tabs-mobile">
                <ul class="price-tabs-header">
                  <li
                      v-for="row in priceTableRows"
                      :key="row.key"
                      :class="{ active: activePriceTab === row.key }"
                      @click="activePriceTab = row.key"
                  >
                    {{ row.label }}
                  </li>
                </ul>

                <div
                    v-for="row in priceTableRows"
                    :key="row.key + '-content'"
                    v-show="activePriceTab === row.key"
                    class="price-card-mobile"
                >
                  <div class="price-row">
                    <span>قیمت پایه</span>
                    <strong>{{ row.fareDisplay }}</strong>
                  </div>

                  <div class="price-row">
                    <span>مالیات و عوارض</span>
                    <strong>{{ row.taxDisplay }}</strong>
                  </div>

                  <div
                      class="price-row"
                      v-if="$store.state.isCounter && flight.flight_type_li == 'system'"
                  >
                    <span>کمیسیون آژانس</span>
                    <strong>{{ row.markupDisplay }}</strong>
                  </div>

                  <div class="price-row">
                    <span>تخفیف</span>
                    <strong>{{ row.discountDisplay }}</strong>
                  </div>

                  <div class="price-row price-total">
                    <span>قیمت نهایی</span>
                    <strong>{{ row.finalDisplay }} ریال</strong>
                  </div>
                </div>
              </div>


              <!--                            <div v-else class="parent-grid-ticket-details">-->
              <!--                               <div class="parent-price-ticket-details">-->
              <!--                                  <div class="tdpricelabel"> {{useXmltag('Adt')}} :</div>-->
              <!--                                  <div class="tdprice">-->
              <!--                                     <i v-if="flight.price.adult.has_discount=='yes'">{{flight.price.adult.with_discount}}</i>-->
              <!--                                     <i v-else>{{flight.price.adult.price}}</i>-->
              <!--                                     {{flight.price.adult.type_currency}}-->
              <!--                                  </div>-->
              <!--                               </div>-->
              <!--                                <div class="parent-price-ticket-details">-->
              <!--                                   <div class="tdpricelabel"> {{useXmltag('Chd')}} :</div>-->
              <!--                                   <div class="tdprice">-->
              <!--                                      <i v-if="flight.price.child.price > 0 ">{{flight.price.child.price}}</i>-->
              <!--                                      <i v-else>{{useXmltag('PreInvoiceStep')}}</i>-->
              <!--                                   </div>-->
              <!--                                </div>-->
              <!--                               <div class="parent-price-ticket-details">-->
              <!--                                  <div class="tdpricelabel"> {{useXmltag('Inf')}} :</div>-->
              <!--                                  <div class="tdprice">-->
              <!--                                     <i v-if="flight.price.infant.price > 0 ">{{flight.price.infant.price}}</i>-->
              <!--                                     <i v-else>{{useXmltag('PreInvoiceStep')}}</i>-->
              <!--                                  </div>-->
              <!--                               </div>-->
              <!--                            </div>-->

            </div>
          </div>



          <!--                        <template v-if="fee_cancel !='' ">
                                      <div class="cancel-policy cancel_modal">
                                          <div class="cancel-policy-head">
                                              <div class="cancel-policy-head-text">{{useXmltag('DetailMoneyCancel')}}</div>
                                              <div class="cancel-policy-class">
                                                  <span>{{useXmltag('Classflight')}} :</span>
                                                  <span> {{useXmltag('TypeClass')}} </span>
                                              </div>
                                          </div>
                                          <div class="cancel-policy-inner">
                                            <div class="cancel-policy-item cancel_modal">
                                                <span class="cancel-policy-item-text site-main-text-color">{{useXmltag('Fromthetimeticketissueuntilnoondaysbeforeflight')}}</span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-if="isNaN(`'${fee_cancel.ThreeDaysBefore}'`)">
                                                {{ fee_cancel.ThreeDaysBefore }}
                                            </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                                                 {{ fee_cancel.ThreeDaysBefore }} {{useXmltag('PenaltyPercent')}}
                                            </span>
                                            </div>

                                            <div class="cancel-policy-item cancel_modal">
                                            <span class="cancel-policy-item-text site-main-text-color">
                                                {{useXmltag('Fromnoondaysbeforeflightnoondaybeforeflight')}}
                                                </span>
                                               <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color"
                                                      v-if="isNaN(`'${fee_cancel.OneDaysBefore}'`)">
                                                {{ fee_cancel.OneDaysBefore}}
                                               </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                                                 {{ fee_cancel.OneDaysBefore}} {{useXmltag('PenaltyPercent')}}
                                            </span>
                                            </div>
                                            <div class="cancel-policy-item cancel_modal">

                                            <span class="cancel-policy-item-text site-main-text-color">
                                                {{useXmltag('Fromnoondaybeforeflighthoursbeforeflight')}}
                                            </span>

                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color"
                                                      v-if="isNaN(`'${fee_cancel.ThreeHoursBefore}'`)">
                                                {{ fee_cancel.ThreeHoursBefore}}
                                            </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                                                 {{ fee_cancel.ThreeHoursBefore}} {{useXmltag('PenaltyPercent')}}
                                            </span>
                                            </div>
                                            <div class="cancel-policy-item cancel_modal">
                                                <span class="cancel-policy-item-text site-main-text-color">
                                                {{useXmltag('Fromhoursbeforeflighttominutesbeforeflight')}}
                                                </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color site-bg-main-color"
                                                      v-if="isNaN(`'${fee_cancel.ThirtyMinutesAgo}'`)">
                                                {{ fee_cancel.ThirtyMinutesAgo}}
                                            </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                                                 {{ fee_cancel.ThirtyMinutesAgo}} {{useXmltag('PenaltyPercent')}}
                                            </span>
                                            </div>

                                            <div class="cancel-policy-item cancel_modal">
                                                {{ useXmltag('Minutesbeforetheflight')}}
                                                <span class="cancel-policy-item-text site-main-text-color ">
                                            </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color"
                                                      v-if="isNaN(`'${fee_cancel.OfThirtyMinutesAgoToNext}'`)">
                                                {{ fee_cancel.ThirtyMinutesAgo}}
                                            </span>
                                                <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                                                 {{ fee_cancel.ThirtyMinutesAgo}} {{useXmltag('OfThirtyMinutesAgoToNext')}}
                                            </span>
                                            </div>
                                          </div>
                                      </div>
                                  </template>-->

<!--          <div class="cancel-policy cancel-policy-charter" v-if="flight.flight_type_li !='system'">-->
<!--                        <span class="">-->
<!--                            {{useXmltag('ThecharterflightscharterunderstandingCivilAviationOrganization')}}-->
<!--                        </span>-->
<!--          </div>-->

        </div>
        <div id="tab-3-0" class="tab-content"><p class="iranL  lh25 displayb"></p>
          <ul v-if="flight.flight_type_li =='system'">
            <li>1- {{useXmltag('AccordingCivilAviationOrganizationResponsibilityResponsibleFlying')}}</li>
            <li>2- {{useXmltag('ResponsibilityAllTravelInformationEntryIncorrectPassengerRePurchase')}}</li>
            <li>3- {{useXmltag('MustEnterValidMobileNecessary')}}</li>
            <li>4- {{useXmltag('AviationRegulationsBabyChildAdultAges')}}</li>
            <li>5- {{useXmltag('CanNotBuyBabyChildTicketOnlineIndividuallySeparatelyAdultTickets')}}</li>
            <li>6- {{useXmltag('AircraftDeterminedAnyChangeAircraftCarrierHoldingFlight')}}</li>
            <li>7- {{useXmltag('PresenceDomesticFlightsRequiredForeignFlightsRequiredDocuments')}}</li>
            <li>8- {{useXmltag('penaltyScheduleFollows')}}</li>
          </ul>


          <ul v-else-if="flight.flight_type_li !='system' && flight.source_id =='22'">
            <li>1- {{useXmltag('DomesticRefundPenaltyWithin30MinutesPorsetare')}}</li>
            <li>2- {{useXmltag('DomesticRefundPenaltyFromIssueTo3DaysBeforePorsetare')}}</li>
            <li>3- {{useXmltag('DomesticRefundPenaltyFrom3DaysTo2DaysBeforePorsetare')}}</li>
            <li>4- {{useXmltag('DomesticRefundPenaltyFrom2DaysTo1DayBeforePorsetare')}}</li>
            <li>5- {{useXmltag('DomesticRefundPenaltyFrom1DayTo24HoursBeforePorsetare')}}</li>
            <li>6- {{useXmltag('DomesticRefundPenaltyFrom24HoursBeforePorsetare')}}</li>
            <li>7- {{useXmltag('DomesticRefundPenaltyNotePorsetare')}}</li>
            <li>{{useXmltag('DomesticRefundContactPorsetare')}}</li>
            <li>8- {{useXmltag('penaltyScheduleFollows')}}</li>
            <li><a href="https://apstick.ir/api/DeepLink/Refund/V1?language=fa" target="_blank">{{useXmltag('DomesticRefundLinkPorsetare')}}</a></li>

          </ul>

          <ul v-else>
            <li>1- {{useXmltag('RefundPenaltyFromIssueTo3DaysBefore')}}</li>
            <li>2- {{useXmltag('RefundPenaltyFrom3DaysTo2DaysBefore')}}</li>
            <li>3- {{useXmltag('RefundPenaltyFrom2DaysTo1DayBefore')}}</li>
            <li>4- {{useXmltag('RefundPenaltyFrom1DayTo24HoursBefore')}}</li>
            <li>5- {{useXmltag('RefundPenaltyFrom24HoursBefore')}}</li>
            <li>{{useXmltag('RefundPenaltyNote')}}</li>
            <li>6- {{useXmltag('penaltyScheduleFollows')}}</li>
          </ul>


          <cancel-policy
              :fee_cancel="fee_cancel"
              :flight_type_li="flight.flight_type_li"
          />
        </div>
        <div :id="`tab-4-0`" class="tab-content w-100" v-show="flight.source_id=='14'">

          <img :src="`${getUrlWithoutLang()}/view/client/assets/images/load21.gif`"
               width="120px"
               alt="" class="loaderDetail"
               style="width: 50px;position: relative;"
               :id="`loaderDetail${flight.flight_id}`" v-if="is_show_loader">

          <rules-flight :data_rules="data_rules" v-if='is_show_rules'></rules-flight>
        </div>
      </div>
    </div>

  </div>
          </div>

          <div class="sidebar-footer" :class="{ 'static-footer': hasCancelPolicy }">
            <div class="SelectTicket SelectTicketDetail" id="typeFlightPeraian">
              <template v-if="flight.source_id == 'special'">
                <a
                    class="international-available-btn site-bg-main-color site-main-button-color-hover SendInfoReservationFlight"
                    :id="`btnReservationFlight_${flight.flight_id}`"
                    @click="
                        sendInfoReservationFlightForeign(`${flight.flight_id}`)
                     ">
                  {{ useXmltag("Selectionflight") }}
                </a>
              </template>
              <template v-else>
                <button
                    type="button"
                    class="international-available-btn btn btn-block site-bg-main-color price-btn-new-sidebar site-main-button-color-hover price-btn--new"
                    :class="{skeleton: is_show_loader}"
                    :disabled="is_show_loader"
                    :id="`select${this.$store.state.typeTripFlight}`"
                    @click="changeTripFlight(flight.capacity)">
                  <template
                      v-if="
                           this.data_search.MultiWay === 'TwoWay' &&
                           type != 'twoWay'
                        ">
                    <template
                        v-if="this.$store.state.typeTripFlight === 'dept'">
                      {{ useXmltag("PickWentFlight") }}
                    </template>
                    <template v-else>
                      {{ useXmltag("PickBackFlight") }}
                    </template>
                  </template>
                  <template v-else>
                    {{ useXmltag("Selectionflight") }}
                  </template>
                  <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 448 512">
                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                    <path
                        d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"></path>
                  </svg>
                </button>
              </template>
              <input
                  type="hidden"
                  :value="data_search.dataSearch.adult"
                  id="CountAdult"
                  class="CountAdult" />
              <input
                  type="hidden"
                  :value="data_search.dataSearch.child"
                  id="CountChild"
                  class="CountChild" />
              <input
                  type="hidden"
                  :value="data_search.dataSearch.infant"
                  id="CountInfant"
                  class="CountInfant" />
              <input
                  type="hidden"
                  value=""
                  name="session_filght_Id"
                  id="session_filght_Id" />
              <!--                    <a class="f-loader-check f-loader-check-change":id="`loader_check_${flight.flight_id}`" v-show="is_show_loader"></a>-->
              <input
                  type="hidden"
                  value="reservation"
                  id="typeApplication"
                  class="typeApplication"
                  v-if="flight.source_id == 'special'" />
              <input
                  type="hidden"
                  value="privateCharter"
                  id="PrivateCharter"
                  class="PrivateCharter"
                  v-if="flight.source_id == 'special'" />
              <input
                  type="hidden"
                  :value="flight.flight_id"
                  id="IdPrivate"
                  class="IdPrivate"
                  v-if="flight.source_id == 'special'" />
              <input
                  type="hidden"
                  :value="flight.flight_id_return"
                  id="flight_id_return"
                  class="flight_id_return"
                  v-if="flight.source_id == 'special'" />
            </div>
          </div>
        </div>
      </transition>
    </div>
    <div class="international-available-details" style="border-radius: 0 0 10px 10px;">
    <span class="international-available-detail-btn-new ">
             <div class="text_div_morei site-main-text-color iranM " v-if="flight.point_club > 0 ">
                     {{ useXmltag('Yourpurchasepoints')}} {{ flight.point_club}} {{ useXmltag('Point')}}
                 </div>
<!--            <div class="my-more-info slideDownAirDescription">-->
<!--                {{useXmltag('MoreDetails')}}-->
<!--                <i class="fa fa-angle-down"></i>-->
<!--            </div>-->
        </span>
      </div>
<!--    <span class="international-available-detail-btn  slideUpAirDescription displayiN">-->
<!--            <i class="fa fa-angle-up site-main-text-color"></i>-->
<!--        </span>-->
  </div>
</template>

<script>
import rulesFlight from './rulesFlight';
import CancelPolicy from './CancelPolicy.vue';
import airlineOutPutFlight from './airlineFight.vue'
import infoOutPutFlight from './outPutFlight.vue'
import airlineReturnFlight from './airlineReturnFlight.vue'
import infoReturnRouteFlight from './infoReturnRouteFlight.vue'
import priceFlight from './priceFlight.vue'
import detailDepartFlight from '../interantionalFlight/detailDepartFlight.vue'
import detailReturnFlight from '../interantionalFlight/detailReturnFlight.vue'
export default {
  name: "detailFlight",
  props:['flight','data_search' ,'showSidebarInternal' ,'openSidebar','closeSidebar','isProcessingFlightSelection'],
  data(){
    return {
      fee_cancel : '',
      data_rules : {},
      is_show_rules : false,
      is_show_loader : false ,
      check_currency_data: true,
      request_number: 0,
      flight_id: 0,
      adult_count: 0,
      child_count: 0,
      infant_count: 0,
      source_id: 0,
      hasCancelPolicy: false,
      flight_direction: "dept",
      isMobileView: window.innerWidth <= 768,
      activePriceTab: 'adult',

    }
  },
  components: {
    'rulesFlight':rulesFlight,
    'CancelPolicy':CancelPolicy
  },
  methods:{



    changeTripFlight(capacity) {

      this.request_number = this.flight.unique_code
      this.flight_id = this.flight.flight_id
      this.source_id = this.flight.source_id
      this.adult_count = this.data_search.dataSearch.adult
      this.child_count = this.data_search.dataSearch.child
      this.infant_count = this.data_search.dataSearch.infant
      this.is_show_loader = true
      var _this = this
      let request_capacity =
          parseInt(_this.adult_count) + parseInt(_this.child_count)
      if (
          parseInt(capacity) >= request_capacity ||
          (_this.source_id == "14" && capacity < 1)
      ) {
        if (
            _this.data_search.MultiWay === "TwoWay" &&
            _this.type != "twoWay"
        ) {
          if (_this.$store.state.typeTripFlight === "dept") {

            axios
                .post(
                    amadeusPath + "ajax",
                    {
                      className: "newApiFlight",
                      method: "revalidateFlight",
                      Flight: _this.flight_id,
                      UniqueCode: _this.request_number,
                      SourceId: _this.source_id,
                      adt: _this.adult_count,
                      chd: _this.child_count,
                      inf: _this.infant_count,
                      FlightDirection: _this.flight_direction,
                    },
                    {
                      "Content-Type": "application/json",
                    }
                )
                // .then((response) => {
                //
                //
                //
                //
                //   _this.$emit('update:isProcessingFlightSelection', true);
                //   _this.closeSidebar();
                //
                //   let id_selected = _this.flight_id
                //   let id_btn =
                //       "select" + _this.$store.state.typeTripFlight
                //   const node =
                //       document.getElementById(id_selected).lastChild
                //   const clone = node.cloneNode(true)
                //
                //   document.getElementById("myList1").appendChild(clone)
                //   document.getElementById(id_btn).remove()
                //
                //   setTimeout( () => {
                //     _this.is_show_loader = false
                //     // document.getElementById('loader_check_'+id_selected).style.display = 'none';
                //     _this.$store.commit("setTypeTripFlight", "return")
                //     _this.$store.commit(
                //         "setFlightUniqId",
                //         response.data.data.result_uniq_id
                //     )
                //
                //     _this.$emit('update:isProcessingFlightSelection', false);   _this.isProcessingFlightSelection = false;
                //   }, 1000)
                // })
                // .then((response) => {
                //   // مستقیم showSidebar رو false کن
                //   _this.$parent.showSidebarInternal = false;
                //   // یا اگه this همون eachFlight هست:
                //   // _this.showSidebarInternal = false;
                //
                //   // یه nextTick صبر کن
                //   _this.$nextTick(() => {
                //     console.log('After nextTick, showSidebarInternal:', _this.$parent.showSidebarInternal);
                //
                //     // حالا store رو تغییر بده
                //     let previousType = _this.$store.state.typeTripFlight;
                //     _this.$store.commit("setTypeTripFlight", "return");
                //     _this.$store.commit("setFlightUniqId", response.data.data.result_uniq_id);
                //
                //     _this.$emit('update:isProcessingFlightSelection', true);
                //
                //     // بقیه کدها...
                //     let id_selected = _this.flight_id;
                //     let id_btn = "select" + previousType;
                //
                //     const node = document.getElementById(id_selected);
                //     if (node && node.lastChild) {
                //       const clone = node.lastChild.cloneNode(true);
                //       document.getElementById("myList1").appendChild(clone);
                //     }
                //
                //     const btnElement = document.getElementById(id_btn);
                //     if (btnElement) {
                //       btnElement.remove();
                //     }
                //
                //     setTimeout(() => {
                //       _this.is_show_loader = false;
                //       _this.$emit('update:isProcessingFlightSelection', false);
                //       _this.isProcessingFlightSelection = false;
                //     }, 1000);
                //   });
                // })
                .then((response) => {

                  // فلگ رو ست کن
                  _this.$emit('update:isProcessingFlightSelection', true);

                  // سایدبار رو ببند
                  _this.closeSidebar();

                  _this.$nextTick(() => {

                    let previousType = _this.$store.state.typeTripFlight;

                    // تغییر store
                    _this.$store.commit("setTypeTripFlight", "return");
                    _this.$store.commit("setFlightUniqId", response.data.data.result_uniq_id);
                    _this.$store.commit("setSelectedFlightId", _this.flight_id); // اینو اضافه کن
                    // DOM manipulation
                    let id_selected = _this.flight_id;
                    let id_btn = "select" + previousType;

                    const node = document.getElementById(id_selected);
                    if (node && node.lastChild) {
                      const clone = node.lastChild.cloneNode(true);
                      document.getElementById("myList1").appendChild(clone);
                    }

                    const btnElement = document.getElementById(id_btn);
                    console.log(btnElement)
                    if (btnElement) {
                      btnElement.remove();
                    }

                    // *** حتماً فلگ رو ریست کن ***
                    setTimeout(() => {
                      _this.is_show_loader = false;

                      // ریست کردن فلگ - این خیلی مهمه
                      _this.$emit('update:isProcessingFlightSelection', false);
                      _this.isProcessingFlightSelection = false;

                    }, 1000);
                  });
                })
                .catch(function (error) {
                  _this.is_show_loader = false
                  _this.$swal({
                    icon: "error",
                    toast: true,
                    position: "bottom-end",
                    showConfirmButton: false,
                    timerProgressBar: true,
                    timer: 4000,
                    width: 600,
                    iconColor: "#FFFFFF",
                    background: "#FF0000",
                    title: `<span style="color:#FFFFFF">${error.response.data.data.result_message}</span>`,
                  })
                })
          }
          else {

            axios
                .post(
                    amadeusPath + "ajax",
                    {
                      className: "newApiFlight",
                      method: "revalidateFlight",
                      Flight: _this.flight_id,
                      UniqueCode: _this.request_number,
                      SourceId: _this.source_id,
                      adt: _this.adult_count,
                      chd: _this.child_count,
                      inf: _this.infant_count,
                      FlightDirection: _this.$store.state.typeTripFlight,
                      uniq_id: _this.$store.state.flightUniqId,
                    },
                    {
                      "Content-Type": "application/json",
                    }
                )
                .then(function (response) {

                  if (
                      response.data.data.result_status == "SuccessLogged"
                  ) {
                    _this.sendDataToPassengerDetail(response.data.data)
                  } else {
                    _this.sendDataToPassengerDetailWithoutLogin(
                        response.data.data
                    )
                  }
                  // _this.is_show_loader = false;
                })
                .catch(function (error) {
                  _this.is_show_loader = false
                  _this.$swal({
                    icon: "error",
                    toast: true,
                    position: "bottom-end",
                    showConfirmButton: false,
                    timerProgressBar: true,
                    timer: 4000,
                    width: 600,
                    iconColor: "#FFFFFF",
                    background: "#2f2f2f",
                    title: `<span style="color:#FFFFFF">${error.response.data.data.result_message}</span>`,
                  })
                })
          }
        }
        else {
          axios
              .post(
                  amadeusPath + "ajax",
                  {
                    className: "newApiFlight",
                    method: "revalidateFlight",
                    Flight: _this.flight_id,
                    UniqueCode: _this.request_number,
                    SourceId: _this.source_id,
                    adt: _this.adult_count,
                    chd: _this.child_count,
                    inf: _this.infant_count,
                    FlightDirection: _this.flight_direction,
                  },
                  {
                    "Content-Type": "application/json",
                  }
              )
              .then(function (response) {

                if (response.data.data.result_status == "SuccessLogged") {
                  _this.sendDataToPassengerDetail(response.data.data)
                } else {
                  _this.sendDataToPassengerDetailWithoutLogin(
                      response.data.data
                  )
                }
                // _this.is_show_loader = false;
              })
              .catch(function (error) {
                _this.is_show_loader = false
                _this.$swal({
                  icon: "error",
                  toast: true,
                  position: "bottom-end",
                  showConfirmButton: false,
                  timerProgressBar: true,
                  timer: 4000,
                  width: 600,
                  iconColor: "#FFFFFF",
                  background: "#FF0000",
                  title: `<span style="color:#FFFFFF">${error.response.data.data.result_message}</span>`,
                })
              })
        }
      }
      else {
        _this.is_show_loader = false
        _this.$swal({
          icon: "error",
          toast: true,
          position: "bottom-end",
          showConfirmButton: false,
          timerProgressBar: true,
          timer: 4000,
          width: 600,
          iconColor: "#FFFFFF",
          background: "#480808",
          title: `<span style="color:#FFFFFF">${useXmltag(
              "lowCapacityPassenger"
          )}</span>`,
        })
      }
    },
    sendDataToPassengerDetail(data) {
      let form = document.createElement("form")
      form.setAttribute("method", "POST")
      form.setAttribute(
          "action",
          amadeusPathByLang + "passengersDetailLocal"
      )

      let hiddenField = document.createElement("input")
      hiddenField.setAttribute("name", "temporary")
      hiddenField.setAttribute("value", data.result_uniq_id)
      form.appendChild(hiddenField)

      let hiddenField2 = document.createElement("input")
      hiddenField2.setAttribute("name", "ZoneFlight")
      hiddenField2.setAttribute("value", "Local")
      form.appendChild(hiddenField)
      form.appendChild(hiddenField2)
      document.body.appendChild(form)
      form.submit()
      document.body.removeChild(form)
    },
    sendDataToPassengerDetailWithoutLogin(data) {
      document.getElementById("session_filght_Id").value =
          data.result_uniq_id
      document.getElementById("ZoneFlight").value = "Local"
      let show_popup = document.getElementById("isShowLoginPopup").value


      if (show_popup === "1") {
        setTimeout(function () {
          document
              .getElementsByClassName("cd-user-modal")[0]
              .classList.add("is-visible")
        }, 1000)
      } else {
        this.sendDataToPassengerDetail(data)
      }
    },
    getFeeCancel(type_flight,airline_iata,cabin_type){
      if(type_flight==='system'){
        let _this = this
        axios.post(amadeusPath + 'ajax', {
          className: 'newApiFlight',
          method: 'getFeeCancel',
          airline_iata,
          cabin_type,
          is_json: true,
        }, {
          'Content-Type': 'application/json',
        }).then(response => {
          this.hasCancelPolicy = true;
          let data_fee = response.data; // <-- این الان یک آبجکت با key data هست

          if(Array.isArray(data_fee.data) && data_fee.data.length) {
            this.fee_cancel = data_fee.data.map(item => ({
              ...item,
              fine_text: item.fine_text ||
                  (Number(item.fine_percentage) === 0 ? 'بدون جریمه' :
                      Number(item.fine_percentage) === 100 ? 'غیرقابل استرداد' :
                          `%${item.fine_percentage}`),
              title: item.title || 'عنوان نامشخص'
            }));
          } else {
            this.fee_cancel = [];
          }
        }).catch(error => {
          console.log(error);
        });

      }

      return true ;
    } ,
    getAirRules(){

      let _this = this;
      axios.post(amadeusPath + 'ajax',
          {
            className: 'newApiFlight',
            method: 'getInfoRulesFlight',
            request_number: _this.flight.unique_code,
            agency_id:_this.flight.agency_id,
            fare_source_code :_this.flight.flight_id
          },
          {
            'Content-Type': 'application/json'
          }).then(function (response) {
        _this.data_rules = response.data.data ;
        _this.is_show_rules = true;
        _this.is_show_loader = false;
      }).catch(function (error) {
      });

    },
    _toNumber(v) {
      if (v === null || v === undefined || v === '') return NaN;
      const n = Number(v);
      return Number.isFinite(n) ? n : NaN;
    },
    _fmtNumber(v) {
      if (v === null || v === undefined || (typeof v === 'number' && Number.isNaN(v))) return '-';
      const n = Number(v);
      return Number.isNaN(n) ? '-' : n.toLocaleString();
    },
    handleResize() {
      this.isMobileView = window.innerWidth <= 768
    }
  },
  computed: {
    flightTitle() {
      return this.$store.state.typeTripFlight === 'dept'
          ? useXmltag('Wentflight')
          : useXmltag('Returnflight');
    },
    priceTableRows() {

      const isCounter = this.$store.state.isCounter;
      const isSafar360 = this.$store.state.isSafar360;
      const priceData = (this.flight && this.flight.price) ? this.flight.price : {};
      const typeMap = {
        adult: 'بزرگسال',
        child: 'کودک',
        infant: 'نوزاد'
      };

      const rows = [];

      Object.keys(priceData).forEach((key) => {
        const f = priceData[key] || {};

        let markupNum = null;
        if (f.price === 0 || f.price === '0' || f.price === null || f.price === undefined) {
          markupNum = null;
        } else {
          markupNum = this._toNumber(f.markup_amount);
        }


        const baseForFare = ((this.flight && this.flight.flight_type_li === 'charter') ? (f.fare + markupNum ?? null) : (f.fare ?? null));

        const fareNum = this._toNumber(baseForFare);
        const taxNum = this._toNumber(f.tax);



        let discountDisplay;
        if (f.with_discount == 0) {
          discountDisplay = '0';
        } else {
          const p = this._toNumber(f.price);
          const wd = this._toNumber(f.with_discount);
          discountDisplay = (!Number.isNaN(p) && !Number.isNaN(wd)) ? ( (p - wd).toLocaleString() ) : '-';
        }

        let finalDisplay;
        if ((isCounter || isSafar360) && this.flight.flight_type_li == 'system') {
          const p = this._toNumber(f.price);
          const wd = this._toNumber(f.with_discount);
          const mk = (markupNum === null) ? NaN : Number(markupNum);

          if (f.with_discount == 0) {
            finalDisplay = (!Number.isNaN(p) && !Number.isNaN(mk)) ? ( (p - mk).toLocaleString() ) : '-';
          } else {
            finalDisplay = (!Number.isNaN(wd) && !Number.isNaN(mk)) ? ( (wd - mk).toLocaleString() ) : '-';
          }

        } else {
          if (f.with_discount == 0) {
            finalDisplay = f.price ? this._fmtNumber(f.price) : '-';
          } else {
            finalDisplay = f.with_discount ? this._fmtNumber(f.with_discount) : '-';
          }
        }

        rows.push({
          key,
          label: typeMap[key] || key,
          fareDisplay: this._fmtNumber(fareNum),
          taxDisplay: this._fmtNumber(taxNum),
          markupDisplay: (markupNum === null ? '-' : Number(markupNum).toLocaleString()),
          discountDisplay,
          finalDisplay
        });
      });

      return rows;
    },
    isMobile() {
      return this.isMobileView
    },
  },
  mounted() {
    window.addEventListener('resize', this.handleResize)
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.handleResize)
  }
}
</script>

<style scoped>
/* استایل تب‌ها با !important برای اطمینان از اعمال */

.tabs {
  display: flex !important;
  flex-wrap: wrap !important;
  gap: 0.5rem !important;
  list-style: none !important;
  margin: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  background-color: #ffffff !important;
}

.tab-link {
  position: relative !important;
  font-size: 0.95rem !important;
  font-weight: 500 !important;
  color: #4a5568 !important;
  background: transparent !important;
  border: none !important;
  cursor: pointer !important;
  transition: all 0.2s ease-in-out !important;
  white-space: nowrap !important;
  outline: none !important;
  border-radius: 10px !important;
  border-top: 2px solid transparent !important;
  padding:10px !important
}

.tab-link:hover {
  color: var(--mainColor) !important;
}
.tab-content{
  background:#fff !important;
}

.tab-link.current {
  color: #ffffff !important;
  background-color: var(--mainColor) !important;
  font-weight: 600 !important;
  border:0 !important;
  border-radius:10px !important;
}


.tab-link:active {
  transform: scale(0.97) !important;
}
.international-available-airlines-detail .airlines-detail-box{
  width:unset !important;
  text-align:center;
  padding: 0 90px !important;
}
.international-available-airlines-detail:first-child{
  border-top:0 !important;
}
.international-available-airlines-detail-tittle span{
  display:unset !important;
  font-size:0.90rem;
}
.airlines-detail-box-color{
  color:#0f172a !important;
}
.airlines-detail-box  .openB{
font-weight: 700;
color: var(--mainColor);
direction: ltr;
display: inline-block;
}
.sidebar-close-btn{
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  color:#000;
}
.sidebar-close-btn-times{
  color:var(--mainColor);
}
@media (max-width: 640px) {
  .international-available-airlines-info-detail{
    justify-content:unset !important;
  }
  .international-available-airlines-logo-detail-internal {
    width:72px !important
  }
  .tabs {
    flex-wrap: nowrap !important;
    overflow-x: auto !important;
    -webkit-overflow-scrolling: touch !important;
    scrollbar-width: thin !important;
    padding-bottom: 0.25rem !important;
  }
  .tab-link {
    padding: 0.6rem 1rem !important;
    font-size: 0.85rem !important;
    white-space: nowrap !important;
  }
}

.tab-link:focus-visible {
  outline: 2px solid var(--mainColor) !important;
  outline-offset: 2px !important;
  border-radius: 4px !important;
}
</style>