{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="special_tour_params" value=['type'=>'','limit'=> '4','dateNow' => $dateNow]}
{assign var='special_tours' value=$obj_main_page->getToursReservation($special_tour_params)}


{if !empty($special_tours)}
<section class="sp-tour-banner">

    <div class="sp-tour-banner__inner container">

        <div class="title-center-demo">
            <div class="">
                <h2>
                    <div class="square-title"></div>
                    <span>تورهای ویژه</span>
                </h2>
                <p>
                    تورهای ویژه با برنامه‌های منحصر به فرد و خدمات اختصاصی، تجربه‌ای متمایز و به‌یادماندنی را برای مسافران فراهم می‌کنند.
                </p>
            </div>
        </div>

        <div class="owl-carousel owl-theme owl-tour-demo">
        {foreach $special_tours as $tour}
        <div class="sp-tour-banner__header item">
            <div class="sp-tour-banner__parent">
                <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/reservationTour/{$tour['tour_pic']}"
                     alt="تورهای ویژه">
                <h3 class="__title_class__">
                    {$tour['tour_name']}
                </h3>
                <div class="sp-tour-banner__actions">
                    {if isset($tour.tour_file) && $tour.tour_file neq ''}
                        <a href="gds/pic/reservationTour/{$tour.tour_file}"
                           target="_blank" class="sp-tour-banner__btn sp-tour-banner__btn--download">
                            دانلود پکیج
                        </a>
                    {/if}
                </div>
            </div>

        </div>
        {/foreach}
        </div>



    </div>

</section>
{literal}
    <style>
        .sp-tour-banner h2 .square-title {
            width: 16px;
            height: 16px;
            background: #37589e;
            border-radius: 4px;
            display: inline-block;
            margin-left: 8px;
        }
        .sp-tour-banner h2 span {
            font-size: 20px;
            color: #444;
            font-weight: 600;
        }


        /* Wrapper */
        .sp-tour-banner {
            margin: 40px 0;
        }


        /* Header */
        .sp-tour-banner__header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
        }

        /* Title */
        .sp-tour-banner__title {
            font-size: 20px;
            color: #444;
            font-weight: 600;
        }

        /* Actions */
        .sp-tour-banner__actions {
            display: flex;
            gap: 10px;
            position: absolute;
            bottom: 10px;
            left: 10px;
        }

        /* Buttons */
        .sp-tour-banner__btn {
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: all .2s ease;
        }

        /* Download */
        .sp-tour-banner__btn--download {
            background: #eb1e25;
            color: #fff;
        }

        .sp-tour-banner__btn--download:hover {
            color: #fff;
        }

        /* Login */
        .sp-tour-banner__btn--login {
            background: #fff;
            color: #111827;
            border: 1px solid #d1d5db;
        }

        .sp-tour-banner__btn--login:hover {
            background: #f3f4f6;
        }

        /* Image */
        .sp-tour-banner__parent {
            margin-top: 12px;
            border-radius: 14px;
            overflow: hidden;
            width: 100%;
            position: relative;
        }

        .sp-tour-banner__parent img {
            display: block !important;
            width: 100% !important;
            filter: brightness(65%) !important;
            height: 200px !important;
            object-fit: cover !important;
        }

        .sp-tour-banner__parent h3 {
            position: absolute;
            bottom: 2px;
            color: #fff;
            right: 10px;
        }

    </style>
{/literal}

{/if}
