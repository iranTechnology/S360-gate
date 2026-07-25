{*{assign var="list_id" value=[1 , 5 , 7]}*}
{assign var='aboutIran' value=$obj_main_page->aboutIranMain()}
{$aboutIran|count}
{if $aboutIran}
<section class="destinations-iran">
    <div class="container">
        <div class="title">
            <h2>Destinations Iran</h2>
        </div>
        <div class="parent-destinations-iran">
            <div class="item-destinations-iran">
                <div class="parent-video-destinations-iran">
                    <video controls="" loop="loop" src="project_files/video/tabriz.mp4" type="project_files/video/mp4"></video>
                </div>
                <a class="parent-text-destinations-iran" href="javascript:">
                    <h3>Incredible Tabriz</h3>
                    <p>Cities, wildlife and the Great Outdoors</p>
                </a>
            </div>
            <div class="item-destinations-iran">
                <div class="parent-video-destinations-iran">
                    <video controls="" loop="loop" src="project_files/video/esfahan.mp4" type="project_files/video/mp4"></video>
                </div>
                <a class="parent-text-destinations-iran" href="javascript:">
                    <h3>Epic Mazandaran</h3>
                    <p>Discover reef, rock &amp; rainforest Down Under</p>
                </a>
            </div>
            <div class="item-destinations-iran">
                <div class="parent-video-destinations-iran">
                    <video controls="" loop="loop" src="project_files/video/iran.mp4" type="project_files/video/mp4"></video>
                </div>
                <a class="parent-text-destinations-iran" href="javascript:">
                    <h3>Awesome Esfahan</h3>
                    <p>Geysers, glaciers and grapes</p>
                </a>
            </div>
        </div>
        <div class="owl-carousel owl-theme destinations-iran-owl">
            <div class="item">
                <div class="item-destinations-iran">
                    <div class="parent-video-destinations-iran">
                        <video controls="" loop="loop" src="project_files/video/tabriz.mp4" type="project_files/video/mp4"></video>
                    </div>
                    <a class="parent-text-destinations-iran" href="javascript:">
                        <h3>Incredible Tabriz</h3>
                        <p>Cities, wildlife and the Great Outdoors</p>
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="item-destinations-iran">
                    <div class="parent-video-destinations-iran">
                        <video controls="" loop="loop" src="project_files/video/esfahan.mp4" type="project_files/video/mp4"></video>
                    </div>
                    <a class="parent-text-destinations-iran" href="javascript:">
                        <h3>Epic Mazandaran</h3>
                        <p>Discover reef, rock &amp; rainforest Down Under</p>
                    </a>
                </div>
            </div>
            <div class="item">
                <div class="item-destinations-iran">
                    <div class="parent-video-destinations-iran">
                        <video controls="" loop="loop" src="project_files/video/iran.mp4" type="project_files/video/mp4"></video>
                    </div>
                    <a class="parent-text-destinations-iran" href="javascript:">
                        <h3>Awesome Esfahan</h3>
                        <p>Geysers, glaciers and grapes</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="parent-btn-more">
            <a class="btn-more" href="javascript:">

                See more

            </a>
        </div>
    </div>
</section>
{/if}
