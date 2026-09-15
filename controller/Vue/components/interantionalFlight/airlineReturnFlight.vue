<template>
  <div class=" international-available-airlines pt-2">
    <div class="international-available-airlines-logo international_logo_coming_back foreign"

         :class="{
        'airline-more-three-route': each_return_flight.return_route_detail.length > 2,
        [each_return_flight.airline]: true
    }"
    >
      <div class="logo-airline-ico-foreign"></div>
    </div>
    <div class="international-available-airlines-log-info pt-2">
      <div v-if="!hasMoreThanTwo" class="sandali-span2 iranL text-dark">
        {{ each_return_flight.airline_name }}
        <span class="d-none d-md-inline">({{ each_return_flight.airline }})</span>
      </div>

      <div v-else class="sandali-span2 iranL text-dark d-flex flex-column">
    <span v-for="(airline, index) in uniqueAirlinesWithFlights" :key="airline.airline_code" class="d-block">
        {{ airline.airline_name }}
        <span class="d-none d-md-inline">({{ airline.airline_code }})</span>
        <span v-if="airline.flight_numbers && airline.flight_numbers.length > 0">
            / {{ airline.flight_numbers[0] }}
        </span>
    </span>
      </div>


      <span
          :class="['iranB txt12 p-0 text-dark', each_return_flight.is_private == 'private' ? 'd-none' : '' ]"
      >
  {{ each_return_flight.flight_type }}
</span>
      <span class="flightnumber_s pt-2" v-if="!hasMoreThanTwo">
            {{ each_return_flight.flight_number_return}}
           </span>
    </div>

    <div class="international-available-airlines-log-info pt-2 site-main-text-color" v-if="each_return_flight.capacity > 0">
      <!--        <div class="sandali-span2 iranL  site-main-text-color">{{ each_return_flight.capacity}}{{useXmltag('Chair')}}</div>-->
    </div>
  </div>
</template>

<script>
export default {
  name: "airlineReturnFlight",
  props:['each_return_flight','key_each_airline_flight'],

  computed: {
    hasMoreThanTwo() {
      return this.each_return_flight?.return_route_detail?.length > 2;
    },
    uniqueAirlinesWithFlights() {
      const routes = this.each_return_flight?.return_route_detail || [];
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