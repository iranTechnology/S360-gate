<template>
	<div class="loader-section">
		<div id="loader-page" class="lazy-loader-parent ">
			<div class="loader-page container site-bg-main-color">
				<div class="parent-in row">

					<div class="loader-txt">

						<div id="flight_loader">
              <div
                  class="d-flex align-items-center w-100"
                  :class="data_search.DateFlightReturnWithName ? 'justify-content-around' : 'justify-content-center'"
              >
              <div>
                          <span class="loader-date"  style="line-height:20px !important">
                              {{data_search.DateFlightWithName}}
                          </span>
              <span class="text-sm-flight dir-ltr" v-if="this.isPersianDate(data_search.departureDate)">
                              {{this.formatDate(data_search.departure_date_en)}}
                          </span>
              <span class="text-sm-flight dir-ltr" v-else>
                              {{this.formatDatePersian(data_search.departureDate)}}
                          </span>
              </div>
              <p v-if="data_search.DateFlightReturnWithName" class="on-flight"> {{ useXmltag('On')}} </p>
              <div>
                  <span class="loader-date" style="line-height:20px !important" v-if="data_search.DateFlightReturnWithName">
                              {{data_search.DateFlightReturnWithName}}
                          </span>
                <span class="text-sm-flight dir-ltr" v-if="data_search.arrivalDate && this.isPersianDate(data_search.arrivalDate)">
                              {{this.formatDate(data_search.arrival_date_en)}}
                          </span>
                <span class="text-sm-flight dir-ltr" v-if="data_search.arrival_date_en && !this.isPersianDate(data_search.arrivalDate)">
                              {{this.formatDatePersian(data_search.arrival_date_en)}}
                          </span>

              </div>
              </div>

							<div class="wrapper">

								<div class="locstart"></div>
								<div class="flightpath">
									<div class="airplane"></div>
								</div>
								<div class="locend"></div>
							</div>
						</div>

						<div class="loader-distinc">
							{{ useXmltag('Searching')}}
							{{ useXmltag('Flight')}}
							{{ useXmltag('From')}}
							<span>
                                  {{ data_search.name_departure}}
                            </span>
							{{ useXmltag('On')}}
							<span>
                                   {{ data_search.name_arrival}}
                                </span>
							{{ useXmltag('ForYou')}}
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</template>

<script>
    export default {
        name: "loader",
	    props:['dataSearch'],
	    data(){
          return{
              data_search:[]
          }
	    },
      methods:{
        formatDate(dateString) {
          const date = new Date(dateString);
          const year = date.getFullYear();
          const month = date.toLocaleString('en-US', { month: 'short' });
          const day = date.getDate();
          return `${day} ${month} ${year}`;
        },
        isPersianDate(dateStr) {



          const cleanDate = dateStr

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
        }

      },
	    watch:{
            dataSearch() {
                let _this = this;
                if (_this.dataSearch) {
                    _this.data_search = _this.dataSearch.dataSearch;
                }
            },
	    },

    }
</script>

<style scoped>
.text-sm-flight{
  font-size:14px !important;
}
.loader-date{
  font-size:17px !important;
}
.on-flight{
  font-size:16px  !important;
}

</style>