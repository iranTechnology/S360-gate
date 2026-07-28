{assign var="main_articles" value=$obj_main_page->getNewsArticles()}
{assign var="othe_itmes" value=$main_articles['data']}
{assign var="i" value="2"}
{if $main_articles['count'] > 0 }
    <section class="news my-5 py-5">
        <div class="container">
            <h2 class="news_title">آخرین اخبار و رویدادها</h2>
            <div class="news-grid">
                <div class="div1">
                    <h2>آخرین اخبار و رویدادها</h2>
                    <p class="mt-auto">
                        به روزترین و جذاب‌ترین اخبار از دنیای موارد مختلف در وب سایت ما!
                    </p>
                    <p>
                        به عنوان یک منبع اطلاعاتی جامع، با تیم ما در اینجا همراه شوید تا از آخرین اخبار و رویدادهای جذاب جهان مطلع شوید. از آخرین پیشرفت‌های علمی و تکنولوژی تا بهترین روش‌ها برای بهبود سلامتی، از جدیدترین موضوعات محیط‌زیستی تا هنر و فرهنگ هر کشور... همه چیز در اینجا وجود دارد!
                    </p>
                </div>
                {foreach $othe_itmes as $item}
                    {if $i eq 2 }
                        <div class="div{$i}">
                            <a href="{$item['link']}">
                                <img src="{$item['image']}"
                                     alt="{$item['alt']}" >
                                <div>
                                    <div>
                                        <h4>{$item['heading']}</h4>
                                        <span>بیشتر بدانید
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M447.1 256c0 13.25-10.76 24.01-24.01 24.01H83.9l132.7 126.6c9.625 9.156 9.969 24.41 .8125 33.94c-9.156 9.594-24.34 9.938-33.94 .8125l-176-168C2.695 268.9 .0078 262.6 .0078 256S2.695 243.2 7.445 238.6l176-168C193 61.51 208.2 61.85 217.4 71.45c9.156 9.5 8.812 24.75-.8125 33.94l-132.7 126.6h340.1C437.2 232 447.1 242.8 447.1 256z"/></svg>
                                    </span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    {elseif $i <= 5}
                        <div class="div{$i}">
                            <a href="{$item['link']}" class="news_box">
                                <div class="news_box_img">
                                    <img src="{$item['image']}"
                                         alt="{$item['alt']}">
                                </div>
                                <div class="news_box_text">
                                    <h4>{$item['heading']}</h4>
                                    <p>{$item['description']}</p>
                                    <span>بیشتر بدانید
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M447.1 256c0 13.25-10.76 24.01-24.01 24.01H83.9l132.7 126.6c9.625 9.156 9.969 24.41 .8125 33.94c-9.156 9.594-24.34 9.938-33.94 .8125l-176-168C2.695 268.9 .0078 262.6 .0078 256S2.695 243.2 7.445 238.6l176-168C193 61.51 208.2 61.85 217.4 71.45c9.156 9.5 8.812 24.75-.8125 33.94l-132.7 126.6h340.1C437.2 232 447.1 242.8 447.1 256z"/></svg>
                                    </span>
                                </div>
                            </a>
                        </div>
                    {/if}
                    {$i = $i + 1}
                {/foreach}
            </div>
        </div>
    </section>





{/if}