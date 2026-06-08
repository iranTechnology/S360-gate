let currentOpenBusSelect = null;
setupMobileBusDrawerElements('origin')
function renderMobilePopularBusCities(type) {
   const container = $('#mobilePopularDestinations');
   container.html('');

   $.ajax({
      type: 'POST',
      url: amadeusPath + 'ajax',
      dataType: 'json',
      data: JSON.stringify({
         className: "busRoute",
         method: "getPopularBusCities",
      }),
      beforeSend: function () {
         container.html(`<div class='mobile-loading text-center mt-4'>${useXmltag("Loading")}</div>`);
      },
      success: function(response) {
         const popular_cities = response.results;
         let html_output = '';
         let popularListHTML = '';

         $(popular_cities).each(function(_, value) {
            let id = value.id;
            let city = value.text
            const json_value = JSON.stringify({
               id: id,
               city: city,
               type:type
            });

            // آیتم اصلی
            popularListHTML += `
  <li onclick='selectCityBusItem(${json_value}, event, $(this));'>
    <div class="mobile-city-item">
       <svg viewBox="0 0 24 24" width="24px" height="24px" fill="currentColor" class="mobile-drawer-svg-map shrink-0"><path d="M11.28 1.534c4.437-.419 8.22 3.11 8.22 7.59 0 4.053-1.89 7.941-6.398 12.888-.593.65-1.62.651-2.212 0-4.219-4.628-6.14-8.33-6.374-12.09-.263-4.237 2.701-8.005 6.765-8.388ZM18 9.124c0-3.604-3.031-6.432-6.579-6.097C8.192 3.332 5.8 6.374 6.013 9.83c.21 3.37 1.977 6.775 5.982 11.17l.531-.59c3.803-4.306 5.402-7.66 5.471-11.054L18 9.124ZM12 5.25a3.75 3.75 0 1 1 0 7.5 3.75 3.75 0 0 1 0-7.5Zm0 1.5a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5Z" fill-rule="evenodd"></path></svg>
      <span class="city-text">${city} (${id})</span>
    </div>
  </li>
  <div class="mobile-divider"></div>
`;

         });

         html_output += `
        <h2>${useXmltag("Busy")}</h2>
        <ul class="ul-mobile-drawer">${popularListHTML}</ul>
      `;

         container.html(html_output);
      }
   });
}
function handleMobileBusSearch(keyword, type , search_type) {

   const listContainer = $("#mobilePopularDestinations");

   if (!keyword.trim()) {
         renderMobilePopularBusCities(type);
         return;
   }
   $.ajax({
         type: 'POST',
         url: amadeusPath + 'ajax',
         dataType: 'json',
         data: JSON.stringify({
            className: "busRoute",
            method: "routeBus",
            value:keyword
         }),
         beforeSend: function () {
            listContainer.html(`<div class='mobile-loading text-center mt-4'>${useXmltag("Loading")}</div>`);
         },
         success: function (response) {

            let results = response.results || [];
            let html_items = [];
            if (results.length === 0) {
               listContainer.html(`<div class='not_found text-center mt-4'>${useXmltag("Noresult")}</div>`);
               return;
            }

            results.forEach(item => {

               let id = item.id;
               let city = item.text;


               let json_value = JSON.stringify({
                  id: id,
                  city: city,
               });


               html_items.push(`
                 <li onclick='selectCityBusItem(${json_value}, event, $(this));'>
    <div class="mobile-city-item">
        <svg viewBox="0 0 24 24" width="24px" height="24px" fill="currentColor" class="mobile-drawer-svg-map shrink-0"><path d="M11.28 1.534c4.437-.419 8.22 3.11 8.22 7.59 0 4.053-1.89 7.941-6.398 12.888-.593.65-1.62.651-2.212 0-4.219-4.628-6.14-8.33-6.374-12.09-.263-4.237 2.701-8.005 6.765-8.388ZM18 9.124c0-3.604-3.031-6.432-6.579-6.097C8.192 3.332 5.8 6.374 6.013 9.83c.21 3.37 1.977 6.775 5.982 11.17l.531-.59c3.803-4.306 5.402-7.66 5.471-11.054L18 9.124ZM12 5.25a3.75 3.75 0 1 1 0 7.5 3.75 3.75 0 0 1 0-7.5Zm0 1.5a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5Z" fill-rule="evenodd"></path></svg>
        <span class="city-text">${city} (${id})</span>
    </div>
</li>
<div class="mobile-divider"></div>
        `);
            });

            listContainer.html(`
        <h2>${useXmltag("SearchResult")}</h2>
        <ul class="ul-mobile-drawer">${html_items.join("")}</ul>
      `);

         },
         error: function () {
            listContainer.html(`<div class='not_found'>${useXmltag("ErrorHappened")}</div>`);
         }
      });

}
function setupMobileBusDrawerElements(type) {
   const drawer = document.getElementById('mobileDrawer');
   const overlay = document.getElementById('drawerOverlay');

   const typesText = type === 'origin' ? 'انتخاب مبدا' : 'انتخاب مقصد';
   const placeholderText = type === 'origin' ? 'جستجوی شهر مبدا' : 'جستجوی شهر مقصد';


   // اگر قبلاً ساخته شده → فقط آپدیت + وصل کردن سرچ
   if (drawer && overlay) {
      document.getElementById('types').textContent = typesText;

      const searchInput = document.getElementById('mobileSearchInput');
      searchInput.placeholder = placeholderText;

      // اطمینان از اینکه oninput همیشه درست وصل می شود
      searchInput.oninput = () => handleMobileBusSearch(searchInput.value, type);

      return; // اگر عناصر موجود بودند، کار تمام است
   }


   // ساخت overlay
   const newOverlay = document.createElement('div');
   newOverlay.id = 'drawerOverlay';
   newOverlay.className = 'drawer-overlay';
   document.body.appendChild(newOverlay);

   // ساخت drawer
   const newDrawer = document.createElement('div');
   newDrawer.id = 'mobileDrawer';
   newDrawer.className = 'mobile-drawer';

   newDrawer.innerHTML = `
    <div class="d-flex justify-content-between align-items-center mx-3">
        <h5 id="types">${typesText}</h5>
        <button class="close-drawer-btn ml-2">&times;</button>
    </div>

    <div class="drawer-header mb-1">
        <input type="text" id="mobileSearchInput"
            class="mobile-search-input m-0"
            placeholder="${placeholderText}">
    </div>

    <div class="border-bottom w-100"></div>

    <div id="mobilePopularDestinations" class="mobile-popular-list"></div>
  `;

   document.body.appendChild(newDrawer);


   // --- تنظیم ایونت ها بعد از ساخت عناصر ---
   // بستن drawer
   // گرفتن دکمه بستن از newDrawer که همین الان ساخته شده
   const closeButton = newDrawer.querySelector('.close-drawer-btn');
   if (closeButton) {
      closeButton.onclick = closeMobileBusDrawer;
   }
   // overlay هم همینطور
   if (newOverlay) {
      newOverlay.onclick = closeMobileBusDrawer;
   }

   // وصل کردن سرچ
   const searchInput = document.getElementById('mobileSearchInput');
   if (searchInput) {
      searchInput.oninput = () => handleMobileBusSearch(searchInput.value, type);
   }
}
function openMobileBusDrawer() {
   const drawerOverlay = document.getElementById('drawerOverlay'); // یا querySelector
   const mobileDrawer = document.getElementById('mobileDrawer');
   if (drawerOverlay && mobileDrawer) {
      drawerOverlay.classList.add('visible');
      mobileDrawer.classList.add('visible');
   }
}
function closeMobileBusDrawer() {
   const drawerOverlay = document.getElementById('drawerOverlay');
   const mobileDrawer = document.getElementById('mobileDrawer');

   if (drawerOverlay && mobileDrawer) {
      drawerOverlay.classList.remove('visible');
      mobileDrawer.classList.remove('visible');
   }
}
function setupMobileBusDrawerElementsDatePicker(type) {
   const drawerId = 'mobileDrawerDatePicker';
   const overlayId = 'drawerOverlay';
   const datepickerPlaceholderId = "mobileDatepickerContainerPlaceholderBus";
   let drawer = document.getElementById(drawerId);
   let overlay = document.getElementById(overlayId);

   // --- اگر عناصر از قبل موجود بودند، فقط متن عنوان را به‌روز کن و نمایش بده ---
   if (drawer && overlay) {
      document.getElementById('types').textContent = 'انتخاب تاریخ';
      overlay.style.display = 'block';
      drawer.style.display = 'block';
      // اگر تاریخ‌نگار قبلا ساخته شده، نیازی به ساخت مجدد نیست
      // فقط مطمئن می‌شویم که تاریخ‌نگار در محل درستش است
      const datepickerWrapper = document.querySelector(`#${drawerId} .mdp-uni`);
      if (datepickerWrapper) {
         // اگر تاریخ‌نگار قبلا به div دیگری append شده بود، آن را به placeholder اصلی برگردان
         const currentPlaceholder = document.getElementById('انتخاب تاریخ');
         if (currentPlaceholder && !currentPlaceholder.contains(datepickerWrapper)) {
            currentPlaceholder.appendChild(datepickerWrapper);
         }
      }
      return;
   }

   // --- ساخت overlay ---
   if (!overlay) {
      overlay = document.createElement('div');
      overlay.id = overlayId;
      overlay.className = 'drawer-overlay'; // استایل‌های CSS برای overlay
      document.body.appendChild(overlay);
   }

   // --- ساخت drawer ---
   drawer = document.createElement('div');
   drawer.id = drawerId;
   drawer.className = 'mobile-drawer'; // استایل‌های CSS برای کشویی

   // --- محتوای داخل drawer ---
   drawer.innerHTML = `
    <div class="d-flex justify-content-between align-items-center mx-3 mb-3">
        <h5 id="types">انتخاب تاریخ</h5>
        <button class="close-drawer-btn ml-2">&times;</button>
    </div>
    <div class="border-bottom w-100"></div>
    <div id="${datepickerPlaceholderId}" class="datepicker-placeholder">
    </div>
`;
   document.body.appendChild(drawer);

   const closeButton = drawer.querySelector('.close-drawer-btn');
   if (closeButton) {

      closeButton.onclick = closeMobileBusDrawerDatePicker;



   }
   if (overlay) {
      overlay.onclick = closeMobileBusDrawerDatePicker;
   }

   overlay.style.display = 'block';
   drawer.style.display = 'block';

}
function openMobileBusDrawerDatePicker() {
   const drawerOverlay = document.getElementById('drawerOverlay'); // یا querySelector
   const mobileDrawer = document.getElementById('mobileDrawerDatePicker');
   if (drawerOverlay && mobileDrawer) {
      drawerOverlay.classList.add('visible');
      mobileDrawer.classList.add('visible');
      if ($('#mobileDrawerDatePicker').hasClass('visible')) {
         setTimeout(()=>{
            // $(`#departure-date-bus-js`).datepicker().focus()
            $(".departure-date-bus-js").focus();
         } , 100)
      }
   }
}
function closeMobileBusDrawerDatePicker() {
   const drawerOverlay = document.getElementById('drawerOverlay');
   const mobileDrawer = document.getElementById('mobileDrawerDatePicker');
   if (drawerOverlay && mobileDrawer) {
      drawerOverlay.classList.remove('visible');
      mobileDrawer.classList.remove('visible');
   }

}
function selectCityBusItem(data, event, element) {

   const { id, city , type} = data;

   const typed = currentOpenBusSelect.attr('data-type');
   const targetSelect = typed === 'origin'
       ? $('#origin_bus')
       : $('#destination_bus');

   if (!targetSelect.find('option[value="' + id + '"]').length) {
      targetSelect.append(new Option(city, id, true, true));
   } else {
      targetSelect.val(id);
   }
   targetSelect.trigger('change');

   const s2 = targetSelect.data('select2');
   if (s2 && s2.$container) {
      s2.$container
          .find('.select2-selection__placeholder')
          .text(city);
   }

   closeMobileBusDrawer();

   // اگر مبدا انتخاب شده → مقصد را باز کن
   if (typed === 'origin') {
      setTimeout(() => {
         $('#mobileSearchInput').val('');
         const dest = $('#destination_bus');
         currentOpenBusSelect = dest;

         // باز کردن select2 مقصد
         dest.select2("open");

         // رندر شهرهای محبوب مقصد
         renderMobilePopularBusCities('destination');

         // تنظیم عناصر دراور برای مقصد
         setupMobileBusDrawerElements('destination');

         // باز کردن دراور
         openMobileBusDrawer();
      }, 250);
   }else{
      setupMobileBusDrawerElementsDatePicker();
      setTimeout(()=>{
         openMobileBusDrawerDatePicker();
      },100)
   }
}

