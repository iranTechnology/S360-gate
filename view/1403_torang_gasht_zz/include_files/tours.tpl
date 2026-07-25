{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_tour_params" value=['type'=>'special','limit'=> '4','dateNow' => $dateNow, 'country' =>'internal']}
{assign var="foreging_tour_params" value=['type'=>'special','limit'=> '4','dateNow' => $dateNow, 'country' =>'external']}

{assign var='internalTours' value=$obj_main_page->getToursReservation($internal_tour_params)}
{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}


{if !empty($internalTours) || !empty($foreginTours)}
    <section class="special_tour my-5">
        <div class="container">
            <nav class="mt-4">
                <div class="nav nav-tabs mb-2" id="nav-tab2" role="tablist">
                    <a class="nav-link active" id="pills-home-tab" data-toggle="tab" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">تور های داخلی</a>
                    <a class="nav-link" id="pills-profile-tab" data-toggle="tab" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">تورهای خارجی</a>
                </div>
            </nav>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <div class="special_tour_main mt-5">
                        {foreach $internalTours as $item}
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
                                <div class="special_tour_main_img">
                                    <img  src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}"></div>
                                <div class="special_tour_main_div"><h2>{$item['tour_name']}</h2>
                                    <div class="special_tour_main_div_grid">
                                        <div><i>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                    <path d="M421.6 379.9c-.6641 0-1.35 .0625-2.049 .1953c-11.24 2.143-22.37 3.17-33.32 3.17c-94.81 0-174.1-77.14-174.1-175.5c0-63.19 33.79-121.3 88.73-152.6c8.467-4.812 6.339-17.66-3.279-19.44c-11.2-2.078-29.53-3.746-40.9-3.746C132.3 31.1 32 132.2 32 256c0 123.6 100.1 224 223.8 224c69.04 0 132.1-31.45 173.8-82.93C435.3 389.1 429.1 379.9 421.6 379.9zM255.8 432C158.9 432 80 353 80 256c0-76.32 48.77-141.4 116.7-165.8C175.2 125 163.2 165.6 163.2 207.8c0 99.44 65.13 183.9 154.9 212.8C298.5 428.1 277.4 432 255.8 432z"/>
                                                </svg>
                                            </i><h6>{$item['night']} شب</h6></div>
                                        <div><i>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                                    <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                    <path d="M216.1 408.1C207.6 418.3 192.4 418.3 183 408.1L119 344.1C109.7 335.6 109.7 320.4 119 311C128.4 301.7 143.6 301.7 152.1 311L200 358.1L295 263C304.4 253.7 319.6 253.7 328.1 263C338.3 272.4 338.3 287.6 328.1 296.1L216.1 408.1zM128 0C141.3 0 152 10.75 152 24V64H296V24C296 10.75 306.7 0 320 0C333.3 0 344 10.75 344 24V64H384C419.3 64 448 92.65 448 128V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V128C0 92.65 28.65 64 64 64H104V24C104 10.75 114.7 0 128 0zM400 192H48V448C48 456.8 55.16 464 64 464H384C392.8 464 400 456.8 400 448V192z"/>
                                                </svg>
                                            </i><h6>
                                            {assign var="year" value=substr($item['start_date'], 0, 4)}
                                                {assign var="month" value=substr($item['start_date'], 4, 2)}
                                                {assign var="day" value=substr($item['start_date'], 6)}
                                                {$year}-{$month}-{$day}
                                            </h6></div>
                                        <div><i>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                                    <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                    <path d="M255.1 0C304.1 0 336 73.89 336 111.8V153.8L422.5 207.7C406.2 215.2 391.3 225.1 378.1 236.1L287.1 180.7V112.8C287.1 85.87 266.1 49.93 255.1 48.93C245.1 50.93 223.1 86.87 223.1 112.8V180.7L47.1 290.6V324.5L223.1 269.6V383.4L159.1 431.4V458.3L255.1 430.4L343.9 455.1C355.2 475.2 369.9 492.1 387.4 505.7C379.5 511.4 369.7 513.2 360 510.3L256 480.3L152 511.3C143 513.2 133 511.3 125 505.3C117 499.3 112 489.3 112 480.3V423.4C112 413.4 117 404.4 125 398.4L176 359.5V334.5L41 377.4C32 380.4 21 378.4 13 372.5C5 366.5 0 356.5 0 346.5V281.6C0 270.6 7 258.6 16 254.6L176 154.8V112.8C176 73.89 208 0 256 0L255.1 0zM319.1 367.5C319.1 382.7 321.9 397.5 325.6 411.6L287.1 383.4V269.6L340.1 285.9C327.3 310.2 319.1 338 319.1 367.5V367.5zM640 368C640 447.5 575.5 512 496 512C416.5 512 352 447.5 352 368C352 288.5 416.5 224 496 224C575.5 224 640 288.5 640 368zM540.7 324.7L480 385.4L451.3 356.7C445.1 350.4 434.9 350.4 428.7 356.7C422.4 362.9 422.4 373.1 428.7 379.3L468.7 419.3C474.9 425.6 485.1 425.6 491.3 419.3L563.3 347.3C569.6 341.1 569.6 330.9 563.3 324.7C557.1 318.4 546.9 318.4 540.7 324.7H540.7z"/>
                                                </svg>
                                            </i><h6>iran</h6></div>
                                    </div>
                                    <div class="special_tour_main_footer"><h5>قیمت {$item['min_price_r']|number_format} ریال</h5></div>
                                </div>
                            </a>
                        {/foreach}

                    </div>
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <div class="special_tour_main mt-5">
                        {foreach $foreginTours as $item}
                                <a href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id_same']}/{$item['tour_slug']}">
                                <div class="special_tour_main_img">
                                    <img  src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}" alt="{$item['tour_name']}"></div>
                                <div class="special_tour_main_div"><h2>{$item['tour_name']}</h2>
                                    <div class="special_tour_main_div_grid">
                                        <div><i>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                    <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                    <path d="M421.6 379.9c-.6641 0-1.35 .0625-2.049 .1953c-11.24 2.143-22.37 3.17-33.32 3.17c-94.81 0-174.1-77.14-174.1-175.5c0-63.19 33.79-121.3 88.73-152.6c8.467-4.812 6.339-17.66-3.279-19.44c-11.2-2.078-29.53-3.746-40.9-3.746C132.3 31.1 32 132.2 32 256c0 123.6 100.1 224 223.8 224c69.04 0 132.1-31.45 173.8-82.93C435.3 389.1 429.1 379.9 421.6 379.9zM255.8 432C158.9 432 80 353 80 256c0-76.32 48.77-141.4 116.7-165.8C175.2 125 163.2 165.6 163.2 207.8c0 99.44 65.13 183.9 154.9 212.8C298.5 428.1 277.4 432 255.8 432z"/>
                                                </svg>
                                            </i><h6>{$item['night']} شب</h6></div>
                                        <div><i>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                                    <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                    <path d="M216.1 408.1C207.6 418.3 192.4 418.3 183 408.1L119 344.1C109.7 335.6 109.7 320.4 119 311C128.4 301.7 143.6 301.7 152.1 311L200 358.1L295 263C304.4 253.7 319.6 253.7 328.1 263C338.3 272.4 338.3 287.6 328.1 296.1L216.1 408.1zM128 0C141.3 0 152 10.75 152 24V64H296V24C296 10.75 306.7 0 320 0C333.3 0 344 10.75 344 24V64H384C419.3 64 448 92.65 448 128V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V128C0 92.65 28.65 64 64 64H104V24C104 10.75 114.7 0 128 0zM400 192H48V448C48 456.8 55.16 464 64 464H384C392.8 464 400 456.8 400 448V192z"/>
                                                </svg>
                                            </i><h6>
                                                {assign var="year" value=substr($item['start_date'], 0, 4)}
                                                {assign var="month" value=substr($item['start_date'], 4, 2)}
                                                {assign var="day" value=substr($item['start_date'], 6)}
                                                {$year}-{$month}-{$day}
                                            </h6></div>
                                        <div><i>
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                                    <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                    <path d="M255.1 0C304.1 0 336 73.89 336 111.8V153.8L422.5 207.7C406.2 215.2 391.3 225.1 378.1 236.1L287.1 180.7V112.8C287.1 85.87 266.1 49.93 255.1 48.93C245.1 50.93 223.1 86.87 223.1 112.8V180.7L47.1 290.6V324.5L223.1 269.6V383.4L159.1 431.4V458.3L255.1 430.4L343.9 455.1C355.2 475.2 369.9 492.1 387.4 505.7C379.5 511.4 369.7 513.2 360 510.3L256 480.3L152 511.3C143 513.2 133 511.3 125 505.3C117 499.3 112 489.3 112 480.3V423.4C112 413.4 117 404.4 125 398.4L176 359.5V334.5L41 377.4C32 380.4 21 378.4 13 372.5C5 366.5 0 356.5 0 346.5V281.6C0 270.6 7 258.6 16 254.6L176 154.8V112.8C176 73.89 208 0 256 0L255.1 0zM319.1 367.5C319.1 382.7 321.9 397.5 325.6 411.6L287.1 383.4V269.6L340.1 285.9C327.3 310.2 319.1 338 319.1 367.5V367.5zM640 368C640 447.5 575.5 512 496 512C416.5 512 352 447.5 352 368C352 288.5 416.5 224 496 224C575.5 224 640 288.5 640 368zM540.7 324.7L480 385.4L451.3 356.7C445.1 350.4 434.9 350.4 428.7 356.7C422.4 362.9 422.4 373.1 428.7 379.3L468.7 419.3C474.9 425.6 485.1 425.6 491.3 419.3L563.3 347.3C569.6 341.1 569.6 330.9 563.3 324.7C557.1 318.4 546.9 318.4 540.7 324.7H540.7z"/>
                                                </svg>
                                            </i><h6>eurpe</h6></div>
                                    </div>
                                    <div class="special_tour_main_footer"><h5>قیمت {$item['min_price_r']|number_format} ریال</h5></div>
                                </div>
                            </a>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </section>

{/if}
