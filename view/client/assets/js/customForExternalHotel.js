let response_value;
/* *** List of hotels for preview *** */
let getResultExternalHotelPreview = function (countryNameEn, cityNameEn, startDate, nights) {
    setTimeout(function () {
        $(".resultExternalHotelSearchAlaki").html('');
    }, 10000);

    /*$.ajax({
        type: "POST",
        url: amadeusPath + 'external_hotel_ajax.php',
        dataType: 'JSON',
        data: {
            flag: 'getResultExternalHotelPreview',
            countryNameEn: countryNameEn,
            cityNameEn: cityNameEn,
            startDate: startDate,
            nights: nights
        },
        success: function (data) {
            setTimeout(function () {
                $(".resultExternalHotelSearchAlaki").html('');
            }, 10000);
        }
    });*/
}


let priceRangeSlider = function (minPrice, maxPrice) {
    console.log(minPrice);
    console.log(maxPrice);
    minPrice = parseInt(minPrice);
    maxPrice = parseInt(maxPrice);
    console.log(typeof minPrice);
    console.log(typeof maxPrice);
    $("#slider-range").slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        step: 500000,
        animate: false,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            let minRange = ui.values[0];
            let maxRange = ui.values[1];
            $(".filter-price-text span:nth-child(2) i").html(number_format(minRange));
            $(".filter-price-text span:nth-child(1) i").html(number_format(maxRange));
            let hotels = $(".hotel-result-item");
            hotels.hide().filter(function () {
                let price = parseInt($(this).data("price"), 10);
                return price >= minRange && price <= maxRange;
            }).show();

        }
    });

    $(".filter-price-text span:nth-child(2) i").html(number_format(minPrice));
    $(".filter-price-text span:nth-child(1) i").html(number_format(maxPrice));
};

let externalHotelSearchDetails = function(ajax_details){
    $.ajax({
        type: 'POST',
        url: amadeusPath + 'ajax',
        dataType: 'JSON',
        data: JSON.stringify(ajax_details),

        success: function(response){
            console.log(response)
            $('#city_name_fa').text(response.City);
            let loading_text = $(document).find('.text_loading');
            loading_text.find('> h4').html(translateXmlByParams('HotelSearchForCity', {'cityName': response.City}));
            loading_text.find('.night_text').html(translateXmlByParams('ForHowMenyNights', {'nightsCount': response.Night}));
            loading_text.find('.start_date_text').html(response.StartDate);
            loading_text.find('.end_date_text').html(response.EndDate);
            let count_text_span = $('.silence_span');
            count_text_span.html(useXmltag('Loading'));

            console.log(loading_text.find('.night_text').html());
            response_value = response;
            $("#autoComplateSearchIN").val(response.Country + ' - ' + response.City);
        },
        error: function(error){
            console.log(error)
        }
    })
}

$("body , html").click(function(e) {
    var target = $(e.target);
    if(!target.is('#autoComplateSearchIN')) {
        if (
          $("#autoComplateSearchIN").val() == ""&&
          $("#destination_city").val() == ""&&
          $("#destination_country").val() == ""){
            if(response_value){
                $("#autoComplateSearchIN").val(response_value.Country + ' - ' + response_value.City)
                $("#destination_city").val(response_value.City)
                $("#destination_country").val(response_value.Country)
            }
        }
        if (
          $("#autoComplateSearchIN").val() != ""&&
          $("#destination_city").val() == ""&&
          $("#destination_country").val() == ""){
            if(response_value){
            $("#autoComplateSearchIN").val(response_value.Country + ' - ' + response_value.City)
            $("#destination_city").val(response_value.City)
            $("#destination_country").val(response_value.Country)
            }
        }
    }
})

