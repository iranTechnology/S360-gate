<template>



  <div class="w-100">
    <div v-if="showSidebar">
      <div class="sidebar-overlay" @click="closeSidebar"></div>
      <transition name="sidebar-slide">
      <div class="sidebar-panel" :class="{ open: showSidebar }">
        <div class="sidebar-header">
          <h3 class="sidebar-header-title d-flex align-items-center gap-2">  <button class="sidebar-close-btn" @click="closeSidebar"><i  class="fa fa-arrow-right mt-1"></i></button> جزئیات پرواز</h3>
          <button class="sidebar-close-btn  sidebar-close-btn-times" @click="closeSidebar"><i class="fa fa-times"></i></button>
        </div>
        <div class="sidebar-content">
          <div class="international-available-details d-block show border-0">
            <div>
              <div class=" international-available-panel-min h-100">
                <ul class="tabs">
                  <li class="tab-link  detailShow current"
                      :data-tab="`tab-1-${key_flight}`" :counterTab="`${key_flight}`">
                    {{ useXmltag('Informationflight')}}
                  </li>
                  <li class="tab-link "  :data-tab="`tab-2-${key_flight}`">
                    {{ useXmltag('Price')}}
                  </li>
                  <li class="tab-link"
                      :data-tab="`tab-3-${key_flight}`"
                      @click="getFeeCancel(each_flight.flight_type_li, each_flight.airline, each_flight.cabin_type)">
                    {{ useXmltag('TermsandConditions')}}
                  </li>
                  <li class="tab-link site-border-top-main-color"  :data-tab="`tab-4-${key_flight}`"
                      @click="getAirRules()" v-show="each_flight.source_id=='14'">
                    {{ useXmltag('Ticketrules')}}
                  </li>
                </ul>

                <div :id="`tab-1-${key_flight}`" class="tab-content current overflow-custom-scroll">
                  <detail-depart-flight :dept_detail_flight="each_flight.output_routes_detail" :data_search="data_search"></detail-depart-flight>
                  <template v-if="each_flight.return_routes !=''">
                    <detail-return-flight :return_detail_flight="each_flight.return_routes.return_route_detail" :dept_detail_flight="each_flight.output_routes_detail" ></detail-return-flight>
                  </template>

                </div>
                <div :id="`tab-2-${key_flight}`" class="tab-content" style="position: relative">
                               <span class="hidden-data" style="top: -5px">
                              fare: {{ each_flight.price.adult.p_fare_for_test.toLocaleString() }}
                              tax: {{ each_flight.price.adult.p_tax_for_test.toLocaleString() }}
                           </span>
<!--                  <div v-if="!isMobile" class="parent-counter-ticket-details ">-->
<!--                    <table>-->
<!--                      <thead>-->
<!--                      <tr>-->
<!--                        <th>رده سنی</th>-->
<!--                        <th>قیمت پایه (fare)</th>-->
<!--                        <th>مالیات و عوارض (tax)</th>-->
<!--                        <th v-if="$store.state.isCounter && each_flight.flight_type_li == 'system' && each_flight.is_foreign_airline == false">-->
<!--                          کمیسیون آژانس-->
<!--                        </th>-->
<!--                        <th>تخفیف</th>-->
<!--                        <th>قیمت نهایی (ریال)</th>-->
<!--                      </tr>-->
<!--                      </thead>-->
<!--                      <tbody>-->
<!--                      <tr v-for="row in priceTableRows" :key="row.key">-->
<!--                        <td>{{ row.label }}</td>-->
<!--                        <td>{{ row.fareDisplay }}</td>-->
<!--                        <td>{{ row.taxDisplay }}</td>-->

<!--                        <td v-if="$store.state.isCounter && each_flight.flight_type_li == 'system' && each_flight.is_foreign_airline == false">-->
<!--                          {{ row.markupDisplay }}-->
<!--                        </td>-->

<!--                        <td>-->
<!--                          {{ row.discountDisplay }}-->
<!--                        </td>-->

