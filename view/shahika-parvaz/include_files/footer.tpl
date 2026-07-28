
{if $smarty.session.layout neq 'pwa'}
    {if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
        <svg version="1.1" id="wave_footer" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 250"
             enable-background="new 0 0 500 250" xml:space="preserve" preserveAspectRatio="none">
    <path d="M250,246.5c-97.85,0-186.344-40.044-250-104.633V250h500V141.867C436.344,206.456,347.85,246.5,250,246.5z"></path>

    </svg>
        <footer class="footer">
            <div class="footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-md-6 col-lg-3 col_foo">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    درباره ما
                                </h3>
                             <span class='text-footer-about'>
{$smarty.const.ABOUT_ME}                             </span>
                                <a class=" footer-more-link" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
                                    بیشتر
                                    <svg class="mr-1" width="15" height="10" viewBox="0 0 15 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill="currentColor" opacity="0.4" d="M10.4527 4.15949L13.3686 3.90161C14.023 3.90161 14.5536 4.43735 14.5536 5.09812C14.5536 5.75889 14.023 6.29463 13.3686 6.29463L10.4527 6.03674C9.93928 6.03674 9.52308 5.61649 9.52308 5.09812C9.52308 4.57888 9.93928 4.15949 10.4527 4.15949"></path>
                                        <path fill="currentColor" class="fill-current duration-200 transition dark:group-hover:text-blue-60 dark:text-blue-950 text-blue dark:hover:text-gray-210-700 grou-hover:text-dark-700" d="M0.660621 4.20689C0.706196 4.16087 0.87646 3.96637 1.0364 3.80487C1.96941 2.79331 4.40555 1.13921 5.67995 0.632993C5.87343 0.552242 6.36272 0.38032 6.62499 0.368164C6.87523 0.368164 7.11429 0.42634 7.34216 0.540954C7.6268 0.701589 7.85381 0.95513 7.97936 1.25382C8.05933 1.46048 8.18488 2.08131 8.18488 2.09259C8.30957 2.77073 8.3775 3.87346 8.3775 5.09255C8.3775 6.25259 8.30957 7.31017 8.20724 7.99959C8.19606 8.01175 8.07051 8.78192 7.93379 9.04589C7.68355 9.52866 7.19426 9.82735 6.67057 9.82735H6.62499C6.28361 9.81606 5.56644 9.5165 5.56644 9.50608C4.35998 8.99987 1.98145 7.42565 1.02522 6.37936C1.02522 6.37936 0.755212 6.11019 0.638263 5.94261C0.455961 5.70122 0.36481 5.40253 0.36481 5.10383C0.36481 4.77041 0.46714 4.46043 0.660621 4.20689"></path>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3 col_foo">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    دسترسی آسان
                                </h3>
                                <ul class="links double_links">
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/page/tour-internal">تور داخلی</a></li>
                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/page/tour-international">تور خارجی</a>
                                    </li>

                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/mag"> وبلاگ </a>
                                    </li>

                                    <li class="">
                                        <a href="{$smarty.const.ROOT_ADDRESS}/rules">قوانین و مقررات</a>
                                    </li>

                                    <li>
                                        <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking">پیگیری خرید</a>
                                    </li>

                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/contactUs">تماس با ما</a></li>

                                    <li>
                                        <a href="https://{$smarty.const.CLIENT_DOMAIN}#ozviatkhabar">
                                            عضویت درخبرنامه </a>
                                    </li>
                                    <li><a href="{$smarty.const.ROOT_ADDRESS}/aboutUs"> درباره ما </a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3 col_foo foo_contact">

                            <div class="address footer_widget">
                                <h3 class="footer_title">
                                    ##S360ContactUs##
                                </h3>
                                <div class="contact_info_text ">
                                    <i class="fa fa-map-marker"></i>
                                    <a>
                                        {$smarty.const.CLIENT_ADDRESS}
                                    </a>
                                </div>
                                <div class="contact_info_text">
                                    <i class="fa fa-phone"></i>
                                    <a href="tel:{$smarty.const.CLIENT_PHONE}" target="_top"
                                       class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</a>
                                </div>
                                <div class="contact_info_text">
                                    <i class="fa fa-mobile "></i>
                                    <a href="tel:{$smarty.const.CLIENT_MOBILE}" target="_top">{$smarty.const.CLIENT_MOBILE}</a>
                                </div>
                                <div class="contact_info_text">
                                    <i class="fa fa-envelope"></i>
                                    <a href="mailto:{$smarty.const.CLIENT_EMAIL}" target="_top" class="SMFooterEmail">{$smarty.const.CLIENT_EMAIL}</a>
                                </div>
                                {load_presentation_object filename="aboutUs" assign="objAbout"}
                                {assign var="about"  value=$objAbout->getData()}
                                {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
                                {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref', 'aparat' => 'aparatHref']}

                                {foreach $socialLinks as $key => $val}
                                    {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
                                {/foreach}
                                <div class="footer_icons">
                                    <a href="{if $instagramHref}{$instagramHref}{else}javascript:;{/if}" target="_blank" class="footer_instagram"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path></svg></a>
                                    <a href="{if $whatsappHref}{$whatsappHref}{else}javascript:;{/if}" target="_blank" class="footer_whatsapp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"></path></svg></a>
                                    <a href="{if $telegramHref}{$telegramHref}{else}javascript:;{/if}" target="_blank" class="footer_telegram"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M248,8C111.033,8,0,119.033,0,256S111.033,504,248,504,496,392.967,496,256,384.967,8,248,8ZM362.952,176.66c-3.732,39.215-19.881,134.378-28.1,178.3-3.476,18.584-10.322,24.816-16.948,25.425-14.4,1.326-25.338-9.517-39.287-18.661-21.827-14.308-34.158-23.215-55.346-37.177-24.485-16.135-8.612-25,5.342-39.5,3.652-3.793,67.107-61.51,68.335-66.746.153-.655.3-3.1-1.154-4.384s-3.59-.849-5.135-.5q-3.283.746-104.608,69.142-14.845,10.194-26.894,9.934c-8.855-.191-25.888-5.006-38.551-9.123-15.531-5.048-27.875-7.717-26.8-16.291q.84-6.7,18.45-13.7,108.446-47.248,144.628-62.3c68.872-28.647,83.183-33.623,92.511-33.789,2.052-.034,6.639.474,9.61,2.885a10.452,10.452,0,0,1,3.53,6.716A43.765,43.765,0,0,1,362.952,176.66Z"></path></svg></a>
                                </div>
                            </div>

                        </div>
                        <div class="col-12 ">
                            <div class="col_namads">
                                <a target="_blank" rel="nofollow" href="https://www.cao.ir/paxrights">
                                    <img src="project_files/images/certificate1.png" alt="img">
                                </a>
                                <a target="_blank" rel="nofollow" href="https://www.cao.ir/">
                                    <img src="project_files/images/certificate2.png" alt="img">
                                </a>
                                <a target="_blank" rel="nofollow" href="http://aira.ir/images/final3.pdf">
                                    <img src="project_files/images/certificate3.png" alt="img">
                                </a>
                                <a target="_blank" rel="nofollow">
                                    <img src="project_files/images/enamad.png" alt="img">
                                </a>
                                <a target="_blank" rel="nofollow" >
                                    <img src="project_files/images/samandeh.jpg" alt="img">
                                </a>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right_text">
                <div class="container">

                    <div class="row">
                        <div class="col-xl-12">
                            <div class="copyright_content d-flex flex-row justify-content-center">

                                <a href="https://www.iran-tech.com/" target="_blank">##OsafarTravelAgencyDesign##</a>

                                : ##Osafarirantech##
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <a href="javascript:;" id="scroll-top" data-type="section-switch" class="scrollup back-top">
            <i class="fa fa-angle-up"></i>
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