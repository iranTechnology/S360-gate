{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}

{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <footer class="i_modular_footer">
            <div class="body-footer">
                <div class="container">
                    <div class="row">
                        <div class="parent-footer-iran d-flex flex-wrap w-100">
                            <div class="item-footer col-lg-3 col-md-12 col-sm-12 col-12 order-foot1 ">
                                <div class="box-item-footer">
                                    <a class="footer-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                                        <img alt="img-logo" class="__logo_class__" src="project_files/images/logo.png" />
                                    </a>
                                    <div class="child-item-footer2 align-items-start">
                                <span class="badge-footer">
                                    <i class="fa-light fa-location-dot"></i>
                                    آدرس
                                     <span class="branch">(شعبه تهران)</span>
                                </span>
                                        <div class="parent-text-address">
                                            <span class="__address_class__ text-right">
                                                {$smarty.const.CLIENT_ADDRESS}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="child-item-footer2 align-items-start p-0">
                                        <span class="badge-footer">
                                            <i class="fa-light fa-location-dot"></i>
                                            آدرس
                                            <span class="branch">(شعبه شیراز)</span>
                                        </span>
                                        <div class="parent-text-address">
                                            <span class="__address_class__ text-right">
                                                شیراز، ستارخان، ساختمان رز سفید، طبقه‌دوم، واحد۷
                                            </span>
                                        </div>
                                    </div>
                                    {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                                    {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

                                    {foreach $socialLinks as $key => $val}
                                        {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                                    {/foreach}
                                    <div class="__social_class__ footer-icon icon-responsive">
                                        <a class="__telegram_class__ fab fa-telegram footer_telegram"
                                           href="{if $telegramHref}{$telegramHref}{/if}" target="_blank">
                                        </a>
                                        <a class="__instagram_class__ fab fa-instagram footer_instagram"
                                           href="{if $instagramHref}{$instagramHref}{/if}" target="_blank">
                                        </a>
                                        <a class="__whatsapp_class__ fab fa-whatsapp footer_whatsapp"
                                           href="{if $whatsappHref}{$whatsappHref}{/if}" target="_blank">
                                        </a>
                                        <a class="__linkdin_class__ fa-brands fa-linkedin-in footer_linkedin"
                                           href="{if $linkeDinHref}{$linkeDinHref}{/if}" target="_blank">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 order-foot2 ">
                                <div class="box-item-footer text-right">
                                    <h3>
                                        درباره ویستا سیر
                                    </h3>
                                    <ul>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
                                                پیگیری خرید
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/pay">
                                                درگاه پرداخت آنلاین
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
                                            <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">
                                                تماس با ما
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 order-foot2 ">
                                <div class="box-item-footer text-right">
                                    <h3>
                                        دسترسی آسان
                                    </h3>
                                    <ul>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/orderServices">
                                                درخواست خدمات
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/weather">
                                                هواشناسی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/clock">
                                                ساعت کشورها
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/news">
                                                اخبار
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/club">
                                                باشگاه مشتریان
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 order-foot3 ">
                                <div class="box-item-footer">
                                    <h3>
                                        خدمات
                                    </h3>
                                    <ul>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/Flight'>پرواز</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/Hotel'>هتل</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/Tour'>تور</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/Insurance'>بیمه</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/Visa'> ویزا</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-footer col-lg-3 col-md-4 col-sm-6 col-12 order-foot4 ">
                                <div class="box-item-footer parent-contact-information">
                                    <h3>
                                        مجوز ها
                                    </h3>
                                    <div class="namads">
                                        <a href="https://www.cao.ir/paxrights">
                                            <img alt="Enamad1" src="project_files/images/certificate1.png" />
                                        </a>
                                        <a href="https://www.cao.ir/">
                                            <img alt="namad-1" src="project_files/images/certificate2.png" />
                                        </a>
                                        <a href="http://aira.ir/images/final3.pdf">
                                            <img alt="namad-2" src="project_files/images/certificate3.png" />
                                        </a>
                                        <a href="javascript:">
                                            <img alt="namad-2" src="project_files/images/enamad.png" />
                                        </a>
                                        <a href="https://www.iata.org/">
                                            <img alt="iata" src="project_files/images/iata.png" />
                                        </a>
                                        <a href="http://e-tourism.ir/fa/home.php">
                                            <img alt="namad-2" src="project_files/images/ECUNION-Logo(1).png" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="parent-grid-new--address">
                    <div class="child-item-footer">
                                <span class="badge-footer">
                                    <i class="fa-light fa-phone"></i>
                                    <span class="badge-footer-title">تلفن پشتیبانی</span>
                                </span>

                        <a class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                    </div>
{*                    <div class="child-item-footer">*}
{*                                        <span class="badge-footer">*}
{*                                            <i class="fa-light fa-phone"></i>*}
{*                                            <span class="badge-footer-title">تلفن پشتیبانی</span>*}
{*                                        </span>*}
{*                        <a class="__phone_class__" href="tel:02122221009">02122221009</a>*}
{*                    </div>*}
{*                    <div class="child-item-footer">*}
{*                                        <span class="badge-footer">*}
{*                                            <i class="fa-light fa-phone"></i>*}
{*                                            <span class="badge-footer-title">تلفن پشتیبانی</span>*}
{*                                        </span>*}
{*                        <a class="__phone_class__" href="tel:07136491316">07136491316</a>*}
{*                    </div>*}
{*                    <div class="child-item-footer">*}
{*                                        <span class="badge-footer">*}
{*                                            <i class="fa-light fa-mobile"></i>*}
{*                                            <span class="badge-footer-title">شماره موبایل</span>*}
{*                                        </span>*}
{*                        <a class="__mobile_class__" href="tel:09104136078">09104136078</a>*}
{*                    </div>*}
{*                    <div class="child-item-footer">*}
{*                                        <span class="badge-footer">*}
{*                                            <i class="fa-light fa-mobile"></i>*}
{*                                            <span class="badge-footer-title">شماره موبایل</span>*}
{*                                        </span>*}
{*                        <a class="__mobile_class__" href="tel:09129231203">09129231203</a>*}
{*                    </div>*}
{*                    <div class="child-item-footer">*}
{*                                <span class="badge-footer">*}
{*                                    <i class="fa-light fa-envelope"></i>*}
{*                                   <span class="badge-footer-title">ایمیل</span>*}
{*                                </span>*}
{*                        <a class="__email_class__" href="mailto:info@vistavisa.com" style='font-family: "Barlow", sans-serif;'>info@vistavisa.com</a>*}
{*                    </div>*}
{*                    <div class="child-item-footer">*}
{*                                <span class="badge-footer">*}
{*                                    <i class="fa-light fa-envelope"></i>*}
{*                                   <span class="badge-footer-title">ایمیل</span>*}
{*                                </span>*}
{*                        <a class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}" style='font-family: "Barlow", sans-serif;'>{$smarty.const.CLIENT_EMAIL}</a>*}
{*                    </div>*}
                </div>
            </div>
            <div class="last_text col-12 container">
                <div class="d-flex">
                    <a class="last_a" href="https://www.iran-tech.com/">طراحی سایت گردشگری </a>
                    <p class="last_p_text">: ایران تکنولوژی</p>
                </div>
                {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

                {foreach $socialLinks as $key => $val}
                    {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                {/foreach}
                <div class="__social_class__ footer-icon">
                    <a class="__telegram_class__ fab fa-telegram footer_telegram"
                       href="{if $telegramHref}{$telegramHref}{/if}" target="_blank">
                    </a>
                    <a class="__instagram_class__ fab fa-instagram footer_instagram"
                       href="{if $instagramHref}{$instagramHref}{/if}" target="_blank">
                    </a>
                    <a class="__whatsapp_class__ fab fa-whatsapp footer_whatsapp"
                       href="{if $whatsappHref}{$whatsappHref}{/if}" target="_blank">
                    </a>
                    <a class="__linkdin_class__ fa-brands fa-linkedin-in footer_linkedin"
                       href="{if $linkeDinHref}{$linkeDinHref}{/if}" target="_blank">
                    </a>
                </div>
            </div>
            <a href="javascript:" class="fixicone fa fa-angle-up" id="scroll-top" style=""></a>
        </footer>
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}

