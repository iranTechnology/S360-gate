{assign var="type_data" value=['is_active'=>1 , 'limit' =>10]}
                            {assign var='banners' value=$obj_main_page->galleryBannerMain($type_data)}
                            {if $page.files.main_file}
                                {$banners = [0 => ['pic' => $page.files.main_file.src , 'title' => 'page']]}
                            {/if}
                            <style>
                                .banner-slider-display {
                                    display: none !important;
                                }
                            </style>

<section class="i_modular_banner_gallery banner-safiran">
<!--        <div class="owl-carousel owl-theme owl-banner-kanoun">-->
<!--            <div class="__i_modular_nc_item_class_0 item">-->
<!--                <img class="__image_class__" src="project_files/images/bg.jpg" alt="img-banner">-->
<!--            </div>-->
<!--            <div class="__i_modular_nc_item_class_1 item">-->
<!--                <img src="project_files/images/KarbalaNight.jpg" alt="img-banner">-->
<!--            </div>-->
<!--            <div class="__i_modular_nc_item_class_2 item">-->
<!--                <img src="project_files/images/emam-hoseyn-1.jpg" alt="img-banner">-->
<!--            </div>-->
<!--        </div>-->
<div class="banner">
<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
<div data-src="project_files/images/bg.jpg" data-thumb="project_files/images/bg.jpg">
<div class="title-banner">
<h3> موسسه فرهنگی خادمان نهضت تبلیغ</h3>
<p class="__title_class__">مجری کاروان‌های گروهی و سفرهای انفرادی</p>
</div>
</div>
<div data-src="project_files/images/KarbalaNight.jpg" data-thumb="project_files/images/KarbalaNight.jpg">
<div class="title-banner">
<h3> موسسه فرهنگی خادمان نهضت تبلیغ</h3>
<p class="__title_class__">مجری کاروان‌های گروهی و سفرهای انفرادی</p>
</div>
</div>
<div data-src="project_files/images/emam-hoseyn-1.jpg" data-thumb="project_files/images/emam-hoseyn-1.jpg">
<div class="title-banner">
<h3> موسسه فرهنگی خادمان نهضت تبلیغ</h3>
<p class="__title_class__">مجری کاروان‌های گروهی و سفرهای انفرادی</p>
</div>
</div>
</div>
</div>
<div class="title-banner title-banner-res">
<h3> موسسه فرهنگی خادمان نهضت تبلیغ</h3>
<p class="__title_class__">مجری کاروان‌های عتبات و تورهای زیارتی</p>
</div>
<div class="i_modular_searchBox search_box">
<div class="container">
<div class="search_box_div">
<ul class="__search_box_tabs__ nav" id="searchBoxTabs">{include file="./search-box/tabs-search-box.tpl"}</ul>
<div class="__search_boxes__ tab-content" id="searchBoxContent">{include file="./search-box/boxs-search.tpl"}</div>
</div>
</div>
</div>
<!--        <div class="i_modular_searchBox search_box">-->
<!--            <div class="container position-relative">-->
<!--                <div class="search_box_div">-->
<!--                    <ul class="__search_box_tabs__ nav" id="searchBoxTabs">-->
<!--                        <li class="nav-item">-->
<!--                            <a class="nav-link active" id="Hotel-tab" data-toggle="tab" href="#Hotel">-->
<!--                                <div>-->
<!--                                    <svg version="1.2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="100" height="100">-->
<!--                                        <g id="<Group>">-->
<!--                                            <path id="<Path>" class="s0" d="m88 90.4h-76.8c-2.9 0-5.2-2.3-5.2-5.2v-49.6c0-2.8 2.3-5.2 5.2-5.2h76.8c2.8 0 5.1 2.4 5.1 5.2v49.6c0 2.9-2.3 5.2-5.1 5.2z"/>-->
<!--                                            <path id="<Path>" class="s1" d="m49.6 22.1c-3.4 0-6.1-2.7-6.1-6 0-3.4 2.7-6.1 6.1-6.1 3.3 0 6 2.7 6 6.1 0 3.3-2.7 6-6 6z"/>-->
<!--                                            <path id="<Path>" class="s2" d="m79.7 39.5h-60.3c0 3-2.4 5.4-5.3 5.4v33.1c2.9 0 5.3 2.4 5.3 5.3h60.3c0-2.9 2.4-5.3 5.4-5.3v-33.1c-3 0-5.4-2.4-5.4-5.4z"/>-->
<!--                                            <path id="<Path>" class="s1" d="m44.9 19.9l-12.7 10.5"/>-->
<!--                                            <path id="<Path>" class="s1" d="m54.3 19.9l13 10.5"/>-->
<!--                                            <g id="<Group>">-->
<!--                                                <path id="<Compound Path>" class="s3" d="m33.2 66.2q0 0.2-0.2 0.2-0.2 0-0.5 0-0.3 0-0.4 0-0.2 0-0.5 0-0.4 0-0.5 0-0.2 0-0.2-0.2 0-0.7 0-2.3 0.1-1.5 0.1-2.3 0-0.4-0.2-0.4-0.3-0.1-3-0.1-2.7 0-3 0.1-0.2 0-0.2 0.4 0 0.7 0.1 2.3 0 1.5 0 2.2 0 0.3-0.2 0.3-0.2 0-0.5 0-0.3 0-0.5 0-0.2 0-0.5 0-0.3 0-0.4 0-0.2 0-0.2-0.2 0-0.9 0-2.8 0.1-1.9 0.1-2.9 0-1-0.1-3 0-2 0-3 0-0.2 0.2-0.2 0.1 0 0.4 0.1 0.4 0 0.5 0 0.2 0 0.5 0 0.3-0.1 0.5-0.1 0.2 0 0.2 0.2 0 0.7-0.1 2.2 0 1.5 0 2.3 0 0.2 0.1 0.2 0.3 0.1 3.1 0.1 2.7 0 3-0.1 0.2 0 0.2-0.3 0-0.7-0.1-2.2 0-1.5 0-2.2 0-0.2 0.2-0.2 0.2 0 0.5 0.1 0.3 0 0.5 0 0.1 0 0.4 0 0.3-0.1 0.5-0.1 0.2 0 0.2 0.2 0 1-0.1 3-0.1 2-0.1 3 0 1 0.1 2.9 0.1 1.9 0.1 2.8z"/>-->
<!--                                                <path id="<Compound Path>" fill-rule="evenodd" class="s3" d="m47 60.4q0 2.5-1.6 4.4-1.7 1.9-4.2 1.9-2.6 0-4.3-1.9-1.6-1.8-1.6-4.4 0-2.6 1.6-4.4 1.8-1.9 4.3-1.9 2.5 0 4.2 1.9 1.6 1.8 1.6 4.4zm-2 0q0-1.7-1.1-3-1.1-1.3-2.7-1.3-1.7 0-2.8 1.3-1 1.3-1 3 0 1.7 1 2.9 1.1 1.4 2.8 1.4 1.6 0 2.7-1.4 1.1-1.2 1.1-2.9z"/>-->
<!--                                                <path id="<Compound Path>" class="s3" d="m57.1 56q0 0.2-0.1 0.2-0.2 0-3.1-0.1 0 2.6 0 4.2 0 1 0 3 0.1 2 0.1 3 0 0.1-0.2 0.1-0.2 0-0.5 0-0.3 0-0.5 0-0.1 0-0.5 0-0.3 0-0.4 0-0.3 0-0.3-0.2 0-1 0.1-2.9 0.1-2 0.1-3 0-1.5-0.1-4.2-2.2 0.1-3.2 0.1-0.1 0-0.1-0.1 0-0.1 0-0.4 0.1-0.4 0.1-0.5 0.1-0.3 0.2-0.8 0-0.1 0.1-0.1h0.1q3.1 0.2 4 0.2 0.9 0 2.9-0.1 1.3-0.1 1.1-0.1 0.2 0 0.2 0.1 0-0.1 0 0.9 0 0.1 0 0.3 0 0.3 0 0.4z"/>-->
<!--                                                <path id="<Compound Path>" class="s3" d="m67 64.7q0 0.1 0 0.4-0.1 0.3-0.1 0.4-0.1 0.3-0.2 0.9 0 0.2-0.2 0.2-0.1 0-0.3-0.1-1.1-0.1-3.3-0.1-0.6 0-1.9 0-1.3 0-1.9 0-0.3 0-0.3-0.2 0-1 0.1-2.9 0.1-2 0.1-2.9 0-1-0.1-3.7 0-0.7-0.1-2v-0.2q0-0.2 0.3-0.2 0.6 0 1.8 0.1 1.2 0 1.8 0 0.6 0 1.7 0 1.2-0.1 1.7-0.1 0.4 0 0.5 0.3 0.2 1.1 0.2 1.4 0 0.2-0.2 0.2-0.8 0-2.2-0.1-1.5-0.1-2.3-0.1-0.7 0-0.9 0.2-0.2 0.2-0.2 1v1.3q0 0.5 0.1 0.6 0 0.2 0.4 0.2 0.1 0 0.3 0 0.2 0 0.3 0 1.7 0 3 0 0.6-0.1 1.3-0.1 0.2 0 0.2 0.1 0 0.3-0.1 0.9-0.1 0.5-0.1 0.8 0 0.2-0.2 0.2-0.1 0-0.8-0.1-0.5 0-2.2 0-1.4 0-1.8 0-0.3 0-0.4 0.4 0-0.1 0 0.6v1.3q0 0.9 0.3 1.1 0.2 0.2 1.1 0.2h0.9q0.6 0 3.4-0.2h0.2q0.1 0 0.1 0.2z"/>-->
<!--                                                <path id="<Compound Path>" class="s3" d="m77.2 64.6q0 1.2-0.2 1.7 0 0.2-0.3 0.2-0.6 0-1.9 0-1.3-0.1-1.9-0.1-0.6 0-1.8 0-1.2 0-1.8 0-0.2 0-0.2-0.2 0-0.9 0.1-2.8 0-1.9 0-2.9 0-1-0.1-3-0.1-2-0.1-3 0-0.1 0.3-0.1 0.1 0 0.4 0 0.3 0 0.5 0 0.2 0 0.5 0 0.3 0 0.5 0 0.2 0 0.2 0.1 0 0.9-0.1 2.8-0.1 1.8-0.1 2.7 0 0.5 0 1.4 0 0.9 0 1.4 0 1.9 0.2 1.9 3.2 0 4.8-0.2 0.1 0 0.4 0 0.2-0.1 0.4-0.1 0.2 0 0.2 0.2z"/>-->
<!--                                            </g>-->
<!--                                        </g>-->
<!--                                    </svg>-->
<!--                                    <!&ndash;                                    <img src="project_files/images/Icon-01.png" alt="Hotel-tab">&ndash;>-->
<!--                                    <h4>اقامتگاه</h4>-->
<!--                                </div>-->
<!--                            </a>-->
<!--                        </li>-->
<!--                        <li class="nav-item">-->
<!--                            <a class="nav-link disabled" id="Tour-tab" data-toggle="tab" href="#Tour">-->
<!--                                <div>-->
<!--                                    <svg version="1.2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="100" height="100">-->
<!--                                        <g id="<Group>">-->
<!--                                            <g id="<Group>">-->
<!--                                                <g id="<Group>">-->
<!--                                                    <path id="<Compound Path>" fill-rule="evenodd" class="s0" d="m84.5 90.9h-69.6c-6.3 0-11.5-5.2-11.5-11.5v-40.8c0-6.4 5.2-11.6 11.5-11.6h69.6c6.4 0 11.5 5.2 11.5 11.6v40.8c0 6.3-5.1 11.5-11.5 11.5zm-70.3-61.7c-4.9 0-9 4-9 9v41.6c0 5 4.1 9 9 9h71.1c4.9 0 8.9-4 8.9-9v-41.6c0-5-4-9-8.9-9z"/>-->
<!--                                                </g>-->
<!--                                                <g id="<Group>">-->
<!--                                                    <path id="<Compound Path>" fill-rule="evenodd" class="s0" d="m22.5 48.6h-4.3c-1.3 0-2.4-1.1-2.4-2.5v-7.2c0-1.4 1.1-2.5 2.4-2.5h4.3c1.3 0 2.4 1.1 2.4 2.5v7.2c0 1.4-1.1 2.5-2.4 2.5zm-4.9-10.3v8.4h5.5v-8.4z"/>-->
<!--                                                </g>-->
<!--                                                <g id="<Group>">-->
<!--                                                    <path id="<Compound Path>" fill-rule="evenodd" class="s0" d="m81.2 48.6h-4.2c-1.4 0-2.5-1.1-2.5-2.5v-7.2c0-1.4 1.1-2.5 2.5-2.5h4.2c1.3 0 2.4 1.1 2.4 2.5v7.2c0 1.4-1.1 2.5-2.4 2.5zm-4.9-10.3v8.4h5.6v-8.4z"/>-->
<!--                                                </g>-->
<!--                                                <g id="<Group>">-->
<!--                                                    <path id="<Compound Path>" fill-rule="evenodd" class="s0" d="m67.9 29h-8.2l-0.2-8.4c0-0.9-0.2-1.6-0.4-2.2q-0.4-1-2.1-1h-14.6q-1.6 0-2 1c-0.3 0.6-0.4 1.3-0.4 2.2l-0.2 8.4h-8.3v-9c0-0.2-0.1-5.5 2.9-8.6q2.2-2.2 5.6-2.2h19.5q3.4 0 5.5 2.2c3.1 3.1 2.9 8.4 2.9 8.6zm-6.6-1.6h5v-7.4c0-0.1 0.1-4.5-2.2-6.8-1-1-2.2-2.3-3.8-2.3h-21.2c-1.5 0-2.8 1.3-3.8 2.3-1.9 1.9-2.2 5.5-2.1 6.7v7.5h5l0.1-6.8c0.1-1.3 0.2-2.3 0.6-3.2 0.7-1.5 2.3-1.9 4.4-1.9h12.9c2.1 0 3.6 0.4 4.3 1.9 0.4 0.9 0.6 1.9 0.6 3.2z"/>-->
<!--                                                </g>-->
<!--                                                <g id="<Group>">-->
<!--                                                    <path id="<Path>" class="s0" d="m94.6 41.5v2h-89.8v-2z"/>-->
<!--                                                </g>-->
<!--                                                <g id="<Group>">-->
<!--                                                    <path id="<Compound Path>" fill-rule="evenodd" class="s0" d="m79.1 74.4c-3.9 0-7-3.1-7-6.9 0-3.9 3.1-7 7-7 3.8 0 6.9 3.1 6.9 7 0 3.8-3.1 6.9-6.9 6.9zm5.3-6.9c0-3-2.4-5.4-5.3-5.4-3 0-5.4 2.4-5.4 5.4 0 2.9 2.4 5.3 5.4 5.3 2.9 0 5.3-2.4 5.3-5.3z"/>-->
<!--                                                </g>-->
<!--                                            </g>-->
<!--                                            <g id="<Group>">-->
<!--                                                <path id="<Path>" class="s0" d="m75 72l-0.7-1.5 9.8-5.1 0.7 1.5z"/>-->
<!--                                            </g>-->
<!--                                        </g>-->
<!--                                    </svg>-->
<!--                                    <!&ndash;                                    <img src="project_files/images/Icon-03.png" alt="Hotel-tab">&ndash;>-->
<!--                                    <h4>کاروان</h4>-->
<!--                                </div>-->
<!--                            </a>-->
<!--                        </li>-->
<!--                        <li class="nav-item">-->
<!--                            <a class="nav-link disabled" id="Europcar-tab" data-toggle="tab" href="#Europcar">-->
<!--                                <div>-->
<!--                                    <svg version="1.2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="100" height="100">-->
<!--                                        <g id="<Group>">-->
<!--                                            <path id="<Compound Path>" fill-rule="evenodd" class="s0" d="m81 72.5c-0.2 0.1-0.1 0.3-0.1 0.4 0 1.2 0 2.4-0.1 3.6-0.1 1.5-1.1 2.5-2.6 2.7-1.1 0.1-2.2 0.1-3.3-0.1-1.5-0.2-2.5-1.3-2.5-2.8q0-1.4 0-2.8c0-0.3-0.1-0.4-0.4-0.4q-0.3 0-0.6 0-21.6 0-43.2 0-0.2 0-0.4 0c-0.3 0-0.4 0.1-0.4 0.4q0 1.1 0 2.2c0 0.5-0.1 1-0.2 1.5-0.5 1.3-1.5 1.9-2.9 2-1 0-2 0.1-2.9-0.1-1.3-0.1-2.3-1.3-2.4-2.5-0.1-1.1-0.1-2.1-0.1-3.2 0-0.3 0-0.5-0.2-0.8q0 0.3 0 0.5c0 2.7 0.1 5.4 0 8.1 0 1.4-0.5 2.7-1.5 3.7q-1.2 1.3-3 1.3c-1.2 0.1-2.4 0.1-3.5 0.1-1.8-0.1-3-1.1-3.9-2.5q-0.6-1.1-0.6-2.5 0-3.1-0.1-6.3c0-1.2 0-2.5 0-3.8 0-0.9 0.1-1.7 0-2.6-0.1-1-0.3-2.1-0.7-3-0.5-1-0.7-2.1-0.8-3.1q-0.2-2.9-0.4-5.7-0.2-2.7-0.4-5.5c-0.1-0.7-0.1-1.4-0.1-2.1 0-3.7 1.6-6.5 4.6-8.5q1.7-1.1 3.5-1.7c1-0.4 1.7-1.2 2.1-2.2q0.3-0.8 0.5-1.5c0.1-0.1 0.2-0.3 0.1-0.4-0.2 0-0.3 0-0.4 0-0.1 0.1-0.2 0.1-0.3 0.2-0.4 0.9-1.2 1-2.1 0.9-1.8-0.2-3.2-0.8-4.4-2.1q-0.6-0.7-0.8-1.4-0.2-1 0.8-1.3c0.5-0.1 1.1-0.2 1.7-0.3 1-0.1 1.9-0.2 2.9-0.2q0.3 0 0.6 0c1.2 0 1.8 0.5 1.8 1.7q0 0.5 0 1c0 0.1 0 0.3 0.2 0.3 0.2 0 0.4 0.1 0.5-0.2q0.2-0.6 0.4-1.2c1.1-3.4 2.2-6.8 3.6-10 1.5-3.5 4-5.8 7.7-6.7 1.1-0.2 2.3-0.3 3.4-0.4q2.4-0.3 4.9-0.5 2.2-0.3 4.4-0.4c2.7-0.3 5.4-0.4 8.2-0.4q3.9-0.1 7.9 0 3.8 0.2 7.7 0.5c3.4 0.2 6.7 0.6 10.1 1.3 3 0.6 5.2 2.3 6.7 5 1 1.9 1.8 3.9 2.5 5.9q1.1 3.5 2.2 6.9c0.1 0.3 0.2 0.3 0.5 0.3 0.2 0 0.3-0.2 0.3-0.4q0-0.6 0-1.1 0-1.3 1.3-1.5c2-0.3 4-0.2 5.9 0.4q0.7 0.3 0.6 1c-0.2 1-0.7 1.7-1.4 2.2-1.4 1.2-3 1.7-4.8 1.7q-0.7 0-1-0.6-0.1-0.2-0.2-0.3c-0.1-0.1-0.3-0.3-0.4-0.2-0.2 0.1-0.1 0.3 0 0.4q0.1 0.7 0.3 1.3 0.6 1.8 2.4 2.5c2 0.7 3.7 1.8 5.1 3.3 1.6 1.6 2.4 3.5 2.6 5.7 0.1 1.4-0.1 2.8-0.2 4.1q0 1.3-0.1 2.5c-0.2 2.7-0.3 5.4-0.5 8-0.1 1.3-0.5 2.6-1.1 3.8q-0.4 0.7-0.4 1.5 0 6.3 0 12.5c0 0.6 0 1.2-0.2 1.8-0.5 1.9-1.6 3.3-3.6 3.8-0.5 0.1-0.9 0.1-1.3 0.1-1.2-0.1-2.3 0-3.4-0.1-1.9-0.2-3.7-2-3.9-3.9-0.2-1.6-0.1-3.3-0.1-5q0-2.2 0-4.4c0-0.1 0-0.3-0.1-0.4zm-12.6-38.2q0 0 0 0-0.3-0.1-0.6-0.2-4.5-1.1-9.1-1.9-4.8-0.8-9.7-1.4-1.1-0.1-2.2-0.3c-0.2-0.1-0.4-0.2-0.5-0.4-0.1-0.3 0.2-0.4 0.3-0.6 0.2-0.2 0.4-0.2 0.7-0.2q0.9 0.2 1.8 0.3c2.4 0.3 4.8 0.6 7.2 1.1q4.1 0.8 8.1 1.6c1.7 0.3 3.4 0.6 5.1 1.1 0.9 0.2 1.9 0.6 2.8 0.9 1.5 0.5 3 0.7 4.5 0.8 1.1 0.1 2.1 0.2 3.1 0.2 0.9-0.1 1.4-0.6 1.4-1.4q0-0.4-0.1-0.8-1.2-5.4-3.5-10.4c-1-1.9-2.5-3.2-4.6-3.7-3.6-0.8-7.2-1.2-10.9-1.4-2.2-0.2-4.4-0.2-6.7-0.2q-6.3-0.1-12.6 0.1c-2.9 0.1-5.9 0.1-8.8 0.5-2.2 0.3-4.4 0.5-6.6 0.9-2.6 0.4-4.5 1.8-5.5 4.3-1 2.7-2 5.4-3 8.1-0.2 0.7-0.5 1.4-0.7 2.2-0.1 0.9 0.3 1.5 1.2 1.7q0.4 0.1 0.8 0.1c1.1 0 2.2-0.2 3.2-0.3q2.3-0.2 4.6-0.4 1.3-0.1 2.6-0.2c0.1-0.1 0.2 0 0.2-0.1 0-0.1-0.1-0.2-0.2-0.2-0.2-0.1-0.4-0.2-0.6-0.2q-1.2-0.1-2.4-0.2c-1.6-0.1-3.3 0-4.9 0.1-1 0.1-2 0.2-3 0.2-0.5 0-0.9-0.4-0.9-0.9 0-0.5 0.3-0.9 0.9-1q0.4 0 0.8 0 3.1 0.2 6.2 0.4 2 0.1 4 0.2c0.8 0.1 1.1 0.4 1.2 1.2 0.1 0.3 0.2 0.4 0.5 0.3q1.7-0.1 3.4-0.1 1.8-0.1 3.6-0.2-1-0.3-2-0.5-4-0.6-8-1c-2.5-0.3-5-0.4-7.4-0.5-0.3 0-0.6 0-0.9-0.1-0.5-0.2-0.5-0.6-0.2-1 0.3-0.2 0.5-0.2 0.8-0.2q3 0.2 6 0.5 2.6 0.2 5.2 0.5 3.6 0.5 7 1.3 4 0.9 8.2 0.8c1.7 0 3.5 0 5.3 0q1 0 2 0c0.1 0 0.3 0.1 0.3-0.1 0.1-0.1-0.1-0.2-0.1-0.2q-0.4-0.4-0.9-0.5c-0.8-0.1-1.6-0.1-2.4-0.2q-3.7-0.2-7.3-0.3-0.3-0.1-0.6-0.1c-0.5-0.2-0.8-0.7-0.7-1.1 0.2-0.4 0.6-0.7 1.1-0.6q1.1 0.1 2.3 0.2 3.2 0.4 6.4 0.8c0.9 0.1 1.8 0.2 2.6 0.5q1.1 0.4 0.8 1.3c-0.1 0.3 0 0.3 0.2 0.3q2.4 0.2 4.8 0.3 1.7 0.1 3.4 0.2 1.5 0.1 3 0.1zm-18.5 27.6q2.2 0 4.5 0 13.9 0 27.8 0c0.4 0 0.4 0 0.4-0.4q-0.4-1.8-1.2-3.4c-1.2-2.2-2.9-3.7-5.3-4.5-3-1.1-6.1-1.5-9.3-1.8-2.1-0.3-4.3-0.5-6.5-0.6q-3.6-0.3-7.1-0.3c-3.4-0.1-6.8-0.1-10.2 0.1-1.3 0.1-2.6 0.1-4 0.2q-3.5 0.3-7 0.7c-2.5 0.3-5.1 0.7-7.5 1.4q-4.5 1.3-6.6 5.4-0.6 1.4-0.8 2.8c0 0.3 0.1 0.5 0.4 0.4q0.1 0 0.3 0 16 0 32.1 0zm-35.2 4.1q0 0.1 0 0.1-0.9 0-1.9 0c-0.4 0-0.6 0.2-0.5 0.6 0.1 0.8 0.5 1.4 1.2 1.6q1.1 0.5 2.3 0.5 5.6 0 11.3 0 27.3 0 54.5 0 1.6 0 3.2-0.1 0.8 0 1.4-0.3 1-0.5 1.3-1.5c0.1-0.5 0-0.7-0.5-0.8-0.2-0.1-0.5-0.1-0.7-0.1q-35.8 0-71.6 0zm78.3-16.8c0.1-3.4-2.7-6.5-6.2-6.5-3.8 0-6.4 3-6.4 6.3 0 3.6 2.8 6.6 6.3 6.6 3.5 0 6.3-2.9 6.3-6.4zm-80.1-6.5c-3.6 0-6.4 2.8-6.4 6.3 0 3.6 2.9 6.6 6.4 6.6 3.4 0 6.3-3 6.3-6.4 0-3.5-2.9-6.5-6.3-6.5zm76.1 19.1q0.5 0 0.9 0 0.4 0 0.9 0c0.7 0 1.2-0.5 1.3-1.1 0.1-0.8 0-1.5 0-2.2-0.1-0.7-0.5-1.1-1.3-1.2-1.2 0-2.4-0.1-3.7 0-0.7 0.1-1.1 0.5-1.1 1.2q0 1 0 1.9c0.1 0.9 0.6 1.4 1.5 1.4q0.8 0 1.5 0zm-78.2 0q0 0 0 0 0.5 0 0.9 0 0.4 0 0.9 0c0.6 0 1.1-0.4 1.2-1.1 0.1-0.8 0.1-1.6 0-2.4 0-0.5-0.4-0.9-1-1q-2-0.1-3.9 0c-0.7 0.1-1.1 0.5-1.1 1.2q0 1 0 1.9c0 0.9 0.5 1.4 1.4 1.4q0.8 0 1.6 0z"/>-->
<!--                                        </g>-->
<!--                                    </svg>                                    <!&ndash;                                    <img src="project_files/images/Icon-02.png" alt="Hotel-tab">&ndash;>-->
<!--                                    <h4>حمل و نقل</h4>-->
<!--                                </div>-->
<!--                            </a>-->
<!--                        </li>-->
<!--                    </ul>-->
<!--                    <div class="__search_boxes__  tab-content" id="searchBoxContent">-->
<!--                        <div class="__box__ tab-pane active" id="Hotel">-->
<!--<!&ndash;                            <div class="radios switches">&ndash;>-->
<!--<!&ndash;                                <div class="switch">&ndash;>-->
<!--<!&ndash;                                    <input autocomplete="off" type="radio" class="switch-input switch-input-hotel-js"&ndash;>-->
<!--<!&ndash;                                           name="btn_switch_Hotel" value="0" id="btn_switch_Hotel_international">&ndash;>-->
<!--<!&ndash;                                    <label for="btn_switch_Hotel_international" class="switch-label switch-label-on">خارجی</label>&ndash;>-->
<!--<!&ndash;                                    <input checked="" autocomplete="off" type="radio"&ndash;>-->
<!--<!&ndash;                                           class="switch-input switch-input-hotel-js" name="btn_switch_Hotel" value="1"&ndash;>-->
<!--<!&ndash;                                           id="btn_switch_Hotel_internal">&ndash;>-->
<!--<!&ndash;                                    <label for="btn_switch_Hotel_internal"&ndash;>-->
<!--<!&ndash;                                           class="switch-label switch-label-off">داخلی</label>&ndash;>-->
<!--<!&ndash;                                    <span class="switch-selection"></span>&ndash;>-->
<!--<!&ndash;                                </div>&ndash;>-->
<!--<!&ndash;                            </div>&ndash;>-->
<!--<!&ndash;                            <div id="internal_hotel" class="d_flex flex-wrap internal-hotel-js">&ndash;>-->
<!--<!&ndash;                                <form data-action="s360online.iran-tech.com/" name="gdsHotelLocal"&ndash;>-->
<!--<!&ndash;                                      target="_blank" id="internal_hotel_form" class="d_contents" method="post">&ndash;>-->
<!--<!&ndash;                                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;>-->
<!--<!&ndash;                                        <div class="form-group destination_start">&ndash;>-->
<!--<!&ndash;                                            <div class="s-u-in-out-wrapper raft raft-change change-bor w-100">&ndash;>-->
<!--<!&ndash;                                                <input id="autoComplateSearchIN" name="autoComplateSearchIN"&ndash;>-->
<!--<!&ndash;                                                       class="inputSearchForeign w-100 form-control" type="text"&ndash;>-->
<!--<!&ndash;                                                       value=""&ndash;>-->
<!--<!&ndash;                                                       placeholder='انتخاب شهر'&ndash;>-->
<!--<!&ndash;                                                       autocomplete="off"&ndash;>-->
<!--<!&ndash;                                                       onkeyup="searchCity('hotel')"&ndash;>-->
<!--<!&ndash;                                                       onclick="openBoxPopular('hotel')">&ndash;>-->
<!--<!&ndash;                                                <input type='hidden' id='autoComplateSearchIN_hidden' value=''&ndash;>-->
<!--<!&ndash;                                                       placeholder='انتخاب شهر'>&ndash;>-->
<!--<!&ndash;                                                <input type='hidden' id='autoComplateSearchIN_hidden_en' value=''&ndash;>-->
<!--<!&ndash;                                                       placeholder='انتخاب شهر'>&ndash;>-->
<!--<!&ndash;                                                <ul id="listSearchCity"&ndash;>-->
<!--<!&ndash;                                                    class="ul-inputSearch-externalHotel displayiN"></ul>&ndash;>-->
<!--<!&ndash;                                            </div>&ndash;>-->
<!--<!&ndash;                                        </div>&ndash;>-->
<!--<!&ndash;                                    </div>&ndash;>-->
<!--<!&ndash;                                    <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;>-->
<!--<!&ndash;                                        <div class="form-group">&ndash;>-->
<!--<!&ndash;                                            <input type="text"&ndash;>-->
<!--<!&ndash;                                                   autocomplete="off"&ndash;>-->
<!--<!&ndash;                                                   class="init-shamsi-datepicker form-control check-in-date-js"&ndash;>-->
<!--<!&ndash;                                                   name="startDateForHotelLocal"&ndash;>-->
<!--<!&ndash;                                                   id="startDateForHotelLocal"&ndash;>-->
<!--<!&ndash;                                                   placeholder="تاریخ ورود"&ndash;>-->
<!--<!&ndash;                                                   data-type='internal'>&ndash;>-->
<!--<!&ndash;                                        </div>&ndash;>-->
<!--<!&ndash;                                    </div>&ndash;>-->
<!--<!&ndash;                                    <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">&ndash;>-->
<!--<!&ndash;                                        <div class="form-group">&ndash;>-->
<!--<!&ndash;                                            <input type="text"&ndash;>-->
<!--<!&ndash;                                                   class="init-shamsi-return-datepicker form-control check-out-date-internal-js"&ndash;>-->
<!--<!&ndash;                                                   name="endDateForHotelLocal"&ndash;>-->
<!--<!&ndash;                                                   autocomplete="off"&ndash;>-->
<!--<!&ndash;                                                   id="endDateForHotelLocal"&ndash;>-->
<!--<!&ndash;                                                   placeholder="تاریخ خروج"&ndash;>-->
<!--<!&ndash;                                                   data-type='internal'>&ndash;>-->
<!--<!&ndash;                                        </div>&ndash;>-->
<!--<!&ndash;                                    </div>&ndash;>-->
<!--<!&ndash;                                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search p-1">&ndash;>-->
<!--<!&ndash;                                        <div class="form-group">&ndash;>-->
<!--<!&ndash;                                            <div class="hotel_passenger_picker internal-hotel-passenger-picker-js">&ndash;>-->
<!--<!&ndash;                                                <ul onclick="openCountPassenger('internal')">&ndash;>-->
<!--<!&ndash;                                                    <li><em class="number_adult internal-number-adult-js">2</em> بزرگسال&ndash;>-->
<!--<!&ndash;                                                        ،&ndash;>-->
<!--<!&ndash;                                                    </li>&ndash;>-->
<!--<!&ndash;                                                    <li class="li_number_baby"><em&ndash;>-->
<!--<!&ndash;                                                            class="number_baby internal-number-child-js">0</em> کودک ،&ndash;>-->
<!--<!&ndash;                                                    </li>&ndash;>-->
<!--<!&ndash;                                                    <li><em class="number_room_po internal-number-room-js">1</em>اتاق&ndash;>-->
<!--<!&ndash;                                                    </li>&ndash;>-->
<!--<!&ndash;                                                </ul>&ndash;>-->
<!--<!&ndash;                                                <div class="myhotels-rooms internal-my-hotels-rooms-js">&ndash;>-->
<!--<!&ndash;                                                    <div class="hotel_select_room internal-hotel-select-room-js">&ndash;>-->
<!--<!&ndash;                                                        <div class="myroom-hotel-item internal-my-room-hotel-item-js"&ndash;>-->
<!--<!&ndash;                                                             data-roomnumber="1">&ndash;>-->
<!--<!&ndash;                                                            <div class="myroom-hotel-item-title internal-my-room-hotel-item-title-js">&ndash;>-->
<!--<!&ndash;                                <span class="close d-none" onclick="itemsRoom($(this),'internal')">&ndash;>-->
<!--<!&ndash;                                    <i>&ndash;>-->
<!--<!&ndash;                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;><path&ndash;>-->
<!--<!&ndash;                                                d="M144 400C144 408.8 136.8 416 128 416C119.2 416 112 408.8 112 400V176C112 167.2 119.2 160 128 160C136.8 160 144 167.2 144 176V400zM240 400C240 408.8 232.8 416 224 416C215.2 416 208 408.8 208 400V176C208 167.2 215.2 160 224 160C232.8 160 240 167.2 240 176V400zM336 400C336 408.8 328.8 416 320 416C311.2 416 304 408.8 304 400V176C304 167.2 311.2 160 320 160C328.8 160 336 167.2 336 176V400zM310.1 22.56L336.9 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H416V432C416 476.2 380.2 512 336 512H112C67.82 512 32 476.2 32 432V96H16C7.164 96 0 88.84 0 80C0 71.16 7.164 64 16 64H111.1L137 22.56C145.8 8.526 161.2 0 177.7 0H270.3C286.8 0 302.2 8.526 310.1 22.56V22.56zM148.9 64H299.1L283.8 39.52C280.9 34.84 275.8 32 270.3 32H177.7C172.2 32 167.1 34.84 164.2 39.52L148.9 64zM64 432C64 458.5 85.49 480 112 480H336C362.5 480 384 458.5 384 432V96H64V432z"></path></svg>&ndash;>-->
<!--<!&ndash;                                    </i>&ndash;>-->
<!--<!&ndash;                                </span>&ndash;>-->
<!--<!&ndash;                                                                اتاق اول&ndash;>-->
<!--<!&ndash;                                                            </div>&ndash;>-->
<!--<!&ndash;                                                            <div class="myroom-hotel-item-info internal-my-room-hotel-item-info-js">&ndash;>-->
<!--<!&ndash;                                                                <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">&ndash;>-->
<!--<!&ndash;                                                                    <h6>بزرگسال</h6>&ndash;>-->
<!--<!&ndash;                                                                    (بزرگتر از ۱۲ سال)&ndash;>-->
<!--<!&ndash;                                                                    <div>&ndash;>-->
<!--<!&ndash;                                                                        <i class="addParent internal-add-number-adult-js hotelroom-minus plus-hotelroom-bozorgsal"&ndash;>-->
<!--<!&ndash;                                                                           onclick="addNumberAdult('internal',this)">&ndash;>-->
<!--<!&ndash;                                                                            <svg xmlns="http://www.w3.org/2000/svg"&ndash;>-->
<!--<!&ndash;                                                                                 viewBox="0 0 448 512">&ndash;>-->
<!--<!&ndash;                                                                                <!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;>&ndash;>-->
<!--<!&ndash;                                                                                <path d="M432 256C432 269.3 421.3 280 408 280h-160v160c0 13.25-10.75 24.01-24 24.01S200 453.3 200 440v-160h-160c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h160v-160c0-13.25 10.75-23.99 24-23.99S248 58.75 248 72v160h160C421.3 232 432 242.8 432 256z"></path>&ndash;>-->
<!--<!&ndash;                                                                            </svg>&ndash;>-->
<!--<!&ndash;                                                                        </i>&ndash;>-->
<!--<!&ndash;                                                                        <input readonly="" autocomplete="off"&ndash;>-->
<!--<!&ndash;                                                                               class="countParent internal-count-parent-js"&ndash;>-->
<!--<!&ndash;                                                                               min="0" value="2" max="5" type="number"&ndash;>-->
<!--<!&ndash;                                                                               name="adult1" id="adult1">&ndash;>-->
<!--<!&ndash;                                                                        <i class="minusParent internal-minus-number-adult-js hotelroom-minus minus-hotelroom-bozorgsal"&ndash;>-->
<!--<!&ndash;                                                                           onclick="minusNumberAdult('internal',this)">&ndash;>-->
<!--<!&ndash;                                                                            <svg xmlns="http://www.w3.org/2000/svg"&ndash;>-->
<!--<!&ndash;                                                                                 viewBox="0 0 448 512">&ndash;>-->
<!--<!&ndash;                                                                                <!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;>&ndash;>-->
<!--<!&ndash;                                                                                <path d="M432 256C432 269.3 421.3 280 408 280H40c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h368C421.3 232 432 242.8 432 256z"></path>&ndash;>-->
<!--<!&ndash;                                                                            </svg>&ndash;>-->
<!--<!&ndash;                                                                        </i>&ndash;>-->
<!--<!&ndash;                                                                    </div>&ndash;>-->
<!--<!&ndash;                                                                </div>&ndash;>-->
<!--<!&ndash;                                                                <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">&ndash;>-->
<!--<!&ndash;                                                                    <h6>کودک</h6>&ndash;>-->
<!--<!&ndash;                                                                    (کوچکتر از ۱۲ سال)&ndash;>-->
<!--<!&ndash;                                                                    <div>&ndash;>-->
<!--<!&ndash;                                                                        <i class="addChild internal-add-number-child-js hotelroom-minus plus-hotelroom-koodak"&ndash;>-->
<!--<!&ndash;                                                                           onclick="addNumberChild('internal',this)">&ndash;>-->
<!--<!&ndash;                                                                            <svg xmlns="http://www.w3.org/2000/svg"&ndash;>-->
<!--<!&ndash;                                                                                 viewBox="0 0 448 512">&ndash;>-->
<!--<!&ndash;                                                                                <!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;>&ndash;>-->
<!--<!&ndash;                                                                                <path d="M432 256C432 269.3 421.3 280 408 280h-160v160c0 13.25-10.75 24.01-24 24.01S200 453.3 200 440v-160h-160c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h160v-160c0-13.25 10.75-23.99 24-23.99S248 58.75 248 72v160h160C421.3 232 432 242.8 432 256z"></path>&ndash;>-->
<!--<!&ndash;                                                                            </svg>&ndash;>-->
<!--<!&ndash;                                                                        </i>&ndash;>-->
<!--<!&ndash;                                                                        <input readonly=""&ndash;>-->
<!--<!&ndash;                                                                               class="countChild internal-count-child-js"&ndash;>-->
<!--<!&ndash;                                                                               autocomplete="off" min="0" value="0"&ndash;>-->
<!--<!&ndash;                                                                               max="5" type="number" name="child1"&ndash;>-->
<!--<!&ndash;                                                                               id="child1">&ndash;>-->
<!--<!&ndash;                                                                        <i class="minusChild internal-minus-number-child-js hotelroom-minus minus-hotelroom-koodak"&ndash;>-->
<!--<!&ndash;                                                                           onclick="minusNumberChild('internal',this)">&ndash;>-->
<!--<!&ndash;                                                                            <svg xmlns="http://www.w3.org/2000/svg"&ndash;>-->
<!--<!&ndash;                                                                                 viewBox="0 0 448 512">&ndash;>-->
<!--<!&ndash;                                                                                <!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;>&ndash;>-->
<!--<!&ndash;                                                                                <path d="M432 256C432 269.3 421.3 280 408 280H40c-13.25 0-24-10.74-24-23.99C16 242.8 26.75 232 40 232h368C421.3 232 432 242.8 432 256z"></path>&ndash;>-->
<!--<!&ndash;                                                                            </svg>&ndash;>-->
<!--<!&ndash;                                                                        </i>&ndash;>-->
<!--<!&ndash;                                                                    </div>&ndash;>-->
<!--<!&ndash;                                                                </div>&ndash;>-->
<!--<!&ndash;                                                                <div class="tarikh-tavalods internal-birth-days-js"></div>&ndash;>-->
<!--<!&ndash;                                                            </div>&ndash;>-->
<!--<!&ndash;                                                        </div>&ndash;>-->
<!--<!&ndash;                                                    </div>&ndash;>-->
<!--<!&ndash;                                                    <div class="btn_group">&ndash;>-->
<!--<!&ndash;                                                        <div class="btn_add_room internal-btn-add-room-js"&ndash;>-->
<!--<!&ndash;                                                             onclick="addRoom('internal')">&ndash;>-->
<!--<!&ndash;                                                            <i class="fal fa-plus"></i>&ndash;>-->
<!--<!&ndash;                                                            افزودن اتاق&ndash;>-->
<!--<!&ndash;                                                        </div>&ndash;>-->
<!--<!&ndash;                                                        <div class="close_room btn_close_box internal-close-room-js">&ndash;>-->
<!--<!&ndash;                                                            <i class="fal fa-check"></i>&ndash;>-->
<!--<!&ndash;                                                            تایید&ndash;>-->
<!--<!&ndash;                                                        </div>&ndash;>-->
<!--<!&ndash;                                                    </div>&ndash;>-->
<!--<!&ndash;                                                </div>&ndash;>-->
<!--<!&ndash;                                            </div>&ndash;>-->
<!--<!&ndash;                                        </div>&ndash;>-->
<!--<!&ndash;                                    </div>&ndash;>-->
<!--<!&ndash;                                    <div class="col-lg-2 col-md-3 col-sm-6 col-12 btn_s col_search margin-center p-1">&ndash;>-->
<!--<!&ndash;                                        <button type="button" onclick="searchInternalHotel()"&ndash;>-->
<!--<!&ndash;                                                class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>&ndash;>-->
<!--<!&ndash;                                    </div>&ndash;>-->
<!--<!&ndash;                                </form>&ndash;>-->
<!--<!&ndash;                            </div>&ndash;>-->
<!--                            <div id="international_hotel" class="d-flex flex-wrap international-hotel-js">-->
<!--                                <form target="_blank" data-action="https://s360online.iran-tech.com/" class="d_contents"-->
<!--                                      method="post" id="international_hotel_form">-->
<!--                                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search search_col p-1">-->
<!--                                        <div class="form-group destination_start">-->
<!--                                            <div class="inputSearchForeign-box inputSearchForeign-pad_Fhotel w-100">-->
<!--                                                <div class="s-u-in-out-wrapper raft raft-change change-bor">-->
<!--                                                    <input id="autoComplateSearchIN_2" name="autoComplateSearchIN"-->
<!--                                                           class="inputSearchForeign w-100 form-control" type="text"-->
<!--                                                           value=""-->
<!--                                                           placeholder='انتخاب شهر'-->
<!--                                                           autocomplete="off"-->
<!--                                                           onkeyup="searchCity('externalHotel')"-->
<!--                                                           onclick="openBoxPopular('externalHotel')">-->
<!--                                                    <input id="destination_country" name="destination_country"-->
<!--                                                           type="hidden" value="" placeholder='انتخاب شهر'>-->
<!--                                                    <input class="destination-country-js" name="destination-country-js"-->
<!--                                                           type="hidden" value="" placeholder='انتخاب شهر'>-->
<!--                                                    <input class="destination-city-js" name="destination-city-js"-->
<!--                                                           type="hidden" value="" placeholder='انتخاب شهر'>-->
<!--                                                    <input id="destination_city_foreign" name="destination_city_foreign"-->
<!--                                                           type="hidden" value="" placeholder='انتخاب شهر'>-->
<!--                                                    <input id="destination_city" name="destination_city" type="hidden"-->
<!--                                                           value="" placeholder='انتخاب شهر'>-->
<!--                                                    <ul id="listSearchCity_2"-->
<!--                                                        class="ul-inputSearch-externalHotel displayiN"></ul>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">-->
<!--                                        <div class="form-group">-->
<!--                                            <input readonly="" type="text"-->
<!--                                                   autocomplete="off"-->
<!--                                                   class="init-shamsi-datepicker form-control check-in-date-international-js"-->
<!--                                                   name="startDateForHotelInternational"-->
<!--                                                   id="startDateForExternalHotelInternational"-->
<!--                                                   placeholder="تاریخ ورود"-->
<!--                                                   data-type='international'>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">-->
<!--                                        <div class="form-group">-->
<!--                                            <input readonly="" type="text"-->
<!--                                                   class="init-shamsi-return-datepicker form-control check-out-date-international-js"-->
<!--                                                   name="endDateForExternalHotelInternational"-->
<!--                                                   autocomplete="off"-->
<!--                                                   id="endDateForExternalHotelInternational"-->
<!--                                                   placeholder="تاریخ خروج"-->
<!--                                                   data-type='international'>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-lg-3 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                        <div class="form-group">-->
<!--                                            <div class="hotel_passenger_picker international-hotel-passenger-picker-js">-->
<!--                                                <ul onclick="openCountPassenger('international')">-->
<!--                                                    <li><em class="number_adult international-number-adult-js">2</em>-->
<!--                                                        بزرگسال ،-->
<!--                                                    </li>-->
<!--                                                    <li class="li_number_baby"><em-->
<!--                                                            class="number_baby international-number-child-js">0</em>-->
<!--                                                        کودک ،-->
<!--                                                    </li>-->
<!--                                                    <li><em class="number_room_po international-number-room-js">1</em>اتاق-->
<!--                                                    </li>-->
<!--                                                </ul>-->
<!--                                                <div class="myhotels-rooms international-my-hotels-rooms-js">-->
<!--                                                    <i class="close_room international-close-room-js"></i>-->
<!--                                                    <div class="hotel_select_room international-hotel-select-room-js">-->
<!--                                                        <div class="myroom-hotel-item international-my-room-hotel-item-js"-->
<!--                                                             data-roomnumber="1">-->
<!--                                                            <div class="myroom-hotel-item-title international-my-room-hotel-item-title-js">-->
<!--                                <span class="close d-none" onclick="itemsRoom('international')">-->
<!--                                    <i>-->
<!--                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!&ndash;! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. &ndash;><path-->
<!--                                                d="M144 400C144 408.8 136.8 416 128 416C119.2 416 112 408.8 112 400V176C112 167.2 119.2 160 128 160C136.8 160 144 167.2 144 176V400zM240 400C240 408.8 232.8 416 224 416C215.2 416 208 408.8 208 400V176C208 167.2 215.2 160 224 160C232.8 160 240 167.2 240 176V400zM336 400C336 408.8 328.8 416 320 416C311.2 416 304 408.8 304 400V176C304 167.2 311.2 160 320 160C328.8 160 336 167.2 336 176V400zM310.1 22.56L336.9 64H432C440.8 64 448 71.16 448 80C448 88.84 440.8 96 432 96H416V432C416 476.2 380.2 512 336 512H112C67.82 512 32 476.2 32 432V96H16C7.164 96 0 88.84 0 80C0 71.16 7.164 64 16 64H111.1L137 22.56C145.8 8.526 161.2 0 177.7 0H270.3C286.8 0 302.2 8.526 310.1 22.56V22.56zM148.9 64H299.1L283.8 39.52C280.9 34.84 275.8 32 270.3 32H177.7C172.2 32 167.1 34.84 164.2 39.52L148.9 64zM64 432C64 458.5 85.49 480 112 480H336C362.5 480 384 458.5 384 432V96H64V432z"></path></svg>-->
<!--                                    </i>-->
<!--                                </span>-->
<!--                                                                اتاق اول-->
<!--                                                            </div>-->
<!--                                                            <div class="myroom-hotel-item-info international-my-room-hotel-item-info-js">-->
<!--                                                                <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">-->
<!--                                                                    <h6>بزرگسال</h6>-->
<!--                                                                    (بزرگتر از ۱۲ سال)-->
<!--                                                                    <div>-->
<!--                                                                        <i class="addParent international-add-number-adult-js hotelroom-minus plus-hotelroom-bozorgsal fas fa-plus"-->
<!--                                                                           onclick="addNumberAdult('international',this)"></i>-->
<!--                                                                        <input readonly="" autocomplete="off"-->
<!--                                                                               class="countParent international-count-parent-js"-->
<!--                                                                               min="0" value="2"-->
<!--                                                                               max="5" type="number" name="adult1"-->
<!--                                                                               id="adult1">-->
<!--                                                                        <i-->
<!--                                                                                class="minusParent international-minus-number-adult-js hotelroom-minus minus-hotelroom-bozorgsal fas fa-minus"-->
<!--                                                                                onclick="minusNumberAdult('international',this)"></i>-->
<!--                                                                    </div>-->
<!--                                                                </div>-->
<!--                                                                <div class="myroom-hotel-item-tedad my-room-hotel-bozorgsal">-->
<!--                                                                    <h6>کودک</h6>-->
<!--                                                                    (کوچکتر از ۱۲ سال)-->
<!--                                                                    <div>-->
<!--                                                                        <i class="addChild international-add-number-child-js hotelroom-minus plus-hotelroom-koodak fas fa-plus"-->
<!--                                                                           onclick="addNumberChild('international',this)"></i>-->
<!--                                                                        <input readonly=""-->
<!--                                                                               class="countChild international-count-child-js"-->
<!--                                                                               autocomplete="off"-->
<!--                                                                               min="0" value="0" max="5"-->
<!--                                                                               type="number" name="child1"-->
<!--                                                                               id="child1"><i-->
<!--                                                                            class="minusChild international-minus-number-child-js hotelroom-minus minus-hotelroom-koodak fas fa-minus"-->
<!--                                                                            onclick="minusNumberChild('international',this)"></i>-->
<!--                                                                    </div>-->
<!--                                                                </div>-->
<!--                                                                <div class="tarikh-tavalods international-birth-days-js"></div>-->
<!--                                                            </div>-->
<!--                                                        </div>-->
<!--                                                    </div>-->
<!--                                                    <div class="btn_group">-->
<!--                                                        <div class="btn_add_room international-btn-add-room-js"-->
<!--                                                             onclick="addRoom('international')">-->
<!--                                                            <i class="fal fa-plus"></i>-->
<!--                                                            افزودن اتاق-->
<!--                                                        </div>-->
<!--                                                        <div class="close_room btn_close_box international-close-room-js">-->
<!--                                                            <i class="fal fa-check"></i>-->
<!--                                                            تایید-->
<!--                                                        </div>-->
<!--                                                    </div>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="col-lg-2 col-md-3 col-sm-6 col-12 btn_s col_search margin-center p-1">-->
<!--                                        <input type="hidden" id="nights_hotel" name="nights_hotel" value=""-->
<!--                                               placeholder='تاریخ خروج' class='nights-hotel-js'>-->
<!--                                        <button onclick="searchInternationalHotel()" type="button"-->
<!--                                                class="btn theme-btn seub-btn b-0"><span>جستجو</span></button>-->
<!--                                    </div>-->
<!--                                </form>-->
<!--                            </div>-->
<!--                            <input type='hidden' id="type_section" name="type_section" class="type-section-js"-->
<!--                                   value="internal">-->
<!--                        </div>-->
<!--                        <div class="__box__ tab-pane" id="Tour">-->
<!--<!&ndash;                            <div class="radios switches">&ndash;>-->
<!--<!&ndash;                                <div class="switch">&ndash;>-->
<!--<!&ndash;                                    <input autocomplete="off"&ndash;>-->
<!--<!&ndash;                                           type="radio"&ndash;>-->
<!--<!&ndash;                                           class="switch-input switch-input-tour-js"&ndash;>-->
<!--<!&ndash;                                           name="btn_switch_tour"&ndash;>-->
<!--<!&ndash;                                           value="1"&ndash;>-->
<!--<!&ndash;                                           id="btn_switch_tour_international">&ndash;>-->
<!--<!&ndash;                                    <label for="btn_switch_tour_international"&ndash;>-->
<!--<!&ndash;                                           class="switch-label switch-label-on">&ndash;>-->
<!--<!&ndash;                                        خارجی&ndash;>-->
<!--<!&ndash;                                    </label>&ndash;>-->
<!--<!&ndash;                                    <input autocomplete="off"&ndash;>-->
<!--<!&ndash;                                           type="radio"&ndash;>-->
<!--<!&ndash;                                           class="switch-input switch-input-tour-js"&ndash;>-->
<!--<!&ndash;                                           name="btn_switch_tour"&ndash;>-->
<!--<!&ndash;                                           checked=""&ndash;>-->
<!--<!&ndash;                                           value="2"&ndash;>-->
<!--<!&ndash;                                           id="btn_switch_tour_internal">&ndash;>-->
<!--<!&ndash;                                    <label for="btn_switch_tour_internal"&ndash;>-->
<!--<!&ndash;                                           class="switch-label switch-label-off">&ndash;>-->
<!--<!&ndash;                                        داخلی&ndash;>-->
<!--<!&ndash;                                    </label>&ndash;>-->
<!--<!&ndash;                                    <span class="switch-selection"></span>&ndash;>-->
<!--<!&ndash;                                </div>&ndash;>-->
<!--<!&ndash;                            </div>&ndash;>-->
<!--<!&ndash;                            <div id="internal_tour" class="_internal internal-tour-js">&ndash;>-->
<!--<!&ndash;                                <div class="col-12">&ndash;>-->
<!--<!&ndash;                                    <div class="row">&ndash;>-->
<!--<!&ndash;                                        <form data-action="https://s360online.iran-tech.com/" class="d_contents"&ndash;>-->
<!--<!&ndash;                                              method="post"&ndash;>-->
<!--<!&ndash;                                              name="gdsTourLocal" id="gdsTourLocal" target="_blank">&ndash;>-->
<!--<!&ndash;                                            <div class="col-lg-4 col-md-6 col-sm-6 col-12 col_search p-1">&ndash;>-->
<!--<!&ndash;                                                <div class="form-group">&ndash;>-->
<!--<!&ndash;                                                    <select data-placeholder="نام شهر مبدأ"&ndash;>-->
<!--<!&ndash;                                                            onchange="getArrivalCitiesTour('internal',this)"&ndash;>-->
<!--<!&ndash;                                                            name="internal_origin_tour" id="internal_origin_tour"&ndash;>-->
<!--<!&ndash;                                                            class="select2_in select2-hidden-accessible internal-origin-tour-js"&ndash;>-->
<!--<!&ndash;                                                            tabindex="-1" aria-hidden="true">&ndash;>-->
<!--<!&ndash;                                                        <option value="">انتخاب کنید...</option>&ndash;>-->
<!--<!&ndash;                                                    </select>&ndash;>-->
<!--<!&ndash;                                                </div>&ndash;>-->
<!--<!&ndash;                                            </div>&ndash;>-->
<!--<!&ndash;                                            <div class="col-lg-4 col-md-6 col-sm-6 col-12 col_search p-1">&ndash;>-->
<!--<!&ndash;                                                <div class="form-group">&ndash;>-->
<!--<!&ndash;                                                    <select data-placeholder="نام شهر مقصد"&ndash;>-->
<!--<!&ndash;                                                            name="tourDestinationCityLocal"&ndash;>-->
<!--<!&ndash;                                                            id="tourDestinationCityLocal"&ndash;>-->
<!--<!&ndash;                                                            class="select2_in select2-hidden-accessible internal-destination-tour-js"&ndash;>-->
<!--<!&ndash;                                                            tabindex="-1" aria-hidden="true">&ndash;>-->
<!--<!&ndash;                                                        <option value="">انتخاب کنید...</option>&ndash;>-->
<!--<!&ndash;                                                    </select>&ndash;>-->
<!--<!&ndash;                                                </div>&ndash;>-->
<!--<!&ndash;                                            </div>&ndash;>-->
<!--<!&ndash;                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">&ndash;>-->
<!--<!&ndash;                                                <div class="form-group">&ndash;>-->
<!--<!&ndash;                                                    <select data-placeholder="تاریخ مسافرت"&ndash;>-->
<!--<!&ndash;                                                            name="tourDeptDateLocal"&ndash;>-->
<!--<!&ndash;                                                            id="tourDeptDateLocal"&ndash;>-->
<!--<!&ndash;                                                            class="select2_in DeptYearOnChange_js select2-hidden-accessible internal-date-travel-tour-js"&ndash;>-->
<!--<!&ndash;                                                            tabindex="-1" aria-hidden="true">&ndash;>-->
<!--<!&ndash;                                                        <option value="">انتخاب کنید...</option>&ndash;>-->
<!--<!&ndash;                                                    </select>&ndash;>-->
<!--<!&ndash;                                                </div>&ndash;>-->
<!--<!&ndash;                                            </div>&ndash;>-->
<!--<!&ndash;                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search p-1">&ndash;>-->
<!--<!&ndash;                                                <button type="button" onclick="searchInternalTour()"&ndash;>-->
<!--<!&ndash;                                                        class="btn theme-btn seub-btn b-0">&ndash;>-->
<!--<!&ndash;                                                    <span>جستجو</span></button>&ndash;>-->
<!--<!&ndash;                                            </div>&ndash;>-->
<!--<!&ndash;                                        </form>&ndash;>-->
<!--<!&ndash;                                    </div>&ndash;>-->
<!--<!&ndash;                                </div>&ndash;>-->
<!--<!&ndash;                            </div>&ndash;>-->
<!--                            <div id="international_tour" class="_external international-tour-js d-flex">-->
<!--                                <div class="col-12">-->
<!--                                    <div class='row'>-->
<!--                                        <form data-action="https://s360online.iran-tech.com/" class="d_contents"-->
<!--                                              method="post"-->
<!--                                              name="gdsPortalLocal" id="gdsPortalLocal" target="_blank">-->
<!--                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                                <div class="form-group">-->
<!--                                                    <input type="text" class="form-control " disabled-->
<!--                                                           placeholder="کشور مبدا: ایران">-->
<!--                                                    <input type="hidden" value="1" name="tourOriginCountryPortal"-->
<!--                                                           id="tourOriginCountryPortal">-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                                <div class="form-group">-->
<!--                                                    <select data-placeholder=" شهر مبدا"-->
<!--                                                            name="tourOriginCityPortal"-->
<!--                                                            id="tourOriginCityPortal"-->
<!--                                                            onchange="getArrivalCitiesTour('international',this)"-->
<!--                                                            class="select2_in select2-hidden-accessible international-tour-origin-city-js"-->
<!--                                                            tabindex="-1"-->
<!--                                                            aria-hidden="true">-->
<!--                                                        <option value="">انتخاب کنید...</option>-->
<!--                                                    </select>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                                <div class="form-group">-->
<!--                                                    <select data-placeholder="کشور مقصد"-->
<!--                                                            onchange="getDestinationCityTour('international',this)"-->
<!--                                                            name="tourDestinationCountryPortal"-->
<!--                                                            id="tourDestinationCountryPortal"-->
<!--                                                            class="select2_in select2-hidden-accessible international-destination-tour-js"-->
<!--                                                            tabindex="-1"-->
<!--                                                            aria-hidden="true">-->
<!--                                                        <option value="">انتخاب کنید...</option>-->
<!--                                                    </select></div>-->
<!--                                            </div>-->
<!--                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                                <div class="form-group">-->
<!--                                                    <select data-placeholder="شهر مقصد"-->
<!--                                                            name="tourDestinationCityPortal"-->
<!--                                                            id="tourDestinationCityPortal"-->
<!--                                                            class="select2_in select2-hidden-accessible international-destination-city-tour-js"-->
<!--                                                            tabindex="-1" aria-hidden="true">-->
<!--                                                        <option value="">انتخاب کنید...</option>-->
<!--                                                    </select>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                                <div class="form-group">-->
<!--                                                    <select data-placeholder="تاریخ مسافرت"-->
<!--                                                            name="tourDeptDateInternational"-->
<!--                                                            id="tourDeptDateInternational"-->
<!--                                                            class="select2_in DeptYearOnChange_js select2-hidden-accessible international-date-travel-tour-js"-->
<!--                                                            tabindex="-1" aria-hidden="true">-->
<!--                                                        <option value="">انتخاب کنید...</option>-->
<!--                                                    </select>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                            <div class="col-lg-2 col-md-6 col-sm-6 col-12 btn_s col_search p-1">-->
<!--                                                <button type="button" onclick="searchInternationalTour()"-->
<!--                                                        class="btn theme-btn seub-btn b-0">-->
<!--                                                    <span>جستجو</span>-->
<!--                                                </button>-->
<!--                                            </div>-->
<!--                                        </form>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                        <div class="__box__ tab-pane" id="Europcar">-->
<!--                            <div class="col-md-12 col-12">-->
<!--                                <div class="row">-->
<!--                                    <form data-action="/" method="post" target="_blank" class="d_contents"-->
<!--                                          name="cartype_rentCar_js" id="cartype_rentCar_js">-->
<!--                                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                            <div class="form-group"><select data-placeholder="  نوع ماشین"-->
<!--                                                                            name="cartype_rentCar" id="cartype_rentCar"-->
<!--                                                                            class="select2  select2-hidden-accessible"-->
<!--                                                                            tabindex="-1" aria-hidden="true">-->
<!--                                                <option value="">انتخاب کنید...</option>-->
<!--                                            </select></div>-->
<!--                                        </div>-->
<!--                                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">-->
<!--                                            <div class="form-group"><input type="text"-->
<!--                                                                           class="form-control deptCalendar  hasDatepicker"-->
<!--                                                                           name="rentdate_rentCar" id="rentdate_rentCar"-->
<!--                                                                           placeholder="تاریخ اجاره"></div>-->
<!--                                        </div>-->
<!--                                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                            <div class="form-group"><select data-placeholder="   محل اجاره"-->
<!--                                                                            name="rentstation_rentCar"-->
<!--                                                                            id="rentstation_rentCar"-->
<!--                                                                            class="select2  select2-hidden-accessible"-->
<!--                                                                            tabindex="-1" aria-hidden="true">-->
<!--                                                <option value="">انتخاب کنید...</option>-->
<!--                                            </select></div>-->
<!--                                        </div>-->
<!--                                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search search_col p-1">-->
<!--                                            <div class="form-group"><input type="text"-->
<!--                                                                           class="form-control deptCalendar hasDatepicker"-->
<!--                                                                           name="dept_rentCar" id="dept_rentCar"-->
<!--                                                                           placeholder="تاریخ تحویل"></div>-->
<!--                                        </div>-->
<!--                                        <div class="col-lg-2 col-md-6 col-sm-6 col-12 col_search p-1">-->
<!--                                            <div class="form-group"><select data-placeholder=" محل تحویل"-->
<!--                                                                            name="deliverystation_rentCar"-->
<!--                                                                            id="deliverystation_rentCar"-->
<!--                                                                            class="select2  select2-hidden-accessible"-->
<!--                                                                            tabindex="-1" aria-hidden="true">-->
<!--                                                <option value="">انتخاب کنید...</option>-->
<!--                                            </select></div>-->
<!--                                        </div>-->
<!--                                        <div class="col-lg-2 col-md-3 col-sm-6 col-12 btn_s col_search p-1">-->
<!--                                            <button type="button" onclick="rentcar_local()"-->
<!--                                                    class="btn theme-btn seub-btn b-0">-->
<!--                                                <span>جستجو</span></button>-->
<!--                                        </div>-->
<!--                                    </form>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
</section>
