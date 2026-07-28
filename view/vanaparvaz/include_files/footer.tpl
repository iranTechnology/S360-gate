{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <footer class="i_modular_footer footer-new">
            <a class="__mobile_class__ telephone" href="tel:{$smarty.const.CLIENT_MOBILE}">
                <img src="project_files/images/telephone.png" alt="img">
            </a>
            <div class="__whatsapp_class__ whatsapp">
                <img alt="img" src="project_files/images/whatsapp.png" />
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="foo">
                            <h3>
                                درباره ما
                            </h3>
                            <p class="__aboutUs_class__">
                                {$htmlContent = $about['body']|strip_tags}{$htmlContent|truncate:300}
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="foo">
                            <h3>
                                تماس با ما
                            </h3>
                            <div class="footer-widget">
                                <p>
                                    <i class="fa fa-map-marker-alt">
                                    </i>
                                    <a class="__address_class__ SMFooterAddress" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}"">
                                        {$smarty.const.CLIENT_ADDRESS}
                                    </a>
                                </p>
                                <p>
                                    <i class="fa fa-envelope">
                                    </i>
                                    <a class="__email_class__ SMFooterEmail" href="mailto:{$smarty.const.CLIENT_EMAIL}">
                                        {$smarty.const.CLIENT_EMAIL}
                                    </a>
                                </p>
                                <p>
                                    <i class="fa fa-headphones">
                                    </i>
                                    <a class="__mobile_class__ SMFooterPhone" href="tel:{$smarty.const.CLIENT_MOBILE}">
                                        {$smarty.const.CLIENT_MOBILE}
                                    </a>
                                </p>
                                <div class="logos_footer">
                                    <a href="https://trustseal.enamad.ir/?id=558281&amp;Code=0bOTVnO7xzhBzSCbnvMBG2GlIZzXzVtM"
                                       target="_blank">
                                        <img alt="" code="0bOTVnO7xzhBzSCbnvMBG2GlIZzXzVtM" referrerpolicy="origin"
                                             src="https://trustseal.enamad.ir/logo.aspx?id=558281&amp;Code=0bOTVnO7xzhBzSCbnvMBG2GlIZzXzVtM"
                                             style="cursor:pointer" />
                                    </a>
                                    <a target="_blank">
                                        <img alt="logo-samandehi" id="rgvjjzpefukzjxlzoeukapfu"
                                             onclick='window.open("https://logo.samandehi.ir/Verify.aspx?id=376185&amp;p=xlaojyoegvkarfthmcsidshw", "Popup","toolbar=no, scrollbars=no, location=no, statusbar=no, menubar=no, resizable=0, width=450, height=630, top=30")'
                                             referrerpolicy="origin"
                                             src="https://logo.samandehi.ir/logo.aspx?id=376185&amp;p=qftiyndtwlbqnbpdaqgwujyn"
                                             style="cursor:pointer" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex flex-wrap align-items-center justify-content-center">
                        <div class="">
                            <div class="social">
                                <div class="phone_support">
       <span>
        شماره تماس پشتیبانی 24 ساعته
       </span>
                                    <a class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">
                                        {$smarty.const.CLIENT_PHONE}
                                    </a>
                                </div>
                                {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                                {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

                                {foreach $socialLinks as $key => $val}
                                    {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                                {/foreach}

                                <ul class="__social_class__">
                                    <li class="telegram_icon">
                                        <a class="__telegram_class__ SMTelegram"
                                           href="{if $telegramHref}{$telegramHref}{/if}">
                                            <i class="fab fa-telegram-plane">
                                            </i>
                                        </a>
                                    </li>
                                    <li class="instagram_icon">
                                        <a class="__instagram_class__ SMInstageram"
                                           href="{if $instagramHref}{$instagramHref}{/if}">
                                            <i class="fab fa-instagram">
                                            </i>
                                        </a>
                                    </li>
                                    <li class="icon_aparat">
                                        <a class="__aparat_class__ SMAparat" href="{if $aparatHref}{$aparatHref}{/if}">
                                            <svg id="Layer_1" version="1.1" viewbox="0 0 48 48" x="0px"
                                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" y="0px">
          <g>
              <path d="M21.881 6.136l-4.315-.974a6.533 6.533 0 0 0-7.812 4.934l-.983 4.351c2.832-4.497 7.586-7.659 13.11-8.311z">
              </path>
              <path d="M6.136 26.119l-.974 4.315a6.533 6.533 0 0 0 4.934 7.812l4.351.983c-4.497-2.833-7.659-7.586-8.311-13.11z">
              </path>
              <path d="M37.904 9.754l-4.351-.983c4.497 2.832 7.659 7.586 8.311 13.109l.974-4.315a6.533 6.533 0 0 0-4.934-7.811z">
              </path>
              <path d="M26.119 41.864l4.315.974a6.533 6.533 0 0 0 7.812-4.934l.983-4.351c-2.832 4.497-7.586 7.659-13.11 8.311z">
              </path>
          </g>
                                                <path d="M24 8C15.163 8 8 15.163 8 24s7.163 16 16 16 16-7.163 16-16S32.837 8 24 8zm-4 5a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm-3 19a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm5-8a2 2 0 1 1 3.999-.001A2 2 0 0 1 22 24zm6 11a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm3-11a4 4 0 1 1 0-8 4 4 0 0 1 0 8z">
                                                </path>
         </svg>
                                        </a>
                                    </li>
                                    <li class="facebook_icon">
                                        <a class="__facebook_class__ SMFaceBook" href="{if $facebookHref}{$facebookHref}{/if}">
                                            <i class="fab fa-facebook-f">
                                            </i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}
<div class="copyright">
 <div>
     کلیه حقوق محفوظ و متعلق به وانا پرواز می باشد.
 </div>
 <div><a href="https://www.iran-tech.com/" target='_blank'> طراحی سایت گردشگری </a>: ایران تکنولوژی</div>
</div>
<a data-placement="top" data-toggle="tooltip" id="scroll-top" title="بازگشت به بالای صفحه">
 <button><i class="fas fa-arrow-up"></i></button>
</a>
