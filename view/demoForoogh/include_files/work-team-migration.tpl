{load_presentation_object filename="personnel" assign="objPersonnel"}
{assign var="type_data" value=['lang'=>$smarty.const.SOFTWARE_LANG]}


<section class="work-team-migration">
    <div class="container">
        <div class="title">
            <div class="box-right">
                <div class="text-title">
                    <h5>معرفی همکاران</h5>
                    <span>در این بخش می‌توانید با تیم همکاران ما و حوزه‌های فعالیت آن‌ها بیشتر آشنا شوید.</span>
                </div>
            </div>
            <a class="more-title" href="{$smarty.const.ROOT_ADDRESS}/personnel">

                مشاهده بیشتر

                <i class="fa-solid fa-arrow-left"></i>
            </a>
        </div>

        <div class="owl-carousel owl-theme owl-work-team-migration">
            {assign var="personnel_list" value=$objPersonnel->getPersonnels($type_data)}
            {foreach $personnel_list['data'] as $personnel}
            <div class="item">
                <a class="link-item-owl-work-team-migration" href="javascript:">
                    <div class="parent-img-work-team-migration">
                        <img src="{$personnel.image}" alt="{$personnel.name}">
                    </div>
                    <div class="parent-text-work-team-migration">
                        <h4>{$personnel.name}</h4>
                        <span>{$personnel.position}</span>
                    </div>
                </a>
            </div>
            {/foreach}

        </div>
    </div>
</section>
