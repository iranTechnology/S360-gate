<template>
   <div>
      <template v-if="flight_type_li === 'system'">

         <template v-if="fee_cancel && fee_cancel.length">
            <div class="cancel-policy cancel_modal">
               <div class="cancel-policy-head">
                  <div class="cancel-policy-head-text">{{ useXmltag('DetailMoneyCancel') }}</div>
<!--                  <div class="cancel-policy-class">-->
<!--                     <span>{{ useXmltag('Classflight') }} :</span>-->
<!--                     <span>{{ useXmltag('TypeClass') }}</span>-->
<!--                  </div>-->
               </div>

               <div class="cancel-policy-inner">
                  <div
                     class="cancel-policy-item cancel_modal"
                     v-for="(item, index) in fee_cancel"
                     :key="index"
                  >
              <span class="cancel-policy-item-text site-main-text-color" v-if=" $store.state.SOFTWARE_LANG == 'fa' ">
                {{ item.title }}
              </span>
                    <span class="cancel-policy-item-text site-main-text-color" v-else>
                {{ item.title_en }}
              </span>

                     <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-if=" $store.state.SOFTWARE_LANG == 'fa' ">
                {{ item.fine_text }}
              </span>
                    <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                {{ item.fine_text_en }}
              </span>
                  </div>
               </div>
            </div>
         </template>

         <template v-else>
           <div class="cancel-policy cancel_modal">
             <div class="cancel-policy-head">
               <div class="cancel-policy-head-text">{{ useXmltag('DetailMoneyCancel') }}</div>
<!--               <div class="cancel-policy-class">-->
<!--                 <span>{{ useXmltag('Classflight') }} :</span>-->
<!--                 <span>{{ useXmltag('TypeClass') }}</span>-->
<!--               </div>-->
             </div>

             <div class="cancel-policy-inner">
               <div
                   class="cancel-policy-item cancel_modal"
                   v-for="(item, index) in fee_cancel_default"
                   :key="index"
               >

                 <span class="cancel-policy-item-text site-main-text-color" v-if=" $store.state.SOFTWARE_LANG == 'fa' ">
                {{ item.title }}
              </span>
                 <span class="cancel-policy-item-text site-main-text-color" v-else>
                {{ item.title_en }}
              </span>

                 <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-if=" $store.state.SOFTWARE_LANG == 'fa' ">
                {{ item.fine_text }}
              </span>
                 <span class="cancel-policy-item-pnalty site-bg-main-color-admin site-bg-main-color" v-else>
                {{ item.fine_text_en }}
              </span>

               </div>
             </div>
           </div>

         </template>

      </template>
     <div class="cancel-policy cancel-policy-charter" v-else>
      <span>
        {{ useXmltag('ThecharterflightscharterunderstandingCivilAviationOrganization') }}
      </span>
     </div>
   </div>
</template>

<script>
export default {
   name: "CancelPolicy",
   props: ["fee_cancel", "flight_type_li"],
  data() {
    return {
      fee_cancel_default: [
        {
          title: 'از زمان صدور تا 12 ظهر 3 روز قبل',
          title_en: 'From the time of issuance until 12:00 PM, three days prior.',
          fine_text: '%30',
          fine_text_en: '%30'
        },
        {
          title: 'از 12 ظهر 3 روز قبل تا 12 ظهر 2 روز قبل',
          title_en: 'From 12:00 PM three days prior to 12:00 PM two days prior.',
          fine_text: '%40',
          fine_text_en: '%40'
        },
        {
          title: 'از 12 ظهر 2 روز قبل تا 12 ظهر 1 روز قبل',
          title_en: 'From 12:00 PM two days prior to 12:00 PM the day before.',
          fine_text: '%70',
          fine_text_en: '%70'
        },
        {
          title: 'از 12 ظهر 1 روز قبل تا زمان پرواز',
          title_en: 'From 12:00 PM on the day before until flight time.',
          fine_text: '%100',
          fine_text_en: '%100'
        }
      ]
    }
  }
}
</script>
