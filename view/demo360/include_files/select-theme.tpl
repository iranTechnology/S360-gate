<style>


    .section-button{
        left: 0;
        right: 0;
        margin: 10px;
        bottom: 0;
    }
    .box {
        background-color: var(--mainColor);
        color: white;
        padding: 20px;
        margin: 20px;
        border-radius: 10px;
    }

    .settings-toggle {
        position: fixed;
        left: 20px;
        bottom: 20px;
        background-color: var(--mainColor);
        color: white;
        width: 55px;
        height: 55px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        box-shadow: 0 2px 15px rgba(0,0,0,0.3);
        z-index: 1000;
        transition: all 0.3s;
        font-size: 28px;
    }
    #show-message-setting{
        position: fixed;
        left: 81px;
        bottom: 20px;
        background-color: #212121;
        color: white;
        width: fit-content;
        height: 55px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        z-index: 1000;
        transition: all 0.3s;
        font-size: 13px;
        border-radius: 11px;
        padding: 0px 20px !important;
    }
    #show-message-clear{
        position: fixed;
        left: 81px;
        bottom: 80px;
        background-color: #212121;
        color: white;
        width: fit-content;
        height: 55px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        z-index: 1000;
        transition: all 0.3s;
        font-size: 13px;
        border-radius: 11px;
        padding: 0px 20px !important;
    }
    .settings-toggle:hover {
        transform: scale(1.1);
    }

    .settings-sidebar {
        position: fixed;
        left: -380px;
        top: 0;
        width: 360px;
        height: 100%;
        background-color: white;
        box-shadow: -2px 0 20px rgba(0,0,0,0.2);
        z-index: 10000;
        transition: left 0.3s ease;
        padding: 25px;
        overflow-y: auto;
        direction: rtl;
    }

    .settings-sidebar.open {
        left: 0;
    }

    .settings-sidebar h3 {
        margin-bottom: 20px;
        color: var(--mainColor);
        text-align: center;
        font-size: 22px;
    }

    .settings-sidebar .close-btn {
        position: absolute;
        top: 15px;
        left: 15px;
        background: none;
        border: none;
        font-size: 24px;
        cursor: pointer;
        color: #999;
    }

    .color-group {
        margin-bottom: 25px;
    }

    .color-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }

    .color-input {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .color-input input[type="color"] {
        width: 60px;
        height: 50px;
        border: 2px solid #ddd;
        border-radius: 8px;
        cursor: pointer;
    }

    .color-input input[type="text"] {
        flex: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
        direction: ltr;
    }

    .logo-upload {
        margin-bottom: 25px;
    }

    .logo-upload label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }

    .logo-preview {
        width: 100px;
        height: 100px;
        object-fit: contain;
        border: 2px solid #ddd;
        border-radius: 10px;
        margin-top: 10px;
        padding: 5px;
        background-color: #f9f9f9;
    }

    .apply-btn {
        background-color: var(--mainColor);
        color: white;
        padding: 12px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        margin-top: 10px;
    }

    .save-btn {
        background-color: green !important;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        width: 50%;
        font-size: 13px;
        margin-right: 10px;
    }

    .reset-btn {
        background-color: #e74c3c;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        width: 50%;
        font-size: 13px;
    }

    .note {
        font-size: 12px;
        color: #999;
        text-align: center;
        margin-top: 7px;
    }
    .overlay-black {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.70);
        z-index: 999;
        display: none; /* تغییر از flex به none */
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
        backdrop-filter: blur(5px);
    }

    .overlay-black.show {
        display: flex; /* وقتی show دارد نمایش داده شود */
    }

    /* جلوگیری از اسکرول هنگام باز بودن اوریلی */
    body.overlay-open {
        overflow: hidden;
    }

    .overlay-content {
        text-align: center;
        color: #fff;
        width: fit-content;
        box-shadow: 0 25px 50px rgba(0,0,0,0.5);
        animation: fadeInUp 0.5s ease;
        position: absolute;
        z-index: 100000;
        bottom: 85px;
        left: 20px;
        background: #000;
        border-radius: 10px;
        display: flex;
        align-items: center;
        flex-direction: row-reverse;
        gap: 10px;
        height: 50px;
        justify-content: center;
        padding:26px
    }

    /* اضافه کردن دکمه بستن به استایل */
    .close-overlay {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 14px 35px;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 20px;
        transition: all 0.3s;
    }

    .close-overlay:hover {
        background-color: #c0392b;
        transform: scale(1.05);
    }

    /* دکمه بستن در سایدبار */
    .close-sidebar-btn {
        position: absolute;
        top: 15px;
        left: 15px;
        background: none;
        border: none;
        font-size: 24px;
        cursor: pointer;
        color: #999;
    }

    /* جلوگیری از اسکرول هنگام باز بودن اوریلی */
    body.overlay-open {
        overflow: hidden;
    }



    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .overlay-content h2 {
        font-size: 32px;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .overlay-content p {
        font-size: 15px;
        line-height: 1.8;
    }

    .overlay-content ul {

        text-align: center;
        margin: 25px 0;
        padding-right: 20px;
    }

    .overlay-content li {
        margin: 12px 0;
        font-size: 16px;
        list-style-type: none;
    }

    .overlay-icon {
        text-align: center;
        padding-right: 10px;
        font-size:18px;
        padding-top:10px
    }

    /* انیمیشن حرکت رفت و برگشت (چپ و راست) */
    @keyframes moveLeftRight {
        0% {
            transform: translateY(0);
        }
        50% {
            transform: translateY(-10px);
        }
        100% {
            transform: translateY(0);
        }
    }

    /* انیمیشن حرکت رفت و برگشت (بالا و پایین) */
    @keyframes moveUpDown {
        0% {
            transform: translateY(0);
        }
        50% {
            transform: translateY(-10px);
        }
        100% {
            transform: translateY(0);
        }
    }

    /* انیمیشن چرخش */
    @keyframes rotate {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

    /* انیمیشن تکان خوردن */
    @keyframes shake {
        0%, 100% {
            transform: translateX(0);
        }
        25% {
            transform: translateX(-10px);
        }
        75% {
            transform: translateX(10px);
        }
    }

    /* اعمال انیمیشن به آیکون */
    .overlay-icon i,
    .overlay-icon span {
        display: inline-block;
        animation: moveLeftRight 1.5s ease-in-out infinite;
    }

    /* یا برای حرکت بالا و پایین */
    .overlay-icon .arrow-down {
        display: inline-block;
        animation: moveUpDown 1.5s ease-in-out infinite;
    }

    /* یا برای تکان خوردن */
    .overlay-icon .shake-arrow {
        display: inline-block;
        animation: shake 0.8s ease-in-out infinite;
    }

    .close-overlay {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 14px 35px;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        margin-top: 20px;
        transition: all 0.3s;
    }

    .close-overlay:hover {
        background-color: #c0392b;
        transform: scale(1.05);
    }

    .dont-show-again {
        margin-top: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .dont-show-again input {
        width: 18px;
        height: 18px;
        cursor: pointer;
    }

    .dont-show-again label {
        cursor: pointer;
        font-size: 14px;
        color: rgba(255,255,255,0.9);
    }
    /* بخش لوگو به سبک اینستاگرام */
    .logo-section-instagram {
        margin-bottom: 25px;
    }

    .logo-section-instagram label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }

    .instagram-logo-container {
        cursor: pointer;
        margin-bottom: 15px;
    }

    .instagram-logo-wrapper {
        position: relative;
        width: 100px;
        height: 100px;
        margin: 0 auto;
        border-radius: 50%;
        overflow: hidden;
        /*background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);*/
        border: 3px solid var(--mainColor);
        transition: all 0.3s;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .instagram-logo-wrapper:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    .instagram-logo-img {
        width: 100%;
        height: 100%;
        object-fit: contain !important;
    }

    .instagram-logo-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.65);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s;
        color: white;
    }

    .instagram-logo-wrapper:hover .instagram-logo-overlay {
        opacity: 1;
    }

    .instagram-logo-overlay i {
        font-size: 24px;
        margin-bottom: 4px;
    }

    .instagram-logo-overlay span {
        font-size: 10px;
    }

    /* ویرایشگر اینستاگرامی */
    .instagram-editor {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 50%;
        height: 70%;
        background: #000;
        z-index: 10000;
        display: flex;
        flex-direction: column;
        animation: instagramFadeIn 0.3s ease;
        justify-content: center;
        align-items: center;
        border-radius: 10px;
    }

    @keyframes instagramFadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    .instagram-editor-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 12px 16px;
        background: #000;
        color:#fff;
        backdrop-filter: blur(10px);
        border-bottom: 0.5px solid rgba(255,255,255,0.1);
    }

    .instagram-cancel-btn {
        background: none;
        border: none;
        color: #ffffff;
        font-size: 16px;
        cursor: pointer;
        padding: 8px;
    }

    .instagram-editor-title {
        color: #fff;
        font-weight: 600;
        font-size: 16px;
    }

    .instagram-done-btn {
        background: none;
        border: none;
        color: #0095f6;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        padding: 8px;
    }

    /* منطقه برش دایره‌ای */
    .instagram-crop-area {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        /*background: #000000;*/
        overflow: hidden;
        position: relative;
    }

    .instagram-crop-circle {
        position: relative;
        width: min(40vw, 40vh);
        height: min(40vw, 40vh);
        border-radius: 50%;
        overflow: hidden;
        /*background: #1a1a1a;*/
        cursor: grab;
        /*box-shadow: 0 0 0 100vw rgba(0,0,0,0.8);*/
        border: 1px solid rgba(0,0,0,0.9);
    }

    .instagram-crop-circle:active {
        cursor: grabbing;
    }

    .instagram-crop-circle img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        pointer-events: none;
    }

    .instagram-grid-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        border: 2px solid rgba(255,255,255,0.3);
        pointer-events: none;
        z-index: 10;
    }

    /* نوار ابزار پایین */
    .instagram-toolbar {
        background: rgba(0,0,0,0.9);
        backdrop-filter: blur(10px);
        padding: 12px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-top: 0.5px solid rgba(255,255,255,0.1);
        gap: 20px;
        width: 100%;
        border-radius: 0 0 10px 10px;

    }

    .instagram-tool-btn {
        background: none;
        border: none;
        color: #ffffff;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 4px;
        cursor: pointer;
        padding: 8px;
        transition: all 0.2s;
        font-size: 12px;
    }

    .instagram-tool-btn i {
        font-size: 22px;
    }

    .instagram-tool-btn:hover {
        opacity: 0.7;
    }

    .instagram-zoom-container {
        display: flex;
        align-items: center;
        gap: 15px;
        flex: 1;
    }

    .instagram-zoom-container i {
        color: #ffffff;
        font-size: 20px;
        cursor: pointer;
    }

    .instagram-zoom-container i:hover {
        opacity: 0.7;
    }

    .instagram-zoom-container input {
        width: 200px;
        height: 3px;
        -webkit-appearance: none;
        background: #3a3a3a;
        border-radius: 5px;
        outline: none;
    }

    .instagram-zoom-container input::-webkit-slider-thumb {
        -webkit-appearance: none;
        width: 16px;
        height: 16px;
        border-radius: 50%;
        background: #ffffff;
        cursor: pointer;
    }

    /* دکمه حذف لوگو */
    .instagram-remove-logo {
        width: 60%;
        padding: 10px;
        background: #e74c3c;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        margin-top: 10px;
        font-size: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        margin: 0 auto;
    }

    .instagram-remove-logo:hover {
        background: #c0392b;
    }
    /* استایل برای بستن */
    body.instagram-editor-open {
        overflow: hidden;
    }
    .instagram-logo-img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: contain;
        border: 2px solid #ddd;
        cursor: pointer;
        transition: transform 0.2s;
    }

    .instagram-logo-img:hover {
        transform: scale(1.05);
    }

    .instagram-logo-wrapper {
        position: relative;
        width: 100px;
        height: 100px;
    }

    .instagram-logo-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        border-radius: 50%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s;
        color: white;
        cursor: pointer;
    }

    .instagram-logo-wrapper:hover .instagram-logo-overlay {
        opacity: 1;
    }
    @media (max-width: 768px) {
        .instagram-editor  {
            width:70%;
        }
    }
    @media (max-width: 768px) {
        #rest-theme-btn {
            display: none !important;
        }
    }
