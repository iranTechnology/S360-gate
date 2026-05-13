
<section class="newsletters">
    <div class="container">
        <div class="parent-newsletters">
            <h4>اطلاع از بلیط و تورهای لحظه آخری (لیست انتظار)</h4>
            <form class="col-12" id="versa-news-letter">
                <label class="col-12 col-md-6 col-lg-6 p-1">
                    <span>نام : </span>
                    <input name='NameSms' id="NameSms" type="text" placeholder="نام" class='full-name-js' placeholder="نام و نام خانوادگی">
                </label>
                <label class="col-12 col-md-6 col-lg-6 p-1">
                    <span>  موبایل : </span>
                    <input name="CellSms" id="CellSms" type="text" placeholder="موبایل" class='mobile-js' placeholder="تلفن همراه">
                </label>
{*                <label style='display:none' class="col-12 col-md-6 col-lg-6 p-1">*}
{*                    <span>  ایمیل : </span>*}
{*                    <input  placeholder="ایمیل" class='mobile-js email-js' value="" name="EmailSms" id="EmailSms" type="email">*}
{*                </label>*}
                <label class="col-12 col-md-12 col-lg-12 p-1">
                    <span>توضیحات : </span>
                    <textarea name="EmailSms" id="EmailSms" class='email-js' cols="30" rows="3" placeholder="توضیحات"></textarea>
                </label>
                <div class="membership">
                    <button type="button"
                            name="ButSms"
                            id="ButSms"
                            onclick="submitVersaNewsLetter()"
                            class="newsletters-btn news-letter-js">
                        <div class="newsletters_text_css">ثبت</div>
                        <div class="newsletters_loading_css"></div>
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>