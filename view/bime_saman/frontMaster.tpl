{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{load_presentation_object filename="contactUs" assign="objContact"}

{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}
{assign var="gds_project_file_name" value="bime_saman"}
<!doctype html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="{$obj->Title_head()}">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{$obj->Title_head()}</title>
    <base href="{$smarty.const.CLIENT_DOMAIN}"/>

    <link rel="stylesheet" type="text/css" href="https://{$smarty.const.CLIENT_MAIN_DOMAIN}/fa/user/GlobalFile/css/register.css">
    <link rel="shortcut icon" type="image/png" href="project_files/images/favicone.png">

    {literal}
        <script src="project_files/js/jquery-3.4.1.min.js"></script>
    {/literal}

    {if $smarty.session.layout neq 'pwa'}
        <link rel="stylesheet" href="project_files/css/bootstrap.min.css">
        <link rel="stylesheet" href="project_files/css/header.css">
    {/if}

    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentHead.tpl"}


</head>
<body>

{if $smarty.session.layout neq 'pwa' }
    <header class="my-header">
        <div class="header-top">
            <div class="container">
                <div class="parent-header-phone">
                    <span>خرید تلفنی :</span>
                    <span> 02165823674 - 09100624168</span>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="parent-header-logo-svg">
                    <a href="https://www.sam24.ir/">
                        <img src="project_files/images/logo.png" alt="img-logo">
                    </a>
                    <div class="parent-svg-xmark-menu">
                        <svg class="svg-menu-click" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z"/></svg>
                        <svg class="svg-xmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M393.4 41.4c12.5-12.5 32.8-12.5 45.3 0s12.5 32.8 0 45.3L269.3 256 438.6 425.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L224 301.3 54.6 470.6c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L178.7 256 9.4 86.6C-3.1 74.1-3.1 53.9 9.4 41.4s32.8-12.5 45.3 0L224 210.7 393.4 41.4z"/></svg>
                    </div>
                </div>
            </div>
        </div>

        <div class="box-hamburger">
            <div class="menu-hamburger">
                <ul class="nav-hamburger">
                    <li>
                        <a href="https://www.sam24.ir">خانه</a>
                    </li>
                    <li>
                        <a href="https://www.sam24.ir/%d8%aa%d9%85%d8%a7%d8%b3-%d8%a8%d8%a7-%d9%85%d8%a7/">تماس با ما</a>
                    </li>
                    <li>
                        <a href="https://www.sam24.ir/shop/">خرید آنلاین بیمه مسافرتی سامان</a>
                    </li>
                    <li>
                        <a href="javascript:" class="clickable">
                                <span>
                                    حساب کاربری من
                                </span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M362.7 203.9l-159.1 144c-6.125 5.469-15.31 5.469-21.44 0L21.29 203.9C14.73 197.1 14.2 187.9 20.1 181.3C26.38 174.4 36.5 174.5 42.73 180.1L192 314.5l149.3-134.4c6.594-5.877 16.69-5.361 22.62 1.188C369.8 187.9 369.3 197.1 362.7 203.9z"/></svg>
                        </a>
                        <ul class="nav-hamburger-internal">
                            <li>
                                <a href="https://www.sam24.ir/my-account/">حساب کاربری من</a>
                            </li>
                            <li>
                                <a href="https://www.sam24.ir/my-account/cart/">سبد خرید</a>
                            </li>
                            <li>
                                <a href="https://www.sam24.ir/my-account/checkout/">پرداخت</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="https://www.sam24.ir/%d8%ae%d8%b1%db%8c%d8%af-%d8%aa%d9%84%d9%81%d9%86%db%8c-%d9%88-%d9%88%d8%a7%d8%aa%d8%b3-%d8%a2%d9%be/">خرید تلفنی و واتس آپ</a>
                    </li>
                    <li>
                        <a href="javascript:" class="clickable">
                                <span>
                                    پوشش های بیمه مسافرتی سامان
                                </span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M362.7 203.9l-159.1 144c-6.125 5.469-15.31 5.469-21.44 0L21.29 203.9C14.73 197.1 14.2 187.9 20.1 181.3C26.38 174.4 36.5 174.5 42.73 180.1L192 314.5l149.3-134.4c6.594-5.877 16.69-5.361 22.62 1.188C369.8 187.9 369.3 197.1 362.7 203.9z"/></svg>
                        </a>
                        <ul class="nav-hamburger-internal">
                            <li>
                                <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">پوشش های بیمه مسافرتی سامان</a>
                            </li>
                            <li>
                                <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/%d8%b4%d8%b1%d8%a7%db%8c%d8%b7-%d9%88-%d8%b6%d9%88%d8%a7%d8%a8%d8%b7-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">شرایط و ضوابط بیمه مسافرتی سامان</a>
                            </li>
                            <li>
                                <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c/">بیمه مسافرتی</a>
                            </li>
                            <li>
                                <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/%d8%a7%d8%b3%d8%aa%d8%b9%d9%84%d8%a7%d9%85-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">استعلام بیمه مسافرتی سامان</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="https://www.sam24.ir/%d8%a7%d8%ae%d8%a8%d8%a7%d8%b1-%d9%88-%d8%a7%d8%b7%d9%84%d8%a7%d8%b9%db%8c%d9%87/">اخبار و اطلاعیه</a>
                    </li>
                </ul>
            </div>
            <div class="back-hamburger"></div>
        </div>
    </header>
{/if}
{if $smarty.const.GDS_SWITCH eq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
{else}
    <div class="content_tech">
        <div class="container">
            <div class="temp-wrapper">
                {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentMain.tpl"}
            </div>
        </div>
    </div>
{/if}
{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

    <footer>
        <div class="parent-footer-bimeh">
            <div class="container parent-grid-bimeh">
                <div class="box-footer">
                    <h5>تلفن پشتیبانی بیمه سامان</h5>
                    <div class="parent-address-footer">
                        <p>تلفن پشتیبانی</p>
                        <p>09100624168</p>
                        <p>02165823674</p>
                        <p>ایمیل :</p>
                        <p>info[@]sam24.ir</p>
                    </div>
                </div>
                <div class="box-footer">
                    <h5>بیمه مسافرتی سامان</h5>
                    <ul>
                        <li>
                            <a href="https://www.sam24.ir/%d8%a7%d8%ae%d8%a8%d8%a7%d8%b1-%d9%88-%d8%a7%d8%b7%d9%84%d8%a7%d8%b9%db%8c%d9%87/">
                                اخبار و اطلاعیه
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/">
                                بیمه مسافرتی سامان
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">
                                پوشش های بیمه مسافرتی سامان
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">
                                پوشش های بیمه مسافرتی سامان
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/%d8%a7%d8%b3%d8%aa%d8%b9%d9%84%d8%a7%d9%85-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">
                                استعلام بیمه مسافرتی سامان
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c/">
                                بیمه مسافرتی
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d9%be%d9%88%d8%b4%d8%b4-%d9%87%d8%a7%db%8c-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/%d8%b4%d8%b1%d8%a7%db%8c%d8%b7-%d9%88-%d8%b6%d9%88%d8%a7%d8%a8%d8%b7-%d8%a8%db%8c%d9%85%d9%87-%d9%85%d8%b3%d8%a7%d9%81%d8%b1%d8%aa%db%8c-%d8%b3%d8%a7%d9%85%d8%a7%d9%86/">
                                شرایط و ضوابط بیمه مسافرتی سامان
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d8%aa%d9%85%d8%a7%d8%b3-%d8%a8%d8%a7-%d9%85%d8%a7/">
                                تماس با ما
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/my-account/">
                                حساب کاربری من
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/my-account/checkout/">
                                پرداخت
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/my-account/cart/">
                                سبد خرید
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/shop/">
                                خرید آنلاین بیمه مسافرتی سامان
                            </a>
                        </li>
                        <li>
                            <a href="https://www.sam24.ir/%d8%ae%d8%b1%db%8c%d8%af-%d8%aa%d9%84%d9%81%d9%86%db%8c-%d9%88-%d9%88%d8%a7%d8%aa%d8%b3-%d8%a2%d9%be/">
                                خرید تلفنی و واتس آپ
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="socket_color" >
            <div class="container parent-item-bottom">
                <div class="parent-text-iran-tech">
                    <a class="last_a" href="https://www.iran-tech.com/">طراحی سایت گردشگری </a>
                    <p class="last_p_text">: ایران تکنولوژی</p>
                </div>
                <div class=''>
                    کلیه حقوق این وب سایت متعلق به گروه sam24 می باشد
                </div>
                <ul class="noLightbox social_bookmarks icon_count_2">
                    <li class=" social_icon">
                        <a target="_blank"  href="https://www.instagram.com/sam24_ir/" aria-hidden="false" data-av_icon="" data-av_iconfont="entypo-fontello" title="Instagram" rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
                        </a>
                    </li>
                    <li class=" social_icon">
                        <a target="_blank"  href="https://api.whatsapp.com/send?phone=989100624168" aria-hidden="false" data-av_icon="" data-av_iconfont="entypo-fontello" title="WhatsApp" rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>
{/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}
<div class="p-popup-container">
    <div class="p-popup-wrapper">
        <span class="p-close-popup"></span>
        <div id="ShowPopup"></div>
    </div>
</div>
</body>

{literal}
    <script src="project_files/js/bootstrap.min.js"></script>
    <script src="project_files/js/header.js"></script>
{/literal}
{if $smarty.const.GDS_SWITCH neq 'app'}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`contentFooter.tpl"}
{/if}

</html>