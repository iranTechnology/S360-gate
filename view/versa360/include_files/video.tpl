{assign var="type_data" value=['is_active'=>1 , 'limit' =>1]}
{assign var='list_video' value=$obj_main_page->getVideo($type_data)}
{if $list_video[0]['iframe_code']}
<section class="video">
    <div class="container">
        <div class="d-flex align-items-center justify-content-center">
            <div class="parent-video">
                <div class="video-ifm" id="11852289746">{$list_video[0]['iframe_code']}</script></div>
            </div>
        </div>
    </div>
</section>
{/if}
