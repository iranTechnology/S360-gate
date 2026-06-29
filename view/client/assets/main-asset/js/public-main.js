$('document').ready(function() {


  $("#searchBoxTabs .nav-link").click(() => {
    setTimeout(()=>{
      if($("#Insurance-tab").hasClass("active")){
        $(".passengers-age-js").click(() => {
          $('#ui-datepicker-div').addClass('insurance-costume-calender')
        })
      } else {
        $('#ui-datepicker-div').removeClass('insurance-costume-calender')
      }
    },100)
  })


  $(".insurance-costume-calender").click((e) => {
    e.stopPropagation();
  })



  if(gdsSwitch == 'mainPage'){
    $('.show-box-login-js').on('click',function(e) {
      $('.show-content-box-login-js').toggle();
      e.stopPropagation();
    })
    $('body').click(function () {
      $('.main-navigation__sub-menu2').hide();
    });
  }


  $(".select2_in").select2({
    templateResult: formatState
  });

  $(".default-select2").select2();

  $('.add-to-count-passenger-js').on('click', function() {
    getCountPassengers(this, 'add')
  })

  $('.minus-to-count-passenger-js').on('click', function() {
    getCountPassengers(this, 'minus')
  })

  $('.select-type-way-js').on('click', function () {

    let type = $(this).data('type');

    let class_element = $(`.${type}-one-way-js`);
    let arrival_date =  $(`.${type}-arrival-date-js`)

    if (class_element.is(':checked')) {
      arrival_date.attr("disabled", "disabled");
    } else {
      arrival_date.removeAttr("disabled");
    }
  });
});

function formatState (state) {
  if (!state.id) {
    return state.text;
  }
  var baseUrl = "/user/pages/images/flags";
  var $state = $(
      '<span class="city_start"><i class="fa fa-map-marker-alt"></i>' + state.text + '</span>'
  );
  return $state;
};

function signout(typeUser) {
  $.post(amadeusPath + 'user_ajax.php',
      {flag: 'signout'},
      function (data) {
        /*if(typeUser !=undefined && typeUser=='agency')
           {
               window.location.href = amadeusPathByLang + "loginAgency";
           }else{
               window.location.href = amadeusPathByLang + "loginUser";
           }*/
        window.location.href = clientMainDomain  ;

      }
  )
}

function getCountPassengers(obj, type) {

  let count_passengers = $(obj).siblings('.number-count-js').attr('data-number')
  let type_passengers = $(obj).siblings('.number-count-js').attr('data-type')
  let type_search = $(obj).siblings('.number-count-js').attr('data-search')
  if (count_passengers <= 9) {
    let new_passenger = count_passengers
    if (type === 'add' && count_passengers < 9) {
      new_passenger = ++count_passengers
    } else if (type !== 'add' && count_passengers > 1 && type_passengers === 'adult') {
      new_passenger = --count_passengers
    } else if ( type !== 'add' && count_passengers >= 1 && type_passengers !== 'adult') {
      new_passenger = --count_passengers
    }

    $(obj).siblings('.number-count-js').html(count_passengers)
    $(obj).siblings('.number-count-js').attr('data-number', count_passengers)
    $('.' + type_passengers).val(new_passenger)

  }

  if($(obj).data('visa') !== undefined && $(obj).data('visa') === 'yes'){
    let passenger_adult = Number($(obj).parents('.box-of-count-passenger-js').find('.adult-number-js .number-count-js').attr('data-number'))
    $(obj).parents('.box-of-count-passenger-js').find('.text-count-passenger-js').text(`${passenger_adult}  ${useXmltag("Passenger")}`)

  }
  else if($(obj).data('train') !== undefined && $(obj).data('train') === 'yes') {
    let passenger_adult = Number($(obj).parents('.box-of-count-passenger-js').find('.adult-number-js .number-count-js').attr('data-number'))
    let passenger_child = Number($(obj).parents('.box-of-count-passenger-js').find('.child-number-js .number-count-js').attr('data-number'))


    $('.' + type_search+'-adult-js').val(passenger_adult);
    $('.' + type_search+'-child-js').val(passenger_child);

    let total_passenger = passenger_adult + passenger_child

    $(obj).parents('.box-of-count-passenger-js').find('.text-count-passenger-js').text(`${total_passenger}  ${useXmltag("Passenger")}`)
  }else if($(obj).data('parvaz') !== undefined && $(obj).data('parvaz') === 'yes') {
    let passenger_adult = Number($(obj).parents('.box-of-count-passenger-js').find('.adult-number-js .number-count-js').attr('data-number'))
    let passenger_child = Number($(obj).parents('.box-of-count-passenger-js').find('.child-number-js .number-count-js').attr('data-number'))
    let passenger_infant = Number($(obj).parents('.box-of-count-passenger-js').find('.infant-number-js .number-count-js').attr('data-number'))

    $('.' + type_search+'-adult-js').val(passenger_adult);
    $('.' + type_search+'-child-js').val(passenger_child);
    $('.' + type_search+'-infant-js').val(passenger_infant);

    let total_passenger = passenger_adult + passenger_child + passenger_infant

    $(obj).parents('.box-of-count-passenger-js').find('.text-count-passenger-js').text(`${total_passenger}  ${useXmltag("Passenger")}`)
  }
  else{
    let passenger_adult = Number($(obj).parents('.box-of-count-passenger-js').find('.adult-number-js .number-count-js').attr('data-number'))
    let passenger_child = Number($(obj).parents('.box-of-count-passenger-js').find('.child-number-js .number-count-js').attr('data-number'))
    let passenger_infant = Number($(obj).parents('.box-of-count-passenger-js').find('.infant-number-js .number-count-js').attr('data-number'))

    $('.' + type_search+'-adult-js').val(passenger_adult);
    $('.' + type_search+'-child-js').val(passenger_child);
    $('.' + type_search+'-infant-js').val(passenger_infant);


    $(obj).parents('.box-of-count-passenger-js').find('.text-count-passenger-js').text(`${passenger_adult}   ${useXmltag("Adult")} ,  ${passenger_child}  ${useXmltag("Child")} ,  ${passenger_infant} ${useXmltag("Infant")}`)

  }

}

function loadXMLDoc(filename) {

  xhttp=new XMLHttpRequest();
  xhttp.open("GET",filename,false);
  xhttp.send();
  return xhttp.responseXML;
}

function useXmltag(tagname) {

  // let get_translate = localStorage.getItem('translate_'+lang) ;

  result=xmlDoc.getElementsByTagName(tagname)[0];

  return result!=undefined ? result.childNodes[0].nodeValue : " ";

}

function translateXmlByParams(tagname, params) {
  let val = useXmltag(tagname);
  let entries = Object.entries(params);
  entries.forEach((para) => {
    let find = '@@' + para[0] + '@@';
    let regExp = new RegExp(find, 'g');
    val = val.replace(regExp, para[1])
  });
  return val;
}

xmlDoc=loadXMLDoc(rootMainPath+"/gds/langs/"+lang+"_frontMaster.xml");

function dateNow(mode) {
  let dateNow = new Date().toLocaleDateString('fa-IR').replace(/([۰-۹])/g, token => String.fromCharCode(token.charCodeAt(0) - 1728));
  let dateNowSplit = [];
  let year = '';
  let month = '';
  let day = '';

  dateNowSplit = dateNow.split('/');

  year = dateNowSplit[0];
  month = (parseInt(dateNowSplit[1]) <= 9) ? '0' + dateNowSplit[1] : dateNowSplit[1];
  day = (parseInt(dateNowSplit[2]) <= 9) ? '0' + dateNowSplit[2] : dateNowSplit[2];
  return year + mode + month + mode + day

}

function checkSearchFields(...data) {
  let items_name = []

  data.forEach(item => {

    item.map(function(idx, elem){
      const each_item=$(elem)
      const item_value = each_item.val()

      if ((!item_value || item_value === "") && each_item.is(":not(:disabled)")) {
        let item_name = each_item.attr("placeholder")
        if (!item_name) {
          item_name = each_item.data("placeholder")
        }
        if (!item_name) {
          item_name = each_item.parent().find('label').text()
        }
        if (item_name) {
          items_name.push(item_name)
        }
      }
    })
  })
  if (items_name.length) {
    let html_tags = ""
    items_name.forEach(item => {
      html_tags +=
          '<spam style="font-size:14px;" class="badge badge-danger-2">' +
          item +
          "</spam>"
    })
    $.alert({
      title: useXmltag("Pleaseenterrequiredfields"),
      icon: "fa fa-cart-plus",
      content: html_tags,
      rtl: true,
      type: "red",
    })
    throw 'fix your entries.'
  }
}




function checkSearchFieldsWithRedBorder(...data) {
  let items_name = []
  data.forEach(item => {
    item.map(function(idx, elem){
      const each_item=$(elem)
      const item_value = each_item.val()
      if ((!item_value || item_value === "") && each_item.is(":not(:disabled)")) {
        items_name.push(each_item.attr("data-border-red"))
      }
    })
  })
  if (items_name.length) {
    items_name.forEach(item => {
      $(item).addClass("border-red")
    })
    $.alert({
      title: useXmltag("Pleaseenterrequiredfields"),
      icon: "fa fa-cart-plus",
      content: html_tags,
      rtl: true,
      type: "red",
    })
    throw 'fix your entries.'
  }else {
    items_name.forEach(item => {
      $(item).removeClass("border-red")
    })
  }
}




function openLink(url, is_new_tab=false) {
  if (is_new_tab) window.open(url, "_blank")
  else window.location.href = url
}

