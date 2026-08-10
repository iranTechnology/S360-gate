{assign var="newsItems" value=$obj_main_page->getNewsArticlesSelected()}

{if $newsItems['data']|count > 0}
    <section class="i_modular_about_us about">
        <div class="container">
            <div class="d-flex flex-wrap">
                <div class="col-lg-5 col-md-12 col-sm-12 col-12 parent-about-col">
                    <div class="parent-about">
                        <div>
                            <h2>چرا خادمان نهضت ؟</h2>
                        </div>
                        <p class="__aboutUs_class__">{$htmlContent = $about['body']|strip_tags}{$htmlContent|truncate:300}</p>
                        <ul class="ul-about" id="aboutSlider">
                            {foreach $newsItems['data'] as $key => $item}

                                <li class="about-slide-item" data-index="{$key}" data-image="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$item.feature_image}">
                                    <a href="{$item['link']}" class="text-dark">
                                        <i class="fa-solid fa-newspaper"></i>
                                        {$item.title}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                        {*                        <div class="bg-btn-karvan">*}
                        {*                            <a class="btn-karvan" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">*}
                        {*                                بیشتر بخوانید*}
                        {*                                <i class="fa-solid fa-arrow-left mr-3"></i>*}
                        {*                            </a>*}
                        {*                        </div>*}
                    </div>
                </div>
                <div class="col-lg-7 col-md-6 col-sm-12 col-12 parent-karevan-about-img">
                    <div class="about-img position-relative">
                        <div class="parent-img" id="aboutImageContainer">
                            {assign var="firstItem" value=$newsItems['data']|@reset}
                            <img id="aboutMainImage" alt="about" src="{$firstItem.feature_image}" />
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </section>
{/if}