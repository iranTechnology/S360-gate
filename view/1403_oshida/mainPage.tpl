{include file="include_files/header.tpl" }

{assign var="data_search_public" value=['page_type'=>'attach','position'=> ['MainPage','internalFlight','internationalFlight']]}
{assign var='specialPageData' value=$obj_main_page->getSpecialPageData($data_search_public)}


{foreach $specialPageData as $specialPage}
    {if $specialPage['position'] eq 'internalFlight'}
        {assign var='specialInternalFlight' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'internationalFlight'}
        {assign var='specialInternationalFlight' value=$specialPage}
    {/if}
    {if $specialPage['position'] eq 'MainPage'}
        {assign var='specialMainPage' value=$specialPage}
    {/if}
{/foreach}
<main>
    <div class="bd-example">
        {include file="include_files/banner-slider.tpl" }
    <!--   start search box-->
        {include file="include_files/search-box.tpl"}
    </div>

    <!--   start tour special-->
    {include file="include_files/special-tours.tpl"}
    <!--   end tour special-->

    <div class="app_section">

        <div class="container">

            <div class="row">

                <div class="col-md-6 image_app">

                    <img src="project_files/images/app2.png" alt="برنامه">


                </div>
                <div class="col-md-6 app_text">

                    <div class="matn_app ">

                        <h4>با اپلیکیشن  اوشیدا پرواز سفر پیش روی شماست</h4>
                        <p>با استفاده از اپلیکیشن اوشیدا پرواز هر کجا که هستید، در کمتر از چند ثانیه به راحتی رزرو هتل،
                            بلیط هواپیما و تور مورد نظرتان را انجام دهید و از بین هزاران گزینه به انتخاب دلخواهتان برسید تا
                            سفری به یاد ماندنی را رقم بزنید.</p>
                        <div class="app__dowload-links">

                            <div class="app-dl">
                                <a href="https://oshidaparvaz.com/apk/com.oshidaparvaz.app.apk" target="_blank" class="btn btn-info2">
                                    <i class="fab fa-android fa-lg fa-fw"></i>  دانلود مستقیم</a>
                            </div>



                        </div>
                    </div>

                </div>

            </div>
        </div>


    </div>


    <div class="section2">

        <div class="container-fluid">

            <h4 class="title"><span> خدمات ما</span></h4>
            <div class="row parent-box-section2">

                <div class="col-sm-12 col-md-6 col-xl-3">
                    <article class="box-minimal box-minimal-border">
                        <div class="box-minimal-icon novi-icon fas fa-plane center"></div>
                        <p class="big box-minimal-title">بلیط هواپیما </p>
                        <hr>
                        <div class="box-minimal-text text-spacing-sm">در آژانس مسافرتی اوشیدا، شما می توانید بلیط هواپیما به
                            هر
                            مقصد جهان را به صورت آنلاین رزرو کنید. شما همچنین تنها با چند مرحله میتوانید از طریق این وب سایت
                            بلیط خود را تهیه کنید
                        </div>
                    </article>
                </div>

                <div class="col-sm-12 col-md-6 col-xl-3">
                    <article class="box-minimal box-minimal-border">
                        <div class="box-minimal-icon novi-icon fas fa-map-marked-alt"></div>
                        <p class="big box-minimal-title"> سفر و گردش </p>
                        <hr>
                        <div class="box-minimal-text text-spacing-sm">
                            علاوه بر تورها و گشت و گذار های داخلی، ما همچنین انواع سفرهای دریایی و هوایی را برای مشتریان
                            مختلف که به دنبال تجربه های عالی هستند نیز ارائه می دهیم.
                        </div>
                    </article>
                </div>

                <div class="col-sm-12 col-md-6 col-xl-3">
                    <article class="box-minimal box-minimal-border">
                        <div class="box-minimal-icon novi-icon fas fa-hotel center"></div>
                        <p class="big box-minimal-title"> رزرو آنلاین </p>
                        <hr>
                        <div class="box-minimal-text text-spacing-sm">

                            ما هتل های گسترده ای را از هتل های 5 ستاره تا هتل های کوچک در سراسر جهان ارائه می دهیم تا
                            بتوانید یک هتل را که باب میل شماست رزرو کنید.
                        </div>
                    </article>
                </div>

                <div class="col-sm-12 col-md-6 col-xl-3">
                    <article class="box-minimal box-minimal-border">
                        <div class="box-minimal-icon novi-icon fas fa-umbrella-beach center"></div>
                        <p class="big box-minimal-title"> تورهای مناسبتی </p>
                        <hr>
                        <div class="box-minimal-text text-spacing-sm">آژانس مسافرتی اوشیدا تورهای متنوعی را از جمله تورهای
                            تابستانی مناسب
                            برای مشتریانی که به دنبال تعطیلات منحصر به فرد و به یاد ماندنی هستند، ارائه می دهد.
                        </div>
                    </article>
                </div>


            </div>

        </div>

    </div>


    {include file="include_files/news.tpl"}


    <div class="section4">

        <div class="container-fluid">
            <h4 class="title"><span>  معرفی کشورها </span></h4>

            <div class="row">

                <div class="gallery">
                    <ul>
                        {assign var='about_iran_items' value=$obj_main_page->aboutIran(6)}

                        {foreach $about_iran_items as $item}

                        <li>
                            <a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/aboutIran/{$item.id}"
                               title="{$item.ci_name}" target="_blank">
                                <img src="{$item.photo}" alt="{$item.ci_name}">
                                <div class="info"><h3 class="title">{$item.ci_name}</h3>

                                    <p>{$item['subtitle']}</p>
                                </div>
                            </a>
                        </li>

                        {/foreach}

                    </ul>
                </div><!-- .gallery -->

            </div>

        </div>

    </div>


    <!--   end ads-->

</main>
{include file="include_files/footer.tpl"}

</body>
{include file="include_files/script-footer.tpl"}