let getResultExternalHotelSearch = function (countryNameEn, cityNameEn, startDate,endDate, nights, rooms, nationality) {

    let json_data = {
        className: 'resultSearchExternalHotel',
        method: 'getHotels',
        countryNameEn, cityNameEn, startDate, nights, rooms, nationality
    };

    let parsJsonCapacity = {
        className: 'fullCapacity',
        method: 'getFullCapacitySite',
        id: 1,
        is_json: 1
    };

    const t = {
        specialHotel:    useXmltag('Specialhotel'),
        showReservation: useXmltag('ShowReservation'),
        address:         useXmltag('Address'),
        price:           useXmltag('Price'),
        night:           useXmltag('Night'),
        points:          useXmltag('Yourpurchasepoints'),
        point:           useXmltag('Point'),
        noHotel:         useXmltag('Nohotel'),
        nothingFound:    useXmltag('NothingFound'),
        silenceSpan:     useXmltag('silenceSpanHotel'),
        pricePerNight:   translateXmlByParams('PriceForEachNight', {'Price': ''}),
    };

    const svgArrow = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"></path></svg>`;
    const svgStar  = `<svg viewBox="0 0 24 24" width="1em" height="1em" fill="currentColor"><path d="M11.892 3.005c-.429.041-.8.325-.95.735l-1.73 5.182-5.087-.001a1.122 1.122 0 0 0-.675 2.021l4.077 3.078-1.834 5.504c-.153.465.011.974.407 1.261l.093.061c.383.224.868.203 1.232-.062l4.577-3.442 4.59 3.408c.4.292.936.292 1.331.005l.087-.07a1.12 1.12 0 0 0 .32-1.189l-1.856-5.477 4.078-3.079a1.12 1.12 0 0 0 .39-1.251 1.125 1.125 0 0 0-1.067-.768h-5.087l-1.724-5.163A1.131 1.131 0 0 0 12 3l-.108.005Z"></path></svg>`;

    let full_capacity_image = amadeusPath + 'view/client/assets/images/fullCapacity.png';

    const capacityPromise = $.ajax({
        type: 'POST',
        url: amadeusPath + 'ajax',
        data: JSON.stringify(parsJsonCapacity)
    }).then(function (data) {
        if (data.pic_url) full_capacity_image = data.pic_url;
    }).catch(function () { /* fallback already set */ });

    const hotelsPromise = $.ajax({
        type: 'POST',
        url: amadeusPath + 'ajax',
        dataType: 'JSON',
        data: JSON.stringify(json_data)
    });

    $.when(capacityPromise, hotelsPromise).then(function (_, hotelsResult) {
        let data = Array.isArray(hotelsResult) ? hotelsResult[0] : hotelsResult;

        let advertises     = data.advertises;
        let request_number = data.requestNumber;

        $('#requestNumber').text(request_number);

        if (data.error) {
            $("#hotelResult").html(`
                <div id='show_offline_request'>
                    <div class='fullCapacity_div'>
                        <img src='${full_capacity_image}' alt='fullCapacity'>
                        <h2>${t.noHotel}</h2>
                    </div>
                </div>`);
            $('.silence_span').html(t.nothingFound);
            return;
        }

        const searched_rooms = $('#searchRooms').val();
        const type           = $('#type').val();
        const nat            = $('#nationality').val();

        $("#loginIdApi").val(data.loginIdApi);
        $("#searchIdApi").val(data.searchIdApi);
        $('#boxCountHotels').removeClass('displayN');

        const hotelCount = data.hotels.length;
        $("#countHotelHtml").html(hotelCount);
        $('.silence_span').html(`<b id='countHotelHtml'>${hotelCount}</b> ${t.silenceSpan}`);
        $("#countHotels").val(hotelCount);
        $("#facilitiesHtml").append(data.htmlFacilitiesPage);
        $('.loader-box-count-hotels').addClass('displayN');

        // -- sort ترکیبی O(n log n) --
        data.hotels.sort(function (a, b) {
            const aSpecial = a.isSpecial === 'yes' ? 0 : 1;
            const bSpecial = b.isSpecial === 'yes' ? 0 : 1;
            if (aSpecial !== bSpecial) return aSpecial - bSpecial;

            const aP = parseFloat(a.amountCurrency) || 0;
            const bP = parseFloat(b.amountCurrency) || 0;
            if (aP === 0 && bP === 0) return 0;
            if (aP === 0) return 1;
            if (bP === 0) return -1;
            return aP - bP;
        });

        // -- ساخت HTML در یک رشته --
        let htmlBuffer = '';

        for (let i = 0; i < hotelCount; i++) {
            const item = data.hotels[i];

            const isReservation = item.typeApp === 'reservation';
            const isSpecial     = item.isSpecial === 'yes';

            // facilities list
            const facList = item.facilitiesList;
            const facLen  = facList ? facList.length : 0;
            let facilities_list = '<ul class="hotelpreferences facilities facilities-21"><div class="external-hotel-facilities">';
            for (let f = 0; f < facLen; f++) {
                if (facList[f]) {
                    facilities_list += `<span style="direction: ltr;">${facList[f]}</span>`;
                    if (f < facLen - 1) facilities_list += '<span>|</span>';
                }
            }
            facilities_list += '</div></ul>';

            const starsFill = item.hotelStars > 0 ? svgStar : '';
            const starText  = item.hotelStars > 0 ? item.hotelStars : '';

            const specialHotelRabon = isSpecial
                ? `<div class='ribbon-special-hotel'>${t.specialHotel}</div>`
                : '';

            const single_detail_link = `${amadeusPathByLang}detailHotel/${item.typeApp}/${item.HotelIndex}/${item.RequestNumber}&searchRooms=${searched_rooms}&type=${type}&nationality=${nat}`;

            const nameWithLink = `<a target='_blank' href='javascript:' class='hotel-result-item-name hotelNameResult text-left'>${item.HotelName}</a>`
                + `<kbd style="color:rgba(0,0,0,0);background:none;box-shadow:none;">S${item.SourceId}</kbd>`;

            const reserveBtn = isReservation
                ? `<a onclick="hotelDetail('${item.typeApp}','${item.HotelIndex}','${item.nameEnUrl}','${item.RequestNumber}','${nights}')" class="bookbtn mt1">${t.showReservation} ${svgArrow}</a>`
                : `<a target="_blank" href="${single_detail_link}" class="bookbtn mt1"> ${t.showReservation} ${svgArrow}</a>`;

            const imgClick = `<a><img src="${item.pictureUrl}" alt="${item.HotelName}"></a>`;

            // امن‌سازی قیمت بدون تخفیف
            let withoutDiscountPrice = '';
            if (item.has_discount) {
                const discountPriceAmount = (item.priceWithoutDiscountCurrency && item.priceWithoutDiscountCurrency.AmountCurrency)
                    ? item.priceWithoutDiscountCurrency.AmountCurrency
                    : (item.priceWithoutDiscount || 0);

                withoutDiscountPrice = `
                <div class="d-flex style_Discount">
                    <span class="currency priceOff CurrencyCal" data-amount="${item.priceWithoutDiscount || 0}">
                        ${number_format(discountPriceAmount)}
                    </span>
                    <div class="ribbon-hotel site-bg-color-dock-border-top">
                        <span><i>%${item.discount}</i></span>
                    </div>
                </div>`;
            }

            // تعیین امن واحد پول (Currency)
            const currencyText = (item.mainCurrency && item.mainCurrency.TypeCurrency) ? item.mainCurrency.TypeCurrency : 'ریال';

            let realPrice;
            if (item.commissionPercent && item.commissionPercent > 0) {
                realPrice = `
                <div class="price_main" style="display:flex;flex-direction:column;align-items:flex-start;">
                    <div class="old_price_line">
                        <span class="ribbon-hotel site-bg-color-dock-border-top">${item.commissionPercent}%</span>
                        <h2 class="currency priceOff CurrencyCal" data-amount="${item.MinimumRoomPriceWithOutCom}"
                            style="color:#999;font-size:14px;margin:0;">
                            ${number_format(item.MinimumRoomPriceWithOutCom)}
                        </h2>
                    </div>
                    <div class="new_price_line" style="display:flex;align-items:center;gap:4px;">
                        <h2 class="CurrencyCal" data-amount="${item.minimumRoomPrice}"
                            style="color:#000;font-size:16px;margin:0;">
                            ${number_format(item.minimumRoomPrice)}
                        </h2>
                        <span class="CurrencyText" style="font-size:14px;color:#000;">${currencyText}</span>
                    </div>
                </div>`;
            } else {
                realPrice = `
                <div class="price_main" style="display:flex;flex-direction:column;align-items:flex-start;">
                    <div class="new_price_line" style="display:flex;align-items:center;gap:4px;">
                        <h2 class="CurrencyCal" data-amount="${item.MinimumRoomPriceEachNightWithOutCom || item.minimumRoomPrice}"
                            style="color:#000;font-size:16px;margin:0;">
                            ${number_format(item.MinimumRoomPriceEachNightWithOutCom || item.minimumRoomPrice)}
                        </h2>
                        <span class="CurrencyText" style="font-size:14px;color:#000;">${currencyText}</span>
                    </div>
                </div>`;
            }

            // امن‌سازی قیمت هر شب
            const amountCurrencyEachNight = (item.mainCurrencyEachNight && item.mainCurrencyEachNight.AmountCurrency)
                ? item.mainCurrencyEachNight.AmountCurrency
                : (item.minimumRoomPriceEachNight || 0);

            const perNightHtml = nights > 1
                ? `<div class='d-flex align-items-center pricePerNight'>
                       <h2 class='CurrencyCal' data-amount='${item.minimumRoomPriceEachNight || 0}'>${number_format(amountCurrencyEachNight)}</h2>
                       <span>${t.pricePerNight}</span>
                   </div>`
                : '';

            const pointHtml = item.calculatePoint > 0
                ? `<div class="text_div_more_hotel_f">
                       <span>${t.points} :</span>
                       <i class="site-main-text-color">${item.calculatePoint} ${t.point}</i>
                       <i class="flat_cup"></i>
                   </div>`
                : '';

            htmlBuffer += `
            <div class="hotelResultItem" id="boxHotel_${item.HotelIndex}">
                <div id="a1" class="hotel-result-item"
                     data-typeApplication="${item.typeApp}"
                     data-price="${item.amountCurrency}"
                     data-priority=''
                     data-special='${item.isSpecial}'
                     data-star="${item.hotelStars}"
                     data-freeBreakfast="${item.freeBreakfast}"
                     data-facilities="${item.hotelFacilities}"
                     data-hotelName="${item.HotelName.toLowerCase()}"
                     data-hotelAddress="${item.HotelAddress.toLowerCase()}">

                    <div class="cols_hotel hotel_content">
                        <div class="hotel-result-item-content external-hotel-content">
                            <div class="hotel-result-item-text align-items-end">
                                ${specialHotelRabon}
                                <div class="parent-hotel-name-result">
                                    <div class='d-flex align-items-center gap-10 flex-row-reverse'>
                                        ${nameWithLink}
                                    </div>
                                    <span class="rp-cel-hotel-star">
                                        <input type="hidden" id="starSortDep" name="starSortDep" value="${item.hotelStars}">
                                        ${starsFill}
                                        <span class='rp-cel-hotel-star_span'>${starText}</span>
                                    </span>
                                </div>
                                <input id="idHotel" name="idHotel" type="hidden" value="${item.HotelIndex}">
                                ${pointHtml}
                                <span class="hotel-result-item-content-location external-hotel-location show-map-modal"
                                      data-longitude="${item.MapLang}" data-latitude="${item.MapLat}">
                                    <span><span>:</span>${t.address}</span>
                                    <span class='hotel_result_item_content_location_spanAddres'>${item.HotelAddress}</span>
                                </span>
                                ${facilities_list}
                            </div>

                            <div class="hotel-result-item-bottom external-hotel-bottom">
                                <div class="price-box-hotel justify-content-end justify-content-md-center">
                                    <span class='nightText' style="direction:ltr">${t.price} ${nights} ${t.night}</span>
                                    ${withoutDiscountPrice}
                                    ${realPrice}
                                    ${reserveBtn}
                                    ${perNightHtml}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="cols_hotel">
                        <div class="hotel-result-item-image external-hotel-image">
                            ${imgClick}
                        </div>
                    </div>
                </div>
            </div>`;
        }

        $("#hotelResult").html(htmlBuffer);

        if (advertises && advertises.length > 0) {
            let mainAdvertise = '<div class="advertises">';
            for (let a = 0; a < advertises.length; a++) {
                mainAdvertise += `<div class="advertise-item">${advertises[a].content}</div>`;
            }
            mainAdvertise += '</div>';
            $(mainAdvertise).insertBefore('#hotelResult');
        }

        priceRangeSlider(data.minPrice, data.maxPrice);

    }).fail(function (error) {
        $('.loader-for-external-hotel-end').hide();
        const errMsg = error.responseJSON
            ? (error.responseJSON.Message || error.responseJSON.message[0])
            : 'خطا در دریافت اطلاعات';
        $("#hotelResult").html(`
            <div class="userProfileInfo-messge">
                <div class="messge-login BoxErrorSearch">
                    <div style="float:right;"><i class="fa fa-exclamation-triangle IconBoxErrorSearch"></i></div>
                    <div class="TextBoxErrorSearch"><br>${errMsg}</div>
                </div>
            </div>`);
    }).always(function () {
        setTimeout(function () {
            sortHotelList($('#sort_hotel_type').val());
        }, 3000);
        $('.loader-for-external-hotel-end').hide();
        $('.container_loading').hide();
    });
};
