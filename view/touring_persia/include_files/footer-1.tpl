{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{assign var="socialLinks"  value=$about['social_links']|json_decode:true}


{if $smarty.session.layout neq 'pwa'}
 {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

  <footer class="i_modular_footer">
   <div class="body-footer">
    <div class="container">
     <div class="row">
      <div class="parent-footer-iran d-flex flex-wrap w-100">
       <div class="item-footer col-lg-5 col-md-6 col-sm-12 col-12 order-foot1">
        <div class="parent-item-footer parent-item-footer-responsive">
         <div class="img-box-footer">
          <img alt="footer-logo" src="project_files/images/logo.png"/>
         </div>
         <!--                            <div class="child-item-footer align-items-start">-->
         <!--                                <i class="fa-sharp fa-solid fa-location-dot icon-location"></i>-->
         <!--                                <span >-->
         <!--                                            Yazd, Mahdieh Square, Imam Jafar Sadegh Blvd., Shahid Bahonar Alley, No. 126235-->
         <!--                                </span>-->
         <!--                            </div>-->
         <div class="child-item-footer child-item-footer2">
          <i class="fa-brands fa-whatsapp">
          </i>
          <a class="__mobile_class__" href="https://wa.me/{$smarty.const.CLIENT_MOBILE}">
           {$smarty.const.CLIENT_MOBILE}
          </a>
         </div>
         <div class="child-item-footer child-item-footer2">
          <i class="fa-light fa-envelope">
          </i>
          <a class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}">
           {$smarty.const.CLIENT_EMAIL}
          </a>
         </div>
         {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
         {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref', 'linkdin' => 'linkdinHref']}

         {foreach $socialLinks as $key => $val}
          {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
         {/foreach}
         <div class="__social_class__ footer-icon my-footer-icon">
          <a class="__youtube_class__ fa-brands fa-youtube footer_telegram" href="{if $youtubeHref}{$youtubeHref}{/if}" target="_blank">
          </a>
          <a class="__instagram_class__ fab fa-instagram footer_instagram" href="{if $instagramHref}{$instagramHref}{/if}" target="_blank">
          </a>
          <a class="__facebook_class__ fa-brands fa-facebook footer_whatsapp" href="{if $whatsappHref}{$whatsappHref}{else}javascript:;{/if}" target="_blank">
          </a>
          <a class="__linkdin_class__ fa-brands fa-linkedin-in footer_linkedin" href="{if $linkedinHref}{$linkedinHref}{/if}" target="_blank">
          </a>
         </div>
        </div>
       </div>
       <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 display-footer-none">
        <div class="box-item-footer text-right">
         <h3>
          Here to help
         </h3>
         <ul>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/faq">
            Faq
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/clock">
            Countries clock
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/weather">
            Meteorology
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/recommendation">
            Travelogue
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/aboutIran">
            Introduction of Iran
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/orderServices">
            Service request
           </a>
          </li>
         </ul>
        </div>
       </div>
       <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 display-footer-none">
        <div class="box-item-footer text-right">
         <h3>
          Easy access
         </h3>
         <ul>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">
            Iran Tour
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
            Iran Hotel
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/iranVisa">
            Iran visa form
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/mag">
            Useful information
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/en/resultEntertainment/all/all/all&is_request=1">
            Tourism services
           </a>
          </li>
          <li>
           <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
            About us
           </a>
          </li>
         </ul>
        </div>
       </div>
       <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 order-foot2">
        <div class="parent-namad box-item-footer text-right">
         <h3>
          Map
         </h3>
         <div id="g-map"></div>
         </div>
         <div class="footer-icon icon-respancive">



          <a class="__telegram_class__ fab fa-telegram footer_telegram" href="{if $telegramHref}{$telegramHref}{else}javascript:;{/if}" target="_blank">
          </a>
          <a class="__instagram_class__ fab fa-instagram footer_instagram" href="{if $instagramHref}{$instagramHref}{else}javascript:;{/if}" target="_blank">
          </a>
          <a class="__whatsapp_class__ fab fa-whatsapp footer_whatsapp" href="{if $whatsappHref}{$whatsappHref}{else}javascript:;{/if}" target="_blank">
          </a>
          <a class="__linkdin_class__ fa-brands fa-linkedin-in footer_linkedin" href="{if $linkdinHref}{$linkdinHref}{else}javascript:;{/if}" target="_blank">
          </a>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <div class="last_text col-12">
    <a class="last_a" href="https://www.iran-tech.com/">
     Tourism website design
    </a>
    <p class="last_p_text">
     : Iran technology
    </p>
   </div>
   <a class="fixicone fa fa-angle-up" href="javascript:" id="scroll-top">
   </a>
  </footer>

 {/if}
{else}
 {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}

{literal}
 <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js" integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ==" crossorigin=""></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ==" crossorigin="" />
<script>
 {/literal}
 const GoogleMapLatitude1 = {$smarty.const.CLIENT_MAP_LAT}
 const GoogleMapLongitude1 = {$smarty.const.CLIENT_MAP_LNG}
 console.log(GoogleMapLatitude1 , GoogleMapLongitude1)
 {literal}
 map = L.map('g-map').setView([GoogleMapLatitude1, GoogleMapLongitude1], 14)
 L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 18,
 }).addTo(map)
 newMarkerGroup = new L.LayerGroup()
 var marker = null
 marker = L.marker({

  lat: GoogleMapLatitude1,
  lng: GoogleMapLongitude1,

 }).addTo(map)
 setTimeout(() => {
  map.invalidateSize()
 }, "1000")
</script>
{/literal}