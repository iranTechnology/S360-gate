{load_presentation_object filename="aboutUs" assign="objAbout"}
                            {assign var="about"  value=$objAbout->getData()}
                            {if $smarty.session.layout neq 'pwa'}
                                {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
                                   
<footer class="position-relative i_modular_footer">
 <div class="div-footer-parent">
  <div class="container">
   <div class="d-flex flex-wrap margin-top-footer">
    <div class="col-lg-4 col-md-6 col-sm-12 col-12 p-0">
     <div class="parent-item-footer parent-item-footer-responsive">
      <div class="img-box-footer">
       <img alt="footer-logo" class="__logo_class__" src="project_files/images/logo.png"/>
      </div>
      <div class="child-item-footer">
       <i class="fa-light fa-location-dot">
       </i>
       آدرس:
       <span class="__address_class__">
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
      <div class="footer-icon">
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
    <div class="col-lg-3 col-md-3 col-sm-6 col-6 p-0">
     <div class="box-item-footer text-right">
      <h3>
       خدمات
      </h3>
      <ul>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">
         <i class="fal fa-angle-left">
         </i>
         پرواز داخلی
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">
         <i class="fal fa-angle-left">
         </i>
         پرواز داخلی
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
         <i class="fal fa-angle-left">
         </i>
         هتل
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">
         <i class="fal fa-angle-left">
         </i>
         تور داخلی
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">
         <i class="fal fa-angle-left">
         </i>
         تور خارجی
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/insurance">
         <i class="fal fa-angle-left">
         </i>
         بیمه
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/visa">
         <i class="fal fa-angle-left">
         </i>
         ویزا
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/bus">
         <i class="fal fa-angle-left">
         </i>
         اتوبوس
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/train">
         <i class="fal fa-angle-left">
         </i>
         قطار
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/entertainment">
         <i class="fal fa-angle-left">
         </i>
         تفریحات
        </a>
       </li>
      </ul>
     </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-6 p-0">
     <div class="box-item-footer text-right">
      <h3>
       دسترسی آسان
      </h3>
      <ul>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/news">
         <i class="fal fa-angle-left">
         </i>
         اخبار
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/weather">
         <i class="fal fa-angle-left">
         </i>
         هواشناسی
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
         <i class="fal fa-angle-left">
         </i>
         درباره ما
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">
         <i class="fal fa-angle-left">
         </i>
         تماس با ما
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/faq">
         <i class="fal fa-angle-left">
         </i>
         پرسش متداول
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
         <i class="fal fa-angle-left">
         </i>
         پیگیری خرید
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/pay">
         <i class="fal fa-angle-left">
         </i>
         پرداخت آنلاین
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/authenticate">
         <i class="fal fa-angle-left">
         </i>
         باشگاه مشتریان
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/aboutCountry">
         <i class="fal fa-angle-left">
         </i>
         معرفی کشورها
        </a>
       </li>
       <li>
        <a href="{$smarty.const.ROOT_ADDRESS}/gallery">
         <i class="fal fa-angle-left">
         </i>
         گالری جهان
        </a>
       </li>
      </ul>
     </div>
    </div>
    <div class="col-lg-2 col-md-6 col-sm-12 col-12 p-0">
     <div class="parent-namad">
      <h3>
       مجوزها
      </h3>
      <div class="namads">
       <a href="javascript:">
        <img alt="Enamad1" src="project_files/images/certificate1.png"/>
       </a>
       <a href="javascript:">
        <img alt="namad-1" src="project_files/images/certificate2.png"/>
       </a>
       <a href="javascript:">
        <img alt="namad-2" src="project_files/images/certificate3.png"/>
       </a>
       <a href="javascript:">
        <img alt="namad-2" src="project_files/images/enamad.png"/>
       </a>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
 <div class="last_text col-12">
  <a class="last_a" href="https://www.iran-tech.com/">
   طراحی سایت گردشگری
  </a>
  <p class="last_p_text">
   : ایران تکنولوژی
  </p>
 </div>
 <!--    <a href="javascript:" class="fixicone fa fa-angle-up" id="scroll-top"></a>-->
</footer>

    {/if}
                            {else}
                                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
                            {/if}