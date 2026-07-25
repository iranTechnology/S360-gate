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










document.addEventListener('DOMContentLoaded', function() {
  console.log('صفحه بارگذاری شد');
  loadSavedTheme();
  setupColorSync();
  setupLogoUpload();
  setupAutoApply();
  checkOverlay();
});

// اعمال خودکار رنگ هنگام تغییر
function setupAutoApply() {
  var mainPicker = document.getElementById('mainColorPicker');
  var secondPicker = document.getElementById('secondColorPicker');
  var mainText = document.getElementById('mainColorText');
  var secondText = document.getElementById('secondColorText');

  // اعمال خودکار برای color picker ها
  if(mainPicker) {
    mainPicker.addEventListener('input', function() {
      var mainColor = this.value;
      var secondColor = secondPicker.value;
      applyColors(mainColor, secondColor);
      if(mainText) mainText.value = mainColor;
      console.log('رنگ اصلی تغییر کرد:', mainColor);
    });
  }

  if(secondPicker) {
    secondPicker.addEventListener('input', function() {
      var secondColor = this.value;
      var mainColor = mainPicker.value;
      applyColors(mainColor, secondColor);
      if(secondText) secondText.value = secondColor;
      console.log('رنگ ثانویه تغییر کرد:', secondColor);
    });
  }

  // اعمال خودکار برای فیلدهای متنی
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

// همگام‌سازی بین color picker و text field
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

// آپلود لوگو
function setupLogoUpload() {
  var logoUpload = document.getElementById('logoUpload');
  if(logoUpload) {
    logoUpload.addEventListener('change', function(e) {
      var file = e.target.files[0];
      if(file) {
        console.log('فایل انتخاب شد:', file.name);
        var reader = new FileReader();
        reader.onload = function(event) {
          var imageUrl = event.target.result;
          console.log('لوگو آپلود شد:', imageUrl.substring(0, 50));

          var logoPreview = document.getElementById('logoPreview');
          if(logoPreview) {
            logoPreview.src = imageUrl;
            logoPreview.style.display = 'block';
          }

          applyLogo(imageUrl);
          showToast('لوگو با موفقیت آپلود شد');
        };
        reader.onerror = function() {
          console.error('خطا در آپلود فایل');
          showToast('خطا در آپلود لوگو');
        };
        reader.readAsDataURL(file);
      }
    });
  }
}

// اعمال رنگ‌ها (بدون نیاز به دکمه جداگانه)
function applyColors(mainColor, secondColor) {
  console.log('اعمال رنگ:', mainColor, secondColor);

  // تغییر متغیرهای CSS
  document.documentElement.style.setProperty('--mainColor', mainColor);
  document.documentElement.style.setProperty('--secondColor', secondColor);

  // تغییر مستقیم استایل المنت‌ها
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

// اعمال لوگو
function applyLogo(logoUrl) {
  console.log('applyLogo فراخوانی شد:', logoUrl ? 'دارد' : 'ندارد');

  var logoImg = document.getElementById('siteLogo');
  var footerLogo = document.getElementById('footerLogo');
  var logoPlaceholder = document.getElementById('logoPlaceholder');

  if(!logoImg) {
    console.error('المنت‌های لوگو پیدا نشدند');
    return;
  }

  if(logoUrl && logoUrl !== '' && logoUrl !== 'undefined') {
    logoImg.src = logoUrl;
    logoImg.style.display = 'block';
    if(footerLogo) {
      footerLogo.src = logoUrl;
      footerLogo.style.display = 'block';
    }
    if(logoPlaceholder) logoPlaceholder.style.display = 'none';
    console.log('لوگو اعمال شد:', logoUrl.substring(0, 50));
  } else {
    if(logoPlaceholder) logoPlaceholder.style.display = 'flex';
    console.log('لوگو حذف شد، placeholder نمایش داده می‌شود');
  }
}

// ذخیره تنظیمات
function getSiteKey() {
  // استفاده از مسیر فعلی یا نام دامنه + پوشه
  var path = window.location.pathname.split('/')[1] || 'root';
  return 'siteTheme_' + path;
}

// ذخیره تنظیمات با کلید منحصر به فرد
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
    savedTime: Date.now() // ذخیره زمان فعلی (میلی‌ثانیه)
  };

  var siteKey = getSiteKey();
  localStorage.setItem(siteKey, JSON.stringify(theme));
  localStorage.setItem('currentSite', siteKey); // ذخیره سایت فعلی

  closeOverlay();
  toggleSidebar();
  console.log('تنظیمات ذخیره شد برای:', siteKey, theme);
  showToast('تنظیمات ذخیره شد!');
}
function loadSavedTheme() {
  var siteKey = getSiteKey();
  var saved = localStorage.getItem(siteKey);
  console.log('بارگذاری تنظیمات برای:', siteKey, saved);

  if(saved) {
    try {
      var theme = JSON.parse(saved);

      // بررسی زمان ذخیره‌سازی (15 دقیقه = 15 * 60 * 1000 میلی‌ثانیه)
      var now = Date.now();
      var fifteenMinutes = 15 * 60 * 1000; // 900000 میلی‌ثانیه

      if(theme.savedTime && (now - theme.savedTime) > fifteenMinutes) {
        // اگر بیشتر از 15 دقیقه گذشته بود، تنظیمات را پاک کن
        console.log('تنظیمات منقضی شده است (بیشتر از 15 دقیقه)');
        localStorage.removeItem(siteKey);
        setDefaultColors();
        showToast('تنظیمات منقضی شد! دوباره تنظیمات را ذخیره کنید.');
        return;
      }

      console.log('تنظیمات معتبر است، زمان باقی مانده:', Math.floor((fifteenMinutes - (now - theme.savedTime)) / 1000), 'ثانیه');

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
        console.log('بارگذاری لوگو:', theme.logo.substring(0, 50));
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
    console.log('تنظیمات ذخیره شده‌ای یافت نشد');
    setDefaultColors();
  }
}

// تنظیم رنگ‌های پیشفرض
// تنظیم رنگ‌های پیشفرض (بدون ذخیره در localStorage)
function setDefaultColors() {
  console.log('تنظیم رنگ‌های پیشفرض');

  var mainPicker = document.getElementById('mainColorPicker');
  var mainText = document.getElementById('mainColorText');
  var secondPicker = document.getElementById('secondColorPicker');
  var secondText = document.getElementById('secondColorText');

  // تنظیم مقادیر پیشفرض در input ها
  if(mainPicker) mainPicker.value = '#b71c1c';
  if(mainText) mainText.value = '#b71c1c';
  if(secondPicker) secondPicker.value = '#ee384e';
  if(secondText) secondText.value = '#ee384e';

  // تنظیم لوگوی پیشفرض
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

  // اعمال رنگ‌های پیشفرض
  // applyColors('#b71c1c', '#ee384e');
}

// بازنشانی به حالت اولیه
function resetTheme() {
  console.log('بازنشانی به حالت اولیه - پاک کردن تمام تغییرات');

  // 1. تنظیم رنگ‌ها به پیش‌فرض
  setDefaultColors();

  // 2. پاک کردن لوگوی آپلود شده
  applyLogo('');

  // 3. پاک کردن فایل آپلود و پیش‌نمایش
  var logoUpload = document.getElementById('logoUpload');
  var logoPreview = document.getElementById('logoPreview');

  if(logoUpload) logoUpload.value = '';
  if(logoPreview) {
    logoPreview.style.display = 'none';
    logoPreview.src = '';
  }

  // 4. حذف تنظیمات از localStorage (مهم)
  var siteKey = getSiteKey(); // اگر از کلید اختصاصی استفاده می‌کنید
  localStorage.removeItem(siteKey);
  // یا اگر از کلید ساده استفاده می‌کنید:
  // localStorage.removeItem('siteTheme');

  // 5. حذف از کوکی (اگر از کوکی استفاده می‌کنید)
  document.cookie = "mainColor=; path=/; max-age=0";
  document.cookie = "secondColor=; path=/; max-age=0";
  document.cookie = "siteTheme=; path=/; max-age=0";

  // 6. حذف متغیرهای CSS اعمال شده (اجباری به پیش‌فرض)
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

  // 8. نمایش پیام تایید
  showToast('✅ تمام تغییرات پاک شد و سایت به حالت اولیه بازگشت!');

  // 9. (اختیاری) رفرش صفحه برای اعمال کامل تغییرات
  // setTimeout(function() {
  //   location.reload();
  // }, 1000);
}

// توابع سایدبار
function toggleSidebar() {
  var sidebar = document.getElementById('settingsSidebar');
  if(sidebar) sidebar.classList.toggle('open');
  closeOverlay();
}

function closeSidebar() {
  var sidebar = document.getElementById('settingsSidebar');
  if(sidebar) sidebar.classList.remove('open');
}

// نمایش پیام
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

// کلیک خارج از سایدبار برای بستن
document.addEventListener('click', function(event) {
  var sidebar = document.getElementById('settingsSidebar');
  var toggleBtn = document.querySelector('.settings-toggle');

  if(sidebar && sidebar.classList.contains('open')) {
    if(!sidebar.contains(event.target) && !toggleBtn.contains(event.target)) {
      closeSidebar();
    }
  }
});

function checkOverlay() {
  // بررسی اینکه کاربر قبلاً اوریلی را بسته باشد یا نه
  var dontShowAgain = localStorage.getItem('dontShowOverlay');

  // اگر کاربر قبلاً "دیگر نشان نده" را زده بود، اوریلی نمایش داده نشود
  if(dontShowAgain !== 'true') {
    // بعد از 500 میلی‌ثانیه اوریلی را نشان بده
    setTimeout(function() {
      var overlay = document.getElementById('overlayBlack');
      if(overlay) {
        overlay.style.display = 'flex';
        overlay.classList.add('show');
        // غیرفعال کردن اسکرول صفحه
        document.body.style.overflow = 'hidden';
      }
    }, 500);
  }
}

// بستن اوریلی
function closeOverlay() {
  var overlay = document.getElementById('overlayBlack');
  var dontShowCheckbox = document.getElementById('dontShowAgain');
  var restThemeBtn = document.getElementById('rest-theme-btn')
  if(overlay) {
    overlay.style.display = 'none';
    overlay.classList.remove('show');
    // فعال کردن مجدد اسکرول
    document.body.style.overflow = 'auto';
    restThemeBtn.style.display = 'flex'
    // اگر چک‌باکس تیک خورده بود، دیگر نشان نده
    if(dontShowCheckbox && dontShowCheckbox.checked) {
      localStorage.setItem('dontShowOverlay', 'true');
    }
  }
}

// همچنین دکمه بستن در اوریلی
document.addEventListener('DOMContentLoaded', function() {
  // پیدا کردن دکمه بستن در اوریلی
  var closeBtn = document.querySelector('#overlayBlack .close-overlay');
  if(!closeBtn) {
    // اگر دکمه وجود ندارد، یک دکمه اضافه کن
    var overlayContent = document.querySelector('#overlayBlack .overlay-content');
  }
});
function applyThemeToAllPages() {
    var saved = localStorage.getItem('siteTheme');
    if(saved) {
        var theme = JSON.parse(saved);

        // اعمال رنگ‌ها
        document.documentElement.style.setProperty('--mainColor', theme.mainColor);
        document.documentElement.style.setProperty('--secondColor', theme.secondColor);

        // اعمال لوگو اگر وجود داشته باشد
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
            if(document.getElementById('logoPlaceholder')) {
                document.getElementById('logoPlaceholder').style.display = 'none';
            }
        }
    }
}

