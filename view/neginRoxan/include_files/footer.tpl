{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

<footer class="i_modular_footer">
 <div class="body-footer">
  <div class="container">
   <div class="row">
    <div class="parent-footer-iran d-flex flex-wrap w-100">
     <div class="item-footer col-lg-4 col-md-6 col-sm-12 col-12  order-foot1 text-center">
      <div class="parent-items-box-footer">
       <h3>به کمک نیاز دارید؟</h3>
       <div class="items-box-footer">
      <span class="__address_class__">
         {$smarty.const.CLIENT_ADDRESS}
        </span>
        <a class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">
         {$smarty.const.CLIENT_PHONE}
        </a>
       </div>
       <div class="items-box-footer">
        <span>به تیم پشتیبانی ما ایمیل بزنید</span>
        <a class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}">
         {$smarty.const.CLIENT_EMAIL}
        </a>
       </div>
       <div class="items-box-footer">
        <span>نگین رکسان غرب در صفحات مجازی</span>
        {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
        {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

        {foreach $socialLinks as $key => $val}
         {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
        {/foreach}
        <div class="__social_class__ footer-icon my-footer-icon">
         <a class="__youtube_class__ footer_youtube" href="{if $youTubeHref}{$youTubeHref}{/if}" target="_blank">
          <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
           <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
           <path d="M186.8 202.1l95.2 54.1-95.2 54.1V202.1zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48zm-42 176.3s0-59.6-7.6-88.2c-4.2-15.8-16.5-28.2-32.2-32.4C337.9 128 224 128 224 128s-113.9 0-142.2 7.7c-15.7 4.2-28 16.6-32.2 32.4-7.6 28.5-7.6 88.2-7.6 88.2s0 59.6 7.6 88.2c4.2 15.8 16.5 27.7 32.2 31.9C110.1 384 224 384 224 384s113.9 0 142.2-7.7c15.7-4.2 28-16.1 32.2-31.9 7.6-28.5 7.6-88.1 7.6-88.1z">
           </path>
          </svg>
         </a>
         <a class="__instagram_class__ footer_instagram" href="{if $instagramHref}{$instagramHref}{/if}" target="_blank">
          <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
           <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
           <path d="M224,202.66A53.34,53.34,0,1,0,277.36,256,53.38,53.38,0,0,0,224,202.66Zm124.71-41a54,54,0,0,0-30.41-30.41c-21-8.29-71-6.43-94.3-6.43s-73.25-1.93-94.31,6.43a54,54,0,0,0-30.41,30.41c-8.28,21-6.43,71.05-6.43,94.33S91,329.26,99.32,350.33a54,54,0,0,0,30.41,30.41c21,8.29,71,6.43,94.31,6.43s73.24,1.93,94.3-6.43a54,54,0,0,0,30.41-30.41c8.35-21,6.43-71.05,6.43-94.33S357.1,182.74,348.75,161.67ZM224,338a82,82,0,1,1,82-82A81.9,81.9,0,0,1,224,338Zm85.38-148.3a19.14,19.14,0,1,1,19.13-19.14A19.1,19.1,0,0,1,309.42,189.74ZM400,32H48A48,48,0,0,0,0,80V432a48,48,0,0,0,48,48H400a48,48,0,0,0,48-48V80A48,48,0,0,0,400,32ZM382.88,322c-1.29,25.63-7.14,48.34-25.85,67s-41.4,24.63-67,25.85c-26.41,1.49-105.59,1.49-132,0-25.63-1.29-48.26-7.15-67-25.85s-24.63-41.42-25.85-67c-1.49-26.42-1.49-105.61,0-132,1.29-25.63,7.07-48.34,25.85-67s41.47-24.56,67-25.78c26.41-1.49,105.59-1.49,132,0,25.63,1.29,48.33,7.15,67,25.85s24.63,41.42,25.85,67.05C384.37,216.44,384.37,295.56,382.88,322Z">
           </path>
          </svg>
         </a>
         <a class="__whatsapp_class__ footer_whatsapp" href="{if $whatsappHref}{$whatsappHref}{/if}" target="_blank">
          <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
           <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
           <path d="M224 122.8c-72.7 0-131.8 59.1-131.9 131.8 0 24.9 7 49.2 20.2 70.1l3.1 5-13.3 48.6 49.9-13.1 4.8 2.9c20.2 12 43.4 18.4 67.1 18.4h.1c72.6 0 133.3-59.1 133.3-131.8 0-35.2-15.2-68.3-40.1-93.2-25-25-58-38.7-93.2-38.7zm77.5 188.4c-3.3 9.3-19.1 17.7-26.7 18.8-12.6 1.9-22.4.9-47.5-9.9-39.7-17.2-65.7-57.2-67.7-59.8-2-2.6-16.2-21.5-16.2-41s10.2-29.1 13.9-33.1c3.6-4 7.9-5 10.6-5 2.6 0 5.3 0 7.6.1 2.4.1 5.7-.9 8.9 6.8 3.3 7.9 11.2 27.4 12.2 29.4s1.7 4.3.3 6.9c-7.6 15.2-15.7 14.6-11.6 21.6 15.3 26.3 30.6 35.4 53.9 47.1 4 2 6.3 1.7 8.6-1 2.3-2.6 9.9-11.6 12.5-15.5 2.6-4 5.3-3.3 8.9-2 3.6 1.3 23.1 10.9 27.1 12.9s6.6 3 7.6 4.6c.9 1.9.9 9.9-2.4 19.1zM400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zM223.9 413.2c-26.6 0-52.7-6.7-75.8-19.3L64 416l22.5-82.2c-13.9-24-21.2-51.3-21.2-79.3C65.4 167.1 136.5 96 223.9 96c42.4 0 82.2 16.5 112.2 46.5 29.9 30 47.9 69.8 47.9 112.2 0 87.4-72.7 158.5-160.1 158.5z">
           </path>
          </svg>
         </a>
         <a class="__linkdin_class__ footer_whatsapp" href="{if $linkeDinHref}{$linkeDinHref}{/if}" target="_blank">
          <svg viewbox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
           <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
           <path d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z">
           </path>
          </svg>
         </a>
        </div>
       </div>
      </div>
     </div>
     <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12  display-footer-none">
      <div class="box-item-footer text-right">
       <h3>نگین رکسان غرب</h3>
       <ul>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/page/internalTour">
          تور داخلی
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/page/internationalTour">
          تور خارجی
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/mag">
          وبلاگ
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/news">
          اخبار
         </a>
        </li>
        </li>
       </ul>
      </div>
     </div>
     <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 order-foot2 display-footer-none">
      <div class="box-item-footer text-right">
       <h3>خدمات مشتریان</h3>
       <ul>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">
          تماس با ما
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/rules">
          قوانین و مقررات
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
          درباره ما
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
          پیگیری خرید
         </a>
        </li>
       </ul>
      </div>
     </div>
     <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 display-footer-none2">
      <div class="box-item-footer text-right">
       <h3>اطلاعات تکمیلی</h3>
       <div class="namads">
        <a href="https://farasa.cao.ir/sysworkflow/fa/modern/3810212626028ab03488017019616799/6464336316028ab04e3c618028352200.php">
         <img alt="Enamad1" src="project_files/images/certificate1.png"/>
        </a>
        <a href="https://caa.gov.ir/">
         <img alt="namad-1" src="project_files/images/certificate2.png"/>
        </a>
        <a href="http://www.aira.ir/">
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
 </div>
 <div class="last_text col-12">
  <a class="last_a" href="https://www.iran-tech.com/">طراحی سایت گردشگری </a>
  <p class="last_p_text">: ایران تکنولوژی</p>
 </div>
 <a href="javascript:" class="fixicone" id="scroll-top">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M169.4 137.4c12.5-12.5 32.8-12.5 45.3 0l160 160c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L192 205.3 54.6 342.6c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l160-160z"/></svg>
 </a>
</footer>
{/if}
{else}
 {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}