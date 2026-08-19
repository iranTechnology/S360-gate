<section class="i_modular_club_weather section_services">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-xs-12 col-lg-4">
                <div class="service" id="shamsiConvertDate">
                    <div class="icon-holder">
                        <i class="fas fa-3x fa-calendar"></i>
                    </div>
                    <h4 class="heading">تبدیل تاریخ</h4>
                    <div class="__date_convertor__ convert-date">
                        <div class="tabdil">
                            <input class="__JalaliToMiladi_input__ convertShamsiMiladiCalendar "
                                   id="txtShamsiCalendar"
                                   name="txtShamsiCalendar" placeholder="تاریخ شمسی" type="text" />
                            <button type='button' class="__JalaliToMiladi_button__ " id="shamsiConvertButton"
                                    onclick="convertJalaliToMiladi()" >تبدیل به میلادی
                            </button>
                            <div class="resultdate" id="showJalaliResult"></div>

                        </div>
                        <div class="tabdil">
                            <input class="__MiladiToJalali_input__ convertMiladiShamsiCalendar" id="txtMiladiCalendar"
                                   name="txtMiladiCalendar" placeholder="تاریخ میلادی" type="text" />
                            <button class="__MiladiToJalali_button__" id="miladiConvertButton"
                                    onclick="convertMiladiToJalali()">تبدیل به شمسی
                            </button>
                            <div id="showMiladiResult"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xs-12 col-lg-4">
                <div class="service">
                    <div class="icon-holder">
                        <i class="fas fa-3x fa-cloud-sun"></i>
                    </div>
                    <h4 class="heading"> هواشناسی</h4>
                    <p>

                        توسط این بخش می تواند منطقه یا مناطق جغرافیایی را جهت نمایش وضعیت آب هوایی انتخاب نماید.تا در
                        زمان گردش بیشترین لذت را از مسافرت خود داشته باشید.
                    </p>
                    <a class="SMWeather btn btn_main" href="{$smarty.const.ROOT_ADDRESS}/weather">هواشناسی</a>
                </div>
            </div>
            <div class="col-md-6 col-xs-12 col-lg-4 margin-arz">
                <div class="service">
                    <div class="icon-holder">
                        <i class="fas fa-3x fa-money-bill"></i>
                    </div>
                    <h4 class="heading"> نرخ ارز</h4>
                    <p>

                        توسط این بخش شما می تواند بروز ترین ، آخرین نرخ لحظه ای ارزهای انتخابی خود را بر اساس ارز
                        مرجع،مشاهده نمایید. تا در زمان گردش بیشترین لذت را از مسافرت خود داشته باشید

                    </p>
                    <a class="SMChange btn btn_main" href="{$smarty.const.ROOT_ADDRESS}/currency">نرخ ارز</a>
                </div>
            </div>
        </div>
    </div>
</section>