{assign var=dateNow value=dateTimeSetting::jdate("Ymd", "", "", "", "en")}
{assign var="internal_hotel_params" value=['Count'=> '5', 'type' =>'internal']}
{assign var="foregin_hotel_params" value=['Count'=> '5','type' =>'external']}

{assign var='internal_hotels' value=$obj_main_page->getHotelWebservice($internal_hotel_params)}
{assign var='foregin_hotels' value=$obj_main_page->getHotelWebservice($foregin_hotel_params)}

<div class="section_hotel popular_destination_area">
    <div class="container">
        <ul class="nav nav-tabs" id="tabsHotel" role="tablist">
            <li class="nav-item">
                <a class="nav-link active show" id="Hotel_L-tab" data-toggle="tab" href="#Hotel_L"
                                    role="tab" aria-controls="Hotel_L" aria-selected="true">
                    هتل داخلی
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="Hotel_F-tab" data-toggle="tab" href="#Hotel_F" role="tab"
                                    aria-controls="Hotel_F" aria-selected="false">
                    هتل خارجی
                </a>
            </li>
        </ul>
        <div class="tab-content" id="tabsHotelContent">
            <div class="tab-pane fade show active" id="Hotel_L" role="tabpanel" aria-labelledby="Hotel_L-tab">
                <div class="row">
                    <div class="owl_4 owl-carousel">
                        {foreach $internal_hotels as $item}

                        <div class="item">
                            <a href="{$smarty.const.ROOT_ADDRESS}/detailHotel/api/{$item['HotelIndex']}">
                                <div class="single_destination">
                                    <div class="thumb">
                                        <img src="{$item['Picture']}"
                                                alt="{$item['City']}">
                                    </div>
                                    <div class="content">
                                        <p class="d-flex align-items-center">
                                            {$item['Name']}
                                        </p>
                                        <span class="d-flex align-items-center">
                                            {$item['City']}
                                        </span>
                                        {for $i = 0; $i < count($item['StarCode']); $i++}
                                            <div class="rating rating_{$item['StarCode']}">
                                                {for $star = 1; $star <= 5; $star++}
                                                    {if $star <= $item['StarCode']}
                                                        <i class="fa fa-star"></i>
                                                    {else}
                                                        <i class="fa fa-star-o"></i>
                                                    {/if}
                                                {/for}
                                            </div>
                                        {/for}

                                    </div>
                                </div>
                            </a></div>
                        {/foreach}
                    </div>
                </div>
            </div>
            <div class="tab-pane " id="Hotel_F" role="tabpanel" aria-labelledby="Hotel_F-tab">
                <div class="row">
                    <div class="owl_4 owl-carousel">
                        {foreach $foregin_hotels as $item}

                            <div class="item">
                                <a href="{$smarty.const.ROOT_ADDRESS}/roomHotelLocal/reservation/{$item['id']}/{$item['name_en']}">
                                    <div class="single_destination">
                                        <div class="thumb">
                                            <img src="{$item['logo']}"
                                                 alt="{$item['name']}">
                                        </div>
                                        <div class="content">
                                            <p class="d-flex align-items-center">
                                                {$item['name']}
                                            </p>
                                            <span class="d-flex align-items-center">
                                            {$item['address']}
                                        </span>
                                            {for $i = 0; $i < count($item['star_code']); $i++}
                                                <div class="rating rating_{$item['star_code']}">
                                                    {for $star = 1; $star <= 5; $star++}
                                                        {if $star <= $item['star_code']}
                                                            <i class="fa fa-star"></i>
                                                        {else}
                                                            <i class="fa fa-star-o"></i>
                                                        {/if}
                                                    {/for}
                                                </div>
                                            {/for}

                                        </div>
                                    </div>
                                </a></div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
