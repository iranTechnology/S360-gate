{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <svg id="wave" style="transform:rotate(0deg); transition: 0.3s" viewBox="0 0 1440 100" version="1.1" xmlns="http://www.w3.org/2000/svg"><defs><linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(253, 253, 253, 1)" offset="0%"></stop><stop stop-color="rgba(234.926, 234.926, 234.926, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 0px); opacity:1" fill="#1e1e1e" d="M0,10L40,18.3C80,27,160,43,240,50C320,57,400,53,480,46.7C560,40,640,30,720,21.7C800,13,880,7,960,11.7C1040,17,1120,33,1200,48.3C1280,63,1360,77,1440,78.3C1520,80,1600,70,1680,56.7C1760,43,1840,27,1920,21.7C2000,17,2080,23,2160,25C2240,27,2320,23,2400,33.3C2480,43,2560,67,2640,66.7C2720,67,2800,43,2880,33.3C2960,23,3040,27,3120,25C3200,23,3280,17,3360,15C3440,13,3520,17,3600,23.3C3680,30,3760,40,3840,40C3920,40,4000,30,4080,31.7C4160,33,4240,47,4320,51.7C4400,57,4480,53,4560,50C4640,47,4720,43,4800,45C4880,47,4960,53,5040,46.7C5120,40,5200,20,5280,10C5360,0,5440,0,5520,1.7C5600,3,5680,7,5720,8.3L5760,10L5760,100L5720,100C5680,100,5600,100,5520,100C5440,100,5360,100,5280,100C5200,100,5120,100,5040,100C4960,100,4880,100,4800,100C4720,100,4640,100,4560,100C4480,100,4400,100,4320,100C4240,100,4160,100,4080,100C4000,100,3920,100,3840,100C3760,100,3680,100,3600,100C3520,100,3440,100,3360,100C3280,100,3200,100,3120,100C3040,100,2960,100,2880,100C2800,100,2720,100,2640,100C2560,100,2480,100,2400,100C2320,100,2240,100,2160,100C2080,100,2000,100,1920,100C1840,100,1760,100,1680,100C1600,100,1520,100,1440,100C1360,100,1280,100,1200,100C1120,100,1040,100,960,100C880,100,800,100,720,100C640,100,560,100,480,100C400,100,320,100,240,100C160,100,80,100,40,100L0,100Z"></path><defs><linearGradient id="sw-gradient-1" x1="0" x2="0" y1="1" y2="0"><stop stop-color="rgba(253, 253, 253, 1)" offset="0%"></stop><stop stop-color="rgba(253, 253, 253, 1)" offset="100%"></stop></linearGradient></defs><path style="transform:translate(0, 50px); opacity:0.9" fill="#1e1e1e" d="M0,90L40,80C80,70,160,50,240,45C320,40,400,50,480,53.3C560,57,640,53,720,46.7C800,40,880,30,960,21.7C1040,13,1120,7,1200,15C1280,23,1360,47,1440,61.7C1520,77,1600,83,1680,81.7C1760,80,1840,70,1920,58.3C2000,47,2080,33,2160,33.3C2240,33,2320,47,2400,51.7C2480,57,2560,53,2640,45C2720,37,2800,23,2880,16.7C2960,10,3040,10,3120,16.7C3200,23,3280,37,3360,43.3C3440,50,3520,50,3600,46.7C3680,43,3760,37,3840,31.7C3920,27,4000,23,4080,18.3C4160,13,4240,7,4320,16.7C4400,27,4480,53,4560,56.7C4640,60,4720,40,4800,28.3C4880,17,4960,13,5040,15C5120,17,5200,23,5280,28.3C5360,33,5440,37,5520,38.3C5600,40,5680,40,5720,40L5760,40L5760,100L5720,100C5680,100,5600,100,5520,100C5440,100,5360,100,5280,100C5200,100,5120,100,5040,100C4960,100,4880,100,4800,100C4720,100,4640,100,4560,100C4480,100,4400,100,4320,100C4240,100,4160,100,4080,100C4000,100,3920,100,3840,100C3760,100,3680,100,3600,100C3520,100,3440,100,3360,100C3280,100,3200,100,3120,100C3040,100,2960,100,2880,100C2800,100,2720,100,2640,100C2560,100,2480,100,2400,100C2320,100,2240,100,2160,100C2080,100,2000,100,1920,100C1840,100,1760,100,1680,100C1600,100,1520,100,1440,100C1360,100,1280,100,1200,100C1120,100,1040,100,960,100C880,100,800,100,720,100C640,100,560,100,480,100C400,100,320,100,240,100C160,100,80,100,40,100L0,100Z"></path></svg>
        <footer class="i_modular_footer position-relative">
            
            <div class="body-footer">
                <div class="container">
                    <div class='pre-footer'>
                         <div class='pre-footer-parent'>
                                <div class='social-footer'>
                                    <a class="footer-brand" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}">
                                        <img alt="{$obj->Title_head()}" class="__logo_class__"
                                             src="project_files/images/logoFooter.png" />
                                    </a>
                                    {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                                    {assign var="socialLinksArray" value=[
                                    'telegram'=>'telegramHref',
                                    'whatsapp'=> 'whatsappHref',
                                    'instagram' => 'instagramHref',
                                    'aparat' => 'aparatHref',
                                    'youTube' => 'youtubeHref',
                                    'facebook' => 'facebookHref',
                                    'linkedin' => 'linkeDinHref' ,
                                    'rubika' => 'rubikaHref' ,
                                    'bale' => 'baleHref' ,
                                    'twitter' => 'twitterHref'
                                    ]}

                                    {foreach $socialLinks as $key => $val}
                                        {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                                    {/foreach}
                                    <div class="__social_class__ footer-icon icon-respancive">
                                        <a class="__telegram_class__ fab fa-telegram footer_telegram"
                                           href="{if $telegramHref}{$telegramHref}{/if}" target="_blank">
                                        </a>
                                        <a class="__instagram_class__ fab fa-instagram footer_instagram"
                                           href="{if $instagramHref}{$instagramHref}{/if}" target="_blank">
                                        </a>
                                        <a class="__whatsapp_class__ fab fa-whatsapp footer_whatsapp"
                                           href="{if $whatsappHref}{$whatsappHref}{/if}" target="_blank">
                                        </a>
                                        <a class="footer_linkedin"
                                           href="{if $rubikaHref}{$rubikaHref}{/if}" target="_blank">
                                            <svg fill="#fff" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="800px" height="800px"
                                                 viewBox="0 0 412.287 412.287" xml:space="preserve">
<g>
    <path d="M380.546,110.125L211.552,1.586c-3.293-2.115-7.515-2.115-10.807,0L31.744,110.081c-2.866,1.84-4.6,5.014-4.598,8.42   l0.041,180.039c0.002,3.476,1.806,6.699,4.767,8.519l168.961,103.75c1.605,0.986,3.419,1.479,5.233,1.479   c1.814,0,3.629-0.491,5.232-1.479L380.352,307.1c2.96-1.818,4.766-5.043,4.767-8.519l0.023-180.039   C385.143,115.137,383.409,111.965,380.546,110.125z M206.147,25.627l61.936,39.629l-61.936,39.627l-61.934-39.627L206.147,25.627z    M50.197,291.254v-63.938l60.692,36.848l0.01,64.377L50.197,291.254z M110.899,237.623l-60.703-37.285v-64.74l60.703,38.842   V237.623z M63.22,116.834l59.186-37.869l59.186,37.869l-59.186,37.869L63.22,116.834z M133.908,174.44l60.705-38.844v64.742   l-60.705,37.285V174.44z M133.938,277.927l40.348,25.815l-40.348,24.783V277.927L133.938,277.927z M194.642,379.952l-50.232-30.854   l50.232-30.847V379.952z M206.138,297.04l-62.076-38.765l62.076-38.592l62.076,38.733L206.138,297.04z M217.653,379.952v-61.645   l50.194,30.812L217.653,379.952z M278.358,328.571l-40.388-24.805l40.388-25.842V328.571z M278.388,237.67l-60.703-37.287v-64.736   l60.703,38.842V237.67z M230.708,116.879l59.186-37.867l59.186,37.867l-59.186,37.869L230.708,116.879z M362.104,291.3   l-60.705,37.286v-63.17l60.705-37.983V291.3z M362.104,200.383l-60.705,37.287v-63.182l60.705-38.844V200.383z"/>
</g>
</svg>
                                        </a>
                                        <a class="footer_linkedin"
                                           href="{if $baleHref}{$baleHref}{/if}" target="_blank">
                                            <svg fill="#fff" viewBox="0 0 24 24" role="img"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M11.425 23.987a12.218 12.218 0 0 1-2.95-.514 6.578 6.578 0 0 0-.336-.116C4.936 22.303 2.22 19.763.913 16.599a11.92 11.92 0 0 1-.9-4.063C.005 12.377.001 10.246 0 6.74 0 .71-.005 1.137.07.903.23.394.673.05 1.224.005c.421-.034.7.088 1.603.699.562.38 1.119.78 1.796 1.289.315.237.353.261.376.247l.35-.23c.58-.381 1.11-.677 1.7-.945A11.913 11.913 0 0 1 9.766.21a11.19 11.19 0 0 1 2.041-.2c1.14-.016 2.077.091 3.152.36 3.55.888 6.538 3.411 8.028 6.78.492 1.113.845 2.43.945 3.522.033.366.039.43.053.611.008.105.015.406.015.669 0 .783-.065 1.57-.169 2.064a5.474 5.474 0 0 0-.046.26c-.056.378-.214.987-.399 1.535-.205.613-.367.999-.684 1.633a11.95 11.95 0 0 1-2.623 3.436c-.44.396-.829.705-1.26 1.003-.647.445-1.307.812-2.039 1.134-.6.265-1.44.539-2.101.686a11.165 11.165 0 0 1-1.178.202 12.28 12.28 0 0 1-2.076.082zm-.61-5.92c.294-.06.678-.209.864-.337.144-.099.428-.376 2.064-2.013a161.8 161.8 0 0 1 1.764-1.753c.017 0 1.687-1.67 1.687-1.689 0-.02 1.64-1.648 1.661-1.648.01 0 .063-.047.118-.106.467-.495.682-.957.716-1.547.026-.433-.06-.909-.217-1.196a2.552 2.552 0 0 0-.983-1.024c-.281-.163-.512-.233-.888-.27-.306-.031-.688 0-.948.075-.243.07-.603.274-.853.481-.042.035-1.279 1.265-2.748 2.733l-2.671 2.67-1.093-1.09c-.6-.6-1.12-1.114-1.155-1.142a2.419 2.419 0 0 0-1.338-.51c-.404-.013-.91.09-1.224.25a2.89 2.89 0 0 0-.659.526c-.108.12-.287.357-.29.385-.003.03-.009.044-.065.16a2.312 2.312 0 0 0-.224.91c-.011.229-.01.265.019.491.045.353.24.781.51 1.115.05.063.97.992 2.044 2.064 1.507 1.505 1.98 1.97 2.074 2.039.327.24.683.388 1.101.456.182.03.5.016.734-.03z"/>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                                <div class='contactUs-footer'>
                                    <div class="child-item-footer2 align-items-start">
                                        <i class="fa-light fa-location-dot">
                                        </i>
                                        <div class="parent-text-address">
{*                                            آدرس:*}
                                            <span class="__address_class__ text-right">
          {$smarty.const.CLIENT_ADDRESS}
         </span>
                                        </div>
                                    </div>
                                    <div class="child-item-footer">
                                        <i class="fa-light fa-phone">
                                        </i>
{*                                        تلفن:*}
                                        <a class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">
                                            02166260003 - {$smarty.const.CLIENT_PHONE}
                                        </a>
                                    </div>
                                    <div class="child-item-footer">
                                        <i class="fa-light fa-mobile">
                                        </i>
{*                                        موبایل:*}
                                        <a class="__mobile_class__" href="tel:{$smarty.const.CLIENT_MOBILE}">
                                            {$smarty.const.CLIENT_MOBILE}
                                        </a>
                                    </div>
                                    <div class="child-item-footer">
                                        <i class="fa-light fa-envelope">
                                        </i>
{*                                        ایمیل:*}
                                        <a class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}" style='font-family: "Barlow", sans-serif;'>
                                            {$smarty.const.CLIENT_EMAIL}
                                        </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="row">
                        <div class="parent-footer-iran d-flex flex-wrap w-100">
                            <div class="item-footer col-lg-5 col-md-6 col-sm-6 col-12 order-foot1">
                                <div class="{*parent-item-footer parent-item-footer-responsive box-item-footer2*} box-item-footer">
                                    <h3>
                                        درباره آژانس مسافرتی شب باد گشت
                                    </h3>
                                    <div class="parent-about-footer text-right">
                                        <span class="__aboutUs_class__ text-footer-about">
                                         {$htmlContent = $about['body']|strip_tags}{$htmlContent}
                                        </span>
                                        <a class="{$smarty.const.ROOT_ADDRESS}/contactUs footer-more-link"
                                           href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
                                            بیشتر
                                            <svg class="mr-1" width="15" height="10" viewBox="0 0 15 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="currentColor" opacity="0.4" d="M10.4527 4.15949L13.3686 3.90161C14.023 3.90161 14.5536 4.43735 14.5536 5.09812C14.5536 5.75889 14.023 6.29463 13.3686 6.29463L10.4527 6.03674C9.93928 6.03674 9.52308 5.61649 9.52308 5.09812C9.52308 4.57888 9.93928 4.15949 10.4527 4.15949"></path>
                                                <path fill="currentColor" class="fill-current duration-200 transition dark:group-hover:text-blue-60 dark:text-blue-950 text-blue dark:hover:text-gray-210-700 grou-hover:text-dark-700" d="M0.660621 4.20689C0.706196 4.16087 0.87646 3.96637 1.0364 3.80487C1.96941 2.79331 4.40555 1.13921 5.67995 0.632993C5.87343 0.552242 6.36272 0.38032 6.62499 0.368164C6.87523 0.368164 7.11429 0.42634 7.34216 0.540954C7.6268 0.701589 7.85381 0.95513 7.97936 1.25382C8.05933 1.46048 8.18488 2.08131 8.18488 2.09259C8.30957 2.77073 8.3775 3.87346 8.3775 5.09255C8.3775 6.25259 8.30957 7.31017 8.20724 7.99959C8.19606 8.01175 8.07051 8.78192 7.93379 9.04589C7.68355 9.52866 7.19426 9.82735 6.67057 9.82735H6.62499C6.28361 9.81606 5.56644 9.5165 5.56644 9.50608C4.35998 8.99987 1.98145 7.42565 1.02522 6.37936C1.02522 6.37936 0.755212 6.11019 0.638263 5.94261C0.455961 5.70122 0.36481 5.40253 0.36481 5.10383C0.36481 4.77041 0.46714 4.46043 0.660621 4.20689"></path>
                                            </svg>
                                        </a>

                                    </div>
                                </div>
                            </div>
                            <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 order-foot2">
                                <div class="box-item-footer text-right">
                                    <h3>
                                        دسترسی آسان
                                    </h3>
                                    <ul>
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                تور داخلی*}
{*                                            </a>*}
{*                                        </li>*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/page/tour">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                تور خارجی*}
{*                                            </a>*}
{*                                        </li>*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/page/hotel">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                هتل*}
{*                                            </a>*}
{*                                        </li>*}

{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/page/visa">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                اطلاعات ویزا*}
{*                                            </a>*}
{*                                        </li>*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                تماس با ما*}
{*                                            </a>*}
{*                                        </li>*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/page/flight">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                پرواز*}
{*                                            </a>*}
{*                                        </li>*}
{*                                        <li>*}
{*                                            <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">*}
{*                                                <i class="fa-sharp fa-solid fa-square">*}
{*                                                </i>*}
{*                                                درباره ما*}
{*                                            </a>*}
{*                                        </li>*}
                                        {*                                        <li>*}
                                        {*                                            <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">*}
                                        {*                                                <i class="fa-sharp fa-solid fa-square">*}
                                        {*                                                </i>*}
                                        {*                                                پیگیری خرید*}
                                        {*                                            </a>*}
                                        {*                                        </li>*}
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
                                                درباره ما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/contactUs">
                                                تماس باما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">
                                                پیگیری خرید
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/rules">
                                                قوانین و مقررات
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{$smarty.const.ROOT_ADDRESS}/authenticate">
                                                باشگاه مشتریان
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-footer col-lg-2 col-md-6 col-sm-12 col-12 order-foot3">
                                <div class="box-item-footer">
                                    <h3>
                                        خدمات
                                    </h3>
                                    <ul>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/flight'>پرواز</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/hotel'>هتل</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/tour'>تور</a>
                                        </li>
                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/visa'> ویزا</a>
                                        </li>

                                        <li>
                                            <a href='{$smarty.const.ROOT_ADDRESS}/page/insurance'>بیمه</a>
                                        </li>


                                    </ul>
{*                                    <div class="parent-tour-footer">*}
{*                                        <a class="" href="javascript:">*}
{*                                            <img alt="img-tour" src="project_files/images/tour-france.jpg" />*}
{*                                            <div class="caption-tour">*}
{*                                                <h4>*}
{*                                                    تور فرانسه*}
{*                                                </h4>*}
{*                                                <span>*}
{*           2 بهمن 1403*}
{*          </span>*}
{*                                            </div>*}
{*                                        </a>*}
{*                                        <a class="" href="javascript:">*}
{*                                            <img alt="img-tour" src="project_files/images/tour-italya.jpg" />*}
{*                                            <div class="caption-tour">*}
{*                                                <h4>*}
{*                                                    تور ایتالیا*}
{*                                                </h4>*}
{*                                                <span>*}
{*           12 بهمن 1403*}
{*          </span>*}
{*                                            </div>*}
{*                                        </a>*}
{*                                        <a class="" href="javascript:">*}
{*                                            <img alt="img-tour" src="project_files/images/tour-sydney.jpg" />*}
{*                                            <div class="caption-tour">*}
{*                                                <h4>*}
{*                                                    تور استرالیا*}
{*                                                </h4>*}
{*                                                <span>*}
{*           18 بهمن 1403*}
{*          </span>*}
{*                                            </div>*}
{*                                        </a>*}
{*                                    </div>*}
                                </div>
                            </div>
                            <div class="item-footer col-lg-3 col-md-6 col-sm-6 col-12 order-foot4">
                                <div class="box-item-footer parent-contact-information">
                                    <h3>
                                        مجوز ها
                                    </h3>
                                    <div class="namads">
                                        <a target="_blank" rel="nofollow" href="https://www.cao.ir/paxrights"><img src="project_files/images/certificate1.png" alt=""></a>
                                        <a target="_blank" rel="nofollow" href="https://www.cao.ir/"><img src="project_files/images/certificate2.png" alt=""></a>
                                        <a target="_blank" rel="nofollow" href="http://aira.ir/images/final3.pdf"><img src="project_files/images/certificate3.png" alt=""></a>
                                        <a target="_blank" rel="nofollow" href="https://enamad.ir/"><img src="project_files/images/enamad.png" alt=""></a>
                                        <a target="_blank" rel="nofollow" href="https://samandehi.ir/Pages/HomePage.aspx"><img src="project_files/images/samandeh.jpg" alt=""></a>
                                        <a target="_blank" rel="nofollow" href="https://www.rai.ir/"><img src="project_files/images/logo_F.png" alt="logo_F"></a>
                                        <a target="_blank" rel="nofollow" href="https://www.haj.ir/"><img src="project_files/images/logo_F2.png" alt="logo_F2"></a>
                                        <a target="_blank" rel="nofollow" href="https://www.mcth.ir/"><img src="project_files/images/logo_F3.png" alt="logo_F3"></a>
                                    </div>
                                    {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                                    {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref']}

                                    {foreach $socialLinks as $key => $val}
                                        {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                                    {/foreach}
                                    <div class="__social_class__ footer-icon icon-respancive">
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
            <a class="fixicone fa fa-angle-up active-btn-up" href="javascript:" id="scroll-top" style=""></a>
        </footer>
        <div class="modal fade bd-example-modal-lg modal-calender-js" id="calenderBox"
             tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal_center_flight">
                <div class="modal-content modal-content-js">

                </div>
            </div>
        </div>
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}