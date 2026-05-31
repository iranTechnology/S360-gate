<section class="cars">
    <div class="container">
        <div class="title-safiran">
            <div class="text-title-safiran">
                <h2>اجاره خودرو</h2>
            </div>
            <a href="{$smarty.const.ROOT_ADDRESS}/page/Europcar" class="more-title-safiran">
                <span>بیشتر</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                    <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                    <path
                            d="M234.8 36.25c3.438 3.141 5.156 7.438 5.156 11.75c0 3.891-1.406 7.781-4.25 10.86L53.77 256l181.1 197.1c6 6.5 5.625 16.64-.9062 22.61c-6.5 6-16.59 5.594-22.59-.8906l-192-208c-5.688-6.156-5.688-15.56 0-21.72l192-208C218.2 30.66 228.3 30.25 234.8 36.25z"
                    />
                </svg>
            </a>
        </div>
        <div class="row">
            <div class="col-md-8 col-12 mb-md-0 mb-3">
                <div class="i_modular_searchBox searchBoxContentRent" id="rent-parent1">
                    <div class="__box__ tab-pane" id="Europcar">
                        <div class="col-md-12 col-12">
                            <div class="row">
                                <form data-action="/" method="post" target="_blank" class="d_contents"
                                      name="cartype_rentCar_js" id="cartype_rentCar_js">
                                    {include file="./search-box/boxes/sections/europcar/carType1.tpl"}
                                    {include file="./search-box/boxes/sections/europcar/rentDate1.tpl"}
                                    {include file="./search-box/boxes/sections/europcar/rentPlace1.tpl"}
                                    {include file="./search-box/boxes/sections/europcar/deliveryDate1.tpl"}
                                    {include file="./search-box/boxes/sections/europcar/deliveryPlace1.tpl"}
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search p-sm-3 p-1  d-flex align-items-center">
                                        <button type="button" onclick="rentcar_local(false, '1')"
                                                class="btn theme-btn seub-btn b-0">
                                            <span>جستجو</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {load_presentation_object filename="rentCar" assign="objCar"}
            {assign var="type_data" value=['is_active'=>1]}
            {assign var='list_car' value=$objCar->listCar($type_data)}
            <div class="col-md-4 col-12 d-flex align-items-center">
                {if $list_car}
                <div class="owl-carousel owl-theme owl-tour-arshida">
                    {foreach $list_car as $item}
                    <a class="tour-item" href="{$smarty.const.ROOT_ADDRESS}/reserveCar/{$item.id}/{$item.title}">
                        <div class="project">
                            <div class="img">
                                <img src="{$item.pic_show}" alt="{$item.title}" title='{$item.title}' class="img-fluid" />
                            </div>

                        </div>
                    </a>
                    {/foreach}
                </div>
                {/if}
            </div>
        </div>
    </div>
</section>