{assign var="data_search_blog" value=['service'=>'Public','section'=>'article', 'limit' =>5]}
{assign var='articles' value=$obj_main_page->articlesPosition($data_search_blog)}
{assign var='categories' value=$obj_main_page->articlesCategories()}
{assign var='counter' value=1}
{assign var="article_count" value=$articles|count}
{$categories|count}
{if $categories }
    <section class="blog py-5 mb-5">
        <div class="container">
            <div class="blogMain d-flex flex-wrap">
                <div class="title col-12 pb-5"><h2>مقالات ترنج گشت </h2></div>
                <div class="col-12 p-0 d-none d-xl-flex flex-wrap">
                    <div class="circle right-top">
                        <div class="title">تاریخی و فرهنگی</div>
                        <a target="_blank" href="javascript:"><img src="project_files/images/images/art1.jpg" alt="art"></a><i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M482.3 192C516.5 192 576 221 576 256C576 292 516.5 320 482.3 320H365.7L265.2 495.9C259.5 505.8 248.9 512 237.4 512H181.2C170.6 512 162.9 501.8 165.8 491.6L214.9 320H112L68.8 377.6C65.78 381.6 61.04 384 56 384H14.03C6.284 384 0 377.7 0 369.1C0 368.7 .1818 367.4 .5398 366.1L32 256L.5398 145.9C.1818 144.6 0 143.3 0 142C0 134.3 6.284 128 14.03 128H56C61.04 128 65.78 130.4 68.8 134.4L112 192H214.9L165.8 20.4C162.9 10.17 170.6 0 181.2 0H237.4C248.9 0 259.5 6.153 265.2 16.12L365.7 192H482.3z"/>
                            </svg>
                        </i>
                    </div>
                    <div class="circle right-center">
                        <div class="title">ایرنگردی</div>
                        <a target="_blank" href="javascript:"><img src="project_files/images/images/art2.jpg" alt="art"></a><i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M482.3 192C516.5 192 576 221 576 256C576 292 516.5 320 482.3 320H365.7L265.2 495.9C259.5 505.8 248.9 512 237.4 512H181.2C170.6 512 162.9 501.8 165.8 491.6L214.9 320H112L68.8 377.6C65.78 381.6 61.04 384 56 384H14.03C6.284 384 0 377.7 0 369.1C0 368.7 .1818 367.4 .5398 366.1L32 256L.5398 145.9C.1818 144.6 0 143.3 0 142C0 134.3 6.284 128 14.03 128H56C61.04 128 65.78 130.4 68.8 134.4L112 192H214.9L165.8 20.4C162.9 10.17 170.6 0 181.2 0H237.4C248.9 0 259.5 6.153 265.2 16.12L365.7 192H482.3z"/>
                            </svg>
                        </i>
                    </div>
                    <div class="circle right-bottom">
                        <div class="title">دانستنی‌های سفر</div>
                        <a target="_blank" href="javascript:"><img src="project_files/images/images/art3.jpg" alt="art"></a><i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M482.3 192C516.5 192 576 221 576 256C576 292 516.5 320 482.3 320H365.7L265.2 495.9C259.5 505.8 248.9 512 237.4 512H181.2C170.6 512 162.9 501.8 165.8 491.6L214.9 320H112L68.8 377.6C65.78 381.6 61.04 384 56 384H14.03C6.284 384 0 377.7 0 369.1C0 368.7 .1818 367.4 .5398 366.1L32 256L.5398 145.9C.1818 144.6 0 143.3 0 142C0 134.3 6.284 128 14.03 128H56C61.04 128 65.78 130.4 68.8 134.4L112 192H214.9L165.8 20.4C162.9 10.17 170.6 0 181.2 0H237.4C248.9 0 259.5 6.153 265.2 16.12L365.7 192H482.3z"/>
                            </svg>
                        </i>
                    </div>
                    <div class="laptop"><img class="laptopImg" src="project_files/images/laptop.png" alt="laptop">
                        <div class="screenBox"><img class="screenImg" src="project_files/images/screen.png" alt="screen"></div>
                    </div>
                    <div class="circle left-top">
                        <div class="title">راهنمای سفر</div>
                        <a target="_blank" href="javascript:"><img src="project_files/images/images/art4.jpg" alt="art"></a><i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M482.3 192C516.5 192 576 221 576 256C576 292 516.5 320 482.3 320H365.7L265.2 495.9C259.5 505.8 248.9 512 237.4 512H181.2C170.6 512 162.9 501.8 165.8 491.6L214.9 320H112L68.8 377.6C65.78 381.6 61.04 384 56 384H14.03C6.284 384 0 377.7 0 369.1C0 368.7 .1818 367.4 .5398 366.1L32 256L.5398 145.9C.1818 144.6 0 143.3 0 142C0 134.3 6.284 128 14.03 128H56C61.04 128 65.78 130.4 68.8 134.4L112 192H214.9L165.8 20.4C162.9 10.17 170.6 0 181.2 0H237.4C248.9 0 259.5 6.153 265.2 16.12L365.7 192H482.3z"/>
                            </svg>
                        </i></div>
                    <div class="circle left-center">
                        <div class="title">جهانگردی</div>
                        <a target="_blank" href="javascript:"><img src="project_files/images/images/art3.jpg" alt="art"></a><i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M482.3 192C516.5 192 576 221 576 256C576 292 516.5 320 482.3 320H365.7L265.2 495.9C259.5 505.8 248.9 512 237.4 512H181.2C170.6 512 162.9 501.8 165.8 491.6L214.9 320H112L68.8 377.6C65.78 381.6 61.04 384 56 384H14.03C6.284 384 0 377.7 0 369.1C0 368.7 .1818 367.4 .5398 366.1L32 256L.5398 145.9C.1818 144.6 0 143.3 0 142C0 134.3 6.284 128 14.03 128H56C61.04 128 65.78 130.4 68.8 134.4L112 192H214.9L165.8 20.4C162.9 10.17 170.6 0 181.2 0H237.4C248.9 0 259.5 6.153 265.2 16.12L365.7 192H482.3z"/>
                            </svg>
                        </i>
                        <div></div>
                    </div>
                    <div class="circle left-bottom">
                        <div class="title">غذا</div>
                        <a target="_blank" href="javascript:"><img src="project_files/images/images/art2.jpg" alt="art"></a><i>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M482.3 192C516.5 192 576 221 576 256C576 292 516.5 320 482.3 320H365.7L265.2 495.9C259.5 505.8 248.9 512 237.4 512H181.2C170.6 512 162.9 501.8 165.8 491.6L214.9 320H112L68.8 377.6C65.78 381.6 61.04 384 56 384H14.03C6.284 384 0 377.7 0 369.1C0 368.7 .1818 367.4 .5398 366.1L32 256L.5398 145.9C.1818 144.6 0 143.3 0 142C0 134.3 6.284 128 14.03 128H56C61.04 128 65.78 130.4 68.8 134.4L112 192H214.9L165.8 20.4C162.9 10.17 170.6 0 181.2 0H237.4C248.9 0 259.5 6.153 265.2 16.12L365.7 192H482.3z"/>
                            </svg>
                        </i></div>
                </div>
                <div class="col-12 p-0 d-flex d-xl-none flex-wrap">
                    <div class="tour_owl owl-carousel owl-theme">
                        {foreach $articles as $key => $article}
                            <div class="item">
                                <a class="BlogSlider" href="{$article['link']}">
                                    <img  src="{$article['image']}" alt="{$article['title']}">
                                    <div class="blogText">
                                        <div class="headerBlog">
                                            <h2>{$article['title']}</h2>
                                            <span>تاریخ انتشار : {$article['created_at']}</span></div>
                                        <p>{$article['description']}</p>
                                        <div class="footerBlog">
                                            <div class="star"><i class="fa fa-star"></i><i class="fa fa-star"></i></div>
                                            <button class="button">بیشتر</button>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        {/foreach}

                    </div>
                </div>
                <div class="d-flex justify-content-center mt-3 w-100"><a href="javascript:" class="button">همه
                        مقالات</a></div>
            </div>
        </div>
    </section>
{/if}