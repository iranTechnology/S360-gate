{load_presentation_object filename="functions" assign="objFunctions"}
{assign var="advertises" value=$objFunctions->getConfigContentByTitle('home_page_advertise')}
{if !empty($advertises) }
    <section class="i_modular_adds advertising">
        <div class="container">
            <div class="ads-parent">
                <div class="owl-carousel owl-theme owl-loaded owl-ads1">
                    {*                {foreach $advertises as $key => $item}*}
                    {*                <div class="__i_modular_nc_item_class_0 item ads1">*}
                    {*                    {$item['content']}*}
                    {*                </div>*}
                    {*                {/foreach}*}

                    {*                اگر این طرح رو برای پروژه واقعی گذاشتید کد های پایین رو کامنت کنید و کد های بالا رو از کامنتی در بیارید تا این بخش داینامیک شود*}

                    <div class="__i_modular_nc_item_class_0 item ads1">
                        <img src="project_files/images/banner1.jpg">
                    </div>
                    <div class="__i_modular_nc_item_class_0 item ads1">
                        <img src="project_files/images/banner2.jpg">
                    </div>
                </div>
            </div>
        </div>
    </section>
{/if}