<!--                        <td>-->
<!--                          {{ row.finalDisplay }}-->
<!--                        </td>-->
<!--                      </tr>-->
<!--                      </tbody>-->
<!--                    </table>-->

<!--                  </div>-->
                  <!-- MOBILE PRICE TABS -->
                  <div  class="price-tabs-mobile">

                    <!-- Tabs -->
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

                    <!-- Card -->
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
                          v-if="$store.state.isCounter
            && each_flight.flight_type_li == 'system'
            && each_flight.is_foreign_airline == false"
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

                </div>
                <div :id="`tab-3-${key_flight}`" class="tab-content">
                  <ul class="ruleText">
                    <li>
                      {{ useXmltag('Presencepassengerobligatoryhalfhoursbeforetimeflightairport')}}
                    </li>

                    <li>
                      {{ useXmltag('Havingvalididentificationdocumentboardingaircraft')}}
                    </li>

                    <li>
                      {{ useXmltag('Delayhurryflightnotificationmadeviamobilenumber')}}
                    </li>

                    <li>
                      {{ useXmltag('Theticketsissuedpassengersnon')}}
                    </li>

                    <li>
                      {{ useXmltag('Youreceivehappysendemailsendusemail')}}
                    </li>

                    <li>
                      {{ useXmltag('Probabilitychangingcharterflightssystemcasesflightswillreturncharterercase')}}
                    </li>

                    <li>
                      {{ useXmltag('ServiceslicensestoragesmaintenanceServicescustomshoistingtransportcargohandling')}}

                    </li>

                    <li>
                      {{ useXmltag('PassengerwishesmakebetweenflightOtherwiseresponsibilitypassengercancelticket')}}
                    </li>

                    <li>
                      {{ useXmltag('Shoulddifferentcancellationhourscancellationflightconsignmentfine')}}

                    </li>

                    <li>
                      {{ useXmltag('UnderpossiblenationalsAfghanistanBangladeshPakistanfutureresponsibilitiesuser')}}

                    </li>

                    <li>
                      {{ useXmltag('ResponsibilityvisacontrolpassengerresponsibilityContactyoufurtherinformation')}}
                    </li>

                    <li>
                      {{ useXmltag('Youhaveproblems')}}

                    </li>

                      <li>
                        {{ useXmltag('RuleFlightAirPortIstanbul')}}
                      </li>
                    </ul>
                    <cancel-policy
                        :fee_cancel="fee_cancel"
                        :flight_type_li="each_flight.flight_type_li"
                    />
                  </div>
                  <div :id="`tab-4-${key_flight}`" class="tab-content w-100" v-show="each_flight.source_id=='14'">

                  <img :src="`${getUrlWithoutLang()}/view/client/assets/images/load21.gif`"
                       width="120px"
                       alt="" class="loaderDetail"
                       style="width: 50px;position: relative;"
                       :id="`loaderDetail${each_flight.flight_id}`" v-if="is_show_loader">

                  <rules-flight :data_rules="data_rules" v-if='is_show_rules'></rules-flight>
                </div>
              </div>
            </div>

          </div>
        </div>
        <div class="sidebar-footer">
          <div class="SelectTicket SelectTicketDetail">

            <template v-if="each_flight.source_id == 'special'">
              <a
                  class="international-available-btn site-bg-main-color site-main-button-color-hover SendInfoReservationFlight price-btn-new-sidebar"
                  :id="`btnReservationFlight_${each_flight.flight_id}`"
                  @click="
                        sendInfoReservationFlightForeign(
                           `${each_flight.flight_id}`
                        )
                     ">
                {{ useXmltag("Selectionflight") }}
              </a>
            </template>
            <template v-else>

              <a
                  class="international-available-btn site-bg-main-color site-main-button-color-hover nextStepclass price-btn--new price-btn-new-sidebar"
                  :id="`nextStep_${each_flight.flight_id.replace(
                        '#',
                        ''
                     )}`"
                  v-if="each_flight.return_route != ''">
                {{ useXmltag("Selectionflight") }}

              </a>
              <a
                  class="international-available-btn site-bg-main-color site-main-button-color-hover nextStepclass price-btn-new-sidebar"
                  :id="`nextStep_${each_flight.flight_id.replace(
                        '#',
                        ''
                     )}${each_flight.return_routes.flight_id_return.replace(
                        '#',
                        ''
                     )}`"
                  v-else>
                {{ useXmltag("Selectionflight") }}
              </a>
            </template>
            <input type="hidden" value="" class="CurrencyCode" />
            <input
                type="hidden"
                :value="each_flight.flight_id"
                class="FlightID" />
            <input
                type="hidden"
                :value="each_flight.return_routes.return_flight_id"
                class="ReturnFlightID" />
            <input type="hidden" :value="price_adult" class="AdtPrice" />
            <input
                type="hidden"
                :value="each_flight.price.child.price"
                class="ChdPrice" />
            <input
                type="hidden"
                :value="each_flight.price.infant.price"
                class="InfPrice" />
            <input
                type="hidden"
                :value="each_flight.cabin_type"
                class="CabinType" />
            <input
                type="hidden"
                :value="each_flight.airline"
                id="Airline_Code"
                class="Airline_Code" />
            <input
                type="hidden"
                :value="each_flight.source_id"
                id="SourceId"
                class="SourceId" />
            <input
                type="hidden"
                :value="each_flight.flight_type_li"
                id="FlightType"
                class="FlightType" />
            <input
                type="hidden"
                :value="each_flight.unique_code"
                id="uniqueCode"
                class="uniqueCode" />
            <input
                type="hidden"
                :value="each_flight.capacity"
                id="Capacity"
                class="priceWithoutDiscount" />
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
            <input type="hidden" value="dept" class="FlightDirection" />
            <input
                type="hidden"
                value="reservation"
                id="typeApplication"
                class="typeApplication"
                v-if="each_flight.source_id == 'special'" />
            <input
                type="hidden"
                value="privateCharter"
                id="PrivateCharter"
                class="PrivateCharter"
                v-if="each_flight.source_id == 'special'" />
            <input
                type="hidden"
                :value="each_flight.flight_id"
                id="IdPrivate"
                class="IdPrivate"
                v-if="each_flight.source_id == 'special'" />
            <input
                type="hidden"
                :value="each_flight.flight_id_return"
                id="flight_id_return"
                class="flight_id_return"
                v-if="each_flight.source_id == 'special'" />
          </div>
        </div>
      </div>
      </transition>
    </div>

        <div class="ribbon" v-if="each_flight.source_id=='special'">
            <span>{{ useXmltag('specialoffer')}}</span>
        </div>
        <div  :class="[
  'international-available-item',
  each_flight.is_private == 'private' ? 'border-is-private' : ''
]">


            <div class="international-available-info">
                <div class="international-available-item-right-Cell my-slideup">
                    <div class="right_busin_div">
                        <div class="site-bg-main-color" v-if="each_flight.seat_class_en == 'business'">
                            <span class="iranM ">{{ each_flight.seat_class }}</span>
                        </div>
                    </div>

                    <airline-out-put-flight :each_airline_flight="each_flight" :key_each_airline_flight="key_flight" :data_search="data_search"></airline-out-put-flight>
                    <info-out-put-flight :each_airline_flight="each_flight" :key_each_airline_flight="key_flight"></info-out-put-flight>
                    <template v-if="each_flight.return_routes !=''">
                        <div class="right_busin_div"></div>
                        <airline-return-flight :each_return_flight="each_flight.return_routes"></airline-return-flight>
                        <info-return-route-flight :each_return_flight="each_flight.return_routes"></info-return-route-flight>
                    </template>

                </div>

                <price-flight :each_price_flight="each_flight" :data_search="data_search" @open-sidebar="openSidebar"></price-flight>

                <div class="international-available-details">

                    <span class="international-available-detail-btn-new">
                 <span class="text_div_morei site-main-text-color iranM " v-if="each_flight.point_club > 0 ">
                     {{ useXmltag('Yourpurchasepoints')}} {{ each_flight.point_club}} {{ useXmltag('Point')}}
                 </span>


<!--                      <div class="my-more-info d-none" @click="openSidebar">-->
<!--    {{ useXmltag('Moredetail')}}-->
<!--    <i class="fa fa-angle-down"></i>-->
<!--</div>-->
             </span>

                </div>
            </div>
        </div>
    </div>

</template>

<script>
    import airlineOutPutFlight from "./airlineOutPutFlight";
    import infoOutPutFlight from "./infoOutPutFlight";
    import airlineReturnFlight from "./airlineReturnFlight";
    import infoReturnRouteFlight from "./infoReturnRouteFlight";
    import priceFlight from "./priceFlight";
    import detailDepartFlight from "./detailDepartFlight";
    import detailReturnFlight from "./detailReturnFlight";
    import rulesFlight from './rulesFlight';
    import CancelPolicy from "./CancelPolicy.vue";
    export default {
        name: "eachFlight",
        props: ['each_flight', 'key_flight','data_search'],
        components: {
            'airlineOutPutFlight': airlineOutPutFlight,
            'infoOutPutFlight': infoOutPutFlight,
            'airlineReturnFlight': airlineReturnFlight,
            'infoReturnRouteFlight': infoReturnRouteFlight,
            'priceFlight': priceFlight,
            'detailDepartFlight': detailDepartFlight,
            'detailReturnFlight' : detailReturnFlight,
            'rulesFlight':rulesFlight,
            'CancelPolicy': CancelPolicy
        },
        data(){
            return{
                data_rules : {},
                fee_cancel: [],
                is_show_rules : false,
                is_show_loader : true,
                isMobileView: window.innerWidth <= 768,
                activePriceTab: 'adult',
              showSidebar: false,
            }
        },
        methods:{
          openSidebar() {
            console.log('ooooooooooooooooooooooooaaa')
            this.showSidebar = true;
            // document.body.style.overflow = 'hidden';


          },

          closeSidebar() {
            this.showSidebar = false;
            document.body.style.overflow = '';
          },
           getFeeCancel(type_flight, airline_iata, cabin_type){

              if(type_flight === 'system'){

                 axios.post(amadeusPath + 'ajax', {
                    className: 'newApiFlight',
                    method: 'getFeeCancel',
                    airline_iata,
                    cabin_type,
                    is_json: true,
                 }, {
                    'Content-Type': 'application/json',
                 }).then(response => {

                    let data_fee = response.data;

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
                    this.fee_cancel = [];
                 });

              } else {
                 this.fee_cancel = [];
              }

              return true;
           },
           handleResize() {
              this.isMobileView = window.innerWidth <= 768
           },
            modalDetailEach(value){
                this.$emit('modalShowTicketDetail', value);
            },
            getAirRules(){
                // document.getElementById(this.each_flight.flight_id).classList.add('skeleton');
                let _this = this;
                axios.post(amadeusPath + 'ajax',
                  {
                      className: 'newApiFlight',
                      method: 'getInfoRulesFlight',
                      request_number: _this.each_flight.unique_code,
                      agency_id:_this.each_flight.agency_id,
                      fare_source_code :_this.each_flight.flight_id
                  },
                  {
                      'Content-Type': 'application/json'
                  }).then(function (response) {
                    console.log(response.data.data);
                    _this.data_rules = response.data.data ;
                    _this.is_show_rules = true;
                    _this.is_show_loader = false;
                    // document.getElementById(_this.dept_detail_flight[0].flight_id).classList.remove('skeleton');
                }).catch(function (error) {
                });

            }
        },
       computed: {
          isMobile() {
             return this.isMobileView
          },
          priceTableRows() {
             const isCounter = this.$store.state.isCounter;
             const isSafar360 = this.$store.state.isSafar360;
             const priceData = this.each_flight && this.each_flight.price ? this.each_flight.price : {};
             const typeMap = {
                adult: 'بزرگسال',
                child: 'کودک',
                infant: 'نوزاد'
             };

             const fmt = (v) => {
                if (v === null || v === undefined) return '-';
                const n = Number(v);
                return isNaN(n) ? '-' : n.toLocaleString();
             };

             const rows = [];

             Object.keys(priceData).forEach((key) => {
                const f = priceData[key] || {};

                let markupNum = null;
                   if (f.price === 0 || f.price === '0' || f.price === null || f.price === undefined) {
                      markupNum = null;
                   } else {
                      markupNum = (f.markup_amount === undefined || f.markup_amount === null || f.markup_amount === '') ? null : Number(f.markup_amount);
                   }

                const rawPrice = (f.fare ?? null);
                const rawFareNum = ((this.each_flight && (this.each_flight.flight_type_li === 'charter' || (this.each_flight.flight_type_li === 'system' && this.each_flight.is_foreign_airline === true))) ? (rawPrice + markupNum ?? null) : (rawPrice ?? null));
                const taxNum = (f.tax === undefined || f.tax === null || f.tax === '') ? null : Number(f.tax);


                let discountDisplay;
                if (f.with_discount == 0) {
                   discountDisplay = '0';
                } else {
                   const p = (f.price === undefined || f.price === null || f.price === '') ? NaN : Number(f.price);
                   const wd = (f.with_discount === undefined || f.with_discount === null || f.with_discount === '') ? NaN : Number(f.with_discount);
                   if (!isNaN(p) && !isNaN(wd)) {
                      discountDisplay = (p - wd).toLocaleString();
                   } else {
                      discountDisplay = '-';
                   }
                }

                let finalDisplay;
                if ((isCounter || isSafar360) && this.each_flight.flight_type_li == 'system' && this.each_flight.is_foreign_airline == false) {
                   const p = (f.price === undefined || f.price === null || f.price === '') ? NaN : Number(f.price);
                   const wd = (f.with_discount === undefined || f.with_discount === null || f.with_discount === '') ? NaN : Number(f.with_discount);
                   const mk = (markupNum === null) ? NaN : Number(markupNum);

                   if (f.with_discount == 0) {
                      finalDisplay = (!isNaN(p) && !isNaN(mk)) ? (p - mk).toLocaleString() : '-';
                   } else {
                      finalDisplay = (!isNaN(wd) && !isNaN(mk)) ? (wd - mk).toLocaleString() : '-';
                   }
                } else {
                   if (f.with_discount == 0) {
                      finalDisplay = (f.price ? fmt(f.price) : '-');
                   } else {
                      finalDisplay = (f.with_discount ? fmt(f.with_discount) : '-');
                   }
                }

                rows.push({
                   key,
                   label: typeMap[key] || key,
                   fareDisplay: fmt(rawFareNum),
                   taxDisplay: fmt(taxNum),
                   markupDisplay: (markupNum === null ? '-' : markupNum.toLocaleString()),
                   discountDisplay,
                   finalDisplay
                });
             });

             return rows;
          },
         price_adult() {
           let info_price = this.$store.state.priceCurrency
           let price = this.each_flight.price.adult.price
           let price_with_out_currency =
               this.each_flight.price.adult.price_with_out_currency


           if (Object.keys(info_price).length !== 0) {
             if (Object.keys(info_price.data).length > 1) {
               if (info_price.data.CurrencyCode > 0) {

                 return (
                     price_with_out_currency / info_price.data.EqAmount
                 ).toFixed(2)
               }
             } else if (Object.keys(info_price.data).length === 0) {

               return price_with_out_currency
             }
           }
           return price
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

@media (max-width: 640px) {
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