function templateFake(content_modal_fake,header) {

  let modal_fake = `
           ${header}
            <div class="modal-body flight-prices">
              <div id="loadbox">
            </div>
              <div class="row">
                ${content_modal_fake}
              </div>
            </div>
          <div class="modal-footer"><button type="button" aria-hidden="true" class="btn btn-primary site-bg-main-color site-bg-color-dock-border" data-dismiss="modal" aria-label="Close">بستن</button></div>
        
`
  return modal_fake
}

function item_template(data_calender) {
  let content_modal_main = '' ;
  console.log(!Object.is(data_calender[0].origin_name, null))
  let route_name = (data_calender[0].origin_name !== undefined && Object.is(data_calender[0].origin_name, null) ===  false) ? `${useXmltag("FlightsFromOrigin")}   ${data_calender[0].origin_name} ${useXmltag("On")} ${data_calender[0].destination_name} ` : ''
  let header = `
               <div class="modal-header">
                  <h5 class="_100 text-right modal-title" id="exampleModalScrollableTitle">${route_name} </h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                  </button>
               </div>
       `;
  data_calender.forEach(function(value, index) {
    console.table(value)
    let div_price = (value.price_final != "") ? ` <span class=" flitght-price-price-info"> ${useXmltag("Startprice")} </span><div class="flitght-price-date flitght-price-price-info">${value.price_final}</div> ` :
        `<div class="flitght-price-date flitght-price-price-info">جستجو کنید</div>`;
    content_modal_main += `
           <div class="flight-modal-items">
              <a href="${value.link}" class="flight-price-item flight-price-item-tag-a">
                <div class="flitght-price-price">
                    <span class=" ">${value.date_for_show}</span>
                    ${div_price}
                </div>
               </a>
           </div>
         `;
  })
  return {content_modal_main,header}
}

















// function item_template(data_calender) {
//   let content_modal_main = '' ;
//   console.log(!Object.is(data_calender[0].origin_name, null))
//   let route_name = (data_calender[0].origin_name !== undefined && Object.is(data_calender[0].origin_name, null) ===  false) ? `${useXmltag("FlightsFromOrigin")}   ${data_calender[0].origin_name} ${useXmltag("On")} ${data_calender[0].destination_name} ` : ''
//   let header = `
//                <div class="modal-header">
//                   <h5 class="_100 text-right modal-title" id="exampleModalScrollableTitle">${route_name} </h5>
//                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
//                       <span aria-hidden="true">×</span>
//                   </button>
//                </div>
//        `;
//   data_calender.forEach(function(value, index) {
//     console.table(value)
//     let div_price = (value.price_final != "") ? ` <span class=" flitght-price-price-info"> ${useXmltag("Startprice")} </span><div class="flitght-price-date flitght-price-price-info">${value.price_final}</div> ` :
//       `<span class="void-space flitght-price-price-info"></span><div class="flitght-price-date flitght-price-price-info">${useXmltag("CompletionCapacity")}</div>`;
//     content_modal_main += `
//            <div class="flight-modal-items">
//               <a href="${value.url}" class="flight-price-item flight-price-item-tag-a">
//                 <div class="flitght-price-price">
//                     <span class=" ">${value.date_for_show}</span>
//                     ${div_price}
//                 </div>
//                </a>
//            </div>
//          `;
//   })
//   return {content_modal_main,header}
// }

function calenderFlightSearch(origin,destination) {

  $('.modal-calender-js').hide();
  $('.modal-calender-js').show();

  let content_modal_fake='' ;
  let header = `
  <div class="modal-header">
    <h5 class="_100 text-right modal-title void-space mr-0 ph-item modal-title-header-js" id="exampleModalScrollableTitle">
     </h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">×</span>
    </button>
    </div>`;
  for (let i = 0; i <= 14; i++) {
    content_modal_fake += `
              <div class="flight-modal-items">
                <a href="javascript:" class="flight-price-item flight-price-item-tag-a ph-item">
                  <div class="flitght-price-price">
                    <span class="pt-0 pb-2">
                      <div class="void-space col-6 ph-item"></div>
                    </span>
                    <span class="void-space flitght-price-price-info flitght-price-price-info-none"></span>
                    <div class="flitght-price-date void-space flitght-price-price-info"></div>
                  </div>
                </a>
              </div>
`;
  }
  let modal_fake = templateFake(content_modal_fake,header)

  $('.modal-content-js').html(modal_fake);

  let data_calender ;
  $.ajax({
    type: "POST",
    url: amadeusPathByLang + "ajax",
    dataType: "json",
    data: JSON.stringify({
      className: "newApiFlight",
      method: "getOfflinePriceFlight",
      origin,
      destination ,
      origin_name:true,
      is_json: true,
      limit: 15,
    }),
    success: function (response) {
      $('.modal-content-js').html(' ');

      data_calender = response.data
      data_calender = Object.values(data_calender)
      data_calender = data_calender.slice(0, 15);
      let modal_fake_item = item_template(data_calender)
      let modal_fake = templateFake(modal_fake_item.content_modal_main,modal_fake_item.header);
      $('.modal-content-js').html(modal_fake);
    },
    error: function (error) {
      console.log(error.responseJSON.data)

      data_calender = error.responseJSON.data ;
      let modal_fake_item = item_template(data_calender)
      let modal_fake = templateFake(modal_fake_item.content_modal_main,modal_fake_item.header);
      $('.modal-content-js').html(modal_fake);
    },
  })
}

function submitNewsLetter_old() {

  let full_name = $('.full-name-js').val();
  let email = $('.email-js').val();
  let mobile = $('.mobile-js').val();
  let has_capcha = $('.has-capcha').val();
  let capcha = $('.capcha-js').val();

  if (has_capcha=='1') {
    $.post(amadeusPath + 'captcha/securimage_check.php',
        {
          captchaAjax: $('#item-captcha').val()
        },
        function(data) {
          // console.log(data)
          if (data == true) {
            if (full_name === "" && (email === "" || mobile === "")) {

              $.alert({
                title: 'ثبت اطلاعات خبر نامه',
                icon: "fa fa-cart-plus",
                content: 'پر کردن همه فیلدها الزامی است',
                rtl: true,
                type: "red",
              })
              return false;
            }
            if (!validateEmail(email)) {

              $.alert({
                title: 'ثبت اطلاعات خبر نامه',
                icon: "fa fa-cart-plus",
                content: 'فرمت ایمیل نادرست است ',
                rtl: true,
                type: "red",
              })
              return false;
            }
            if (!validateMobile(mobile)) {

              $.alert({
                title: 'ثبت اطلاعات خبر نامه',
                icon: "fa fa-cart-plus",
                content: 'شماره موبایل معتبر نمی باشد',
                rtl: true,
                type: "red",
              })
              return false;
            }
            let data_send = {
              'full_name': full_name,
              'email': email,
              'mobile': mobile
            }
            $('.news-letter-js').prop("disabled", true);
            $.ajax({
              type: "POST",
              url: amadeusPath + "ajax",
              dataType: "json",
              data: JSON.stringify({
                method: "registerGuestUser",
                className: "members",
                full_name: data_send.full_name,
                email: data_send.email,
                mobile: data_send.mobile
              }),
              success: function(response) {
                $('.Newsletters-btn').prop("disabled", false);
                if (response) {
                  $.alert({
                    title: 'ثبت اطلاعات خبر نامه',
                    icon: "fa fa-cart-plus",
                    content: 'اطلاعات شما با موفقیت ثبت شد.',
                    rtl: true,
                    type: "green",
                  })
                  $('.full-name-js').val("");
                  $('.email-js').val("");
                  $('.mobile-js').val("");
                } else {
                  $.alert({
                    title: 'ثبت اطلاعات خبر نامه',
                    icon: "fa fa-cart-plus",
                    content: 'خطا، در ثبت اطلاعات شما خطایی رخ داد',
                    rtl: true,
                    type: "red",
                  })
                }
              }
            });
          } else {
            reloadCaptcha();
            $.alert({
              title: 'ثبت اطلاعات خبر نامه',
              icon: 'fa fa-warning',
              content: useXmltag("WrongSecurityCode"),
              rtl: true,
              type: 'red'
            });
            return false;
          }
        });
  }else {



    if ( full_name === "" && (email === "" || mobile === "" )) {

      $.alert({
        title: 'ثبت اطلاعات خبر نامه',
        icon: "fa fa-cart-plus",
        content: 'پر کردن همه فیلدها الزامی است',
        rtl: true,
        type: "red",
      })
      return false;
    }

    if (!validateEmail(email)) {

      $.alert({
        title: 'ثبت اطلاعات خبر نامه',
        icon: "fa fa-cart-plus",
        content: 'فرمت ایمیل نادرست است ',
        rtl: true,
        type: "red",
      })
      return false;
    }
    if (!validateMobile(mobile)) {

      $.alert({
        title: 'ثبت اطلاعات خبر نامه',
        icon: "fa fa-cart-plus",
        content: 'شماره موبایل معتبر نمی باشد',
        rtl: true,
        type: "red",
      })
      return false;
    }
    let data_send ={
      'full_name': full_name,
      'email' : email,
      'mobile': mobile
    }
    $('.news-letter-js').prop("disabled", true);
    $.ajax({
      type: "POST",
      url: amadeusPath + "ajax",
      dataType: "json",
      data: JSON.stringify({
        method: "registerGuestUser",
        className: "members",
        full_name: data_send.full_name,
        email: data_send.email,
        mobile:data_send.mobile
      }),
      success: function(response) {
        $('.Newsletters-btn').prop("disabled", false);
        if (response) {
          $.alert({
            title: 'ثبت اطلاعات خبر نامه',
            icon: "fa fa-cart-plus",
            content: 'اطلاعات شما با موفقیت ثبت شد.',
            rtl: true,
            type: "green",
          })
          $('.full-name-js').val("");
          $('.email-js').val("");
          $('.mobile-js').val("");
        } else {
          $.alert({
            title: 'ثبت اطلاعات خبر نامه',
            icon: "fa fa-cart-plus",
            content: 'خطا، در ثبت اطلاعات شما خطایی رخ داد',
            rtl: true,
            type: "red",
          })
        }
      }
    });



  }


}

