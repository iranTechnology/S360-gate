{load_presentation_object filename="contactUs" assign="objContact"}
{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{load_presentation_object filename="faqs" assign="objFaq"}
{assign var="send_data" value=['limit'=>10 , 'service' =>'contactUs', 'order' => 'DESC']}
{assign var='list_faq' value=$objFaq->getByPosition($send_data)}

{if $smarty.const.SOFTWARE_LANG eq 'en'}
    <link rel='stylesheet' href='assets/styles/css/modules-en/contactUs-en.css'>
{else}
    <link rel='stylesheet' href='assets/modules/css/contactUs.css'>
{/if}

<script>
  $(".content_tech > .container").removeClass("container")
  $(".content_tech").addClass("p-0")

</script>
<div class='parent-banner'>
<div class='contactUs-img'>
    <img src='assets/images/contact-us-banner.jpg'>
    <div class='container'>
        <div class='contactUs-title'>
    <h2>##Contactus##</h2>
            <p>##suggestionorrequest##</p>
            <p>##supportteamwillrespond##</p>
        </div>
    </div>
</div>
<div class='container'>
        <div class='contactUs-box d-flex flex-wrap align-items-start w-100'>
            <div class='contactUs-info w-100 col-lg-6 col-12'>
                <div class='contactUs-info-parent w-100'>
                    <p class='contactUs-info-title'>##KeepInTouchtwo##</p>
                    {assign var='additional_data' value=$smarty.const.ADDITIONAL_DATA|json_decode:true}
                    {foreach $additional_data as $item}
                        {*                {$item['language']}*}
                        {if  $item['language'] eq $smarty.const.SOFTWARE_LANG || $item['language'] eq ''}
                        <div class=''>
                            <div class='contactUs_mainDiv site-main-bg-color-h'>
                                {if $item['icon'] }
                                    <span>
                            <i class="{$item['icon']}  site-border-main-color site-main-text-color"></i>
                                </span>
                                {else}
                                    <span>
                          <i class='far fa-bookmark site-border-main-color site-main-text-color'></i>
                            </span>
                                {/if}
                                <a {if $item['type']=='tel'} href='tel:{$item['body']}' {elseif $item['type']=='mail'} href="mailto:{$item['body']}" {elseif $item['type']=='social'} href='{$item['body']}' target='_blank' {else} href='javascript:' {/if}>
                                    <h2 class='site-main-text-color'>
                                        {$item['title']}

                                    </h2>
                                    <p>{$item['body']}</p>
                                </a>
                            </div>
                        </div>
                        {/if}
                    {/foreach}
                </div>
                <div class='contactUs-socila'>
                    <p>##Followusonsocial##</p>

                    {assign var="socialLinks" value=$about['social_links']|json_decode:true}

                    {* آرایه اصلی شبکه‌های اجتماعی با اولویت *}
                    {assign var="prioritySocials" value=['telegram', 'whatsapp', 'instagram', 'bale']}

                    {* آرایه کمکی برای ذخیره لینک‌ها *}
                    {assign var="socialLinksArray" value=[]}

                    {* پر کردن آرایه با لینک‌های موجود *}
                    {foreach $socialLinks as $val}
                        {$socialLinksArray[$val['social_media']] = $val['link']}
                    {/foreach}

                    {* آرایه نهایی برای نمایش *}
                    {assign var="finalDisplay" value=[]}

                    {* لیست سایر شبکه‌های اجتماعی که لینک دارند (غیر از ۴ تای اصلی) *}
                    {assign var="otherAvailable" value=[]}
                    {foreach $socialLinksArray as $key => $link}
                        {if $link && !in_array($key, $prioritySocials)}
                            {$otherAvailable[] = $key}
                        {/if}
                    {/foreach}

                    {* ساخت آرایه نهایی - ابتدا ۴ تای اصلی را پر می‌کنیم *}
                    {foreach $prioritySocials as $social}
                        {if $socialLinksArray[$social]}
                            {* اگر لینک دارد، خودش را اضافه کن *}
                            {$finalDisplay[] = $social}
                        {else}
                            {* اگر لینک ندارد، از شبکه‌های دیگر جایگزین کن *}
                            {if count($otherAvailable) > 0}
                                {* یک شبکه از لیست دیگر بردار و به جای آن بگذار *}
                                {$replacement = array_shift($otherAvailable)}
                                {$finalDisplay[] = $replacement}
                            {else}
                                {* اگر هیچ شبکه دیگری نیست، خودش را بدون لینک اضافه کن *}
                                {$finalDisplay[] = $social}
                            {/if}
                        {/if}
                    {/foreach}

                    {* اضافه کردن بقیه شبکه‌های دیگر که هنوز باقی مانده‌اند *}
                    {foreach $otherAvailable as $social}
                        {$finalDisplay[] = $social}
                    {/foreach}

                    <div class='contactUs-socila-parent'>
                        {* حلقه نهایی برای نمایش *}
                        {foreach $finalDisplay as $socialKey}
                        {if $socialLinksArray[$socialKey]}
                        {* اگر لینک دارد، با لینک نمایش بده *}
                        <a class='tooltip-social' href='{$socialLinksArray[$socialKey]}' target='_blank'>
                            {else}
                            {* اگر لینک ندارد، بدون لینک نمایش بده (فقط آیکون) *}
                            <a class='tooltip-social' href='javascript:'>
                                {/if}

                                {* نمایش آیکون مربوطه *}
                                {if $socialKey == 'telegram'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10s10-4.48 10-10S17.52 2 12 2m4.64 6.8c-.15 1.58-.8 5.42-1.13 7.19c-.14.75-.42 1-.68 1.03c-.58.05-1.02-.38-1.58-.75c-.88-.58-1.38-.94-2.23-1.5c-.99-.65-.35-1.01.22-1.59c.15-.15 2.71-2.48 2.76-2.69a.2.2 0 0 0-.05-.18c-.06-.05-.14-.03-.21-.02c-.09.02-1.49.95-4.22 2.79c-.4.27-.76.41-1.08.4c-.36-.01-1.04-.2-1.55-.37c-.63-.2-1.12-.31-1.08-.66c.02-.18.27-.36.74-.55c2.92-1.27 4.86-2.11 5.83-2.51c2.78-1.16 3.35-1.36 3.73-1.36c.08 0 .27.02.39.12c.1.08.13.19.14.27c-.01.06.01.24 0 .38" />
                                    </svg>
                                    <span class="tooltiptext-social">##Telegram##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'instagram'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M16 7a1 1 0 1 1 2 0a1 1 0 0 1-2 0" />
                                        <path fill="currentColor" fill-rule="evenodd" d="M12 7.25a4.75 4.75 0 1 0 0 9.5a4.75 4.75 0 0 0 0-9.5M8.75 12a3.25 3.25 0 1 1 6.5 0a3.25 3.25 0 0 1-6.5 0" clip-rule="evenodd" />
                                        <path fill="currentColor" fill-rule="evenodd" d="M17.258 2.833a47.7 47.7 0 0 0-10.516 0c-2.012.225-3.637 1.81-3.873 3.832a46 46 0 0 0 0 10.67c.236 2.022 1.86 3.607 3.873 3.832a47.8 47.8 0 0 0 10.516 0c2.012-.225 3.637-1.81 3.873-3.832a46 46 0 0 0 0-10.67c-.236-2.022-1.86-3.607-3.873-3.832m-10.35 1.49a46.2 46.2 0 0 1 10.184 0c1.33.15 2.395 1.199 2.55 2.517a44.4 44.4 0 0 1 0 10.32a2.89 2.89 0 0 1-2.55 2.516a46.2 46.2 0 0 1-10.184 0a2.89 2.89 0 0 1-2.55-2.516a44.4 44.4 0 0 1 0-10.32a2.89 2.89 0 0 1 2.55-2.516" clip-rule="evenodd" />
                                    </svg>
                                    <span class="tooltiptext-social">##Instagram##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'whatsapp'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M19.05 4.91A9.82 9.82 0 0 0 12.04 2c-5.46 0-9.91 4.45-9.91 9.91c0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38c1.45.79 3.08 1.21 4.74 1.21c5.46 0 9.91-4.45 9.91-9.91c0-2.65-1.03-5.14-2.9-7.01m-7.01 15.24c-1.48 0-2.93-.4-4.2-1.15l-.3-.18l-3.12.82l.83-3.04l-.2-.31a8.26 8.26 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.24-8.24c2.2 0 4.27.86 5.82 2.42a8.18 8.18 0 0 1 2.41 5.83c.02 4.54-3.68 8.23-8.22 8.23m4.52-6.16c-.25-.12-1.47-.72-1.69-.81c-.23-.08-.39-.12-.56.12c-.17.25-.64.81-.78.97c-.14.17-.29.19-.54.06c-.25-.12-1.05-.39-1.99-1.23c-.74-.66-1.23-1.47-1.38-1.72c-.14-.25-.02-.38.11-.51c.11-.11.25-.29.37-.43s.17-.25.25-.41c.08-.17.04-.31-.02-.43s-.56-1.34-.76-1.84c-.2-.48-.41-.42-.56-.43h-.48c-.17 0-.43.06-.66.31c-.22.25-.86.85-.86 2.07s.89 2.4 1.01 2.56c.12.17 1.75 2.67 4.23 3.74c.59.26 1.05.41 1.41.52c.59.19 1.13.16 1.56.1c.48-.07 1.47-.6 1.67-1.18c.21-.58.21-1.07.14-1.18s-.22-.16-.47-.28" />
                                    </svg>
                                    <span class="tooltiptext-social">##Whatsapp##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'bale'}
                                    <svg fill="#000000" width="800px" height="800px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M11.425 23.987a12.218 12.218 0 0 1-2.95-.514 6.578 6.578 0 0 0-.336-.116C4.936 22.303 2.22 19.763.913 16.599a11.92 11.92 0 0 1-.9-4.063C.005 12.377.001 10.246 0 6.74 0 .71-.005 1.137.07.903.23.394.673.05 1.224.005c.421-.034.7.088 1.603.699.562.38 1.119.78 1.796 1.289.315.237.353.261.376.247l.35-.23c.58-.381 1.11-.677 1.7-.945A11.913 11.913 0 0 1 9.766.21a11.19 11.19 0 0 1 2.041-.2c1.14-.016 2.077.091 3.152.36 3.55.888 6.538 3.411 8.028 6.78.492 1.113.845 2.43.945 3.522.033.366.039.43.053.611.008.105.015.406.015.669 0 .783-.065 1.57-.169 2.064a5.474 5.474 0 0 0-.046.26c-.056.378-.214.987-.399 1.535-.205.613-.367.999-.684 1.633a11.95 11.95 0 0 1-2.623 3.436c-.44.396-.829.705-1.26 1.003-.647.445-1.307.812-2.039 1.134-.6.265-1.44.539-2.101.686a11.165 11.165 0 0 1-1.178.202 12.28 12.28 0 0 1-2.076.082zm-.61-5.92c.294-.06.678-.209.864-.337.144-.099.428-.376 2.064-2.013a161.8 161.8 0 0 1 1.764-1.753c.017 0 1.687-1.67 1.687-1.689 0-.02 1.64-1.648 1.661-1.648.01 0 .063-.047.118-.106.467-.495.682-.957.716-1.547.026-.433-.06-.909-.217-1.196a2.552 2.552 0 0 0-.983-1.024c-.281-.163-.512-.233-.888-.27-.306-.031-.688 0-.948.075-.243.07-.603.274-.853.481-.042.035-1.279 1.265-2.748 2.733l-2.671 2.67-1.093-1.09c-.6-.6-1.12-1.114-1.155-1.142a2.419 2.419 0 0 0-1.338-.51c-.404-.013-.91.09-1.224.25a2.89 2.89 0 0 0-.659.526c-.108.12-.287.357-.29.385-.003.03-.009.044-.065.16a2.312 2.312 0 0 0-.224.91c-.011.229-.01.265.019.491.045.353.24.781.51 1.115.05.063.97.992 2.044 2.064 1.507 1.505 1.98 1.97 2.074 2.039.327.24.683.388 1.101.456.182.03.5.016.734-.03z"/></svg>
                                    <span class="tooltiptext-social">##Bale##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'youTube'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="m10 15l5.19-3L10 9zm11.56-7.83c.13.47.22 1.1.28 1.9c.07.8.1 1.49.1 2.09L22 12c0 2.19-.16 3.8-.44 4.83c-.25.9-.83 1.48-1.73 1.73c-.47.13-1.33.22-2.65.28c-1.3.07-2.49.1-3.59.1L12 19c-4.19 0-6.8-.16-7.83-.44c-.9-.25-1.48-.83-1.73-1.73c-.13-.47-.22-1.1-.28-1.9c-.07-.8-.1-1.49-.1-2.09L2 12c0-2.19.16-3.8.44-4.83c.25-.9.83-1.48 1.73-1.73c.47-.13 1.33-.22 2.65-.28c1.3-.07 2.49-.1 3.59-.1L12 5c4.19 0 6.8.16 7.83.44c.9.25 1.48.83 1.73 1.73" />
                                    </svg>
                                    <span class="tooltiptext-social">##Youtube##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'aparat'}
                                    <svg fill="#000000" width="800px" height="800px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M12.001 1.594c-9.27-.003-13.913 11.203-7.36 17.758a10.403 10.403 0 0 0 17.76-7.355c0-5.744-4.655-10.401-10.4-10.403zM6.11 6.783c.501-2.598 3.893-3.294 5.376-1.103 1.483 2.19-.42 5.082-3.02 4.582A2.97 2.97 0 0 1 6.11 6.783zm4.322 8.988c-.504 2.597-3.897 3.288-5.377 1.096-1.48-2.192.427-5.08 3.025-4.579a2.97 2.97 0 0 1 2.352 3.483zm1.26-2.405c-1.152-.223-1.462-1.727-.491-2.387.97-.66 2.256.18 2.04 1.334a1.32 1.32 0 0 1-1.548 1.053zm6.198 3.838c-.501 2.598-3.893 3.293-5.376 1.103-1.484-2.191.421-5.082 3.02-4.583a2.97 2.97 0 0 1 2.356 3.48zm-1.967-5.502c-2.598-.501-3.293-3.896-1.102-5.38 2.19-1.483 5.081.422 4.582 3.02a2.97 2.97 0 0 1-3.48 2.36zM13.59 23.264l2.264.61a3.715 3.715 0 0 0 4.543-2.636l.64-2.402a11.383 11.383 0 0 1-7.448 4.428zm7.643-19.665L18.87 2.97a11.376 11.376 0 0 1 4.354 7.62l.65-2.459A3.715 3.715 0 0 0 21.231 3.6zM.672 13.809l-.541 2.04a3.715 3.715 0 0 0 2.636 4.543l2.107.562a11.38 11.38 0 0 1-4.203-7.145zM10.357.702 8.15.126a3.715 3.715 0 0 0-4.547 2.637l-.551 2.082A11.376 11.376 0 0 1 10.358.702z"/></svg>
                                    <span class="tooltiptext-social">##Aparat##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'facebook'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 4.84 3.44 8.87 8 9.8V15H8v-3h2V9.5C10 7.57 11.57 6 13.5 6H16v3h-2c-.55 0-1 .45-1 1v2h3v3h-3v6.95c5.05-.5 9-4.76 9-9.95" />
                                    </svg>
                                    <span class="tooltiptext-social">##Facebook##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'linkedin'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2zm-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93zM6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37z" />
                                    </svg>
                                    <span class="tooltiptext-social">##Linkedin##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'twitter'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M22.46 6c-.77.35-1.6.58-2.46.69c.88-.53 1.56-1.37 1.88-2.38c-.83.5-1.75.85-2.72 1.05C18.37 4.5 17.26 4 16 4c-2.35 0-4.27 1.92-4.27 4.29c0 .34.04.67.11.98C8.28 9.09 5.11 7.38 3 4.79c-.37.63-.58 1.37-.58 2.15c0 1.49.75 2.81 1.91 3.56c-.71 0-1.37-.2-1.95-.5v.03c0 2.08 1.48 3.82 3.44 4.21a4.2 4.2 0 0 1-1.93.07a4.28 4.28 0 0 0 4 2.98a8.52 8.52 0 0 1-5.33 1.84q-.51 0-1.02-.06C3.44 20.29 5.7 21 8.12 21C16 21 20.33 14.46 20.33 8.79c0-.19 0-.37-.01-.56c.84-.6 1.56-1.36 2.14-2.23" />
                                    </svg>
                                    <span class="tooltiptext-social">##Twitter##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'ita'}
                                    <svg fill="#000000" width="800px" height="800px" viewBox="0 0 24 24" role="img" xmlns="http://www.w3.org/2000/svg"><path d="M5.968 23.942a6.624 6.624 0 0 1-2.332-.83c-1.62-.929-2.829-2.593-3.217-4.426-.151-.717-.17-1.623-.15-7.207C.288 5.47.274 5.78.56 4.79c.142-.493.537-1.34.823-1.767C2.438 1.453 3.99.445 5.913.08c.384-.073.94-.08 6.056-.08 6.251 0 6.045-.009 7.066.314a6.807 6.807 0 0 1 4.314 4.184c.33.937.346 1.087.369 3.555l.02 2.23-.391.268c-.558.381-1.29 1.06-2.316 2.15-1.182 1.256-2.376 2.42-2.982 2.907-1.309 1.051-2.508 1.651-3.726 1.864-.634.11-1.682.067-2.302-.095-.553-.144-.517-.168-.726.464a6.355 6.355 0 0 0-.318 1.546l-.031.407-.146-.03c-1.215-.241-2.419-1.285-2.884-2.5a3.583 3.583 0 0 1-.26-1.219l-.016-.34-.309-.284c-.644-.59-1.063-1.312-1.195-2.061-.212-1.193.34-2.542 1.538-3.756 1.264-1.283 3.127-2.29 4.953-2.68.658-.14 1.818-.177 2.403-.075 1.138.198 2.067.773 2.645 1.639.182.271.195.31.177.555a.812.812 0 0 1-.183.493c-.465.651-1.848 1.348-3.336 1.68-2.625.585-4.294-.142-4.033-1.759.026-.163.04-.304.031-.313-.032-.032-.293.104-.575.3-.479.334-.903.984-1.05 1.607-.036.156-.05.406-.034.65.02.331.053.454.192.736.092.186.275.45.408.589l.24.251-.096.122a4.845 4.845 0 0 0-.677 1.217 3.635 3.635 0 0 0-.105 1.815c.103.461.421 1.095.739 1.468.242.285.797.764.886.764.024 0 .044-.048.044-.106.001-.23.184-.973.326-1.327.423-1.058 1.351-1.96 2.82-2.74.245-.13.952-.47 1.572-.757 1.36-.63 2.103-1.015 2.511-1.305 1.176-.833 1.903-2.065 2.14-3.625.086-.57.086-1.634 0-2.207-.368-2.438-2.195-4.096-4.818-4.37-2.925-.307-6.648 1.953-8.942 5.427-1.116 1.69-1.87 3.565-2.187 5.443-.123.728-.169 2.08-.093 2.75.193 1.704.822 3.078 1.903 4.156a6.531 6.531 0 0 0 1.87 1.313c2.368 1.13 4.99 1.155 7.295.071.996-.469 1.974-1.196 3.023-2.25 1.02-1.025 1.71-1.88 3.592-4.458 1.04-1.423 1.864-2.368 2.272-2.605l.15-.086-.019 3.091c-.018 2.993-.022 3.107-.123 3.561-.6 2.678-2.54 4.636-5.195 5.242l-.468.107-5.775.01c-4.734.008-5.85-.002-6.19-.056z"/></svg>
                                    <span class="tooltiptext-social">##Eita##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'rubika'}
                                    <svg fill="#000000" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="800px" height="800px" viewBox="0 0 412.287 412.287" xml:space="preserve">
<g>
    <path d="M380.546,110.125L211.552,1.586c-3.293-2.115-7.515-2.115-10.807,0L31.744,110.081c-2.866,1.84-4.6,5.014-4.598,8.42   l0.041,180.039c0.002,3.476,1.806,6.699,4.767,8.519l168.961,103.75c1.605,0.986,3.419,1.479,5.233,1.479   c1.814,0,3.629-0.491,5.232-1.479L380.352,307.1c2.96-1.818,4.766-5.043,4.767-8.519l0.023-180.039   C385.143,115.137,383.409,111.965,380.546,110.125z M206.147,25.627l61.936,39.629l-61.936,39.627l-61.934-39.627L206.147,25.627z    M50.197,291.254v-63.938l60.692,36.848l0.01,64.377L50.197,291.254z M110.899,237.623l-60.703-37.285v-64.74l60.703,38.842   V237.623z M63.22,116.834l59.186-37.869l59.186,37.869l-59.186,37.869L63.22,116.834z M133.908,174.44l60.705-38.844v64.742   l-60.705,37.285V174.44z M133.938,277.927l40.348,25.815l-40.348,24.783V277.927L133.938,277.927z M194.642,379.952l-50.232-30.854   l50.232-30.847V379.952z M206.138,297.04l-62.076-38.765l62.076-38.592l62.076,38.733L206.138,297.04z M217.653,379.952v-61.645   l50.194,30.812L217.653,379.952z M278.358,328.571l-40.388-24.805l40.388-25.842V328.571z M278.388,237.67l-60.703-37.287v-64.736   l60.703,38.842V237.67z M230.708,116.879l59.186-37.867l59.186,37.867l-59.186,37.869L230.708,116.879z M362.104,291.3   l-60.705,37.286v-63.17l60.705-37.983V291.3z M362.104,200.383l-60.705,37.287v-63.182l60.705-38.844V200.383z"/>
</g>
</svg>
                                    <span class="tooltiptext-social">##Rubika##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {elseif $socialKey == 'pinterest'}
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                        <path d="M0 0h24v24H0z" fill="none" />
                                        <path fill="currentColor" d="M9.04 21.54c.96.29 1.93.46 2.96.46a10 10 0 0 0 10-10A10 10 0 0 0 12 2A10 10 0 0 0 2 12c0 4.25 2.67 7.9 6.44 9.34c-.09-.78-.18-2.07 0-2.96l1.15-4.94s-.29-.58-.29-1.5c0-1.38.86-2.41 1.84-2.41c.86 0 1.26.63 1.26 1.44c0 .86-.57 2.09-.86 3.27c-.17.98.52 1.84 1.52 1.84c1.78 0 3.16-1.9 3.16-4.58c0-2.4-1.72-4.04-4.19-4.04c-2.82 0-4.48 2.1-4.48 4.31c0 .86.28 1.73.74 2.3c.09.06.09.14.06.29l-.29 1.09c0 .17-.11.23-.28.11c-1.28-.56-2.02-2.38-2.02-3.85c0-3.16 2.24-6.03 6.56-6.03c3.44 0 6.12 2.47 6.12 5.75c0 3.44-2.13 6.2-5.18 6.2c-.97 0-1.92-.52-2.26-1.13l-.67 2.37c-.23.86-.86 2.01-1.29 2.7z" />
                                    </svg>
                                    <span class="tooltiptext-social">##Pinterest##<i class="fa-sharp fa-solid fa-triangle"></i></span>
                                {/if}

                            </a>
                            {/foreach}
                    </div>
                </div>
            </div>
            <div class='contactUs-form col-lg-6 col-12'>
                <div class='d-flex flex-wrap'>
                    <p class='contactUs-form-title'>##contactSendMessage##</p>
                    <form id="fcf-form-id" class='d-flex flex-wrap w-100 '>
                        {*                    <h1 class='w-100 font-20 my-4'>##KeepInTouch##</h1>*}
                        <div class="form-group p-0 mb-0 col-12">
                            <label for="exampleInputEmail1">##Namefamily##</label>
                            {if $objSession->IsLogin() }
                                <input placeholder='##Namefamily##' type="text" name="contactUs-name" disabled id="contactUs-name" value="{$objSession->getNameUser()}" class="form-control input_contactUs" required>
                            {else}
                                <input placeholder='##Namefamily##' type="text" name="contactUs-name" id="contactUs-name"
                                       class="form-control input_contactUs" required>
                            {/if}
                        </div>
                        <div class="form-group p-0 mb-0 col-12">
                            <label for="exampleInputEmail1">##Mobile##</label>
                            <input placeholder='##Phonenumber##' type="number" min="0" id="contactUs-phone" name="contactUs-phone" class="form-control input_contactUs" required>
                        </div>
                        <div class="form-group p-0 mb-0 col-12">
                            <label for="exampleInputEmail1">##Email##</label>
                            <input placeholder='##Email##' type="email" id="contactUs-Email" name="contactUs-Email" class="form-control input_contactUs" required>
                        </div>
                        <div class="form-group p-0 mb-0 col-12">
                            <label for="exampleInputEmail1">##contactMessage##</label>
                            <textarea placeholder='##Enterthetext##' id="contactUs-Message" name="contactUs-Message" class="form-control textarea_contactUs" rows="4" maxlength="3000" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-contactus btn-block btn-primary site-main-button-color">##Register##</button>
                    </form>
                </div>
            </div>
        </div>
        <div>
            {if $list_faq|count > 0}
            <div class="Questions">
                <div class="Questions-title">
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247m2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"></path>
                        </svg>
                        <h2>##FaqPage##</h2>
                    </div>
                    <a href='{$smarty.const.ROOT_ADDRESS}/faq'>
                        <p>##All##</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5"></path>
                        </svg>
                    </a>
                </div>
                <div class='row'>
                    <div class="Questions-parent col-md-12 col-lg-6" id="accordionExample">
                        {foreach $list_faq as $key => $item}
                            {if $key % 2 == 0}
                        <button class="card Questions-item collapsed" type="button" data-toggle="collapse" data-target="#collapse{$item['id']}" aria-expanded="true" aria-controls="collapse{$item['id']}">
                            <div class="card-header Question-header" id="heading{$item['id']}">
                                <h2 class="mb-0">
                                    <div class="Question-txt">
                                        <img src='assets/images/help.png'>
                                        <div class=" Question-btn btn btn-link btn-block text-left collapsed">
                                            {$item['title']}
                                        </div>
                                        <span class="Question-icon">
                                <svg viewBox="0 0 24 24" fill="currentColor" class="block Question-icon-svg"><path d="M21.266 7.302a.75.75 0 0 1 1.037 1.08l-.069.066-9.75 8.25a.75.75 0 0 1-.89.058l-.078-.058-9.75-8.25a.75.75 0 0 1 .893-1.202l.075.056L12 15.142l9.266-7.84Z"></path></svg>
                                  </span>
                                    </div>
                                </h2>
                            </div>
                            <div id="collapse{$item['id']}" class="collapse" aria-labelledby="heading{$item['id']}" data-parent="#accordionExample">
                                <div class="card-body">
                                    {$item['content']}
                                </div>
                            </div>
                        </button>
                            {/if}
                        {/foreach}

                    </div>
                    <div class='col-md-12 col-lg-6'>
                        {foreach $list_faq as $key => $item}
                            {if $key % 2 == 1}
                        <button class="card Questions-item collapsed" type="button" data-toggle="collapse" data-target="#collapse{$item['id']}" aria-expanded="true" aria-controls="collapse{$item['id']}">
                            <div class="card-header Question-header" id="heading{$item['id']}">
                                <h2 class="mb-0">
                                    <div class="Question-txt">
                                        <img src='assets/images/help.png'>
                                        <div class=" Question-btn btn btn-link btn-block text-left collapsed">
                                            {$item['title']}
                                        </div>
                                        <span class="Question-icon">
                                <svg viewBox="0 0 24 24" fill="currentColor" class="block Question-icon-svg"><path d="M21.266 7.302a.75.75 0 0 1 1.037 1.08l-.069.066-9.75 8.25a.75.75 0 0 1-.89.058l-.078-.058-9.75-8.25a.75.75 0 0 1 .893-1.202l.075.056L12 15.142l9.266-7.84Z"></path></svg>
                                 </span>
                                    </div>
                                </h2>
                            </div>
                            <div id="collapse{$item['id']}" class="collapse" aria-labelledby="heading{$item['id']}" data-parent="#accordionExample">
                                <div class="card-body">
                                    {$item['content']}
                                </div>
                            </div>
                        </button>
                            {/if}
                        {/foreach}

                    </div>
                </div>
            </div>
            {/if}
            <div class='parent-map d-flex flex-wrap align-items-start w-100'>
                <div class="Questions-title">
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--! Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc. --><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                        <h2>##Mylocation##</h2>
                    </div>
                </div>
                <div class='d-flex flex-wrap col-12 h_custom p-0'>
                    <div class='w-100 h-100 overflow-hidden'>
                        {if $smarty.const.CLIENT_ID == '308'}
                            <img src='assets/images/contactUs_map.png' alt='contactUs_map'>
                        {else}
                            <div class='w-100 h-100' id='map'></div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>


{*    <div class='d-flex gap-10 flex-wrap col-md-6 col-sm-12 p-2'>*}
{*        <div class='d-flex overflow-hidden gap-10 flex-wrap w-100 bg-white border border-50 rounded p-0'>*}
{*            <div class='d-block p-3'>*}
{*                <div class='border-50 border-bottom d-flex flex-wrap gap-10 justify-content-center pb-1 w-100'>*}
{*                    <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/{$smarty.const.CLIENT_LOGO}"*}
{*                         class='d-flex flex-wrap'*}
{*                         style='width: 85px;'*}
{*                         alt='{$smarty.const.CLIENT_NAME}'>*}
{*                    <span class='d-flex flex-wrap font-15 justify-content-center text-center'>*}
{*                        {$smarty.const.CLIENT_NAME}*}
{*                    </span>*}
{*                </div>*}

{*                <div class='overflow-shadow d-flex flex-wrap gap-10 justify-content-center w-100 mb-3'>*}
{*                    {$smarty.const.ABOUT_ME}*}
{*                </div>*}

{*                <div class='d-flex flex-wrap gap-10 justify-content-center w-100 mb-3'>*}
{*                    <a class='btn btn-secondary font-12 p-2' href='{$smarty.const.ROOT_ADDRESS}/aboutUs'>*}

{*                        <svg style='width:12px;fill:white' xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">*}
{*                            <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->*}
{*                            <path d="M272 64C263.2 64 256 56.84 256 48C256 39.16 263.2 32 272 32H432C440.8 32 448 39.16 448 48V208C448 216.8 440.8 224 432 224C423.2 224 416 216.8 416 208V86.63L187.3 315.3C181.1 321.6 170.9 321.6 164.7 315.3C158.4 309.1 158.4 298.9 164.7 292.7L393.4 64H272zM0 112C0 85.49 21.49 64 48 64H176C184.8 64 192 71.16 192 80C192 88.84 184.8 96 176 96H48C39.16 96 32 103.2 32 112V432C32 440.8 39.16 448 48 448H368C376.8 448 384 440.8 384 432V304C384 295.2 391.2 288 400 288C408.8 288 416 295.2 416 304V432C416 458.5 394.5 480 368 480H48C21.49 480 0 458.5 0 432V112z" />*}
{*                        </svg>*}
{*                        ##AboutUs##*}
{*                    </a>*}
{*                    <a class='btn btn-secondary font-12 p-2' href='https://{$smarty.const.CLIENT_MAIN_DOMAIN}/faq'>*}
{*                        <svg style='width:12px;fill:white' xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">*}
{*                            <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->*}
{*                            <path d="M272 64C263.2 64 256 56.84 256 48C256 39.16 263.2 32 272 32H432C440.8 32 448 39.16 448 48V208C448 216.8 440.8 224 432 224C423.2 224 416 216.8 416 208V86.63L187.3 315.3C181.1 321.6 170.9 321.6 164.7 315.3C158.4 309.1 158.4 298.9 164.7 292.7L393.4 64H272zM0 112C0 85.49 21.49 64 48 64H176C184.8 64 192 71.16 192 80C192 88.84 184.8 96 176 96H48C39.16 96 32 103.2 32 112V432C32 440.8 39.16 448 48 448H368C376.8 448 384 440.8 384 432V304C384 295.2 391.2 288 400 288C408.8 288 416 295.2 416 304V432C416 458.5 394.5 480 368 480H48C21.49 480 0 458.5 0 432V112z" />*}
{*                        </svg>*}

{*                        ##FaqPage##*}
{*                    </a>*}
{*                </div>*}
{*                <div class='d-flex flex-wrap gap-10 w-100 mb-3'>*}
{*                     <span class='d-flex font-12 flex-wrap font-15 w-100 justify-content-center text-center mb-3'>*}
{*                         ##ContactWays##*}
{*                    </span>*}

{*                    <span class='d-flex font-12 flex-wrap font-15 w-100 justify-content-center text-center mb-3'>*}
{*                          ##Address## : {$smarty.const.CLIENT_ADDRESS}*}
{*                     </span>*}

{*                    <div class='d-flex gap-10 flex-wrap col-md-12 p-2'>*}
{*                        {assign var="additional_data" value=$smarty.const.ADDITIONAL_DATA|json_decode:true}*}
{*                        {foreach $additional_data as $item}*}
{*                            <div class='d-grid gap-5 justify-content-center flex-wrap bg-light shadow-sm border border-light rounded p-2'>*}
{*                                <span class="text-muted text-center">{$item['title']}</span>*}
{*                                <span class="text-center">{$item['body']}</span>*}
{*                            </div>*}
{*                        {/foreach}*}
{*                    </div>*}

{*                </div>*}


{*            </div>*}

{*        </div>*}
{*    </div>*}


{literal}

<!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js" integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ==" crossorigin=""></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ==" crossorigin="" />

<script>
    {/literal}
    const GoogleMapLatitude = {$smarty.const.CLIENT_MAP_LAT}
    const GoogleMapLongitude = {$smarty.const.CLIENT_MAP_LNG}

    {literal}
    map = L.map('map').setView([GoogleMapLatitude, GoogleMapLongitude], 14 )
    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 18,
    }).addTo(map)
    newMarkerGroup = new L.LayerGroup()
    var marker = null
    marker = L.marker({

      lat: GoogleMapLatitude,
      lng: GoogleMapLongitude,

    }).addTo(map)
    setTimeout(() => {
      map.invalidateSize()
    }, "1000")

</script>

{/literal}
{literal}
    <script src="assets/js/customForContactUs.js"></script>
{/literal}




