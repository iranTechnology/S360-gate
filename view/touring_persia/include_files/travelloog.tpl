
{assign var="send_data" value=['is_visible'=>1 , 'limit' =>3]}
{assign var='recommendation_list' value=$obj_main_page->recommendationMain($send_data)}

{if $recommendation_list['data']}
<section class="problem" id='Problems-solve'>
    <div class="container">
        <div class="title">
            <h2>Travel Problems We Solve in Iran</h2>
        </div>
        <div class="parent-tour">

            {foreach $recommendation_list['data'] as $recommendation}
            <div class="item-tour">
                <div class="parent-video-tour">
{*                    <video controls="" loop="loop" src="project_files/video/japon.mp4" type="project_files/video/mp4"></video>*}

                    {if $recommendation['video_link']}
                        <iframe src="{$recommendation['video_link']}" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                    {else}
                        <img src="{$recommendation['avatar_image']}" alt="{$recommendation['fullName']}" title='{$recommendation['fullName']}'>
                    {/if}
                </div>
                <a class="parent-text-tour parent-text-problem" href="{$smarty.const.ROOT_ADDRESS}/recommendation/{$recommendation['id']}">
                    <h3>{$recommendation['fullName']}</h3>
                    <p>
                        {$recommendation['content']}
                    </p>
                    <button>

                        See holiday details

                    </button>
                </a>
            </div>
            {/foreach}
        </div>
        <div class="owl-carousel owl-theme problem-owl">
            {foreach $recommendation_list['data'] as $recommendation}
            <div class="item">
                <div class="item-tour">
                    <div class="parent-video-tour">
{*                        <video controls="" loop="loop" src="project_files/video/japon.mp4" type="project_files/video/mp4"></video>*}
                        {if $recommendation['video_link']}
                            <iframe src="{$recommendation['video_link']}" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                        {else}
                            <img src="{$recommendation['avatar_image']}" alt="{$recommendation['fullName']}" title='{$recommendation['fullName']}'>
                        {/if}
                    </div>
                    <a class="parent-text-tour parent-text-problem"  href="{$smarty.const.ROOT_ADDRESS}/recommendation/{$recommendation['id']}">
                        <h3>{$recommendation['fullName']}</h3>
                        <p>
                            {$recommendation['content']}
                        </p>
                        <button>

                            See holiday details

                        </button>
                    </a>
                </div>
            </div>
            {/foreach}
        </div>
        <div class="parent-btn-more">
            <a class="btn-more" href="{$smarty.const.ROOT_ADDRESS}/recommendation">

                See more

            </a>
        </div>
    </div>
</section>
{/if}

