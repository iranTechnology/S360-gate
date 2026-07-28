{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{assign var="socialLinks"  value=$about['social_links']|json_decode:true}

{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

    <footer>
        <div class="container">
            <div class="row footer-row">
                <div class="col-lg-2 col-md-4 col-sm-12 col-12">
                    <div class="link-menu-footer">
                        <h3 class="titr-footer">دسترسی آسان</h3>
                        <ul>
                            <li><a href="https://vcr.salamat.gov.ir/">دریافت کارت واکسن</a></li>
                            <li><a href="https://sadadpsp.ir/tollpayment/">پرداخت عوارض خروج</a></li>
                            <li><a href="https://my.ssaa.ir/portal/executive/inquery-exitban">استعلام ممنوع الخروجی  </a></li>
                            <li><a href="https://mehrabad.airport.ir/69">ترمینال‌های فرودگاه مهرآباد</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 col-sm-12 col-12">
                    <div class="text-footer">
                        <h3 class="titr-footer">درباره ورسا گشت</h3>
                        <p>
                            {$smarty.const.ABOUT_ME}
                        </p>
                    </div>
                </div>
                <div class="col-lg-5 col-md-8 col-sm-12 col-12">
                    <div class="contact-footer">
                        <h3 class="titr-footer">تماس با ورسا گشت</h3>
                        <div class="item-contact-footer">
                            <i class="fa-sharp fa-solid fa-phone-flip"></i>
                            <span>خط ویژه:</span>
                            <a href="tel:{$smarty.const.CLIENT_PHONE}">{$smarty.const.CLIENT_PHONE}</a>
                        </div>
                        <div class="item-contact-footer">
                            {assign var='additional_data' value=$smarty.const.ADDITIONAL_DATA|json_decode:true}

                            {if $additional_data}
                                <i class="fa-sharp fa-solid fa-phone-flip"></i>
                                <span>خط پشتیبانی : </span>
                                {$mobile_data = array('09020363730','09020363731','09020363732')}
                                {foreach $additional_data as $index => $item}

                                    {*                                {$item|var_dump}*}
                                    {if $item['title']|substr:0:2 eq '09' || $item['title']|substr:0:4 eq '+989' || $item['title']|substr:0:2 eq '02'}

                                        <a href="tel:{$item['title']}">{$item['title']}</a>
                                        {if isset($additional_data[$index + 1])}
                                            <span>-</span>
                                        {/if}
                                    {/if}
                                {/foreach}
                            {/if}
                        </div>
                        <div class="item-contact-footer">
                            <i class="fa-solid fa-envelope"></i>
                            <a href="mailto:{$smarty.const.CLIENT_EMAIL}">{$smarty.const.CLIENT_EMAIL}</a>
                        </div>
                        <div class="item-contact-footer">
                            <i class="fa-solid fa-location-dot"></i>
                            {$smarty.const.CLIENT_ADDRESS}
                        </div>
{*                        <form  method="get" class="footer-form">*}
{*                            <input  id="tracking" type="text" placeholder="کد رهگیری خود را وارد کنید..." autocomplete="off">*}
{*                            <button>*}
{*                                ثبت*}
{*                            </button>*}
{*                        </form>*}
                    </div>
                </div>
                <div class="parent-namad">
                    <div class="namads">
                        <a href="https://caa.gov.ir/"><img src="project_files/images/certificate2.png" alt="namad-2"></a>
                        <a href="http://www.aira.ir/"><img src="project_files/images/certificate3.png" alt="namad-3"></a>
{*                        <a referrerpolicy="origin" target="_blank" href="https://trustseal.enamad.ir/?id=172364&Code=8tYZKjuuMGtvLYjwMEFX"><img referrerpolicy="origin" src="https://Trustseal.eNamad.ir/logo.aspx?id=172364&Code=8tYZKjuuMGtvLYjwMEFX" alt="" style="cursor:pointer" id="8tYZKjuuMGtvLYjwMEFX"></a>*}
                        <a referrerpolicy='origin' target='_blank' href='https://trustseal.enamad.ir/?id=172364&Code=8tYZKjuuMGtvLYjwMEFX'><img referrerpolicy='origin' src='https://trustseal.enamad.ir/logo.aspx?id=172364&Code=8tYZKjuuMGtvLYjwMEFX' alt='' style='cursor:pointer' code='8tYZKjuuMGtvLYjwMEFX'></a>
                        <a href="https://www.haj.ir/"><img src="project_files/images/hajArm.png" alt="namad-2"></a>
                        <a href="https://www.rai.ir/"><img src="project_files/images/RAI-logo.png" alt="namad-2"></a>
                        <a href="https://www.mcth.ir/"><img src="project_files/images/nkchto-pic.png" alt="namad-2"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="parent-footer-bottom">
                    <div class="iran-tech">
                        <a class="last_a" href="https://www.iran-tech.com">طراحی سایت گردشگری</a>
                        <p class="last_p_text">: ایران تکنولوژی</p>
                    </div>
                    <div class="footer-icon">
                        {foreach $socialLinks as $key => $socialMedia}
                            {if $socialMedia['social_media'] == 'instagram'}
                                <a target="_blank" href="{$socialMedia['link']}" class="">
                                    <img src="project_files/images/insta.png" alt="telegram">
                                </a>
                            {/if}
                            {if $socialMedia['social_media'] == 'whatsapp'}
                                <a target="_blank" href="{$socialMedia['link']}" class="">
                                    <img src="project_files/images/whatsap.png" alt="telegram">
                                </a>
                            {/if}
                            {if $socialMedia['social_media'] == 'telegram'}
                                <a target="_blank" href="{$socialMedia['link']}" class="">
                                    <img src="project_files/images/telegram.png" alt="telegram">
                                </a>
                            {/if}
                            {if $socialMedia['social_media'] == 'ita'}
                                <a target="_blank" href="{$socialMedia['link']}" class="">
                                    <img src="project_files/images/ita.png" alt="telegram">
                                </a>
                            {/if}
                            {if $socialMedia['social_media'] == 'bale'}
                                <a target="_blank" href="{$socialMedia['link']}" class="">
                                    <img src="project_files/images/bale.png" alt="telegram">
                                </a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        <a href="javascript:" class="fixicone fa fa-angle-up" id="scroll-top"></a>
    </footer>
    <div class="modal fade bd-example-modal-lg modal-calender-js" id="calenderBox"
         tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal_center_flight">
            <div class="modal-content modal-content-js">

            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-lg" id="ModalOfFifteenFlights"
         tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                ...
            </div>
        </div>
    </div>
{/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}