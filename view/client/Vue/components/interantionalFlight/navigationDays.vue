<template>
  <div class="navigation-days">
    <!-- دکمه روز قبل -->
    <a
        v-if="hasPrevious"
        :href="previousLink"
        class="nav-day-btn nav-day-prev"
    >
      <i class="zmdi zmdi-chevron-right"></i>
      <span>{{ useXmltag('Previousday') }}</span>
    </a>
    <span v-else class="nav-day-btn nav-day-prev disabled">
      <i class="zmdi zmdi-chevron-right"></i>
      <span>{{ useXmltag('Previousday') }}</span>
    </span>

    <!-- اطلاعات روز جاری -->
    <div class="nav-day-info">
      <span class="nav-day-date">{{ currentDate }}</span>
    </div>

    <!-- دکمه روز بعد -->
    <a
        v-if="hasNext"
        :href="nextLink"
        class="nav-day-btn nav-day-next"
    >
      <span>{{ useXmltag('Nextday') }}</span>
      <i class="zmdi zmdi-chevron-left"></i>
    </a>
    <span v-else class="nav-day-btn nav-day-next disabled">
      <span>{{ useXmltag('Nextday') }}</span>
      <i class="zmdi zmdi-chevron-left"></i>
    </span>
  </div>
</template>

<script>
export default {
  name: 'NavigationDays',
  props: {
    dataSearch: {
      type: Object,
      required: true
    },
    enablePrevious: {
      type: Boolean,
      default: true
    },
    enableNext: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      today_date: true,
      data_search: {},
      prevDate: null,
      nextDate: null
    }
  },
  computed: {
    currentDate() {
      if (!this.data_search) return '';

      const data = this.data_search;

      if (data.DateFlightWithName) {
        return data.DateFlightWithName;
      }

      return data.departureDate || '';
    },

    previousLink() {
      if (!this.data_search) return '';

      const data = this.data_search;

      // استفاده از prevDate که از والد می‌آید
      const prev = this.prevDate || data.prev;

      if (!data.origin || !data.destination || !prev) {
        return '';
      }
      let isInternal = data.isInternal == '1' ? 1 : 1;
      let classFlight = data.classFlight ? '/' + data.classFlight : '';
      return `${this.amadeusPathByLang()}${data.typeSearch}/${isInternal}/${data.origin}-${data.destination}/${prev}/Y/${data.adult}-${data.child}-${data.infant}${classFlight}`;
    },

    nextLink() {
      if (!this.data_search) return '';
      const data = this.data_search;

      const next = this.nextDate || data.next;

      if (!data.origin || !data.destination || !next) {
        return '';
      }
      let isInternal = data.isInternal == '1' ? 1 : 1;
      let classFlight = data.classFlight ? '/' + data.classFlight : '';
      return `${this.amadeusPathByLang()}${data.typeSearch}/${isInternal}/${data.origin}-${data.destination}/${next}/Y/${data.adult}-${data.child}-${data.infant}${classFlight}`;
    },

    // دکمه قبلی: باید today_date چک شود
    hasPrevious() {
      return this.enablePrevious &&
          this.today_date &&
          this.previousLink !== '' &&
          this.previousLink !== null;
    },

    // دکمه بعدی: بدون چک today_date
    hasNext() {
      return this.enableNext &&
          this.nextLink !== '' &&
          this.nextLink !== null;
    }
  },
  methods: {
    async checkToDayDate() {
      try {
        if (typeof amadeusPath === 'undefined') {
          console.warn('amadeusPath is not defined, using default');
          this.today_date = true;
          return;
        }

        const data = this.data_search;

        if (!data || !data.departureDate) {
          this.today_date = true;
          return;
        }

        const response = await axios.post(amadeusPath + 'ajax', {
          className: 'newApiFlight',
          method: 'checkToDayDate',
          dateSearch: data.departureDate,
        }, {
          'Content-Type': 'application/json',
        });

        this.today_date = response.data.data;
      } catch (error) {
        console.error('Error checking date:', error);
        this.today_date = true;
      }
    },
  },
  mounted() {
    if (this.dataSearch) {
      this.data_search = this.dataSearch.dataSearch || this.dataSearch;

      // دریافت prev و next از dataSearch
      if (this.dataSearch.prev) {
        this.prevDate = this.dataSearch.prev;
      }
      if (this.dataSearch.next) {
        this.nextDate = this.dataSearch.next;
      }
    }

    if (this.data_search && Object.keys(this.data_search).length > 0) {
      this.checkToDayDate();
    }
  },
  watch: {
    dataSearch: {
      handler(newVal) {
        if (newVal) {
          this.data_search = newVal.dataSearch || newVal;

          // به‌روزرسانی prev و next از newVal
          if (newVal.prev) {
            this.prevDate = newVal.prev;
          }
          if (newVal.next) {
            this.nextDate = newVal.next;
          }

          if (this.data_search && Object.keys(this.data_search).length > 0) {
            this.checkToDayDate();
          }
        }
      },
      deep: true,
      immediate: true
    }
  }
}
</script>