function submitNewsLetter() {

  let full_name = $('.full-name-js').val();
  let email = $('.email-js').val();
  let mobile = $('.mobile-js').val();
  let has_capcha = $('.has-capcha').val();
  let capcha = $('.capcha-js').val();

  if (has_capcha=='1') {
    $.post(amadeusPath + 'captcha/securimage_check.php',
        {
          captchaAjax: $('#item-captcha').val()
        },
        function(data) {
          // console.log(data)
          if (data == true) {
            if (full_name === "" && (email === "" || mobile === "")) {

              $.alert({
                title: 'ثبت اطلاعات خبر نامه',
                icon: "fa fa-cart-plus",
                content: 'پر کردن همه فیلدها الزامی است',
                rtl: true,
                type: "red",
              })
              return false;
            }
            if (!validateEmail(email)) {

              $.alert({
                title: 'ثبت اطلاعات خبر نامه',
                icon: "fa fa-cart-plus",
                content: 'فرمت ایمیل نادرست است ',
                rtl: true,
                type: "red",
              })
              return false;
            }
            if (!validateMobile(mobile)) {

              $.alert({
                title: 'ثبت اطلاعات خبر نامه',
                icon: "fa fa-cart-plus",
                content: 'شماره موبایل معتبر نمی باشد',
                rtl: true,
                type: "red",
              })
              return false;
            }
            let data_send = {
              'full_name': full_name,
              'email': email,
              'mobile': mobile
            }
            $('.news-letter-js').prop("disabled", true);
            $.ajax({
              type: "POST",
              url: amadeusPath + "ajax",
              dataType: "json",
              data: JSON.stringify({
                method: "registerUserNewsLetter",
                className: "newsLetter",
                full_name: data_send.full_name,
                email: data_send.email,
                mobile: data_send.mobile
              }),
              success: function(response) {
                $('.Newsletters-btn').prop("disabled", false);
                if (response) {
                  $.alert({
                    title: 'ثبت اطلاعات خبر نامه',
                    icon: "fa fa-cart-plus",
                    content: 'اطلاعات شما با موفقیت ثبت شد.',
                    rtl: true,
                    type: "green",
                  })
                  $('.full-name-js').val("");
                  $('.email-js').val("");
                  $('.mobile-js').val("");
                } else {
                  $.alert({
                    title: 'ثبت اطلاعات خبر نامه',
                    icon: "fa fa-cart-plus",
                    content: 'خطا، در ثبت اطلاعات شما خطایی رخ داد',
                    rtl: true,
                    type: "red",
                  })
                }
              }
            });
          } else {
            reloadCaptcha();
            $.alert({
              title: 'ثبت اطلاعات خبر نامه',
              icon: 'fa fa-warning',
              content: useXmltag("WrongSecurityCode"),
              rtl: true,
              type: 'red'
            });
            return false;
          }
        });
  }else {



    if ( full_name === "" && (email === "" || mobile === "" )) {

      $.alert({
        title: 'ثبت اطلاعات خبر نامه',
        icon: "fa fa-cart-plus",
        content: 'پر کردن همه فیلدها الزامی است',
        rtl: true,
        type: "red",
      })
      return false;
    }

    if (!validateEmail(email)) {

      $.alert({
        title: 'ثبت اطلاعات خبر نامه',
        icon: "fa fa-cart-plus",
        content: 'فرمت ایمیل نادرست است ',
        rtl: true,
        type: "red",
      })
      return false;
    }
    if (!validateMobile(mobile)) {

      $.alert({
        title: 'ثبت اطلاعات خبر نامه',
        icon: "fa fa-cart-plus",
        content: 'شماره موبایل معتبر نمی باشد',
        rtl: true,
        type: "red",
      })
      return false;
    }
    let data_send ={
      'full_name': full_name,
      'email' : email,
      'mobile': mobile
    }
    $('.news-letter-js').prop("disabled", true);
    $.ajax({
      type: "POST",
      url: amadeusPath + "ajax",
      dataType: "json",
      data: JSON.stringify({
        method: "registerUserNewsLetter",
        className: "newsLetter",
        full_name: data_send.full_name,
        email: data_send.email,
        mobile:data_send.mobile
      }),
      success: function(response) {
        $('.Newsletters-btn').prop("disabled", false);
        if (response) {
          $.alert({
            title: 'ثبت اطلاعات خبر نامه',
            icon: "fa fa-cart-plus",
            content: 'اطلاعات شما با موفقیت ثبت شد.',
            rtl: true,
            type: "green",
          })
          $('.full-name-js').val("");
          $('.email-js').val("");
          $('.mobile-js').val("");
        } else {
          $.alert({
            title: 'ثبت اطلاعات خبر نامه',
            icon: "fa fa-cart-plus",
            content: 'خطا، در ثبت اطلاعات شما خطایی رخ داد',
            rtl: true,
            type: "red",
          })
        }
      }
    });



  }


}