// اجرا در تمام صفحات
document.addEventListener('DOMContentLoaded', applyThemeToAllPages);

// متغیرهای ویرایشگر اینستاگرامی
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

// آپلود لوگو
function triggerInstagramUpload() {
  document.getElementById('instagramLogoInput').click();
}

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

// نمایش ویرایشگر اینستاگرامی
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

  document.getElementById('instagramLogoInput').value = '';
}

// فعال کردن جابجایی
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

// اعمال تبدیلات
function applyInstagramTransform() {
  const image = document.getElementById('instagramDraggableImage');
  const cropCircle = document.getElementById('instagramCropCircle');

  const circleRect = cropCircle.getBoundingClientRect();
  const imageDisplayWidth = instagramImageWidth * instagramScale;
  const imageDisplayHeight = instagramImageHeight * instagramScale;

  // محدود کردن جابجایی
  const maxX = Math.max(0, (imageDisplayWidth - circleRect.width) / 2);
  const maxY = Math.max(0, (imageDisplayHeight - circleRect.height) / 2);

  instagramTranslateX = Math.min(maxX, Math.max(-maxX, instagramTranslateX));
  instagramTranslateY = Math.min(maxY, Math.max(-maxY, instagramTranslateY));

  image.style.width = imageDisplayWidth + 'px';
  image.style.height = imageDisplayHeight + 'px';
  image.style.transform = `translate(${instagramTranslateX}px, ${instagramTranslateY}px) rotate(${instagramRotation}deg)`;
}

