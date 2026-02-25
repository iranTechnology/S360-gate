{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}
{assign var="socialLinks"  value=$about['social_links']|json_decode:true}
{assign var="socialLinksArray" value=['telegram'=>'telegramHref','whatsapp'=> 'whatsappHref','instagram' => 'instagramHref','aparat' => 'aparatHref','youTube' => 'youtubeHref','facebook' => 'facebookHref','linkedin' => 'linkeDinHref' , 'twitter' => 'twitterHref' , 'twitter' => 'twitterHref' , 'bale' => 'baleHref' , 'ita' => 'itaHref']}

{foreach $socialLinks as $key => $val}
    {assign var=$socialLinksArray[$val['social_media']] value=$val['link']}
{/foreach}
<div class="float-sm">
    <a class="__telegram_class__ fl-fl float-tg" href="{if $telegramHref}{$telegramHref}{/if}">
        <img alt="telegram" src="project_files/images/telegram.png">
        <span>تلگرام</span>
        </img></a>
    <a class="__instagram_class__ fl-fl float-in" href="{if $instagramHref}{$instagramHref}{/if}">
        <img alt="telegram" src="project_files/images/instagram.png">
        <span>اینستاگرام</span>
        </img></a>
    <a class="fl-fl float-gp" href="{if $baleHref}{$baleHref}{/if}">
        <img alt="bale" src="project_files/images/bale.png">
        <span>بله</span>
        </img></a>
    <a class="fl-fl float-rs" href="{if $itaHref}{$itaHref}{/if}">
        <img alt="eita" src="project_files/images/eita.png">
        <span>ایتا</span>
        </img></a>
    <a class="__aparat_class__ fl-fl float-ig" href="{if $aparatHref}{$aparatHref}{/if}">
        <img alt="aparat" src="project_files/images/aparat.png">
        <span>آپارات</span>
        </img></a>
    <a class="__youtube_class__ fl-fl float-iy" href="{if $youTubeHref}{$youTubeHref}{/if}">
        <svg viewbox="0 0 576 512" xmlns="http://www.w3.org/2000/svg">
            <!--! Font Awesome Pro 6.3.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
            <path d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"></path>
        </svg>
        <span>یوتیوب</span>
    </a>
</div>
{/if}
{else}
    {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}