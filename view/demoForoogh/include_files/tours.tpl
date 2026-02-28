{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="tour_params_internal" value=['type'=>'','limit'=> '4','dateNow' => $dateNow, 'country' =>'internal','city' => null]}
{assign var='tour_internal' value=$obj_main_page->getToursReservation($tour_params_internal)}
{if $tour_internal}
    {assign var='check_general' value=true}
{/if}

{if $check_general}
    <section class="tour i_modular_tours">
        <div class="container">
            <div class="title">
                <div class="box-right">
                    <div class="text-title">
                        <h5>تور های داخلی</h5>
                        <span> تورهای داخلی  فرصتی بی‌نظیر برای کشف فرهنگ‌ها، مناظر طبیعی و آثار تاریخی در داخل از کشور فراهم می‌کنند. </span>
                    </div>
                </div>
                <a class="more-title" href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all">

                    مشاهده بیشتر

                    <i class="fa-solid fa-arrow-left"></i>
                </a>
            </div>


            <div class="desktop parent-grid-box __tour__internal__">
                {foreach $tour_internal as $item}
                <a class="tour_div __link__ __i_modular_nc_item_class_0" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                    <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                    <div class="tour_text">
                        <h6 class="tour_title __title_class__">{$item['tour_name']}</h6>
                        <p class="tour_dis __description_class__">{$item['destination_city_name']}</p>
                        <div class="parent-night-price">
<span class="tour_night">
<svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M310.1 389.5c-31.72 5.969-63.91-2.281-88.59-22.72c-24.78-20.5-39-50.72-39-82.91c0-38.56 20.84-74.47 54.19-93.53c11.91-6.656 18.12-19.59 15.91-33.03C250.4 143.9 240.3 133.7 226.1 131.3C170.6 120.7 113.1 135.8 69.16 172.4C25.22 209 0 262.8 0 320c0 105.9 86.01 192 191.8 192c58.19 0 112.6-26.08 148.9-71.04c8.594-10.38 9.619-24.99 2.681-36.55C336.5 392.9 323.1 386.9 310.1 389.5zM191.8 464C112.5 464 48 399.4 48 320c0-42.91 18.91-83.25 51.88-110.7c22.28-18.53 49.22-29.69 77.41-32.53C150.3 205.4 134.5 243.6 134.5 283.9c0 46.53 20.56 90.25 56.41 119.9c23.81 19.72 52.5 31.59 82.53 34.78C249.8 455 221.4 464 191.8 464zM288 63.1l12.42 29.78c.6094 1.225 2.211 2.219 3.578 2.219s2.967-.9941 3.576-2.219l12.42-29.78l29.79-12.42C351 50.97 352 49.36 352 47.1c0-1.365-.9922-2.967-2.211-3.576l-29.79-12.42l-12.42-29.79c-.6094-1.227-2.209-2.217-3.576-2.217s-2.969 .9902-3.578 2.217l-12.42 29.79L258.2 44.42c-1.217 .6094-2.209 2.211-2.209 3.576c0 1.359 .9922 2.971 2.209 3.58L288 63.1zM507.6 216.9L448 192l-24.88-59.63C421.8 129.8 419 127.1 416 127.1s-5.75 1.75-7.125 4.375L384 192l-59.63 24.88C321.8 218.3 320 221 320 224s1.75 5.75 4.375 7.125L384 256l24.88 59.63C410.3 318.3 413 320 416 320s5.75-1.75 7.125-4.375L448 256l59.63-24.88C510.3 229.8 512 227 512 224S510.3 218.3 507.6 216.9z"></path></svg>
<span class="__night_class__">{$item['night']}</span> شب

                            </span>
                            <div class="box-price">
                                <span class="tour_dis_price">شروع قیمت از :</span>
                                <h6 class="tour_title_price ___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</h6>
                            </div>
                        </div>
                    </div>
                </a>
                {/foreach}
            </div>


            <div class="mobile owl-carousel owl-theme owl-work-tour parent-grid-box __tour__internal__">
                {foreach $tour_internal as $item}
                    <a class="item tour_div __link__ __i_modular_nc_item_class_0" href="{$smarty.const.ROOT_ADDRESS}/detailTour/{$item['id']}/{$item['tour_slug']}">
                        <img alt="{$item['tour_name']}" class="__image_class__" src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$item['tour_pic']}"/>
                        <div class="tour_text">
                            <h6 class="tour_title __title_class__">{$item['tour_name']}</h6>
                            <p class="tour_dis __description_class__">{$item['destination_city_name']}</p>
                            <div class="parent-night-price">
<span class="tour_night">
<svg viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M310.1 389.5c-31.72 5.969-63.91-2.281-88.59-22.72c-24.78-20.5-39-50.72-39-82.91c0-38.56 20.84-74.47 54.19-93.53c11.91-6.656 18.12-19.59 15.91-33.03C250.4 143.9 240.3 133.7 226.1 131.3C170.6 120.7 113.1 135.8 69.16 172.4C25.22 209 0 262.8 0 320c0 105.9 86.01 192 191.8 192c58.19 0 112.6-26.08 148.9-71.04c8.594-10.38 9.619-24.99 2.681-36.55C336.5 392.9 323.1 386.9 310.1 389.5zM191.8 464C112.5 464 48 399.4 48 320c0-42.91 18.91-83.25 51.88-110.7c22.28-18.53 49.22-29.69 77.41-32.53C150.3 205.4 134.5 243.6 134.5 283.9c0 46.53 20.56 90.25 56.41 119.9c23.81 19.72 52.5 31.59 82.53 34.78C249.8 455 221.4 464 191.8 464zM288 63.1l12.42 29.78c.6094 1.225 2.211 2.219 3.578 2.219s2.967-.9941 3.576-2.219l12.42-29.78l29.79-12.42C351 50.97 352 49.36 352 47.1c0-1.365-.9922-2.967-2.211-3.576l-29.79-12.42l-12.42-29.79c-.6094-1.227-2.209-2.217-3.576-2.217s-2.969 .9902-3.578 2.217l-12.42 29.79L258.2 44.42c-1.217 .6094-2.209 2.211-2.209 3.576c0 1.359 .9922 2.971 2.209 3.58L288 63.1zM507.6 216.9L448 192l-24.88-59.63C421.8 129.8 419 127.1 416 127.1s-5.75 1.75-7.125 4.375L384 192l-59.63 24.88C321.8 218.3 320 221 320 224s1.75 5.75 4.375 7.125L384 256l24.88 59.63C410.3 318.3 413 320 416 320s5.75-1.75 7.125-4.375L448 256l59.63-24.88C510.3 229.8 512 227 512 224S510.3 218.3 507.6 216.9z"></path></svg>
<span class="__night_class__">{$item['night']}</span> شب

                            </span>
                                <div class="box-price">
                                    <span class="tour_dis_price">شروع قیمت از :</span>
                                    <h6 class="tour_title_price ___price_class__">{$item['min_price']['discountedMinPriceR']|number_format}</h6>
                                </div>
                            </div>
                        </div>
                    </a>
                {/foreach}
            </div>



        </div>
    </section>
{/if}