// بزرگنمایی
function zoomInstagramImage(delta) {
  const slider = document.getElementById('instagramZoomSlider');
  let newValue = instagramScale + delta;
  newValue = Math.min(3, Math.max(0.5, newValue));
  slider.value = newValue;
  instagramScale = newValue;
  applyInstagramTransform();
}

// چرخش تصویر
function rotateImageLeft() {
  instagramRotation = (instagramRotation - 90) % 360;
  applyInstagramTransform();
}

// بازنشانی - تصویر وسط قرار می‌گیرد
function resetInstagramImage() {
  const cropCircle = document.getElementById('instagramCropCircle');
  const circleRect = cropCircle.getBoundingClientRect();

  // محاسبه اسکیل مناسب برای پوشش کامل دایره
  const scaleX = circleRect.width / instagramImageWidth;
  const scaleY = circleRect.height / instagramImageHeight;
  instagramScale = Math.max(scaleX, scaleY);

  const slider = document.getElementById('instagramZoomSlider');
  slider.value = instagramScale;

  const imageDisplayWidth = instagramImageWidth * instagramScale;
  const imageDisplayHeight = instagramImageHeight * instagramScale;

  // وسط قرار دادن تصویر
  instagramTranslateX = (circleRect.width - imageDisplayWidth) / 2;
  instagramTranslateY = (circleRect.height - imageDisplayHeight) / 2;
  instagramRotation = 0;

  applyInstagramTransform();
}

