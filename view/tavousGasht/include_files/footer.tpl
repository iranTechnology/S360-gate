{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <footer class="i_modular_footer">
            <img class="footer-icon" src="project_files/images/footer-icon.png" />
            <div class="body-footer">
                <h4>
                    بادبان 24
                </h4>
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
                        <a href="{$smarty.const.ROOT_ADDRESS}/mag">
                            وبلاگ
                        </a>
                    </li>
                    <li>
                        <a href="{$smarty.const.ROOT_ADDRESS}/authenticate">
                            باشگاه مشتریان
                        </a>
                    </li>
                </ul>
                <div class="phone-footer">
                    تلفن پشتیبانی:
                    <a class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">
                        {$smarty.const.CLIENT_PHONE}
                    </a>
                </div>
                <div class="namads">
                    <a href="javascript:">
                        <img referrerpolicy='origin' id = 'rgvjsizpnbqejxlzjxlzsizp' style = 'cursor:pointer' onclick = 'window.open("https://logo.samandehi.ir/Verify.aspx?id=392119&p=xlaopfvluiwkrfthrfthpfvl", "Popup","toolbar=no, scrollbars=no, location=no, statusbar=no, menubar=no, resizable=0, width=450, height=630, top=30")' alt = 'logo-samandehi' src = 'https://logo.samandehi.ir/logo.aspx?id=392119&p=qftibsiyodrfnbpdnbpdbsiy' />
                    </a>
{*                    <a href="*}
{*https://farasa.cao.ir/sysworkflow/fa/modern/3810212626028ab03488017019616799/6464336316028ab04e3c618028352200.php" target="_blank">*}
{*                        <img alt="Enamad1" src="project_files/images/certificate1.png"/>*}
{*                    </a>*}
{*                    <a href="https://www.caa.gov.ir/">*}
{*                        <img alt="namad-1" src="project_files/images/certificate2.png"/>*}
{*                    </a>*}
                    <a href="https://aira.ir/images/final3.pdf">
                        <img alt="namad-2" src="project_files/images/certificate3.png"/>
                    </a>
                    <a referrerpolicy='origin' target='_blank' href='https://trustseal.enamad.ir/?id=605518&Code=DC5SpyzJXlZ3tZfWoWNgztwYXSVcFTFd'><img referrerpolicy='origin' src='https://trustseal.enamad.ir/logo.aspx?id=605518&Code=DC5SpyzJXlZ3tZfWoWNgztwYXSVcFTFd' alt='' style='cursor:pointer' code='DC5SpyzJXlZ3tZfWoWNgztwYXSVcFTFd'></a>
                </div>
                {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref' , 'twitter' => 'twitterHref' , 'bale' => 'baleHref' , 'ita' => 'itaHref']}

                {foreach $socialLinks as $key => $val}
                    {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                {/foreach}
                <div class="__social_class__ social">
                    <a href="{if $telegramHref}{$telegramHref}{/if}" target='_blank'>
                        <img alt="telegram" src="project_files/images/gjgjgj.png" />
                    </a>
                    <a href="{if $itaHref}{$itaHref}{/if}" target='_blank'>
                        <img alt="eita" src="project_files/images/eita.png" />
                    </a>
                    <a class="__whatsapp_class__" href="{if $whatsappHref}{$whatsappHref}{/if}">
                        <img alt="Whatsapp" src="project_files/images/Whatsapp.png" />
                    </a>
                    <a class="__instagram_class__" href="{if $instagramHref}{$instagramHref}{/if}">
                        <img alt="instagram" src="project_files/images/instagram.png" />
                    </a>
                </div>
                <div class="last_text col-12">
                    <a class="last_a" href="https://www.iran-tech.com/" target='_blank'>
                        طراحی سایت گردشگری
                    </a>
                    <p class="last_p_text">
                        : ایران تکنولوژی
                    </p>
                </div>
            </div>
        </footer>
    {/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}