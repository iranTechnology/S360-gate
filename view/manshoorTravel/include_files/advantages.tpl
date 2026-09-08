<section class="bestSection">
    <h3 class="title mb-5">چرا ما بهترین هستیم ؟!</h3>
    <div class="container d-flex flex-wrap parent-desc-about-us">
        <div class="col-12 col-md-6 col-lg-4 p-1">
            <div>
                <i class="far fa-smile"></i>
                <div class="parent-text-about">
                    <h4>قیمت منصفانه</h4>
                    <p>شما میتوانید بهترین قیمت ها را در منشور صلح پارسیان ببینید</p>
                </div>
                <img alt="img" class="about-bg-img" src="project_files/images/abouts1.png"/>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4 p-1">
            <div>
                <i class="fal fa-user-headset"></i>
                <div class="parent-text-about">
                    <h4>پشتیبانی ۲۴ ساعته</h4>
                    <p>ما در تمامی مراحل سفر همراه شما هستیم</p>
                </div>
                <img alt="img" class="about-bg-img" src="project_files/images/abouts1.png"/>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-4 p-1 bestSection-child">
            <div>
                <i class="fal fa-tachometer-alt-fastest"></i>
                <div class="parent-text-about">
                    <h4>سرعت ارائه خدمات</h4>
                    <p>ارائه خدمات با کیفیت در کمترین زمان</p>
                </div>
                <img alt="img" class="about-bg-img" src="project_files/images/abouts1.png"/>
            </div>
        </div>
    </div>
    <div class="parent-owl-about-us container">
        <div class="owl-carousel owl-theme owl-about-us">
            <div class="item">
                <div class="owl-about-us-child">
                    <i class="far fa-smile"></i>
                    <div class="parent-text-about">
                        <h4>قیمت منصفانه</h4>
                        <p>شما میتوانید بهترین قیمت ها را در منشور صلح پارسیان ببینید</p>
                    </div>
                    <img alt="img" class="about-bg-img" src="project_files/images/abouts1.png"/>
                </div>
            </div>
            <div class="item">
                <div class="owl-about-us-child">
                    <i class="fal fa-user-headset"></i>
                    <div class="parent-text-about">
                        <h4>پشتیبانی ۲۴ ساعته</h4>
                        <p>ما در تمامی مراحل سفر همراه شما هستیم</p>
                    </div>
                    <img alt="img" class="about-bg-img" src="project_files/images/abouts1.png"/>
                </div>
            </div>
            <div class="item">
                <div class="owl-about-us-child">
                    <i class="fal fa-tachometer-alt-fastest"></i>
                    <div class="parent-text-about">
                        <h4>سرعت ارائه خدمات</h4>
                        <p>ارائه خدمات با کیفیت در کمترین زمان</p>
                    </div>
                    <img alt="img" class="about-bg-img" src="project_files/images/abouts1.png"/>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="float-sm">
    {load_presentation_object filename="aboutUs" assign="objAbout"}
    {assign var="about"  value=$objAbout->getData()}
    {assign var="socialLinks"  value=$about['social_links']|json_decode:true}
    {assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref']}

    {foreach $socialLinks as $key => $val}
        {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
    {/foreach}
    <a class="text-white d-flex align-items-center fl-fl float-TEX" href="{$smarty.const.ROOT_ADDRESS}/page/travel" target="_blank">
        <i class="fa-solid fa-users"></i>
        <div>سفر کلید فهم زندگی است</div>
        <img alt="img" class="fixed-menu1" src="project_files/images/fixed-menu.png" />
    </a>
    <a class="text-white d-flex align-items-center SMTelegram fl-fl float-gp" href="{if $telegramHref}{$telegramHref}{/if}" target="_blank">
        <i class="fab fa-telegram"></i>
        <div>تلگرام</div>
        <img alt="img" class="fixed-menu1" src="project_files/images/fixed-menu2.png" />
    </a>
    <a class="text-white d-flex align-items-center SMWhatsApp fl-fl float-rs" href="{if $whatsappHref}{$whatsappHref}{/if}" target="_blank">
        <i class="fab fa-whatsapp"></i>
        <div>واتساپ</div>
        <img alt="img" class="fixed-menu1" src="project_files/images/fixed-menu3.png" />
    </a>
    <div class="fl-fl fl-flinstagram float-ig text-white d-flex align-items-center" href="">
        <a class="SMInstageram d-flex align-items-center" href="{if $instagramHref}{$instagramHref}{/if}" style="font-size: 12px">
            <i class="fab fa-instagram"></i>
            <div>msptrip</div>
            <img alt="img" class="fixed-menu1" src="project_files/images/fixed-menu4.png" />
        </a>
        <a class="SMInstageram2 d-flex align-items-center" href="{if $instagramHref}{$instagramHref}{/if}" style="font-size: 12px">
            <i class="fab fa-instagram"></i>
            <div>msptravel.ir</div>
        </a>
    </div>
</div>