// ذخیره تصویر
function saveInstagramImage() {
  const cropCircle = document.getElementById('instagramCropCircle');
  const image = document.getElementById('instagramDraggableImage');

  const canvas = document.createElement('canvas');
  const ctx = canvas.getContext('2d');
  const size = 200;
  canvas.width = size;
  canvas.height = size;

  const circleRect = cropCircle.getBoundingClientRect();
  const imageRect = image.getBoundingClientRect();

  // محاسبه منطقه قابل مشاهده
  const visibleX = Math.max(0, (imageRect.left - circleRect.left));
  const visibleY = Math.max(0, (imageRect.top - circleRect.top));
  const visibleWidth = Math.min(circleRect.width, imageRect.right - circleRect.left);
  const visibleHeight = Math.min(circleRect.height, imageRect.bottom - circleRect.top);

  const cropX = (visibleX / instagramScale);
  const cropY = (visibleY / instagramScale);
  const cropWidth = (visibleWidth / instagramScale);
  const cropHeight = (visibleHeight / instagramScale);

  const tempImage = new Image();
  tempImage.src = instagramImageData;

  tempImage.onload = function() {
    ctx.save();

    // برش دایره‌ای
    ctx.beginPath();
    ctx.arc(size / 2, size / 2, size / 2, 0, Math.PI * 2);
    ctx.closePath();
    ctx.clip();

    // وسط قرار دادن تصویر برش خورده
    ctx.translate(size / 2, size / 2);
    ctx.rotate(instagramRotation * Math.PI / 180);
    ctx.drawImage(tempImage,
        cropX, cropY, cropWidth, cropHeight,
        -size / 2, -size / 2, size, size
    );

    ctx.restore();

    const croppedImage = canvas.toDataURL('image/png');

    // ذخیره و اعمال
    const logoDisplay = document.getElementById('instagramLogoDisplay');
    logoDisplay.src = croppedImage;
    logoDisplay.style.objectFit = 'cover';

    localStorage.setItem('customLogo', croppedImage);
    applyInstagramLogoToSite(croppedImage);
    closeInstagramEditor();

    // نمایش پیام موفقیت
    showInstagramToast('لوگو با موفقیت ذخیره شد!');

    // نمایش دکمه حذف
    document.querySelector('.instagram-remove-logo').style.display = 'flex';
  };
}

// بستن ویرایشگر
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

// حذف لوگو
function removeInstagramLogo() {
  if (confirm('آیا از حذف لوگو اطمینان دارید؟')) {
    localStorage.removeItem('customLogo');
    const defaultLogo = 'path/to/default-logo.png';
    const logoDisplay = document.getElementById('instagramLogoDisplay');
    logoDisplay.src = defaultLogo;
    logoDisplay.style.objectFit = 'cover';
    applyInstagramLogoToSite(defaultLogo);
    document.querySelector('.instagram-remove-logo').style.display = 'none';
    showInstagramToast('لوگو حذف شد!');
  }
}

// اعمال لوگو در سایت
function applyInstagramLogoToSite(logoUrl) {
  const logos = document.querySelectorAll('.site-logo, .navbar-brand img, #siteLogo, #footerLogo');
  logos.forEach(el => {
    if (el.tagName === 'IMG') {
      el.src = logoUrl;
      el.style.objectFit = 'cover';
    }
  });
}

// بارگذاری لوگوی ذخیره شده
function loadInstagramSavedLogo() {
  const saved = localStorage.getItem('customLogo');
  if (saved && saved !== '') {
    const logoDisplay = document.getElementById('instagramLogoDisplay');
    logoDisplay.src = saved;
    logoDisplay.style.objectFit = 'cover';
    applyInstagramLogoToSite(saved);
    document.querySelector('.instagram-remove-logo').style.display = 'flex';
  }
}

// نمایش پیام
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

// بارگذاری هنگام شروع
document.addEventListener('DOMContentLoaded', function() {
  loadInstagramSavedLogo();
});














