{$check_general = true}

{if $check_general}
    <section id="module-newsletter" class="i_modular_newsletter">
        <canvas height="300" id="particle-canvas" width="1200">
        </canvas>
        <!-- لایه گرادیان و شیشه اصلی -->
        <div class="container">

            <div class="newsletter-glass-wrapper glass-effect">

                <!-- بخش چپ: فرم شیشه‌ای با المان‌های درخشان -->
                <div class="newsletter-col-form">

                    <div class="newsletter-header">
                        <div class="newsletter-icon-wrapper">
                            <i class="fa-light fa-envelope-circle-check"></i>
                            <div class="icon-glow"></div>
                        </div>
                        <div class="newsletter-text">
                            <h3>عضویت در خبرنامه</h3>
                            <p>برای آگاهی از پیشنهادات در خبرنامه ما عضو شوید</p>
                        </div>
                    </div>

                    <form class="newsletter-form" action="javascript:" onsubmit="submitNewsLetter()">

                        <div class="input-group floating-label">
                            <label>
                                <i class="fa-light fa-user"></i>
                                <input type="text" id="NameSms" name="NameSms" placeholder=" " required>
                                <span class="label-text">نام و نام خانوادگی</span>
                            </label>
                            <div class="input-glow-line"></div>
                        </div>

                        <div class="input-group floating-label">
                            <label>
                                <i class="fa-light fa-at"></i>
                                <input type="email" id="EmailSms" name="EmailSms" placeholder=" " required>
                                <span class="label-text">ایمیل (Email)</span>
                            </label>
                            <div class="input-glow-line"></div>
                        </div>

                        <div class="input-group floating-label">
                            <label>
                                <i class="fa-light fa-phone-alt"></i>
                                <input type="tel" id="CellSms" name="CellSms" placeholder=" " required>
                                <span class="label-text">شماره تلفن همراه</span>
                            </label>
                            <div class="input-glow-line"></div>
                        </div>

                        <div class="input-group submit-group">
                            <button type="submit" class="btn-newsletter-submit">
                                <span>عضویت در خبرنامه</span>
                                <i class="fa-light fa-arrow-left"></i>
                            </button>
                        </div>

                    </form>

                </div>

            </div>
        </div>
    </section>
{/if}