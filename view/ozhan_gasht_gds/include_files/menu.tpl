{load_presentation_object filename="frontMaster" assign="obj"}
{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
{load_presentation_object filename="reservationBasicInformation" assign="objResult"}
{if $smarty.session['userId'] }
    {assign var="userInfo" value=functions::infoMember($smarty.session.userId)}
    {assign var="hashedPass" value=functions::HashKey({$userInfo['email']},'encrypt')}
{/if}

{if $smarty.session.layout neq 'pwa' }
    <header id="header" class="header_area">
        <div class="main_header_area animated" id="navbar">
            <nav id="navigation1" class="navigation">
                <div class="box-header-top">
                    <div class="container">
                        <div class="item-parent-header-top">
                            <div class='register'>
                                <a href="https://online.ozhangasht.com/gds/fa/loginUser" class="">ورود به حساب </a>
                                <a href="https://online.ozhangasht.com/gds/fa/registerUser" class="">ثبت نام حساب کاربری</a>
                            </div>
                            <div class="mx-auto div-phone-email">
                                <a href="tel:+987691001177" class="item-phone-email">
                                    <i class="fa-solid fa-phone-flip"></i>
                                    76-91001177 98+
                                </a>
                                <a href="tel:+982191001777" class="item-phone-email">
                                    <i class="fa-solid fa-phone-flip"></i>
                                    21-91001777 98+
                                </a>
                                {*                                <a href="tel:+982191007767" class="item-phone-email">*}
                                {*                                    <i class="fa-solid fa-phone-flip"></i>*}
                                {*                                     21-91007767 98+*}
                                {*                                </a>*}
                                <a href="mail:info@ozhangasht.com" class="item-phone-email">
                                    <i class="fa-solid fa-envelope"></i>
                                    info@ozhangasht.com
                                </a>
                            </div>
                            <div class="div-language">
                                <a href="https://ozhangasht.com/tr/" class="">Turkish </a>
                                <a href="https://ozhangasht.com/ru/" class="">Русский</a>
                                <a href="https://ozhangasht.com/zh/" class="">中国人</a>
                                <a href="https://ozhangasht.com/en/" class="">English</a>
                                <a href="https://ozhangasht.com/ar/" class="">العربیة</a>
                                <a href="https://ozhangasht.com" class="active-language">فارسی</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-header-center">
                    <div class="container">
                        <div class="item-parent-header-center">
                            <div class="nav-header">
                                <a class="nav-brand" href="https://ozhangasht.com">
                                    <img src='project_files/images/logo.png' alt='logo'>
                                    <div class="titr-logo">
                                        <span>آژانس هواپیمایی و گردشگری</span>
                                        <h1>اوژن گشت کیش</h1>
                                    </div>
                                </a>
                            </div>
                            <div class="parent-media">
                                <a class="button  " href="javascript:">
                                    <a href="javascript:" class="main-navigation__button2 button_logIn btn-user">
                                        <i class="fa-light fa-user"></i>
                                        {include file="`$smarty.const.FRONT_CURRENT_THEME`topBarName.tpl"}
                                    </a>
                                    <div class="main-navigation__sub-menu2" style="display: none">
                                        {include file="`$smarty.const.FRONT_CURRENT_THEME`topBar.tpl"}
                                    </div>
                                </a>
                                {*                                <div class="parent-shopping">*}
                                {*                                    <a href="" class="">*}
                                {*                                        <i class="fas fa-shopping-cart"></i>*}
                                {*                                    </a>*}
                                {*                                </div>*}
                                <div class="media-item">
                                    <a href="https://instagram.com/ozhangasht" class="media-instagram">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                    {*                                    <a href="https://t.me/ozhangasht" class="media-telegram">*}
                                    {*                                        <i class="fab fa-telegram"></i>*}
                                    {*                                    </a>*}
                                    <a href="https://ozhangasht.com/zh/####" class="media-whatsapp">
                                        <i class="fab fa-whatsapp"></i>
                                    </a>
                                </div>
                                <div class="nav-toggle"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-header-bottom">
                    <div class="container">
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu align-to-right">
                                <li><a href="https://ozhangasht.com">صفحه اصلی</a></li>
                                <li><a href="https://ozhangasht.com/entertainments">رزرو تفریحات کیش</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/پر-فروشترین-ها">
                                                <i class="p-2 fa-sharp fa-solid fa-objects-align-top" aria-hidden="true"></i>
                                                پر فروش ترین ها
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/sea">
                                                <i class="p-2 fa-solid fa-mask-snorkel" aria-hidden="true"></i>
                                                تفریحات دریایی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/misc">
                                                <i class="p-2 fa-sharp fa-solid fa-location-dot" aria-hidden="true"></i>
                                                اماکن گردشگری و تفریحی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/cruises">
                                                <i class="p-2 fas fa-fw fa-ship" aria-hidden="true"></i>
                                                کشتی های تفریحی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/night-show">
                                                <i class="p-2 fa-solid fa-masks-theater" aria-hidden="true"></i>
                                                جنگ های شبانه
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/restaurants">
                                                <i class="p-2 fa-solid fa-fork-knife" aria-hidden="true"></i>
                                                کافه و رستوران های موزیکال
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/massage-and-welfare-sevices">
                                                <i class="p-2 fa-solid fa-spa" aria-hidden="true"></i>
                                                مراکز ماساژ و خدمات رفاهی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/kishvand-package">
                                                <i class="p-2 fa-solid fa-box-heart" aria-hidden="true"></i>
                                                پکیج کیشوندان
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/sightseeing">
                                                <i class="p-2 fa-solid fa-bus" aria-hidden="true"></i>
                                                گشت های جزیره
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/best-package">
                                                <i class="p-2 fa-solid fa-box-check" aria-hidden="true"></i>
                                                پکیج های منتخب
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/all-items">
                                                <i class="p-2 fa-solid fa-grid-2" aria-hidden="true"></i>
                                                آیتم های مورد نیاز سفر
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/entertainments/concerts">
                                                <i class="p-2 fas fa-fw fa-music" aria-hidden="true"></i>
                                                کنسرت ها
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/tour">تور</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/tour/تورهای-اروپایی">
                                                <i class="p-2 fa-solid fa-earth-europe" aria-hidden="true"></i>
                                                تورهای ترکیبی اروپا
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/tour/تور-های-قاره-آمریکا">
                                                <i class="p-2 fa-solid fa-earth-americas" aria-hidden="true"></i>
                                                تور های قاره آمریکا
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/tour/تور-های-قاره-آفریقا">
                                                <i class="p-2 fa-solid fa-earth-asia" aria-hidden="true"></i>
                                                تور های قاره آفریقا
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/tour/تور-های-ویژه-آسیا">
                                                <i class="p-2 fa-solid fa-earth-asia" aria-hidden="true"></i>
                                                تور های ویژه آسیا
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/tour/تور-های-ویژه-استرالیا">
                                                <i class="p-2 fa-solid fa-earth-oceania" aria-hidden="true"></i>
                                                تور های ویژه استرالیا
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/ozhankala">اوژن کالا</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/ozhankala/میراث-فرهنگی">
                                                <i class="p-2 fas fa-fw fa-pen-paintbrush" aria-hidden="true"></i>
                                                میراث فرهنگی
                                            </a>
                                            <ul class="nav-dropdown dropdown2">
                                                <li>
                                                    <a href="https://ozhangasht.com//ozhankala/میراث-فرهنگی/صنایع-دستی" >
                                                        <i class="p-2 fas fa-fw fa-hammer" aria-hidden="true"></i>
                                                        صنایع دستی
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://ozhangasht.com/ozhankala/میراث-فرهنگی/هنر-های-دستی" >
                                                        <i class="p-2 fas fa-fw fa-palette" aria-hidden="true"></i>
                                                        هنر های دستی
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/accommodation">ویلا و اقامتگاه</a></li>
                                <li><a href="https://ozhangasht.com/mag">مجله اوژن گشت</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/mag/tourism-news">
                                                <i class="p-2 fas fa-fw fa-newspaper" aria-hidden="true"></i>
                                                بانک جامع گردشگری کیش
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/جشنوارهای-تابستانی-کیش">
                                                <i class="p-2 fa-light fa-solid fa-island-tropical" aria-hidden="true"></i>
                                                جشنوارهای تابستانی کیش
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/iran-tourism">
                                                <i class="p-2 fas fa-fw fa-map-location-dot" aria-hidden="true"></i>
                                                بانک جامع ایرانگردی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/world-tourism">
                                                <i class="p-2 fas fa-fw fa-globe" aria-hidden="true"></i>
                                                بانک جامع جهانگردی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/بانک-جامع-اطلاعات-سفر">
                                                <i class="p-2 fa-regular fa-globe-stand" aria-hidden="true"></i>
                                                اطلاعات سفر اوژن گشت
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/ozh-activities">
                                                <i class="p-2 fa-solid fa-futbol" aria-hidden="true"></i>
                                                فرهنگی و نمایشگاهی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/map-of-iran-provinces">
                                                <i class="p-2 fa-solid fa-map-location-dot" aria-hidden="true"></i>
                                                نقشه ایران استان ها
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/mag/khadamat-visa">
                                                <i class="p-2 fa-solid fa-user" aria-hidden="true"></i>
                                                خدمات ویزا
                                            </a>
                                            <ul class="nav-dropdown dropdown2">
                                                <li>
                                                    <a href="https://ozhangasht.com/mag/khadamat-visa/سفارت-ها" >
                                                        <i class="p-2 fa-solid fa-building" aria-hidden="true"></i>
                                                        سفارت ها
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://ozhangasht.com/mag/khadamat-visa/visa-information" >
                                                        <i class="p-2 fa-brands fa-cc-visa" aria-hidden="true"></i>
                                                        خدمات اخذ ویزا
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://ozhangasht.com/mag/khadamat-visa/no-visa" >
                                                        <i class="p-2 fa-brands fa-cc-visa" aria-hidden="true"></i>
                                                        سفر بدون ویزا
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/terms">قوانین و مقررات</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/terms/general">
                                                <i class="p-2 fas fa-fw fa-gavel" aria-hidden="true"></i>
                                                قوانین و مقررات عمومی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/flight-domestic">
                                                <i class="p-2 fas fa-fw fa-plane-departure fa-flip-horizontal" aria-hidden="true"></i>
                                                قوانین و مقررات پرواز داخلی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/hotel-domestic">
                                                <i class="p-2 fas fa-fw fa-bed" aria-hidden="true"></i>
                                                قوانین و مقررات هتل داخلی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/hotel-foreign">
                                                <i class="p-2 fas fa-fw fa-bed" aria-hidden="true"></i>
                                                قوانین و مقررات هتل خارجی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/insurance">
                                                <i class="p-2 fas fa-fw fa-umbrella" aria-hidden="true"></i>
                                                قوانین و مقررات بیمه مسافرتی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/قوانین-و-مقررات-گردشگری-کیش">
                                                <i class="p-2 fa-solid fa-book-section" aria-hidden="true"></i>
                                                قوانین و مقررات گردشگری کیش
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/questions-for-items">
                                                <i class="p-2 fa-solid fa-comment-question" aria-hidden="true"></i>
                                                راهنمایی خرید تفریحات کیش
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/terms/flight-foreign">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                قوانین و مقررات پرواز خارجی
                                            </a>
                                            <ul class="nav-dropdown dropdown2">
                                                <li>
                                                    <a href="https://www.qatarairways.com/en-bg/visa-and-passport-requirements.html" >
                                                        <i class="p-2 fas fa-link" aria-hidden="true"></i>
                                                        استعلام ویزاهای ترانزیت بین مسیر
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://sadadpsp.ir/tollpayment/" >
                                                        <i class="p-2 fas fa-link" aria-hidden="true"></i>
                                                        پرداخت عوارض خروج از کشور
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://pishkhan24.com/exitban/" >
                                                        <i class="p-2 fas fa-link" aria-hidden="true"></i>
                                                        استعلام ممنوعیت خروج از کشور
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/%D8%AA%D9%88%D8%B6%DB%8C%D8%AD%D8%A7%D8%AA-%D8%AA%DA%A9%D9%85%DB%8C%D9%84%DB%8C">توضیحات تکمیلی</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/questions-1">
                                                <i class="p-2 fas fa-fw fa-comment-question" aria-hidden="true"></i>
                                                راهنمایی بلیط هواپیما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/انواع-روش‌های-خرید-بلیط-هواپیما">
                                                <i class="p-2 fa-solid fa-ticket" aria-hidden="true"></i>
                                                انواع روش‌های خرید بلیط هواپیما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-رزرو-هتل">
                                                <i class="p-2 fas fa-fw fa-hotel" aria-hidden="true"></i>
                                                راهنمای رزرواسیون هتل
                                            </a>
                                            <ul class="nav-dropdown dropdown2">
                                                <li>
                                                    <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-رزرو-هتل/1-رزرو-هتل-داخلی" >
                                                        <i class="p-2 fas fa-fw fa-hotel" aria-hidden="true"></i>
                                                        رزرو هتل داخلی
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-رزرو-هتل/1-رزرو-هتل-خارجی" >
                                                        <i class="p-2 fas fa-fw fa-hotel" aria-hidden="true"></i>
                                                        رزرو هتل خارجی
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/bime-safar-information-1">
                                                <i class="p-2 fas fa-fw fa-umbrella" aria-hidden="true"></i>
                                                خرید بیمه مسافرتی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-هواپیما">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط هواپیما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/%D8%AA%D9%88%D8%B6%DB%8C%D8%AD%D8%A7%D8%AA-%D8%AA%DA%A9%D9%85%DB%8C%D9%84%DB%8C/1-%D9%82%DB%8C%D9%85%D8%AA-%D8%B1%D9%88%D8%B2-%D8%A8%D9%84%DB%8C%D8%B7-%D9%87%D9%88%D8%A7%D9%BE%DB%8C%D9%85%D8%A7">
                                                <i class="p-2 fas fa-fw fa-money-bill" aria-hidden="true"></i>
                                                قیمت روز بلیط هواپیما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-چارتر-هواپیما">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط چارتر هواپیما
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-پرواز-داخلی">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط پرواز داخلی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/بلیط-پرواز-خارجی">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط پرواز خارجی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-کیش">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط کیش
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-مشهد">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط مشهد
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/%D8%AA%D9%88%D8%B6%DB%8C%D8%AD%D8%A7%D8%AA-%D8%AA%DA%A9%D9%85%DB%8C%D9%84%DB%8C/1-%D8%A8%D9%84%DB%8C%D8%B7-%D8%AF%D8%A8%DB%8C">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط دبی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-ترکیه">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط ترکیه
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-داخلی-ترکیه">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط داخلی ترکیه
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/خرید-بلیط-هواپیما-کانادا">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                خرید بلیط هواپیما کانادا
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/توضیحات-تکمیلی/1-بلیط-هواپیما-آمریکا">
                                                <i class="p-2 fas fa-fw fa-plane-departure" aria-hidden="true"></i>
                                                بلیط هواپیما آمریکا
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/flight-ticket">اطلاعات پرواز</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/flight-ticket/اطلاعات-پرواز-فرودگاه-کیش">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه کیش
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://fids.airport.ir/2/%D8%A7%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA-%D9%BE%D8%B1%D9%88%D8%A7%D8%B2-%D9%81%D8%B1%D9%88%D8%AF%DA%AF%D8%A7%D9%87-%D9%85%D9%87%D8%B1%D8%A2%D8%A8%D8%A7%D8%AF">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه مهرآباد
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://fids.airport.ir/102/%D8%A7%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA-%D9%BE%D8%B1%D9%88%D8%A7%D8%B2-%D9%81%D8%B1%D9%88%D8%AF%DA%AF%D8%A7%D9%87-%D9%85%D8%B4%D9%87%D8%AF"">
                                            <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                            اطلاعات پرواز فرودگاه مشهد
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://fids.airport.ir/114/%D8%A7%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA-%D9%BE%D8%B1%D9%88%D8%A7%D8%B2-%D9%81%D8%B1%D9%88%D8%AF%DA%AF%D8%A7%D9%87-%D8%A7%D8%B5%D9%81%D9%87%D8%A7%D9%86">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطالاعات پرواز فرودگاه اصفهان
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://mrbilit.com/flight-info/KER">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه کرمان
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://fids.airport.ir/1/%D8%A7%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA-%D9%BE%D8%B1%D9%88%D8%A7%D8%B2-%D9%81%D8%B1%D9%88%D8%AF%DA%AF%D8%A7%D9%87-%D8%B4%D9%8A%D8%B1%D8%A7%D8%B2">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه شیراز
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://fids.airport.ir/106/%D8%A7%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA-%D9%BE%D8%B1%D9%88%D8%A7%D8%B2-%D9%81%D8%B1%D9%88%D8%AF%DA%AF%D8%A7%D9%87-%D8%B3%D8%A7%D8%B1%D9%8A">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطالاعات پرواز فرودگاه ساری
                                            </a>
                                        </li>
                                        <li>
                                            <a href=https://fids.airport.ir/117/%D8%A7%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA-%D9%BE%D8%B1%D9%88%D8%A7%D8%B2-%D9%81%D8%B1%D9%88%D8%AF%DA%AF%D8%A7%D9%87-%D8%A8%D9%86%D8%AF%D8%B1%D8%B9%D8%A8%D8%A7%D8%B3">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه بندر عباس
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://www.ikac.ir/flight-status">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه امام
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/flight-ticket/اطلاعات-پرواز-فرودگاه-های-دبی">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه های دبی
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/flight-ticket/اطلاعات-پرواز-فرودگاه-استانبول">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه استانبول
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/flight-ticket/اطلاعات-پرواز-فرودگاه-فرانکفورت">
                                                <i class="p-2 fa-solid fa-circle-info" aria-hidden="true"></i>
                                                اطلاعات پرواز فرودگاه فرانکفورت
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="https://ozhangasht.com/about-us">درباره ما</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="https://ozhangasht.com/about-us">
                                                <i class="p-2 fa-solid fa-pen-nib" aria-hidden="true"></i>
                                                پیام مدیر عامل
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://ozhangasht.com/about-us/contact">
                                                <i class="p-2 fa-sharp fa-solid fa-phone-volume fa-shake" aria-hidden="true"></i>
                                                تماس با ما
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
{/if}