function validateMobile(mob) {
  var mobReg = /(0|\+98)?([ ]|-|[()]){0,2}9[0|1|2|3|4|9]([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){8}/;
  var error = 0;
  if (mob == "") {
    return false;
  } else if (!mobReg.test(mob)) {
    return false;
  } else {
    return true;
  }
}

function validateEmail(email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  var error = 0;
  if (email == "") {
    return false;
  } else if (!emailReg.test(email)) {
    return false;
  } else {
    return true;
  }
}
function shamsiConvertButton() {
  $.ajax({
    type: "POST",
    url: amadeusPath + "ajax",
    dataType: "json",
    data: JSON.stringify({
      method: "convertDateShamsi",
      className: "convertDate",
      is_json: true,
    }),
  })
}
function convertJalaliToMiladi() {
  let txtShamsiCalendar = $('#txtShamsiCalendar').val();

  if (txtShamsiCalendar) {

    $.post(amadeusPath + 'user_ajax.php',
        {
          date_jalali: txtShamsiCalendar,
          flag: 'convertDateJalali'
        },
        function (data) {
          $('#showJalaliResult').html(data);
        });
  }
}
function convertMiladiToJalali() {
  var txtMiladiCalendar = $('#txtMiladiCalendar').val();
  if (txtMiladiCalendar) {
    $.post(amadeusPath + 'user_ajax.php',
        {
          date_miladi: txtMiladiCalendar,
          flag: 'convertDateMiladi'
        },
        function (data) {
          $('#showMiladiResult').html(data);
        });
  }
}


if (window.innerWidth <= 576) {
  const openSheetButton = document.querySelectorAll('.sheet-js');
  const closeSheetButton = document.getElementById('closeSheet');
  const bottomSheet = document.getElementById('bottomSheet');
  const overlay = document.getElementById('overlay');
  const handle = document.querySelector('.handle');

// Open bottom sheet
  openSheetButton.forEach(tab => {
    tab.addEventListener('click', () => {
      // Reset transform before adding open class
      bottomSheet.style.transform = 'translateX(100%)';
      // Use setTimeout to ensure the initial transform is applied before transition
      setTimeout(() => {
        bottomSheet.style.transform = 'translateX(0)';
        bottomSheet.classList.add('open');
        overlay.classList.add('active');
        document.body.classList.add('no-scroll');
      }, 10);
    });
  });

// Close bottom sheet with X button
  closeSheetButton.addEventListener('click', closeBottomSheet);

// Close bottom sheet with overlay
  overlay.addEventListener('click', closeBottomSheet);

  function closeBottomSheet() {
    bottomSheet.classList.remove('open');
    overlay.classList.remove('active');
    document.body.classList.remove('no-scroll');
    bottomSheet.style.transform = 'translateX(100%)';
    currentTranslateY = 0; // Reset the translation tracking
  }

// Drag functionality
  let isDragging = false;
  let startY, startTranslateY;
  let currentTranslateY = 0;

  handle.addEventListener('mousedown', (e) => {
    isDragging = true;
    startY = e.clientY;
    startTranslateY = getTranslateY(bottomSheet);
    document.addEventListener('mousemove', onMouseMove);
    document.addEventListener('mouseup', onMouseUp);
  });

  handle.addEventListener('touchstart', (e) => {
    isDragging = true;
    startY = e.touches[0].clientY;
    startTranslateY = getTranslateY(bottomSheet);
    document.addEventListener('touchmove', onTouchMove);
    document.addEventListener('touchend', onTouchEnd);
  });

  function onMouseMove(e) {
    if (!isDragging) return;
    const deltaY = e.clientY - startY;
    const newTranslateY = startTranslateY + deltaY;
    if (newTranslateY >= 0) {
      currentTranslateY = newTranslateY;
      bottomSheet.style.transform = `translateY(${newTranslateY}px)`;
    }
  }

  function onMouseUp() {
    if (!isDragging) return;
    isDragging = false;
    document.removeEventListener('mousemove', onMouseMove);
    document.removeEventListener('mouseup', onMouseUp);
    snapBottomSheet();
  }

  function onTouchMove(e) {
    if (!isDragging) return;
    const deltaY = e.touches[0].clientY - startY;
    const newTranslateY = startTranslateY + deltaY;
    if (newTranslateY >= 0) {
      currentTranslateY = newTranslateY;
      bottomSheet.style.transform = `translateY(${newTranslateY}px)`;
    }
  }

  function onTouchEnd() {
    if (!isDragging) return;
    isDragging = false;
    document.removeEventListener('touchmove', onTouchMove);
    document.removeEventListener('touchend', onTouchEnd);
    snapBottomSheet();
  }

// Modified snap function to only allow fully open or closed states
  function snapBottomSheet() {
    const sheetHeight = bottomSheet.offsetHeight;
    const dragThreshold = sheetHeight * 0.3; // 30% of sheet height as threshold

    if (currentTranslateY > dragThreshold) {
      // If dragged more than threshold, close the sheet
      closeBottomSheet();
    } else {
      // If dragged less than threshold, snap back to fully open
      bottomSheet.style.transform = 'translateY(0)';
      currentTranslateY = 0; // Reset the translation tracking
    }
  }

  function getTranslateY(element) {
    const style = window.getComputedStyle(element);
    const transform = style.transform;
    if (transform === 'none') return 0;
    const matrix = transform.match(/matrix.*\((.+)\)/)[1].split(', ');
    return parseFloat(matrix[5] || matrix[13]);
  }
}









// ========== متغیرهای عمومی ==========
let instagramImageData = null;
let instagramScale = 1;
let instagramTranslateX = 0;
let instagramTranslateY = 0;
let instagramIsDragging = false;
let instagramStartX = 0;
let instagramStartY = 0;
let instagramImageWidth = 0;
let instagramImageHeight = 0;
let instagramRotation = 0;
let logoExpiryTimer = null;

if(window.innerWidth <= 576){
  var element = document.getElementById('show-message-setting');
  element.style.setProperty('display', 'none', 'important');
}


// ========== توابع کمکی ==========
function getSiteKey() {
  var path = window.location.pathname.split('/')[1] || 'root';
  return 'siteTheme_' + path;
}

// ========== توابع یکپارچه لوگو ==========
function saveLogoUnified(logoUrl, expiryMinutes = 15) {
  const currentTime = new Date().getTime();
  const expiryTime = currentTime + (expiryMinutes * 60 * 1000);

  // ذخیره در customLogo با زمان انقضا
  const logoData = {
    image: logoUrl,
    expiresAt: expiryTime
  };
  localStorage.setItem('customLogo', JSON.stringify(logoData));

  // همچنین در theme اصلی ذخیره کن
  const siteKey = getSiteKey();
  let theme = localStorage.getItem(siteKey);
  let themeObj = {};

  if (theme) {
    try {
      themeObj = JSON.parse(theme);
    } catch(e) {
      themeObj = {};
    }
  }

  themeObj.logo = logoUrl;
  themeObj.logoExpiresAt = expiryTime;
  localStorage.setItem(siteKey, JSON.stringify(themeObj));

  console.log('لوگو در هر دو مکان ذخیره شد');
}

function getLogoUnified() {
  const siteKey = getSiteKey();
  const siteTheme = localStorage.getItem(siteKey);

  // ابتدا از theme اصلی چک کن
  if (siteTheme) {
    try {
      const themeObj = JSON.parse(siteTheme);
      if (themeObj.logo && themeObj.logoExpiresAt) {
        const currentTime = new Date().getTime();
        if (themeObj.logoExpiresAt > currentTime) {
          return { logo: themeObj.logo, expiresAt: themeObj.logoExpiresAt };
        } else {
          delete themeObj.logo;
          delete themeObj.logoExpiresAt;
          localStorage.setItem(siteKey, JSON.stringify(themeObj));
        }
      }
    } catch(e) {}
  }

  // اگر در theme نبود، از customLogo چک کن
  const saved = localStorage.getItem('customLogo');
  if (saved) {
    try {
      const logoData = JSON.parse(saved);
      const currentTime = new Date().getTime();
      if (logoData.expiresAt && logoData.expiresAt > currentTime) {
        saveLogoUnified(logoData.image);
        return logoData;
      } else {
        localStorage.removeItem('customLogo');
      }
    } catch(e) {
      localStorage.removeItem('customLogo');
    }
  }

  return null;
}

function removeLogoUnified() {
  localStorage.removeItem('customLogo');

  const siteKey = getSiteKey();
  const siteTheme = localStorage.getItem(siteKey);

  if (siteTheme) {
    try {
      const themeObj = JSON.parse(siteTheme);
      delete themeObj.logo;
      delete themeObj.logoExpiresAt;
      localStorage.setItem(siteKey, JSON.stringify(themeObj));
    } catch(e) {}
  }

  if (logoExpiryTimer) {
    clearTimeout(logoExpiryTimer);
    logoExpiryTimer = null;
  }

  // console.log('لوگو از همه مکان‌ها حذف شد');
}

function startLogoExpiryTimer(expiryTime) {
  if (logoExpiryTimer) {
    clearTimeout(logoExpiryTimer);
  }

  const currentTime = new Date().getTime();
  const timeRemaining = expiryTime - currentTime;

  if (timeRemaining > 0) {
    logoExpiryTimer = setTimeout(function() {
      removeLogoAutomatically();
    }, timeRemaining);
  } else {
    removeLogoAutomatically();
  }
}

function removeLogoAutomatically() {
  removeLogoUnified();

  const defaultLogo = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
  const logoDisplay = document.getElementById('instagramLogoDisplay');
  if (logoDisplay) {
    logoDisplay.src = defaultLogo;
    logoDisplay.style.objectFit = 'cover';
    logoDisplay.style.borderRadius = '50%';
  }

  applyInstagramLogoToSite(defaultLogo);

  // مخفی کردن دکمه حذف
  const removeBtn = document.querySelector('.instagram-remove-logo');
  if (removeBtn) {
    removeBtn.style.display = 'none';
  }

  showInstagramToast('⏰ زمان ۱۵ دقیقه به پایان رسید. لوگو پاک شد!');
}

// ========== توابع ویرایشگر اینستاگرامی ==========
function triggerInstagramUpload() {
  document.getElementById('instagramLogoInput').click();
}

function showInstagramEditor(imageSrc) {
  const editor = document.getElementById('instagramEditor');
  const draggableImage = document.getElementById('instagramDraggableImage');
  const slider = document.getElementById('instagramZoomSlider');

  draggableImage.src = imageSrc;
  editor.style.display = 'flex';
  document.body.classList.add('instagram-editor-open');

  draggableImage.onload = function() {
    instagramImageWidth = draggableImage.naturalWidth;
    instagramImageHeight = draggableImage.naturalHeight;
    resetInstagramImage();
    enableInstagramDragging();
  };

  slider.oninput = function(e) {
    instagramScale = parseFloat(e.target.value);
    applyInstagramTransform();
  };
}

function enableInstagramDragging() {
  const cropCircle = document.getElementById('instagramCropCircle');

  cropCircle.removeEventListener('mousedown', startInstagramDrag);
  window.removeEventListener('mousemove', onInstagramDrag);
  window.removeEventListener('mouseup', stopInstagramDrag);

  cropCircle.addEventListener('mousedown', startInstagramDrag);
  window.addEventListener('mousemove', onInstagramDrag);
  window.addEventListener('mouseup', stopInstagramDrag);
}

function startInstagramDrag(e) {
  instagramIsDragging = true;
  instagramStartX = e.clientX - instagramTranslateX;
  instagramStartY = e.clientY - instagramTranslateY;
  e.preventDefault();
}

function onInstagramDrag(e) {
  if (!instagramIsDragging) return;
  instagramTranslateX = e.clientX - instagramStartX;
  instagramTranslateY = e.clientY - instagramStartY;
  applyInstagramTransform();
}

function stopInstagramDrag() {
  instagramIsDragging = false;
}

function applyInstagramTransform() {
  const image = document.getElementById('instagramDraggableImage');
  const cropCircle = document.getElementById('instagramCropCircle');

  const circleRect = cropCircle.getBoundingClientRect();
  const imageDisplayWidth = instagramImageWidth * instagramScale;
  const imageDisplayHeight = instagramImageHeight * instagramScale;

  const maxX = Math.max(0, (imageDisplayWidth - circleRect.width) / 2);
  const maxY = Math.max(0, (imageDisplayHeight - circleRect.height) / 2);

  instagramTranslateX = Math.min(maxX, Math.max(-maxX, instagramTranslateX));
  instagramTranslateY = Math.min(maxY, Math.max(-maxY, instagramTranslateY));

  image.style.width = imageDisplayWidth + 'px';
  image.style.height = imageDisplayHeight + 'px';
  image.style.transform = `translate(${instagramTranslateX}px, ${instagramTranslateY}px) rotate(${instagramRotation}deg)`;
}

function zoomInstagramImage(delta) {
  const slider = document.getElementById('instagramZoomSlider');
  let newValue = instagramScale + delta;
  newValue = Math.min(3, Math.max(0.5, newValue));
  slider.value = newValue;
  instagramScale = newValue;
  applyInstagramTransform();
}

function rotateImageLeft() {
  instagramRotation = (instagramRotation - 90) % 360;
  applyInstagramTransform();
}

function resetInstagramImage() {
  const cropCircle = document.getElementById('instagramCropCircle');
  const circleRect = cropCircle.getBoundingClientRect();

  instagramRotation = 0;
  const scaleX = circleRect.width / instagramImageWidth;
  const scaleY = circleRect.height / instagramImageHeight;
  instagramScale = Math.max(scaleX, scaleY);

  const slider = document.getElementById('instagramZoomSlider');
  slider.value = instagramScale;

  const imageDisplayWidth = instagramImageWidth * instagramScale;
  const imageDisplayHeight = instagramImageHeight * instagramScale;

  instagramTranslateX = (circleRect.width - imageDisplayWidth) / 2;
  instagramTranslateY = (circleRect.height - imageDisplayHeight) / 2;

  applyInstagramTransform();
}
function updateRemoveLogoButton() {
  const removeBtn = document.querySelector('.instagram-remove-logo');
  if (!removeBtn) return;

  const logoData = getLogoUnified();
  const defaultLogo = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';

  // بررسی کنید که لوگوی معتبر و غیر پیش‌فرض وجود دارد
  if (logoData && logoData.logo && logoData.logo !== defaultLogo && logoData.logo !== '') {
    removeBtn.style.display = 'flex';
    console.log('دکمه حذف لوگو نمایش داده شد');
  } else {
    removeBtn.style.display = 'none';
    console.log('دکمه حذف لوگو مخفی شد');
  }
}
function loadInstagramSavedLogo() {
  const logoData = getLogoUnified();

  const logoDisplay = document.getElementById('instagramLogoDisplay');
  const removeBtn = document.querySelector('.instagram-remove-logo');

  if (logoData && logoData.logo) {
    if (logoDisplay) {
      logoDisplay.src = logoData.logo;
      logoDisplay.style.objectFit = 'cover';
      logoDisplay.style.borderRadius = '50%';
    }
    applyInstagramLogoToSite(logoData.logo);

    if (logoData.expiresAt) {
      startLogoExpiryTimer(logoData.expiresAt);
    }
  } else {
    // لوگو وجود ندارد، لوگوی پیش‌فرض را نمایش بده
    const defaultLogo = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
    if (logoDisplay) {
      logoDisplay.src = defaultLogo;
    }
  }

  // به‌روزرسانی وضعیت دکمه حذف
  setTimeout(function() {
    updateRemoveLogoButton();
  }, 100);
}

function closeInstagramEditor() {
  document.getElementById('instagramEditor').style.display = 'none';
  document.getElementById('instagramDraggableImage').src = '';
  document.body.classList.remove('instagram-editor-open');
  instagramImageData = null;
  instagramScale = 1;
  instagramTranslateX = 0;
  instagramTranslateY = 0;
  instagramRotation = 0;
}

function removeInstagramLogo() {
  if (confirm('آیا از حذف لوگو اطمینان دارید؟')) {
    removeLogoUnified();

    const defaultLogo = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
    const logoDisplay = document.getElementById('instagramLogoDisplay');
    if (logoDisplay) {
      logoDisplay.src = defaultLogo;
      logoDisplay.style.objectFit = 'cover';
    }
    applyInstagramLogoToSite(defaultLogo);

    // مخفی کردن دکمه حذف
    const removeBtn = document.querySelector('.instagram-remove-logo');
    if (removeBtn) {
      removeBtn.style.display = 'none';
    }

    showInstagramToast('لوگو حذف شد!');
  }
}
function applyInstagramLogoToSite(logoUrl) {
  const logos = document.querySelectorAll('.site-logo, .navbar-brand img, #siteLogo, #footerLogo');
  logos.forEach(el => {
    if (el.tagName === 'IMG') {
      el.src = logoUrl;
      el.style.objectFit = 'cover';
    }
  });

  // همچنین دکمه حذف را نمایش بده اگر لوگو معتبر است
  const removeBtn = document.querySelector('.instagram-remove-logo');
  if (removeBtn && logoUrl && logoUrl !== '' && logoUrl !== 'https://safar360.com/gds/view/demo360/project_files/images/logo.png') {
    removeBtn.style.display = 'flex';
  }
}
function updateLogoDisplay() {
  console.log('بروزرسانی نمایش لوگو...');

  const logoDisplay = document.getElementById('instagramLogoDisplay');
  const removeBtn = document.querySelector('.instagram-remove-logo');

  if (!logoDisplay) {
    console.log('المنت instagramLogoDisplay پیدا نشد');
    return;
  }

  const logoData = getLogoUnified();
  const defaultLogo = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';

  if (logoData && logoData.logo && logoData.logo !== '') {
    // لوگوی معتبر وجود دارد
    logoDisplay.src = logoData.logo;
    logoDisplay.style.objectFit = 'cover';
    logoDisplay.style.borderRadius = '50%';
    applyInstagramLogoToSite(logoData.logo);

    if (removeBtn) {
      removeBtn.style.display = 'flex';
    }

    if (logoData.expiresAt) {
      startLogoExpiryTimer(logoData.expiresAt);
    }
    console.log('لوگو بارگذاری شد و دکمه حذف نمایش داده شد');
  } else {
    // لوگو وجود ندارد، لوگوی پیش‌فرض را نمایش بده
    logoDisplay.src = defaultLogo;
    logoDisplay.style.objectFit = 'cover';
    logoDisplay.style.borderRadius = '50%';
    applyInstagramLogoToSite(defaultLogo);

    if (removeBtn) {
      removeBtn.style.display = 'none';
    }
    console.log('لوگوی پیش‌فرض نمایش داده شد');
  }
}
function loadInstagramSavedLogo() {
  const logoData = getLogoUnified();

  const removeBtn = document.querySelector('.instagram-remove-logo');

  if (logoData && logoData.logo) {
    const logoDisplay = document.getElementById('instagramLogoDisplay');
    if (logoDisplay) {
      logoDisplay.src = logoData.logo;
      logoDisplay.style.objectFit = 'cover';
      logoDisplay.style.borderRadius = '50%';
    }
    applyInstagramLogoToSite(logoData.logo);

    // نمایش دکمه حذف لوگو
    if (removeBtn) {
      removeBtn.style.display = 'flex';
    }

    if (logoData.expiresAt) {
      startLogoExpiryTimer(logoData.expiresAt);
    }
  } else {
    // لوگو وجود ندارد، دکمه حذف را مخفی کن
    if (removeBtn) {
      removeBtn.style.display = 'none';
    }
  }

  updateLogoDisplay();
}
function showInstagramToast(message) {
  const toast = document.createElement('div');
  toast.innerHTML = message;
  toast.style.cssText = `
    position: fixed;
    bottom: 100px;
    left: 50%;
    transform: translateX(-50%);
    background: rgba(0,0,0,0.8);
    color: white;
    padding: 12px 24px;
    border-radius: 25px;
    z-index: 10001;
    font-size: 14px;
    backdrop-filter: blur(10px);
  `;
  document.body.appendChild(toast);
  setTimeout(() => toast.remove(), 2000);
}

// ========== توابع تنظیمات سایت ==========
function setupAutoApply() {
  var mainPicker = document.getElementById('mainColorPicker');
  var secondPicker = document.getElementById('secondColorPicker');
  var mainText = document.getElementById('mainColorText');
  var secondText = document.getElementById('secondColorText');

  if(mainPicker) {
    mainPicker.addEventListener('input', function() {
      var mainColor = this.value;
      var secondColor = secondPicker.value;
      applyColors(mainColor, secondColor);
      if(mainText) mainText.value = mainColor;
    });
  }

  if(secondPicker) {
    secondPicker.addEventListener('input', function() {
      var secondColor = this.value;
      var mainColor = mainPicker.value;
      applyColors(mainColor, secondColor);
      if(secondText) secondText.value = secondColor;
    });
  }

  if(mainText) {
    mainText.addEventListener('input', function() {
      if(/^#[0-9A-F]{6}$/i.test(this.value)) {
        var mainColor = this.value;
        var secondColor = secondPicker.value;
        if(mainPicker) mainPicker.value = mainColor;
        applyColors(mainColor, secondColor);
      }
    });
  }

  if(secondText) {
    secondText.addEventListener('input', function() {
      if(/^#[0-9A-F]{6}$/i.test(this.value)) {
        var secondColor = this.value;
        var mainColor = mainPicker.value;
        if(secondPicker) secondPicker.value = secondColor;
        applyColors(mainColor, secondColor);
      }
    });
  }
}

function setupColorSync() {
  var mainPicker = document.getElementById('mainColorPicker');
  var mainText = document.getElementById('mainColorText');
  var secondPicker = document.getElementById('secondColorPicker');
  var secondText = document.getElementById('secondColorText');

  if(mainPicker && mainText) {
    mainPicker.addEventListener('input', function() {
      mainText.value = this.value;
    });
  }

  if(mainText && mainPicker) {
    mainText.addEventListener('input', function() {
      if(/^#[0-9A-F]{6}$/i.test(this.value)) {
        mainPicker.value = this.value;
      }
    });
  }

  if(secondPicker && secondText) {
    secondPicker.addEventListener('input', function() {
      secondText.value = this.value;
    });
  }

  if(secondText && secondPicker) {
    secondText.addEventListener('input', function() {
      if(/^#[0-9A-F]{6}$/i.test(this.value)) {
        secondPicker.value = this.value;
      }
    });
  }
}

function setupLogoUpload() {
  var logoUpload = document.getElementById('logoUpload');
  if(logoUpload) {
    logoUpload.addEventListener('change', function(e) {
      var file = e.target.files[0];
      if(file) {
        var reader = new FileReader();
        reader.onload = function(event) {
          var imageUrl = event.target.result;
          var logoPreview = document.getElementById('logoPreview');
          if(logoPreview) {
            logoPreview.src = imageUrl;
            logoPreview.style.display = 'block';
          }
          applyLogo(imageUrl);
          showToast('لوگو با موفقیت آپلود شد');
        };
        reader.onerror = function() {
          showToast('خطا در آپلود لوگو');
        };
        reader.readAsDataURL(file);
      }
    });
  }
}

function applyColors(mainColor, secondColor) {
  document.documentElement.style.setProperty('--mainColor', mainColor);
  document.documentElement.style.setProperty('--secondColor', secondColor);

  var headers = document.querySelectorAll('.header');
  for(var i = 0; i < headers.length; i++) {
    headers[i].style.backgroundColor = mainColor;
  }

  var boxes = document.querySelectorAll('.box');
  for(var i = 0; i < boxes.length; i++) {
    boxes[i].style.backgroundColor = mainColor;
  }

  var btns = document.querySelectorAll('.btn');
  for(var i = 0; i < btns.length; i++) {
    btns[i].style.backgroundColor = secondColor;
  }

  var toggleBtn = document.querySelector('.settings-toggle');
  if(toggleBtn) {
    toggleBtn.style.backgroundColor = mainColor;
  }

  var applyBtn = document.querySelector('.apply-btn');
  if(applyBtn) applyBtn.style.backgroundColor = mainColor;

  var saveBtn = document.querySelector('.save-btn');
  if(saveBtn) saveBtn.style.backgroundColor = secondColor;
}

function applyLogo(logoUrl) {
  var logoImg = document.getElementById('siteLogo');
  var footerLogo = document.getElementById('footerLogo');
  var logoPlaceholder = document.getElementById('logoPlaceholder');

  if(!logoImg) return;

  if(logoUrl && logoUrl !== '' && logoUrl !== 'undefined') {
    logoImg.src = logoUrl;
    logoImg.style.display = 'block';
    if(footerLogo) {
      footerLogo.src = logoUrl;
      footerLogo.style.display = 'block';
    }
    if(logoPlaceholder) logoPlaceholder.style.display = 'none';
  } else {
    if(logoPlaceholder) logoPlaceholder.style.display = 'flex';
  }
}
let hasShown = false;

function showOnce() {
  if (!hasShown) {
    hasShown = true;
    simpleSwal('توجه!', 'تغییرات اعمال‌شده در این بخش صرفاً در حد تنظیمات گرافیکی اولیه و جهت مشاهده نمای کلی سایت بر اساس برند شماست و نسخه نهایی ممکن است شامل اصلاحات و بهینه‌سازی‌های تکمیلی باشد.');
  }
}
function saveTheme() {
  var mainColor = document.getElementById('mainColorPicker').value;
  var secondColor = document.getElementById('secondColorPicker').value;
  var logoImg = document.getElementById('siteLogo');
  var logoPreview = document.getElementById('logoPreview');
  var finalLogo = '';

  if(logoImg && logoImg.style.display === 'block' && logoImg.src && logoImg.src !== '') {
    finalLogo = logoImg.src;
  } else if(logoPreview && logoPreview.style.display === 'block' && logoPreview.src && logoPreview.src !== '') {
    finalLogo = logoPreview.src;
  }

  var theme = {
    mainColor: mainColor,
    secondColor: secondColor,
    logo: finalLogo,
    savedTime: Date.now()
  };

  var siteKey = getSiteKey();
  localStorage.setItem(siteKey, JSON.stringify(theme));
  localStorage.setItem('currentSite', siteKey);

  closeOverlay();
  toggleSidebar();
  showToast('تنظیمات ذخیره شد!');

  showOnce()

}

function loadSavedTheme() {
  var siteKey = getSiteKey();
  var saved = localStorage.getItem(siteKey);

  if(saved) {
    try {
      var theme = JSON.parse(saved);
      var now = Date.now();
      var fifteenMinutes = 15 * 60 * 1000;

      if(theme.savedTime && (now - theme.savedTime) > fifteenMinutes) {
        localStorage.removeItem(siteKey);
        setDefaultColors();
        showToast('تنظیمات منقضی شد! دوباره تنظیمات را ذخیره کنید.');
        return;
      }

      if(theme.mainColor) {
        var mainPicker = document.getElementById('mainColorPicker');
        var mainText = document.getElementById('mainColorText');
        if(mainPicker) mainPicker.value = theme.mainColor;
        if(mainText) mainText.value = theme.mainColor;
      }

      if(theme.secondColor) {
        var secondPicker = document.getElementById('secondColorPicker');
        var secondText = document.getElementById('secondColorText');
        if(secondPicker) secondPicker.value = theme.secondColor;
        if(secondText) secondText.value = theme.secondColor;
      }

      if(theme.mainColor && theme.secondColor) {
        applyColors(theme.mainColor, theme.secondColor);
      }

      if(theme.logo && theme.logo !== '' && theme.logo !== 'undefined') {
        applyLogo(theme.logo);
        var logoPreview = document.getElementById('logoPreview');
        if(logoPreview) {
          logoPreview.src = theme.logo;
          logoPreview.style.display = 'block';
        }
      }
    } catch(e) {
      console.error('خطا در بارگذاری:', e);
    }
  } else {
    setDefaultColors();
  }
}

function setDefaultColors() {
  var mainPicker = document.getElementById('mainColorPicker');
  var mainText = document.getElementById('mainColorText');
  var secondPicker = document.getElementById('secondColorPicker');
  var secondText = document.getElementById('secondColorText');

  if(mainPicker) mainPicker.value = '#b71c1c';
  if(mainText) mainText.value = '#b71c1c';
  if(secondPicker) secondPicker.value = '#ee384e';
  if(secondText) secondText.value = '#ee384e';

  var siteLogo = document.getElementById('siteLogo');
  var footerLogo = document.getElementById('footerLogo');
  var logoPlaceholder = document.getElementById('logoPlaceholder');

  if(siteLogo) {
    siteLogo.src = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
    siteLogo.style.display = 'block';
  }
  if(footerLogo) {
    footerLogo.src = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
    footerLogo.style.display = 'block';
  }
  if(logoPlaceholder) {
    logoPlaceholder.style.display = 'none';
  }
}

function resetTheme() {
  // console.log('بازنشانی به حالت اولیه - پاک کردن تمام تغییرات');

  // 1. حذف لوگو از همه جا
  removeLogoUnified();

  // 2. تنظیم رنگ‌ها به پیش‌فرض
  setDefaultColors();

  // 3. پاک کردن فایل آپلود و پیش‌نمایش
  var logoUpload = document.getElementById('logoUpload');
  var logoPreview = document.getElementById('logoPreview');

  if(logoUpload) logoUpload.value = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
  if(logoPreview) {
    logoPreview.style.display = 'none';
    logoPreview.src = 'https://safar360.com/gds/view/demo360/project_files/images/logo.png';
  }

  // 4. حذف تنظیمات از localStorage
  var siteKey = getSiteKey();
  localStorage.removeItem(siteKey);

  // 5. حذف از کوکی
  document.cookie = "mainColor=; path=/; max-age=0";
  document.cookie = "secondColor=; path=/; max-age=0";
  document.cookie = "siteTheme=; path=/; max-age=0";

  // 6. حذف متغیرهای CSS اعمال شده
  document.documentElement.style.setProperty('--mainColor', '#b71c1c');
  document.documentElement.style.setProperty('--secondColor', '#ee384e');

  // 7. حذف استایل‌های مستقیم از المنت‌ها
  var headers = document.querySelectorAll('.header');
  for(var i = 0; i < headers.length; i++) {
    headers[i].style.backgroundColor = '';
    headers[i].style.background = '';
  }

  var boxes = document.querySelectorAll('.box');
  for(var i = 0; i < boxes.length; i++) {
    boxes[i].style.backgroundColor = '';
  }

  var btns = document.querySelectorAll('.btn');
  for(var i = 0; i < btns.length; i++) {
    btns[i].style.backgroundColor = '';
  }

  var toggleBtn = document.querySelector('.settings-toggle');
  if(toggleBtn) {
    toggleBtn.style.backgroundColor = '';
  }

  // 8. مخفی کردن دکمه حذف لوگو
  const removeBtn = document.querySelector('.instagram-remove-logo');
  if (removeBtn) {
    removeBtn.style.display = 'none';
  }

  // 9. نمایش پیام تایید
  showToast('✅ تمام تغییرات پاک شد و سایت به حالت اولیه بازگشت!');
}

// ========== توابع سایدبار و اوریلی ==========
function toggleSidebar() {
  hideShowMessageClear()
  var sidebar = document.getElementById('settingsSidebar');
  if(window.innerWidth <= 768){
    simpleSwal('توجه!', 'جهت اعمال تنظیمات شخصی‌سازی، از نسخه دسکتاپ استفاده نمایید.','با انتخاب لوگو و رنگ سازمانی از این بخش، گرافیک سایت به‌صورت خودکار متناسب با برند شما شخصی‌سازی و نمایش داده می‌شود.', function (){
      closeOverlay();
    });
  }else{
    if(sidebar) sidebar.classList.toggle('open');
    closeOverlay();
  }

}
function simpleSwal(options,message2,onConfirm = null) {
  // پشتیبانی از ورودی ساده یا شی تنظیمات
  let config = {};
  if (typeof options === 'string') {
    config = {
      title: options,
      message: arguments[1] || '',
      message2: arguments[2] || '',
      type: 'info',
      confirmText: 'متوجه شدم',
      showCancel: false,
      cancelText: 'انصراف',
      onConfirm: arguments[3] || null,
      onCancel: null
    };
  } else {
    config = {
      title: options.title || 'اطلاعیه',
      message: options.message || '',
      type: options.type || 'info',
      confirmText: options.confirmText || 'باشه',
      showCancel: options.showCancel || false,
      cancelText: options.cancelText || 'انصراف',
      onConfirm: options.onConfirm || null,
      onCancel: options.onCancel || null,
      showCloseButton: options.showCloseButton || false
    };
  }

  // حذف مودال قبلی
  const existingModal = document.querySelector('.swal-pro-modal');
  if (existingModal) existingModal.remove();

  // استایل‌های اصلی
  if (!document.getElementById('swal-pro-styles')) {
    const style = document.createElement('style');
    style.id = 'swal-pro-styles';
    style.textContent = `
      @keyframes swalFadeIn {
        from { opacity: 0; backdrop-filter: blur(0px); }
        to { opacity: 1; backdrop-filter: blur(4px); }
      }
      
      @keyframes swalFadeOut {
        from { opacity: 1; backdrop-filter: blur(4px); }
        to { opacity: 0; backdrop-filter: blur(0px); }
      }
      
      @keyframes swalScaleIn {
        0% {
          opacity: 0;
          transform: translate(-50%, -50%) scale(0.8);
        }
        100% {
          opacity: 1;
          transform: translate(-50%, -50%) scale(1);
        }
      }
      
      @keyframes swalScaleOut {
        0% {
          opacity: 1;
          transform: translate(-50%, -50%) scale(1);
        }
        100% {
          opacity: 0;
          transform: translate(-50%, -50%) scale(0.8);
        }
      }

      @keyframes swalShake {
        0%, 100% { transform: translateX(0); }
        10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
        20%, 40%, 60%, 80% { transform: translateX(5px); }
      }

      .swal-pro-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.6);
        z-index: 9999;
        animation: swalFadeIn 0.3s ease forwards;
        backdrop-filter: blur(4px);
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .swal-pro-modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        border-radius: 24px;
        padding: 32px 28px;
        width: 90%;
        max-width: 420px;
        z-index: 10000;
        animation: swalScaleIn 0.35s cubic-bezier(0.34, 1.2, 0.64, 1) forwards;
        text-align: center;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
     
      }

      .swal-pro-icon {
        width: 70px;
        height: 70px;
        margin: 0 auto 20px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        animation: swalScaleIn 0.4s cubic-bezier(0.34, 1.2, 0.64, 1) 0.1s both;
      }

      .swal-pro-icon svg {
        width: 40px;
        height: 40px;
      }

      .swal-pro-title {
        font-size: 24px;
        font-weight: 700;
        margin: 0 0 12px 0;
        color: #1e293b;
      }

      .swal-pro-message {
        font-size: 16px;
        line-height: 1.6;
        color: #64748b;
        margin: 0 0 28px 0;
      }

      .swal-pro-buttons {
        display: flex;
        gap: 12px;
        justify-content: center;
      }

      .swal-pro-btn {
        flex: 1;
        padding: 12px 20px;
        border: none;
        border-radius: 12px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        font-family: inherit;
      }

      .swal-pro-confirm {
        background: var(--mainColor);
        color: white;
      }

      .swal-pro-confirm:hover {
        transform: translateY(-2px);
      }

      .swal-pro-confirm:active {
        transform: translateY(0);
      }

      .swal-pro-cancel {
        background: #f1f5f9;
        color: #64748b;
      }

      .swal-pro-cancel:hover {
        background: #e2e8f0;
        transform: translateY(-2px);
      }

      .swal-pro-close {
        position: absolute;
        top: 16px;
        right: 16px;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: #f1f5f9;
        border: none;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s ease;
        color: #94a3b8;
      }

      .swal-pro-close:hover {
        background: #e2e8f0;
        color: #475569;
        transform: rotate(90deg);
      }

      /* آیکون‌های مختلف */
      .swal-pro-icon-success { background: #10b98120; }
      .swal-pro-icon-success svg { stroke: #10b981; }
      .swal-pro-icon-error { background: #ef444420; }
      .swal-pro-icon-error svg { stroke: #ef4444; }
      .swal-pro-icon-warning { background: #f59e0b20; }
      .swal-pro-icon-warning svg { stroke: #f59e0b; }
      .swal-pro-icon-info { background: #3b82f620; }
      .swal-pro-icon-info svg { stroke: #3b82f6; }
      .swal-pro-icon-question { background: #8b5cf620; }
      .swal-pro-icon-question svg { stroke: #8b5cf6; }

      /* ریسپانسیو */
      @media (max-width: 768px) {
        .swal-pro-modal {
          padding: 24px 20px;
          max-width: calc(100% - 40px);
        }
        .swal-pro-title {
          font-size: 20px;
        }
        .swal-pro-message {
          font-size: 14px;
        }
        .swal-pro-buttons {
          flex-direction: column;
        }
        .swal-pro-btn {
          padding: 14px;
        }
        .swal-pro-icon {
          width: 60px;
          height: 60px;
        }
        .swal-pro-icon svg {
          width: 32px;
          height: 32px;
        }
      }
    `;
    document.head.appendChild(style);
  }
  const iconClass = `swal-pro-icon swal-pro-icon-${config.type}`;

  // ساخت مودال
  const overlay = document.createElement('div');
  overlay.className = 'swal-pro-overlay';

  const modal = document.createElement('div');
  modal.className = 'swal-pro-modal';

  let closeButtonHTML = '';
  if (config.showCloseButton) {
    closeButtonHTML = `<button class="swal-pro-close">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M18 6L6 18M6 6L18 18"/>
      </svg>
    </button>`;
  }

  let buttonsHTML = '';
  if (config.showCancel) {
    buttonsHTML = `
      <div class="swal-pro-buttons">
        <button class="swal-pro-btn swal-pro-cancel">${config.cancelText}</button>
        <button class="swal-pro-btn swal-pro-confirm">${config.confirmText}</button>
      </div>
    `;
  } else {
    buttonsHTML = `
      <div class="swal-pro-buttons">
        <button class="swal-pro-btn swal-pro-confirm">${config.confirmText}</button>
      </div>
    `;
  }

  modal.innerHTML = `
    ${closeButtonHTML}
    <p class="swal-pro-message">${config.message2}</p>
    <h3 class="swal-pro-title">${config.title}</h3>
    <p class="swal-pro-message">${config.message}</p>
    ${buttonsHTML}
  `;

  document.body.appendChild(overlay);
  document.body.appendChild(modal);

  // توابع بستن
  const closeModal = (isConfirm = false) => {
    modal.style.animation = 'swalScaleOut 0.25s ease forwards';
    overlay.style.animation = 'swalFadeOut 0.25s ease forwards';

    setTimeout(() => {
      modal.remove();
      overlay.remove();
      if (isConfirm && config.onConfirm && typeof config.onConfirm === 'function') {
        config.onConfirm();
      } else if (!isConfirm && config.onCancel && typeof config.onCancel === 'function') {
        config.onCancel();
      }
    }, 250);
  };

  // رویدادهای دکمه‌ها
  const confirmBtn = modal.querySelector('.swal-pro-confirm');
  const cancelBtn = modal.querySelector('.swal-pro-cancel');
  const closeBtn = modal.querySelector('.swal-pro-close');

  if (confirmBtn) confirmBtn.onclick = () => closeModal(true);
  if (cancelBtn) cancelBtn.onclick = () => closeModal(false);
  if (closeBtn) closeBtn.onclick = () => closeModal(false);
  overlay.onclick = (e) => {
    if (e.target === overlay) closeModal(false);
  };

  // بستن با Escape
  const escHandler = (e) => {
    if (e.key === 'Escape') {
      closeModal(false);
      document.removeEventListener('keydown', escHandler);
    }
  };
  document.addEventListener('keydown', escHandler);

  // افکت لرزش برای خطا (اختیاری)
  if (config.type === 'error') {
    setTimeout(() => {
      modal.style.animation = 'swalShake 0.5s ease';
      setTimeout(() => { modal.style.animation = ''; }, 500);
    }, 100);
  }
}
// استفاده آسان:
// simpleSwal('موفق!', 'عملیات با موفقیت انجام شد', () => console.log('بسته شد'));
// simpleSwal({ title: 'هشدار', message: 'آیا مطمئن هستید؟', type: 'warning', showCancel: true, onConfirm: () => alert('تایید') });
function closeSidebar() {
  var sidebar = document.getElementById('settingsSidebar');
  if(sidebar) sidebar.classList.remove('open');
}

function showToast(message) {
  var toast = document.createElement('div');
  toast.textContent = message;
  toast.style.cssText = `
    position: fixed;
    bottom: 100px;
    left: 20px;
    background-color: #333;
    color: white;
    padding: 12px 24px;
    border-radius: 8px;
    z-index: 1002;
    font-size: 14px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.2);
  `;
  document.body.appendChild(toast);

  setTimeout(function() {
    toast.style.opacity = '0';
    toast.style.transition = 'opacity 0.3s';
    setTimeout(function() {
      if(toast.parentNode) {
        toast.parentNode.removeChild(toast);
      }
    }, 300);
  }, 2000);
}

// ========== توابع مدیریت اوریلی با زمان انقضای ۲۴ ساعت ==========

function checkOverlay() {
  // دریافت داده ذخیره شده
  const overlayData = localStorage.getItem('dontShowOverlayData');
  const now = Date.now();
  const fiveHours = 5 * 60 * 60 * 1000; // 5 ساعت به میلی‌ثانیه
  // const fiveHours = 2 * 60 * 1000; // 5 ساعت به میلی‌ثانیه

  let shouldShowOverlay = true;

  if (overlayData) {
    try {
      const data = JSON.parse(overlayData);
      // بررسی کنید آیا هنوز 5 ساعت نگذشته است
      if (data.dontShow === true && (now - data.timestamp) < fiveHours) {
        shouldShowOverlay = false;
        // console.log('اوریلی نمایش داده نمی‌شود. زمان باقی‌مانده:',
        //     Math.floor((fiveHours - (now - data.timestamp)) / 1000 / 60 / 60), 'ساعت و',
        //     Math.floor(((fiveHours - (now - data.timestamp)) % (1000 * 60 * 60)) / (1000 * 60)), 'دقیقه');
      } else if ((now - data.timestamp) >= fiveHours) {
        // اگر 5 ساعت گذشته بود، داده را پاک کن
        localStorage.removeItem('dontShowOverlayData');
        resetTheme();
        // console.log('5 ساعت گذشته، اوریلی دوباره نمایش داده می‌شود');
      }
    } catch(e) {
      localStorage.removeItem('dontShowOverlayData');
    }
  }
  if (shouldShowOverlay) {
    setTimeout(function() {
      var overlay = document.getElementById('overlayBlack');
      if (overlay) {
        overlay.style.display = 'flex';
        overlay.classList.add('show');
        // document.body.style.overflow = 'hidden';
      }
    }, 500);
  }
}


// تابع برای حذف دستی تنظیمات اوریلی (در صورت نیاز)
function resetOverlaySetting() {
  localStorage.removeItem('dontShowOverlayData');
  // console.log('تنظیمات اوریلی بازنشانی شد');
  showToast('اوریلی در بارگذاری بعدی صفحه نمایش داده می‌شود');
}

function closeOverlay() {
  var overlay = document.getElementById('overlayBlack');
  var dontShowCheckbox = document.getElementById('dontShowAgain');
  var restThemeBtn = document.getElementById('rest-theme-btn');

  if (overlay) {
    overlay.style.display = 'none';
    overlay.classList.remove('show');
    // document.body.style.overflow = 'auto';

    if (restThemeBtn) {
      restThemeBtn.style.display = 'flex';
    }

    if (dontShowCheckbox && dontShowCheckbox.checked) {
      const data = {
        dontShow: true,
        timestamp: Date.now()
      };
      localStorage.setItem('dontShowOverlayData', JSON.stringify(data));
      // console.log('اوریلی برای 5 ساعت غیرفعال شد');
    }
  }
}
// تابع برای دریافت زمان باقی‌مانده اوریلی (اختیاری - برای نمایش به کاربر)
function getOverlayRemainingTime() {
  const overlayData = localStorage.getItem('dontShowOverlayData');
  if (!overlayData) return 0;

  try {
    const data = JSON.parse(overlayData);
    const now = Date.now();
    const oneDay = 24 * 60 * 60 * 1000;
    const elapsed = now - data.timestamp;

    if (elapsed < oneDay) {
      return oneDay - elapsed;
    } else {
      localStorage.removeItem('dontShowOverlayData');
      return 0;
    }
  } catch(e) {
    return 0;
  }
}

function applyThemeToAllPages() {
  var saved = localStorage.getItem(getSiteKey());
  if(saved) {
    var theme = JSON.parse(saved);
    document.documentElement.style.setProperty('--mainColor', theme.mainColor);
    document.documentElement.style.setProperty('--secondColor', theme.secondColor);

    if(theme.logo && document.getElementById('siteLogo')) {
      document.getElementById('siteLogo').src = theme.logo;
      document.getElementById('siteLogo').style.display = 'block';
      if(document.getElementById('logoPlaceholder')) {
        document.getElementById('logoPlaceholder').style.display = 'none';
      }
    }
    if(document.getElementById('footerLogo')) {
      document.getElementById('footerLogo').src = theme.logo;
      document.getElementById('footerLogo').style.display = 'block';
    }
  }
}

function saveInstagramImage() {
  const cropCircle = document.getElementById('instagramCropCircle');
  const image = document.getElementById('instagramDraggableImage');

  const canvas = document.createElement('canvas');
  const ctx = canvas.getContext('2d');
  const size = 100;
  canvas.width = size;
  canvas.height = size;

  const circleRect = cropCircle.getBoundingClientRect();
  const imageRect = image.getBoundingClientRect();

  const relativeX = (circleRect.left - imageRect.left);
  const relativeY = (circleRect.top - imageRect.top);

  const originalX = relativeX / instagramScale;
  const originalY = relativeY / instagramScale;

  const tempImage = new Image();
  tempImage.src = instagramImageData;
  tempImage.crossOrigin = "Anonymous";

  tempImage.onload = function() {
    const cropWidth = circleRect.width / instagramScale;
    const cropHeight = circleRect.height / instagramScale;

    canvas.width = size;
    canvas.height = size;

    ctx.save();
    ctx.clearRect(0, 0, size, size);
    ctx.beginPath();
    ctx.arc(size / 2, size / 2, size / 2, 0, Math.PI * 2);
    ctx.closePath();
    ctx.clip();

    ctx.translate(size / 2, size / 2);
    ctx.rotate(instagramRotation * Math.PI / 180);
    ctx.drawImage(
        tempImage,
        originalX, originalY, cropWidth, cropHeight,
        -size / 2, -size / 2, size, size
    );
    ctx.restore();

    const croppedImage = canvas.toDataURL('image/png');

    const logoDisplay = document.getElementById('instagramLogoDisplay');
    logoDisplay.src = croppedImage;
    logoDisplay.style.objectFit = 'cover';
    logoDisplay.style.borderRadius = '50%';

    saveLogoUnified(croppedImage, 15);
    applyInstagramLogoToSite(croppedImage);
    closeInstagramEditor();

    showInstagramToast('لوگو با موفقیت ذخیره شد! (۱۵ دقیقه معتبر است)');

    // نمایش دکمه حذف لوگو
    updateRemoveLogoButton();

    const currentTime = new Date().getTime();
    const expiryTime = currentTime + (15 * 60 * 1000);
    startLogoExpiryTimer(expiryTime);
  };

  tempImage.onerror = function() {
    showInstagramToast('خطا در پردازش تصویر!');
  };
}
// ========== رویدادهای بارگذاری ==========
document.addEventListener('DOMContentLoaded', function() {
  console.log('صفحه بارگذاری شد');

  // ابتدا تنظیمات اولیه را بارگذاری کن
  loadSavedTheme();

  // سپس لوگو را بارگذاری کن

  loadInstagramSavedLogo();

  // تنظیمات دیگر
  setupColorSync();
  setupLogoUpload();
  setupAutoApply();
  checkOverlay();
  applyThemeToAllPages();

  // یک بار دیگر بعد از 500 میلی‌ثانیه دکمه حذف را بررسی کن
  // (برای اطمینان از اینکه همه چیز کامل بارگذاری شده)
  setTimeout(function() {
    updateRemoveLogoButton();
    console.log('بررسی مجدد دکمه حذف لوگو بعد از تأخیر');
  }, 500);

  // یک بار دیگر بعد از 1 ثانیه (برای اطمینان بیشتر)
  setTimeout(function() {
    updateRemoveLogoButton();
  }, 1000);
});

document.addEventListener('click', function(event) {
  var sidebar = document.getElementById('settingsSidebar');
  var toggleBtn = document.querySelector('.settings-toggle');

  if(sidebar && sidebar.classList.contains('open')) {
    if(!sidebar.contains(event.target) && !toggleBtn.contains(event.target)) {
      closeSidebar();
    }
  }
});

document.getElementById('instagramLogoInput').addEventListener('change', function(e) {
  const file = e.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function(event) {
      instagramImageData = event.target.result;
      showInstagramEditor(instagramImageData);
    };
    reader.readAsDataURL(file);
  }
});
function showMessageSetting() {
  var showMessageSettenigSelector = document.getElementById('show-message-setting');

  // دریافت داده اوریلی
  var overlayData = localStorage.getItem('dontShowOverlayData');
  var shouldShowMessage = true; // پیش‌فرض: نمایش داده شود

  if (overlayData) {
    try {
      var parsedData = JSON.parse(overlayData);
      // اگر کاربر "دیگر نشان نده" را زده باشد و هنوز 24 ساعت نگذشته باشد
      if (parsedData.dontShow === true) {
        var now = Date.now();
        var oneDay = 24 * 60 * 60 * 1000;
        var timePassed = now - (parsedData.timestamp || 0);

        if (timePassed < oneDay) {
          shouldShowMessage = false; // اگر کمتر از 24 ساعت گذشته، پیام را نشان نده
        }
      }
    } catch(e) {
      shouldShowMessage = true;
    }
  }

  // نمایش پیام فقط اگر شرط برقرار باشد
  if (shouldShowMessage === false) {
    showMessageSettenigSelector.style.display = 'flex';
  }
}
function hideShowMessageSetting() {
  var showMessageSettenigSelector = document.getElementById('show-message-setting');
  if (showMessageSettenigSelector) {
    showMessageSettenigSelector.style.display = 'none';
  }
}

function showMessageClear() {
  var showMessageClearSelector = document.getElementById('show-message-clear');
  if (showMessageClearSelector) {
    showMessageClearSelector.style.display = 'flex';
  }else{
    showMessageClearSelector.style.display = 'none';

  }
}

function hideShowMessageClear() {
  var showMessageClearSelector = document.getElementById('show-message-clear');
  if (showMessageClearSelector) {
    showMessageClearSelector.style.display = 'none';
  }
}







