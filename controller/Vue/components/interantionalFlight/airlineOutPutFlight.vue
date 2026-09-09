<template>

  <div class="international-available-airlines" v-if="data_search.dataSearch.MultiWay !='multi_destination'">
    <div class="international-available-airlines-logo foreign"   :class="{
        'airline-more-three-route': each_airline_flight.output_routes_detail.length > 2,
        [each_airline_flight.airline]: true
    }">
      <div class="logo-airline-ico-foreign"></div>
    </div>

    <div class="international-available-airlines-log-info pt-2">
      <div v-if="!hasMoreThanTwo" class="sandali-span2 iranL text-dark">
        {{ each_airline_flight.airline_name }}
        <span class="d-none d-md-inline">({{ each_airline_flight.airline }})</span>
      </div>

      <!-- حالت بیشتر از 2 مسیر -->
      <div v-else class="sandali-span2 iranL text-dark d-flex flex-column">
            <span v-for="(airline, index) in uniqueAirlines" :key="airline.airline_code" class="d-block">
                {{ airline.airline_name }}
                <span class="d-none d-md-inline">({{ airline.airline_code }})</span>
                <span v-if="airline.flight_numbers && airline.flight_numbers.length > 0">
                    / {{ airline.flight_numbers[0] }}
                </span>
            </span>
      </div>



      <span
          :class="['iranB txt12 p-0 text-dark' , each_airline_flight.is_private == 'private' ? 'd-none' : '' ]"
      >
  {{ each_airline_flight.flight_type }}
</span>
    </div>

    <!--          <div class="international-available-airlines-log-info pt-2 site-main-text-color" v-if="each_airline_flight.capacity > 0">-->

    <!--            <div class="sandali-span2 iranL  site-main-text-color">{{ each_airline_flight.capacity}} {{useXmltag('Chair')}}</div>-->
    <!--          </div>-->

    <span class="flightnumber_s pt-2" v-if="!hasMoreThanTwo">
               {{ each_airline_flight.flight_number}}
           </span>
  </div>


  <div class=" international-available-airlines" v-else>
    <div class="international-available-airlines-logo foreign"
         :class="{
        'airline-more-three-route': each_airline_flight.output_routes_detail.length > 2,
        [each_airline_flight.airline.airline_code]: true
    }"

    >
      <div class="logo-airline-ico-foreign"></div>
    </div>
    <div class="international-available-airlines-log-info pt-2">
      <div class="sandali-span2 iranL text-dark">{{ each_airline_flight.airline.airline_name}}</div>
    </div>
    <div class="international-available-airlines-log-info pt-2 site-main-text-color" v-if='each_airline_flight.capacity > 0'>
      <div class="sandali-span2 sandali-span2-margin-right iranL d-block w-100 text-end  site-main-text-color">{{ each_airline_flight.capacity}}{{useXmltag('Chair')}}</div>
    </div>
  </div>


</template>


<script>
export default {
  name: "airlineOutPutFlight",
  props:['each_airline_flight','key_each_airline_flight','data_search'],
  computed: {
    hasMoreThanTwo() {
      return this.each_airline_flight?.output_routes_detail?.length > 2;
    },
    uniqueAirlines() {
      const routes = this.each_airline_flight?.output_routes_detail || [];
      const airlineMap = new Map();

      routes.forEach(route => {
        if (route.airline && route.airline.airline_code) {
          const code = route.airline.airline_code;
          if (!airlineMap.has(code)) {
            airlineMap.set(code, {
              airline_code: code,
              airline_name: route.airline.airline_name || '',
              flight_numbers: []
            });
          }
          // اضافه کردن flight_number به آرایه
          if (route.flight_number) {
            airlineMap.get(code).flight_numbers.push(route.flight_number);
          }
        }
      });

      return Array.from(airlineMap.values());
    }
  }
}
</script>

<style scoped>

</style>