$(document).ready(function () {
   // تابع کمکی برای فراخوانی setupMobileBusDrawerElements
   function handleBusSelection(element) {
      const dataType = element.data('type');
      if (dataType) {
         renderMobilePopularBusCities(dataType);
         setupMobileBusDrawerElements(dataType);
      }
   }
   if (window.innerWidth <= 576) {
      $('#departure_date_bus')
          .attr('readonly', 'readonly')
          .css('background-color', '#fff');
      $('#origin_bus').attr('data-type', 'origin');
      $('#destination_bus').attr('data-type', 'destination');
      $(".select-route-bus-js").on("select2:open", function (e) {
         currentOpenBusSelect = $(this);
         $(".select2-dropdown").css("display", "none");
         openMobileBusDrawer();
         handleBusSelection($(this));
      });

      $('#departure_date_bus').click(()=>{

      setupMobileBusDrawerElementsDatePicker();
      openMobileBusDrawerDatePicker();
      })
   }


   else {
      // --- بخش دسکتاپ ---
      $(".select-route-bus-js").select2({
         ajax: {
            type: "POST",
            url: amadeusPath + "ajax",
            dataType: "json",
            delay: 250,
            data: function (params) {
               if (!params.term || params.term.trim() === '') {
                  return JSON.stringify({
                     className: "busRoute",
                     method: "getPopularBusCities",
                  });
               }
               return JSON.stringify({
                  value: params.term,
                  className: "busRoute",
                  method: "routeBus",
               });
            },
            processResults: function (response) {
               // این تابع برای تبدیل پاسخ به فرمت مورد نیاز select2 اضافه شده
               let results = response.results || [];
               return {
                  results: results.map(function(item) {
                     return {
                        id: item.id,
                        text: item.text
                     };
                  })
               };
            },
            cache: true
         },
         placeholder: "جستجو بین شهر ها",
         minimumInputLength: 0,
         language: {
            inputTooShort: function () { return "شما باید حداقل یک حرف وارد کنید"; },
            searching: function () { return "در حال جستجو ... "; },
            noResults: function () { return "جستجوی شما نتیجه ایی ندارد"; },
         }
      });

      // اضافه کردن data-type در دسکتاپ هم لازم است
      $('#origin_bus').attr('data-type', 'origin');
      $('#destination_bus').attr('data-type', 'destination');

      // رویداد change برای باز کردن مقصد
      $(".select-origin-route-bus-js").change((e) => {
         currentOpenBusSelect = $(this);



         $(".select-destination-route-bus-js").select2('open');


         handleBusSelection($('#origin_bus'));
      });



      // رویداد change برای فوکوس به تاریخ
      $(".select-destination-route-bus-js").change(() => {
         currentOpenBusSelect = $(this);
         $(".departure-date-bus-js").focus();
         // فراخوانی تابع کمکی با المنت مقصد
         handleBusSelection($('#destination_bus'));
      });
   }

});


function searchBus() {
   const form = document.getElementById('gds_local_bus');
   const is_new_tab = form.target === '_blank';

   let origin_bus = $(".select-origin-route-bus-js")
   let destination_bus = $(".select-destination-route-bus-js")
   let departure_date_bus = $(".departure-date-bus-js")
   checkSearchFields(origin_bus, destination_bus, departure_date_bus)

   origin_bus = origin_bus.val()
   destination_bus = destination_bus.val()
   departure_date_bus = departure_date_bus.val()
   let url = `${amadeusPathByLang}buses/${origin_bus}-${destination_bus}/${departure_date_bus}`

   openLink(url, is_new_tab)
}