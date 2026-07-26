{assign var="lottery" value=$objLottery->getLottery($smarty.const.LOTTERY_ID)}
{assign var="user_info" value=$objMembers->getMember()}

{if $lottery && $lottery neq ''}



    {if $smarty.const.SOFTWARE_LANG eq 'en'}
        <link rel='stylesheet' href='assets/styles/css/modules-en/mag-en.css'>
    {else}
        <link rel='stylesheet' href='assets/modules/css/mag.css'>

        <link rel='stylesheet' href='assets/modules/css/lottery.css'>
    {/if}

{*<link rel='stylesheet' href='assets/modules/css/mag.css'>*}

<section class="mag_three">
    <div>
        <div class="d-flex flex-wrap">
            <div class="col-lg-8 col-md-12 col-sm-12 col-12 my-padding-mobile p-0 m-auto">
                <div class="parent_box_right text-right">
                    <img class='main-img-banner'
                         data-lottery-id="{$lottery['id']}"
                         src="/gds/pic/{$lottery['cover_image']}"
                         alt="{$lottery['title']}"
                         style="cursor: pointer;">

                    {* Hidden gallery data for JavaScript *}
                    {if $lottery['gallery']}
                        <div id="lottery-gallery-data" style="display:none;" data-gallery='{json_encode($lottery["gallery"])|escape}'></div>
                    {/if}

                    <div class="d-flex justify-content-between align-items-center mt-2">
                    <span class="h3">
                        {$lottery['title']}
                    </span>

                    <button data-lottery-id="27" class="btn lottery-trigger btn-to-sherkat ">شرکت در قرعه کشی</button>
                    </div>
{*                    <span class="calendar">*}
{*                          <i class="fa-light fa-calendar-days"></i>*}
{*                            {$lottery['created_at']}*}
{*                    </span>*}

                    {if $lottery['description']}
                    <div class='content-whatever-special-pages'>{$lottery['description']}</div>
                    {/if}




                </div>
            </div>


        </div>
    </div>
</section>

{* Multi-Step Lottery Modal *}
<div id="lottery-modal" class="lottery-modal" style="display:none;">
    <div class="lottery-modal-overlay"></div>
    <div class="lottery-modal-content">
        <button class="lottery-modal-close">&times;</button>

        {* Step 1: Phone Number *}
        <div class="lottery-step lottery-step-1 active">
            <h2 class="lottery-modal-title">شرکت در قرعه‌کشی</h2>
            <p class="lottery-modal-desc">لطفاً شماره موبایل خود را وارد کنید</p>
            <div class="lottery-form-group">
                <input type="text"
                       id="lottery-phone"
                       class="lottery-input"
                       placeholder=""
                       maxlength="11"
                       autocomplete="off">
                <span class="lottery-error" id="phone-error"></span>
            </div>
            <button class="lottery-btn lottery-btn-primary lottery-next" data-next="2">
                ادامه
            </button>
        </div>

        {* Step 2: Verification Code *}
        <div class="lottery-step lottery-step-2">
            <h2 class="lottery-modal-title">کد تأیید</h2>
            <p class="lottery-modal-desc">کد 4 رقمی ارسال شده را وارد کنید</p>

            <div class="lottery-form-group">
                <input type="text"
                       id="lottery-code"
                       class="lottery-input"
                       placeholder=""
                       maxlength="4"
                       autocomplete="off">
                <div class="d-flex justify-content-between align-items-center">
                    <span class="lottery-error" id="code-error"></span>

                    {* Countdown Timer *}
                    <div class="lottery-countdown mr-auto" id="countdown-container">
                        <span class="countdown-label">زمان باقی‌مانده:</span>
                        <span id="countdown-timer" class="countdown-time">2:00</span>
                    </div>

                    {* Resend Button - Initially Hidden *}
                    <button id="resend-otp" class="lottery-btn-link" style="display: none;">
                        ارسال مجدد کد
                    </button>
                </div>
            </div>

            <div class="lottery-actions">
                <button class="lottery-btn lottery-btn-secondary lottery-back" data-back="1">
                    بازگشت
                </button>
                <button class="lottery-btn lottery-btn-primary lottery-next" data-next="3">
                    تأیید کد
                </button>
            </div>
        </div>

        {* Step 3: Result *}
        <div class="lottery-step lottery-step-3">
{*            <h2 class="lottery-modal-title">🎉 تبریک!</h2>*}
            <p class="lottery-modal-desc">جایزه شما:</p>
            <div class="lottery-result">
                <img id="lottery-prize-image" src="" alt="Prize" class="lottery-prize-img">
            </div>
            <button class="lottery-btn lottery-btn-mainColor lottery-modal-close-btn">
                بستن
            </button>
        </div>
    </div>
</div>


<link rel="stylesheet" href="assets/modules/css/jquery.fancybox.min.css">
<script src="assets/modules/js/jquery.fancybox.min.js"></script>
<script src="assets/modules/js/lottery.js"></script>
{else}
    404
{/if}