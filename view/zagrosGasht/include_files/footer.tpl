{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="special_tour_params" value=['type'=>'special','limit'=> '3','dateNow' => $dateNow]}

{assign var='special_tours' value=$obj_main_page->getToursReservation($special_tour_params)}

{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
 {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

  <footer class="i_modular_footer">
   <div class="body-footer">
    <div class="container">
     <div class="row">
      <div class="parent-footer-iran d-flex flex-wrap w-100">
       <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 order-foot1">
        <div class="parent-item-footer parent-item-footer-responsive box-item-footer2">
         <img alt="img-logo" id="footerLogo" class="__logo_class__" src="project_files/images/logo.png"/>
         <div class="parent-about-footer box-item-footer text-right">
        <span class="__aboutUs_class__ text-footer-about">
         {$htmlContent = $about['body']|strip_tags}{$htmlContent|truncate:300}
        </span>
          <a class="{$smarty.const.ROOT_ADDRESS}/contactUs footer-more-link" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
           بیشتر
           <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
            <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
            <path d="M447.1 256c0 13.25-10.76 24.01-24.01 24.01H83.9l132.7 126.6c9.625 9.156 9.969 24.41 .8125 33.94c-9.156 9.594-24.34 9.938-33.94 .8125l-176-168C2.695 268.9 .0078 262.6 .0078 256S2.695 243.2 7.445 238.6l176-168C193 61.51 208.2 61.85 217.4 71.45c9.156 9.5 8.812 24.75-.8125 33.94l-132.7 126.6h340.1C437.2 232 447.1 242.8 447.1 256z">
            </path>
           </svg>
          </a>
         </div>
         {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
         {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

         {foreach $socialLinks as $key => $val}
          {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
         {/foreach}
         <div class="__social_class__ footer-icon my-footer-icon">
          <a class="__telegram_class__ fab fa-telegram footer_telegram" href="{if $telegramHref}{$telegramHref}{/if}" target="_blank">
          </a>
          <a class="__instagram_class__ fab fa-instagram footer_instagram" href="{if $instagramHref}{$instagramHref}{/if}" target="_blank">
          </a>
          <a class="__whatsapp_class__ fab fa-whatsapp footer_whatsapp" href="{if $whatsappHref}{$whatsappHref}{/if}" target="_blank">
          </a>
          <a class="__linkdin_class__ fa-brands fa-linkedin-in footer_linkedin" href="{if $linkeDinHref}{$linkeDinHref}{/if}" target="_blank">
          </a>
         </div>
        </div>
       </div>
       <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 order-foot2">
        <div class="box-item-footer text-right">
         <h3>
          دسترسی آسان
         </h3>
         <ul>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           پرواز
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           هتل
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           تور
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/page/package">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           پکیج
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           تماس با ما
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           درباره ما
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/rules">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           قوانین و مقررات
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/convertDate">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           تبدیل تاریخ
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/weather">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           هواشناسی
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/pay">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           پرداخت آنلاین
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/profile">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           باشگاه مشتریان
          </span>
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
            <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
             <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
             <path d="M0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96z">
             </path>
            </svg>
            <span>
           پیگیری خرید
          </span>
           </a>
          </li>
         </ul>
        </div>
       </div>


       <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 order-foot3">
        <div class="box-item-footer i_modular_tours">
         <h3>
          تورهای محبوب
         </h3>
         <div class="parent-tour-footer __tour__special__">
          {foreach $special_tours as $item}
           <a class="__link__ __i_modular_nc_item_class_0" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
            <img alt="{$item['tour_name']}" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
            <div class="caption-tour">
             <h4 class="__title_class__">
              {$item['tour_name']}
             </h4>
             {*            <span class="__date_class__">*}
             {*             {$item['created_at']}*}
             {*          </span>*}
            </div>
           </a>
          {/foreach}
         </div>
        </div>
       </div>



       <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 order-foot4">
        <div class="box-item-footer parent-contact-information">
         <h3>
          تماس با ما
         </h3>
         <div class="child-item-footer2">
          <i class="fa-light fa-location-dot">
          </i>
          آدرس:
          <span class="__address_class__ text-right">
         {$smarty.const.CLIENT_ADDRESS}
        </span>
         </div>
         <div class="child-item-footer">
          <i class="fa-light fa-phone">
          </i>
          تلفن:
          <a class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">
           {$smarty.const.CLIENT_PHONE}
          </a>
         </div>
         <div class="child-item-footer">
          <i class="fa-light fa-mobile">
          </i>
          موبایل:
          <a class="__mobile_class__" href="tel:{$smarty.const.CLIENT_MOBILE}">
           {$smarty.const.CLIENT_MOBILE}
          </a>
         </div>
         <div class="child-item-footer">
          <i class="fa-light fa-envelope">
          </i>
          ایمیل:
          <a class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}">
           {$smarty.const.CLIENT_EMAIL}
          </a>
         </div>
         <div class="namads">
          <a href="https://www.cao.ir/paxrights">
           <img alt="Enamad1" src="project_files/images/certificate1.png"/>
          </a>
          <a href="https://www.cao.ir/">
           <img alt="namad-1" src="project_files/images/certificate2.png"/>
          </a>
          <a href="http://aira.ir/images/final3.pdf">
           <img alt="namad-2" src="project_files/images/certificate3.png"/>
          </a>
          {if !empty($about.enamad_id) && !empty($about.enamad_code)}
           <a referrerpolicy="origin" target="_blank"
              href="https://trustseal.enamad.ir/?id={$about.enamad_id}&Code={$about.enamad_code}">
            <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG|cat:'/pic/enamad.png'}"
                 alt="اینماد"
                 style="cursor:pointer">
           </a>
          {/if}
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
    <img alt="img-footer" class="footer-img w-100" src="project_files/images/footer_back.jpg"/>
   </div>
   <div class="last_text col-12">
    <a class="last_a" href="https://www.iran-tech.com/">
     طراحی سایت گردشگری
    </a>
    <p class="last_p_text">
     : ایران تکنولوژی
    </p>
   </div>
   <a class="fixicone fa fa-angle-up" href="javascript:" id="scroll-top" style="">
   </a>
  </footer>

 {/if}
{else}
 {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}