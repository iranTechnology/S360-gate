{*{if $smarty.const.GDS_SWITCH eq 'page' && $active_tab eq 'Hotel' } active {/if}*}



{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Tour') || $smarty.const.GDS_SWITCH eq 'mainPage')  }
    <li class="nav-item">
        <a class="nav-link active" id="Tour-tab" data-toggle="tab" href="#Tour">
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M352.1 128h-32.07l.0123-80c0-26.47-21.53-48-48-48h-96c-26.47 0-48 21.53-48 48L128 128H96.12c-35.35 0-64 28.65-64 64v224c0 35.35 28.58 64 63.93 64L96 496C96 504.8 103.2 512 112 512S128 504.8 128 496V480h192v16c0 8.836 7.164 16 16 16s16-7.164 16-16l.0492-16c35.35 0 64.07-28.65 64.07-64V192C416.1 156.7 387.5 128 352.1 128zM160 48C160 39.17 167.2 32 176 32h96C280.8 32 288 39.17 288 48V128H160V48zM384 416c0 17.64-14.36 32-32 32H96c-17.64 0-32-14.36-32-32V192c0-17.64 14.36-32 32-32h256c17.64 0 32 14.36 32 32V416zM304 336h-160C135.2 336 128 343.2 128 352c0 8.836 7.164 16 16 16h160c8.836 0 16-7.164 16-16C320 343.2 312.8 336 304 336zM304 240h-160C135.2 240 128 247.2 128 256c0 8.836 7.164 16 16 16h160C312.8 272 320 264.8 320 256C320 247.2 312.8 240 304 240z"/></svg>
                <h4>تور</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Hotel') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item position-relative">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Hotel') )  }active {/if} disabled" id="Hotel-tab" data-toggle="tab" href="#Hotel">
            <div>
                <span class="coming-soon">بزودی</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M48 384C56.84 384 64 376.8 64 368c0-105.9 86.13-192 192-192s192 86.13 192 192c0 8.844 7.156 16 16 16s16-7.156 16-16c0-118.1-91.97-214.9-208-223.2V96h32C312.8 96 320 88.84 320 80S312.8 64 304 64h-96C199.2 64 192 71.16 192 80S199.2 96 208 96h32v48.81C123.1 153.1 32 249.9 32 368C32 376.8 39.16 384 48 384zM496 416h-480C7.156 416 0 423.2 0 432S7.156 448 16 448h480c8.844 0 16-7.156 16-16S504.8 416 496 416z"/></svg>
                <h4>هتل</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Flight') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Flight') )  }active {/if}" id="Flight-tab"  href="https://bilitnet.ir/" target="_blank">
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M176 153.1V112.1C176 74.04 207 0 256 0C304 0 336 74.04 336 112.1V154.1L422.4 208.1C411.5 213.1 401.1 219.3 391.6 226.3L304 171.1V112.1C304 81.04 278 33.02 256 33.02C233 33.02 208 81.04 208 113.1V172.1L32 282.1V347.2L208 292.1V392.2L144 440.2V480.2L256 448.2L358.1 477.4C366.4 487.9 375.9 497.4 386.4 505.7C378.5 511.4 368.8 513.2 360 511.2L256 480.2L152 510.2C142 513.3 132 511.2 124 505.2C116 499.2 112 490.2 112 480.2V440.2C112 430.2 116 421.2 124 415.2L176 376.2V335.2L41 378.2C31 381.2 20 379.2 12 373.2C4 367.2 0 357.2 0 347.2V282.1C0 271.1 6 259.1 16 254.1L176 153.1zM563.3 324.7C569.6 330.9 569.6 341.1 563.3 347.3L491.3 419.3C485.1 425.6 474.9 425.6 468.7 419.3L428.7 379.3C422.4 373.1 422.4 362.9 428.7 356.7C434.9 350.4 445.1 350.4 451.3 356.7L480 385.4L540.7 324.7C546.9 318.4 557.1 318.4 563.3 324.7H563.3zM352 368C352 288.5 416.5 224 496 224C575.5 224 640 288.5 640 368C640 447.5 575.5 512 496 512C416.5 512 352 447.5 352 368zM496 480C557.9 480 608 429.9 608 368C608 306.1 557.9 256 496 256C434.1 256 384 306.1 384 368C384 429.9 434.1 480 496 480z"/></svg>
                <h4>هواپیما</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Train') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item position-relative">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Train') )  }active {/if} disabled" id="train-tab" data-toggle="tab" href="#train">
            <div>
                <span class="coming-soon">بزودی</span>
                <svg data-v-06e19f0f="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path data-v-06e19f0f="" d="M192 336C192 318.3 206.3 304 224 304C241.7 304 256 318.3 256 336C256 353.7 241.7 368 224 368C206.3 368 192 353.7 192 336zM352 0C405 0 448 42.98 448 96V352C448 398 415.6 436.4 372.4 445.8L411.3 484.7C417.6 490.9 417.6 501.1 411.3 507.3C405.1 513.6 394.9 513.6 388.7 507.3L329.4 448H118.6L59.31 507.3C53.07 513.6 42.94 513.6 36.69 507.3C30.44 501.1 30.44 490.9 36.69 484.7L75.55 445.8C32.36 436.4 0 398 0 352V96C0 42.98 42.98 0 96 0H352zM352 32H96C60.65 32 32 60.65 32 96V224H416V96C416 60.65 387.3 32 352 32zM96 416H352C387.3 416 416 387.3 416 352V256H32V352C32 387.3 60.65 416 96 416z"></path></svg>
                <h4>قطار</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Bus') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Bus') )  }active {/if}" id="Bus-tab" data-toggle="tab" href="#Bus">
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M336 64C344.8 64 352 71.16 352 80C352 88.84 344.8 96 336 96H240C231.2 96 224 88.84 224 80C224 71.16 231.2 64 240 64H336zM184 352C184 365.3 173.3 376 160 376C146.7 376 136 365.3 136 352C136 338.7 146.7 328 160 328C173.3 328 184 338.7 184 352zM392 352C392 338.7 402.7 328 416 328C429.3 328 440 338.7 440 352C440 365.3 429.3 376 416 376C402.7 376 392 365.3 392 352zM72.3 69.88C96.5 40.06 164.2 0 288 0C420.6 0 481.2 39.95 504.2 70.2C510.2 78.14 512 87.36 512 95.15V384C512 407.7 499.1 428.4 480 439.4V496C480 504.8 472.8 512 464 512C455.2 512 448 504.8 448 496V448H128V496C128 504.8 120.8 512 112 512C103.2 512 96 504.8 96 496V439.4C76.87 428.4 64 407.7 64 384V95.15C64 87.42 65.79 77.91 72.3 69.88V69.88zM288 32C170.1 32 113.2 70.22 97.15 90.05C96.77 90.51 96 91.94 96 95.15V128H480V95.15C480 92 479.2 90.3 478.7 89.53C463.9 70.12 414.8 32 288 32zM272 256V160H96V256H272zM304 256H480V160H304V256zM128 416H448C465.7 416 480 401.7 480 384V288H96V384C96 401.7 110.3 416 128 416zM32 240C32 248.8 24.84 256 16 256C7.164 256 0 248.8 0 240V144C0 135.2 7.164 128 16 128C24.84 128 32 135.2 32 144V240zM576 240C576 248.8 568.8 256 560 256C551.2 256 544 248.8 544 240V144C544 135.2 551.2 128 560 128C568.8 128 576 135.2 576 144V240z"/></svg>
                <h4>اتوبوس</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Insurance') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Insurance') )  }active {/if}" id="Insurance-tab" data-toggle="tab" href="#Insurance">
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M471.6 99.4c46.8 45.1 72.2 109 68.3 174.7l-86.3-31.4c15.2-43.2 21.6-89 18.9-134.8c-.2-2.9-.5-5.7-.9-8.5zM402.8 54.3c21.7 10.1 36.3 31.4 37.7 55.6c2.5 41.4-3.3 82.8-17 121.9l-167.6-61c14.6-38.8 36.9-74.2 65.3-104.3c17.5-18.5 44.1-25.2 68.2-17.3c1.1 .4 2.2 .8 3.3 1.2c3.4 1.2 6.7 2.5 10 3.9zm-3.1-35.4c-109.8-38-228.4 3.2-292.6 94c-11.1 15.7-2.8 36.8 15.3 43.4l92.4 33.6 0 0L245 200.9l167.6 61 30.1 10.9 0 0 89.1 32.4c18.1 6.6 38-4.2 39.6-23.4c9-108.1-52-213.2-155.6-256.9c-2.4-1.1-4.9-2.1-7.4-3l-5.9-2.1c-.9-.3-1.8-.6-2.7-.9zM305.9 37c-2.7 2.3-5.4 4.8-7.9 7.5c-31.5 33.3-56 72.5-72.2 115.4l-89.6-32.6C176.5 73 239.2 40.1 305.9 37zM16 480c-8.8 0-16 7.2-16 16s7.2 16 16 16H560c8.8 0 16-7.2 16-16s-7.2-16-16-16H253.4l77.8-213.7-30.1-10.9L219.4 480H16z"/></svg>
                <h4>بیمه</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Europcar') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item position-relative">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Europcar') )  }active {/if} disabled" id="car-tab" data-toggle="tab" href="#car">
            <div>
                <span class="coming-soon">بزودی</span>
                <svg data-v-06e19f0f="" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path data-v-06e19f0f="" d="M124.2 0H259.8C288.4 0 313.5 18.94 321.3 46.42L342.1 122.1C353 127.7 361.7 135.5 368.5 144.7C356.6 146.2 345.3 149.8 334.1 155.3C326.6 148.3 315.8 144 304 144H80C53.49 144 32 165.5 32 192V256H275.8L269.6 277.8C265.3 280.9 261.4 284.3 257.6 288H32V320C32 328.8 24.84 336 16 336C7.164 336 0 328.8 0 320V192C0 161.1 16.56 135.8 41.04 122.1L62.67 46.42C70.52 18.94 95.63 0 124.2 0V0zM124.2 32C109.9 32 97.36 41.47 93.44 55.21L77.2 112C78.13 112 79.06 112 80 112H304C304.9 112 305.9 112 306.8 112L290.6 55.21C286.6 41.47 274.1 32 259.8 32H124.2zM56 200C56 186.7 66.75 176 80 176C93.25 176 104 186.7 104 200C104 213.3 93.25 224 80 224C66.75 224 56 213.3 56 200zM312 376C312 362.7 322.7 352 336 352C349.3 352 360 362.7 360 376C360 389.3 349.3 400 336 400C322.7 400 312 389.3 312 376zM584 376C584 389.3 573.3 400 560 400C546.7 400 536 389.3 536 376C536 362.7 546.7 352 560 352C573.3 352 584 362.7 584 376zM380.2 176H515.8C544.4 176 569.5 194.9 577.3 222.4L598.1 298.1C623.4 311.8 640 337.1 640 368V496C640 504.8 632.8 512 624 512C615.2 512 608 504.8 608 496V464H287.1V496C287.1 504.8 280.8 512 271.1 512C263.2 512 255.1 504.8 255.1 496V368C255.1 337.1 272.6 311.8 297 298.1L318.7 222.4C326.5 194.9 351.6 176 380.2 176H380.2zM380.2 208C365.9 208 353.4 217.5 349.4 231.2L333.2 288C334.1 288 335.1 288 336 288H560C560.9 288 561.9 288 562.8 288L546.6 231.2C542.6 217.5 530.1 208 515.8 208H380.2zM608 368C608 341.5 586.5 320 560 320H336C309.5 320 288 341.5 288 368V432H608V368z"></path></svg>
                <h4>خودرو</h4>
            </div>
        </a>
    </li>
{/if}
{if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Visa') || $smarty.const.GDS_SWITCH eq 'mainPage')  }

    <li class="nav-item position-relative">
        <a class="nav-link {if (($smarty.const.GDS_SWITCH eq 'page'  && $active_tab eq 'Visa') )  }active {/if} disabled" id="Visa-tab" data-toggle="tab" href="#Visa">
            <div>
                <span class="coming-soon">بزودی</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 80c-70.75 0-128 57.25-128 128s57.25 128 128 128s128-57.25 128-128S294.8 80 224 80zM129.6 224h39.13c1.5 27 6.5 51.38 14.12 70.38C155.3 281.1 134.9 255.3 129.6 224zM168.8 192H129.6c5.25-31.25 25.62-57.13 53.25-70.38C175.3 140.6 170.3 165 168.8 192zM224 302.8C216.3 295.3 203.3 268.3 200.6 224h46.75C244.8 268.3 231.8 295.3 224 302.8zM200.5 192C203.3 147.8 216.3 120.8 224 113.3C231.8 120.8 244.8 147.8 247.4 192H200.5zM265.1 294.4C272.8 275.4 277.8 251 279.3 224h39.13C313.1 255.3 292.8 281.1 265.1 294.4zM279.3 192c-1.5-27-6.5-51.38-14.12-70.38c27.62 13.25 48 39.13 53.25 70.38H279.3zM448 368v-320C448 21.49 426.5 0 400 0h-320C35.82 0 0 35.82 0 80V448c0 35.35 28.65 64 64 64h368c8.844 0 16-7.156 16-16S440.8 480 432 480H416v-66.95C434.6 406.4 448 388.8 448 368zM384 480H64c-17.64 0-32-14.36-32-32s14.36-32 32-32h320V480zM400 384H64c-11.71 0-22.55 3.389-32 8.9V80C32 53.49 53.49 32 80 32h320C408.8 32 416 39.16 416 48v320C416 376.8 408.8 384 400 384z"/></svg>
                <h4>ویزا</h4>
            </div>
        </a>
    </li>
{/if}
