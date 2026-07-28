<footer>
    <div class="body-footer">
        <div class="container">
            <div class="row">
                <div class="parent-footer-iran d-flex flex-wrap w-100">
                    <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12  display-footer-none">
                        <div class="box-item-footer text-right">
                            <h3>ونوس</h3>
                            <ul>
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
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/mag">
                                        مجله ونوس
                                    </a>
                                </li>
                                <li>
                                    <a  onclick="clickScroll('gym-box')" href="javascript:">
                                        باشگاه مشتریان
                                    </a>
                                </li>
                                <li>
                                    <a href="https://ravis.venustour.ir/">
                                        چارترهای ونوس
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 order-foot2">
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
                                    <a href="{$smarty.const.ROOT_ADDRESS}/faq">
                                        سوالات متداول
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12 ">
                        <div class="box-item-footer text-right">
                            <h3>اطلاعات تکمیلی</h3>
                            <ul>
                                <li>
                                    <a href="{$smarty.const.ROOT_ADDRESS}/page/license">
                                        مجوزها
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="item-footer col-lg-3 col-md-6 col-sm-12 col-12  order-foot1 text-center">
                        <div class="parent-item-footer parent-item-footer-responsive">
                            <div class="img-box-footer">
                                <img src="project_files/images/Venus_Logo_Transparent.png" alt="footer-logo">
                            </div>
                            <div class="child-item-footer">
                                <a href="tes:{$smarty.const.CLIENT_PHONE}" class="">
                                    {$smarty.const.CLIENT_PHONE}
                                    <i class="fa-regular font-18 mr-1 fa-phone my-phone"></i>
                                </a>
                            </div>
                            <div class="footer-icon my-footer-icon">
                                {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                                {foreach $socialLinks as $key => $socialMedia}
                                    {if $socialMedia['social_media'] == 'telegram'}
                                    <a target="_blank" href="{$socialMedia['link']}" class="fab fa-telegram footer_telegram"></a>
                                    {/if}
                                    {if $socialMedia['social_media'] == 'instagram'}
                                    <a target="_blank" href="{$socialMedia['link']}" class="fab fa-instagram footer_instagram"></a>
                                    {/if}
                                    {if $socialMedia['social_media'] == 'youtube'}
                                    <a target="_blank" href="{$socialMedia['link']}" class="fa-brands fa-youtube footer_whatsapp"></a>
                                    {/if}
                                    {if $socialMedia['social_media'] == 'aparat'}
                                    <a target="_blank" href="{$socialMedia['link']}" class=" footer_linkedin">
                                        <img class="icon-img" src="project_files/images/aparat.png" alt="aparat">
                                    </a>
                                    {/if}
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-namad">
            <div class="container">
                <div class="parent-about-namad-footer">
                    <div class="namads">
                        <a href="javascript:"><img src="project_files/images/certificate1.png" alt="Enamad1"></a>
                        <a href="javascript:"><img src="project_files/images/certificate2.png" alt="namad-1"></a>
                        <a>
                            <img referrerpolicy='origin' id = 'rgvjsizpwlaonbqeesgtapfu' style = 'cursor:pointer' onclick = 'window.open("https://logo.samandehi.ir/Verify.aspx?id=394205&p=xlaopfvlaodsuiwkobpddshw", "Popup","toolbar=no, scrollbars=no, location=no, statusbar=no, menubar=no, resizable=0, width=450, height=630, top=30")' alt = 'logo-samandehi' src = 'https://logo.samandehi.ir/logo.aspx?id=394205&p=qftibsiyshwlodrflymaujyn' />
                        </a>
                        <a referrerpolicy='origin'
                           target='_blank'
                           href='https://trustseal.enamad.ir/?id=12970&Code=jPcOrqNqGkIvBpZd5sga'>
                            <img referrerpolicy='origin'
                                 src='https://trustseal.enamad.ir/logo.aspx?id=12970&Code=jPcOrqNqGkIvBpZd5sga'
                                 alt=''
                                 style='cursor:pointer'
                                 Code='jPcOrqNqGkIvBpZd5sga'>
                        </a>
                    </div>
                    <div class="about-namad">
                        <h4>درباره ونوس</h4>
                        <p>
                            {$smarty.const.ABOUT_ME}

                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-mobile">
        <a href="javascript:" class="back-to-top footer__section">
            <i class="fa fa-angle-up"></i>
            <span>بازگشت به بالا</span>
        </a>
        <div id="accordion-faq" role="tablist" aria-multiselectable="true">
            <div class=" panel-default card">
                <div class="panel-heading card-header" role="tab" id="heading-faq-1">
                    <h4 class="panel-title mb-0 parent-accordion">
                        <a class="btn-link w-100 collapsed" data-toggle="collapse" data-parent="#accordion-faq"
                           href="#Collapse-faq-1" aria-expanded="false" aria-controls="Collapse-faq-1">
                            ونوس
                            <i class="fa icone-arrow"></i>
                        </a>
                    </h4>
                </div>
                <div id="Collapse-faq-1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-faq-1"
                     style="">
                    <ul class="ul-footer-mobile">
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
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/mag">
                                مجله ونوس
                            </a>
                        </li>
                        <li>
                            <a  onclick="clickScroll('gym-box')" href="javascript:">
                                باشگاه مشتریان
                            </a>
                        </li>
                        <li>
                            <a href="https://ravis.venustour.ir/">
                                چارترهای ونوس
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class=" panel-default card">
                <div class="panel-heading card-header" role="tab" id="heading-faq-2">
                    <h4 class="panel-title mb-0 parent-accordion">
                        <a class="btn-link w-100 collapsed" data-toggle="collapse" data-parent="#accordion-faq"
                           href="#Collapse-faq-2" aria-expanded="false" aria-controls="Collapse-faq-2">
                            خدمات مشتریان
                            <i class="fa icone-arrow"></i>
                        </a>
                    </h4>
                </div>
                <div id="Collapse-faq-2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-faq-2"
                     style="">
                    <ul class="ul-footer-mobile">
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
                            <a href="{$smarty.const.ROOT_ADDRESS}/faq">
                                سوالات متداول
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class=" panel-default card">
                <div class="panel-heading card-header" role="tab" id="heading-faq-3">
                    <h4 class="panel-title mb-0 parent-accordion">
                        <a class="collapsed btn-link w-100" data-toggle="collapse" data-parent="#accordion-faq"
                           href="#Collapse-faq-3" aria-expanded="false" aria-controls="Collapse-faq-3">
                            اطلاعات تکمیلی
                            <i class="fa icone-arrow"></i>
                        </a>
                    </h4>
                </div>
                <div id="Collapse-faq-3" class="panel-collapse collapse" role="tabpanel"
                     aria-labelledby="heading-faq-3">
                    <ul class="ul-footer-mobile">
                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS}/page/license">
                                مجوزها
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-mobile-namad">
            <div class="namads-mobile">
                <a href="javascript:"><img src="project_files/images/certificate1.png" alt="Enamad1"></a>
                <a href="javascript:"><img src="project_files/images/certificate2.png" alt="namad-1"></a>
                <a href="javascript:"><img src="project_files/images/certificate3.png" alt="namad-2"></a>
                <a href="javascript:"><img src="project_files/images/enamad.png" alt="namad-2">
                </a>
            </div>
        </div>
        <div class="parent-item-footer parent-item-footer-responsive">
            <div class="img-box-footer">
                <img src="project_files/images/Venus_Logo_Transparent.png" alt="footer-logo">
            </div>
            <div class="child-item-footer">
                <i class="fa-regular fa-phone icon-mobile-phone"></i>
                <span class="text-mobile-phone">تلفن:</span>
                <a href="tel:{$smarty.const.CLIENT_PHONE}" class="">
                    {$smarty.const.CLIENT_PHONE}
                </a>
            </div>
        </div>
    </div>
    <div class="last_text col-12">
        <a class="last_a" href="https://www.iran-tech.com/">طراحی سایت گردشگری </a>
        <p class="last_p_text">: ایران تکنولوژی</p>
    </div>
    <a href="javascript:" class="fixicone fa fa-angle-up" id="scroll-top"></a>
</footer>
