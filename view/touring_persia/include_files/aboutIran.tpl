
{load_presentation_object filename="introductIran" assign="objAboutIran"}
{assign var="send_data" value=['is_active '=>1 , 'limit' =>3]}
{assign var='aboutIran' value=$obj_main_page->aboutIranMain($send_data)}


{if $aboutIran}
<section class="destinations-iran">
    <div class="container">
        <div class="title">
            <h2>Must-visit Cities in Iran</h2>
        </div>
        <div class="parent-destinations-iran">
            {foreach $aboutIran as $item}
            <div class="item-destinations-iran">
                <div class="parent-video-destinations-iran">
                    {*<video controls="" loop="loop" src="project_files/video/tabriz.mp4" type="project_files/video/mp4"></video>*}
                    {if $item.video_url}
                        <iframe src="{$item.video_url}" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                    {else}
                        <img src="{$item.pic_show}" alt="{$item.title}" title='{$item.title}'>
                    {/if}
                </div>
                <a class="parent-text-destinations-iran" href="{$smarty.const.ROOT_ADDRESS}/introductIran/{$item.id}">
                    <h3>{$item.title}</h3>
                    <p>{$objAboutIran->my_substr(strip_tags($item.note_province) , 0 , 300)}</p>
                </a>
            </div>
            {/foreach}
        </div>
        <div class="owl-carousel owl-theme destinations-iran-owl">
            {foreach $aboutIran as $item}
            <div class="item">
                <div class="item-destinations-iran">
                    <div class="parent-video-destinations-iran">
                        {*<video controls="" loop="loop" src="project_files/video/tabriz.mp4" type="project_files/video/mp4"></video>*}
                        {if $item.video_url}
                            <iframe src="{$item.video_url}" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                        {else}
                            <img src="{$item.pic_show}" alt="{$item.title}" title='{$item.title}'>
                        {/if}
                    </div>
                    <a class="parent-text-destinations-iran" href="{$smarty.const.ROOT_ADDRESS}/aboutIran/{$item.id}">
                        <h3>{$item.title}</h3>
                        <p>{$objAboutIran->my_substr(strip_tags($item.note_province) , 0 , 100)}</p>
                    </a>
                </div>
            </div>

            {/foreach}
        </div>
        <div class="parent-btn-more">
            <a class="btn-more" href="{$smarty.const.ROOT_ADDRESS}/introductIran">
                See more
            </a>
        </div>
    </div>
</section>
{/if}
