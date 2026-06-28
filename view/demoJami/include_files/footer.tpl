{load_presentation_object filename="aboutUs" assign="objAbout"}
                            {assign var="about"  value=$objAbout->getData()}
                            {if $smarty.session.layout neq 'pwa'}
                                {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
                                   
<footer class="i_modular_footer">
 <div class="body-footer">
  <canvas height="304" id="particle-canvas" width="1440">
  </canvas>
  <!--        <div class="background-gradient"></div>-->
  <div class="container">
   <div class="row">
    <div class="parent-footer-iran d-flex flex-wrap">
     <div class="item-footer col-lg-6 col-md-6 col-sm-12 col-12">
      <div class="box-item-footer text-right parent-link-box-footer">
       <div>
        <a href="javascript:">
         تلفن پشتیبانی:
         <span class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">
          {$smarty.const.CLIENT_PHONE}
         </span>
        </a>
        <a class="mr-auto" href="javascript:">
         ایمیل پشتیبانی:
         <span class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}">
          {$smarty.const.CLIENT_EMAIL}
         </span>
        </a>
       </div>
       <div class="flex-wrap">
        <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">
         پرواز
        </a>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
         هتل
        </a>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/bus">
         اتوبوس
        </a>
        <a href="{$smarty.const.ROOT_ADDRESS}/page/entertainment">
         تفریحات
        </a>
        <a class="mr-auto footer01" href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
         پیگیری خرید و کنسلی
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
     <div class="item-footer col-lg-6 col-md-6 col-sm-12 col-12">
      <div class="card-item-footer">
       <h5>
        باشگاه مشتریان
       </h5>
       <p>
        جایی که هر سفر شما را به امتیاز و هر امتیاز را به تجربه‌ای جدید تبدیل می‌کنیم!
       </p>
       <a class="__login_register_class__" href="{$smarty.const.ROOT_ADDRESS}/authenticate">
        ورود / ثبت نام
       </a>
      </div>
     </div>
     <div class="item-footer col-lg-4 col-md-6 col-sm-12 col-12">
      <div class="box-item-footer text-right">
       <h3>
        دسترسی آسان
       </h3>
       <ul>
        <li>
         <a class="{$smarty.const.ROOT_ADDRESS}/contactUs" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
          درباره ما
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/rules">
          قوانین و مقررات
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
{*        <li>*}
{*         <a href="javascript:">*}
{*          عضویت در خبرنامه*}
{*         </a>*}
{*        </li>*}
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/introductCountry">
          معرفی کشور‌ها
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/weather">
          هواشناسی
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/orderServices">
          درخواست خدمات
         </a>
        </li>
        <li>
         <a href="{$smarty.const.ROOT_ADDRESS}/pay">
          درگاه پرداخت آنلاین
         </a>
        </li>
       </ul>
      </div>
     </div>
     <div class="item-footer col-lg-8 col-md-6 col-sm-12 col-12">
      <div class="parent-namad box-item-footer text-right">
       <h3>
        سفری آسان با سفر 360!
       </h3>
       <p>
        {$htmlContent = $about['body']|strip_tags}{$htmlContent}
       </p>
       <div class="namads">
        <a href="https://www.cao.ir/paxrights">
         <img alt="Enamad1" src="project_files/images/certificate1.png"/>
        </a>
        <a href="https://www.cao.ir/">
         <img alt="namad-1" src="project_files/images/certificate2.png"/>
        </a>
        <a href="javascript:">
         <img alt="namad-2" src="project_files/images/samandehipng.parspng.com_.png"/>
        </a>
        {if !empty($about.enamad_id) && !empty($about.enamad_code)}
         <a referrerpolicy="origin" target="_blank"
            href="https://trustseal.enamad.ir/?id={$about.enamad_id}&Code={$about.enamad_code}">
          <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG|cat:'/pic/enamad.png'}"
               alt="اینماد"
               style="cursor:pointer">
        </a>
        {/if}

        <a href="http://aira.ir/images/final3.pdf">
         <img alt="namad-2" src="project_files/images/certificate3.png"/>
        </a>
       </div>
      </div>
     </div>
     <!--                    <div class="item-footer col-lg-12 col-sm-12 col-12 mb-0 d-sm-block d-none">-->
     <!--                        <div class="parent-link-page-footer">-->
     <!--                            <a href="javascript:">-->
     <!--                                بلیط هواپیما استانبول-->
     <!--                            </a>-->
     <!--                            <a href="javascript:">-->
     <!--                                بلیط هواپیما نجف-->
     <!--                            </a>-->
     <!--                            <a href="javascript:">-->
     <!--                                رزرو هتل تهران-->
     <!--                            </a>-->
     <!--                            <a href="javascript:">-->
     <!--                                رزرو هتل مشهد-->
     <!--                            </a>-->
     <!--                            <a href="javascript:" class="d-md-flex d-none">-->
     <!--                                رزرو هتل اصفهان-->
     <!--                            </a>-->
     <!--                            <a href="javascript:" class="d-md-flex d-none">-->
     <!--                                رزرو هتل کیش-->
     <!--                            </a>-->
     <!--                            <a href="javascript:" class="d-lg-flex d-none">-->
     <!--                                رزرو هتل قشم-->
     <!--                            </a>-->
     <!--                            <a href="javascript:" class="d-lg-flex d-none">-->
     <!--                                رزرو هتل شیراز-->
     <!--                            </a>-->
     <!--                        </div>-->
     <!--                    </div>-->
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
 <a class="fixicone fa fa-angle-up" href="javascript:" id="scroll-top" style="">
 </a>
</footer>

    {/if}
                            {else}
                                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
                            {/if}