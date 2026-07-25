
{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="special_tour_params" value=['type'=>'special','limit'=> '4','dateNow' => $dateNow]}

{assign var='special_tours' value=$obj_main_page->getToursReservation($special_tour_params)}

{assign var="internal_tour_params" value=['type'=>'','limit'=> '6','dateNow' => '', 'country' =>'internal']}
{assign var="foreging_tour_params" value=['type'=>'','limit'=> '1','dateNow' => '', 'country' =>'external']}

{assign var='foreginTours' value=$obj_main_page->getToursReservation($foreging_tour_params)}



<section class="sp-tour-banner">

    <div class="sp-tour-banner__inner container">

        <div class="sp-tour-banner__header">
            <h2>
                <span>تور استانبول</span>
            </h2>

            <div class="sp-tour-banner__actions">
                {if isset($foreginTours[0].tour_file) && $foreginTours[0].tour_file neq ''}
                    <a href="gds/pic/reservationTour/{$foreginTours[0].tour_file}"
                       target="_blank" class="sp-tour-banner__btn sp-tour-banner__btn--download">
                        دانلود پکیج
                    </a>
                {/if}


                <a href="/gds/fa/detailTour/8/zemestantour"
                   class="sp-tour-banner__btn sp-tour-banner__btn--login">
                    جزئیات تور ...
                </a>
            </div>
        </div>

        <div class="sp-tour-banner__image">
            <img src="project_files/images/ist-porsetare.jpg"
                 alt="تورهای ویژه">
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
            background: #2563eb;
            color: #fff;
        }

        .sp-tour-banner__btn--download:hover {
            background: #1e40af;
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
        .sp-tour-banner__image {
            margin-top: 12px;
            border-radius: 14px;
            overflow: hidden;
        }

        .sp-tour-banner__image img {
            width: 100%;
            height: auto;
            display: block;
        }

    </style>
{/literal}