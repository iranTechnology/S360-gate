{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

        <footer class="site-footer">
            <div class="container container_foo">
                <div class="row">
                    <div class="col-xs-6 col-md-3">
                        <h6>تور های مسافرتی </h6>
                        <ul class="footer-links">
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/fa/resultTourLocal/1-all/1-all/{$objDate->jtoday()}/all">تورهای داخلی</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/fa/resultTourLocal/all-all/all-all/{$objDate->jtoday()}/all">تورهای خارجی</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-6 col-md-3">
                        <h6>بلیط هواپیما</h6>
                        <ul class="footer-links">
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/international/1/IKA-IST/{$objDate->jtoday()}/Y/1-0-0/">  بلیط هواپیما استانبول</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/search-flight/1/THR-SYZ/{$objDate->jtoday()}/Y/1-0-0/">بلیط هواپیما شیراز</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/international/1/IKA-CDG/{$objDate->jtoday()}/Y/1-0-0/"> بلیط هواپیما پاریس </a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/search-flight/1/THR-MHD/{$objDate->jtoday()}/Y/1-0-0/">بلیط هواپیما مشهد</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/international/1/IKA-DXB/{$objDate->jtoday()}/Y/1-0-0/"> بلیط هواپیما دبی</a></li>
                            <li><a href="{$smarty.const.ROOT_ADDRESS}/search-flight/1/THR-KIH/{$objDate->jtoday()}/Y/1-0-0/">بلیط هواپیما کیش</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <h6>درباره ما</h6>
                        <p class="text-justify"> {$smarty.const.ABOUT_ME} </p>
                    </div>





                    <div class="col-xs-12 col-md-12 foo_l">
                        <div class="col-md-6 col-lg-6 col-xl-6 text-xl-right logo-moshtari">

                            <ul style="text-align: right">
                                <li>
                                    <a href="https://www.cao.ir/paxrights" target="_blank" rel="nofollow" >
                                        <img src="project_files/images/certificate1.png" alt=""></a>
                                </li>
                                <li>
                                    <a rel="nofollow" target="_blank" href="https://www.cao.ir/" ><img src="project_files/images/certificate2.png" alt=""></a>
                                </li>
                                <li>
                                    <a rel="nofollow" target="_blank" href="http://aira.ir/" ><img src="project_files/images/certificate3.png" alt=""></a>
                                </li>

                            </ul>


                        </div>

                        <div class="col-md-6 col-lg-6 col-xl-6 text-xl-left center logo_foo">
                            <a href="http://{$smarty.const.CLIENT_MAIN_DOMAIN}/" class="logo_foo_a">
                                <img class="inverse-logo" src="project_files/images/logo-foo.png" alt="{$smarty.const.CLIENT_NAME}" ></a>
                        </div>
                    </div>
                </div>
                <hr>
            </div>

            <div class="container">
                <div class="row row-fix justify-content-sm-center align-items-md-center row-30">


                    <div class="col-md-10 col-lg-7 col-xl-6 text-xl-right">
                        <ul class="group-xs group-middle">
                            <li><a class="fab fa-facebook-f SMFaceBook" ></a></li>
                            <li><a class="fab fa-telegram-plane SMTelegram"></a></li>
                            <li><a class="fab fa-instagram SMInstageram"></a></li>
                            <li><a class="fab fa-twitter SMTwitter"></a></li>
                        </ul>
                    </div>
                    <div class="col-md-10 col-lg-7 col-xl-6">
                        <p class="text-xl-left"><a href="https://www.iran-tech.com/"> طراحی سایت گردشگری </a> : ایران تکنولوژی</p>
                    </div>
                </div>
            </div>
        </footer>
        <a id="scroll-top" style="cursor: pointer;">
            <button><i class="fas fa-arrow-up"></i></button>
        </a>
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