</style>


<div class="settings-toggle" onmouseover="showMessageSetting()" onmouseleave="hideShowMessageSetting()" onclick="toggleSidebar()">
    <i class="fa fa-cog"></i>️
</div>
<div style="fontsize:10px;display:none" class="m-0 p-0 " id="show-message-setting"> ✅ با انتخاب لوگو و رنگ سازمانی از این بخش، گرافیک سایت به‌صورت خودکار متناسب با برند شما شخصی‌سازی و نمایش داده می‌شود.</div>
<div style="fontsize:10px;display:none" class="m-0 p-0 " id="show-message-clear">✅ تمام تغییرات پاک شده و سایت به حالت اولیه برمیگردد!</div>

<div class="settings-toggle" id="rest-theme-btn" onmouseover="showMessageClear()" onmouseleave="hideShowMessageClear()"  style="bottom:80px !important;display:none" onclick="resetTheme()">
    <i class="fa fa-refresh"></i>️
</div>

<div id="settingsSidebar" class="settings-sidebar">

    <button class="close-btn" onclick="closeSidebar()">✕</button>
    <h3> تنظیمات شخصی سازی</h3>

    <div class="color-group">
        <label> رنگ اصلی:</label>
        <div class="color-input">
            <input type="color" id="mainColorPicker" value="#3498db">
            <input type="text" id="mainColorText" value="#3498db" placeholder="#RRGGBB">
        </div>
    </div>

    <div class="color-group">
        <label> رنگ مکمل :</label>
        <div class="color-input">
            <input type="color" id="secondColorPicker" value="#2ecc71">
            <input type="text" id="secondColorText" value="#2ecc71" placeholder="#RRGGBB">
        </div>
    </div>

    <div class="logo-section-instagram">
        <label> لوگوی شما:</label>

        <!-- نمایش لوگو فعلی -->
        <div class="instagram-logo-container" onclick="triggerInstagramUpload()">
            <div class="instagram-logo-wrapper">
                <img id="instagramLogoDisplay" class="instagram-logo-img" alt="لوگو">
                <div class="instagram-logo-overlay">
                    <i class="fa fa-camera"></i>
                    <span>ویرایش لوگو</span>
                </div>
            </div>
        </div>

        <input type="file" id="instagramLogoInput" accept="image/*" style="display: none;">

        <!-- ویرایشگر به سبک اینستاگرام -->
        <div id="instagramEditor" class="instagram-editor" style="display: none;">
            <!-- هدر -->
            <div class="instagram-editor-header">
                <span class="instagram-editor-title">ویرایش لوگو</span>

            </div>

            <!-- منطقه برش دایره‌ای -->
            <div class="instagram-crop-area">
                <div class="instagram-crop-circle" id="instagramCropCircle">
                    <img id="instagramDraggableImage" src="" alt="تصویر">
                    <div class="instagram-grid-overlay"></div>
                </div>
            </div>

            <!-- نوار ابزار پایین -->
            <div class="instagram-toolbar">


                <div class="instagram-zoom-container">
                    <i class="fa fa-search-minus" onclick="zoomInstagramImage(-0.1)"></i>
                    <input type="range" id="instagramZoomSlider" min="0.5" max="3" step="0.01" value="1">
                    <i class="fa fa-search-plus" onclick="zoomInstagramImage(0.1)"></i>
                </div>
                <button class="instagram-cancel-btn" onclick="rotateImageLeft()">
                    چرخش
                </button>
                <button class="instagram-cancel-btn" onclick="resetInstagramImage()">
                    بازنشانی
                </button>
                <button class="instagram-cancel-btn" onclick="closeInstagramEditor()">لغو</button>
                <button class="instagram-done-btn" onclick="saveInstagramImage()">انجام</button>
            </div>

            <div class="instagram-resize-handle"></div>
        </div>

        <button class="instagram-remove-logo" onclick="removeInstagramLogo()" style="display: none;">
            <i class="fa fa-trash"></i> حذف لوگو
        </button>
    </div>


    <div class="position-absolute section-button">
        <div class="d-flex align-items-center gap-2">
            <button class="reset-btn" onclick="resetTheme()">↺ بازنشانی به حالت اولیه</button>
            <button class="save-btn" onclick="saveTheme()"> ذخیره تنظیمات</button>
        </div>
        <div class="note">⚠️ رنگ را انتخاب کنید و روی "ذخیره تنظیمات" کلیک کنید</div>
    </div>
</div>
<div id="overlayBlack" class="overlay-black">
    <div class="overlay-content">
        <div class="overlay-icon">
            <i class="fa fa-arrow-down"></i>
        </div>

        <p style="fontsize:10px" class="m-0 p-0"> ✅ با انتخاب لوگو و رنگ سازمانی از این بخش، گرافیک سایت به‌صورت خودکار متناسب با برند شما شخصی‌سازی و نمایش داده می‌شود.</p>
        <div class="dont-show-again d-none">
            <input type="checkbox" checked id="dontShowAgain">
            <label for="dontShowAgain">دیگر نشان نده</label>
        </div>
    </div>
</div>