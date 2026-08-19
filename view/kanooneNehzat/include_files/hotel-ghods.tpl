<section class="hotel-ghods">
    <div class="container">
        <div class="title-safiran">
            <div class="text-title-safiran">
                <h2>اقامتگاه‌ها</h2>
            </div>
        </div>
        <div class="parent-hotel">
            <div class="item">
                <a class="link-parent" href="{$smarty.const.ROOT_ADDRESS}/searchHotel&type=new&city=65&startDate={$objDate->daysAfterToday('1')}&nights=1&rooms=R:2-0-0">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-1.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های مشهد مقدس</h3>
                    </div>
                </a>
            </div>
            <div class="item">
                <a class="link-parent" href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/iraq/Karbala/{$objDate->daysAfterToday('1')}/{$objDate->daysAfterToday('2')}/1/R:2-0-0">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-2.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های عراق</h3>
                    </div>
                </a>
            </div>
            <div class="item">
                <a class="link-parent" href="javascript:">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-3.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های شمال</h3>
                    </div>
                </a>
            </div>
            <div class="item">
                <a class="link-parent" href="{$smarty.const.ROOT_ADDRESS}/searchHotel&type=new&city=163&startDate={$objDate->daysAfterToday('1')}&nights=1&rooms=R:2-0-0">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-4.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های سازمانی</h3>
                    </div>
                </a>
            </div>
        </div>
        {*        {include file="./hotels-webservice.tpl"}*}
        <div class="owl-carousel owl-theme parent-hotel-owl">
            <div class="item">
                <a class="link-parent"  href="{$smarty.const.ROOT_ADDRESS}/searchHotel&type=new&city=65&startDate={$objDate->daysAfterToday('1')}&nights=1&rooms=R:2-0-0">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-1.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های مشهد مقدس</h3>
                    </div>
                </a>
            </div>
            <div class="item">
                <a class="link-parent" href="{$smarty.const.ROOT_ADDRESS}/resultExternalHotel/iraq/Karbala/{$objDate->daysAfterToday('1')}/{$objDate->daysAfterToday('2')}/1/R:2-0-0">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-2.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های عراق</h3>
                    </div>
                </a>
            </div>
            <div class="item">
                <a class="link-parent" href="javascript:">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-3.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های شمال</h3>
                    </div>
                </a>
            </div>
            <div class="item">
                <a class="link-parent" href="{$smarty.const.ROOT_ADDRESS}/searchHotel&type=new&city=163&startDate={$objDate->daysAfterToday('1')}&nights=1&rooms=R:2-0-0">
                    <div class="img-hotel">
                        <img alt="img-hotel" src="project_files/images/hotel-box-4.webp" />
                    </div>
                    <div class="text-hotel">
                        <h3>اقامتگاه های سازمانی</h3>
                    </div>
                </a>
            </div>
        </div>
        {*        {include file="./hotels-webservice-second.tpl"}*}
        <div class="bg-btn-karvan mx-auto mt-4">
            <a class="btn-karvan" href="{$smarty.const.ROOT_ADDRESS}/page/hotel">
                <span>بیشتر</span>
                <i class="fa-solid fa-arrow-left mr-3"></i>
            </a>
        </div>
    </div>
</section>
