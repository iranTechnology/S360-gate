<!DOCTYPE html>

<html dir="ltr" lang="en">
{include file="include_files/header-1.tpl"}
<body>
{include file="include_files/menu-1.tpl"}
    <main>
        {include file="include_files/search-box.tpl"}
        {include file="include_files/aboutIran.tpl"}

        {include file="include_files/tours-1.tpl"}
        {include file="include_files/travelloog.tpl"}
        <section class="problem-email">
            <div class="parent-problem">
                <h4>problems that solve we do</h4>
                <p>Enter your problems and ideas in the fields below and send them to us.</p>
                <div class="parent-input-problem">
                    <form method='post' id="feedback-form-id" class=''>
                        <input type='hidden' name='type' value='feedback'>

                        <div class="input-problem col-lg-12">
                            <div class="inputs col-lg-6">
                                <label for="feedback-name">First name</label>
                                <input name="feedback-name" id="feedback-name"  type="text"/>
                            </div>
                            <div class="inputs col-lg-6">
                                <label for="feedback-family">Last name</label>
                                <input name="feedback-family" id="feedback-family" type="text"/>
                            </div>
                            <div class="inputs col-lg-12">
                                <label for="Email">Email</label>
                                <input  type="email" id="feedback-Email" name="feedback-Email" type="text"/>
                            </div>
                            <div class="inputs col-lg-12">
                                <label for="Description">Description</label>
                                <textarea cols="30"  id="feedback-Message" name="feedback-Message"  maxlength="3000" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="input-problem col-lg-12">
                            <div class="parent-btn-more">
                                <button type='button' onclick='submitFeedback()' class="btn-more" href="javascript:">

                                    Submit

                                </button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </section>
        {include file="include_files/vote.tpl"}
        {include file="include_files/blog-1.tpl"}
        <section class="form-us" id='contact-us'>
            <div class="parent-form-us">
                {load_presentation_object filename="aboutUs" assign="objAbout"}
                {assign var="aboutUsData" value=$objAbout->GetData()}
                <div class="form-us-video">
                    {if $aboutUsData['video_link']}
                    <iframe src="{$aboutUsData['video_link']}" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                    {else}
                        <img src="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/pic/aboutUs/{$aboutUsData['banner_file']}" alt="{$aboutUsData['title']}">
                    {/if}
                </div>
                <div class="parent-problem2">
                    <h4>Contact us form</h4>
                    <p>To contact us, just fill out the form below and send us your opinion.</p>
                    <div class="parent-input-problem">
                        <div class="input-problem col-lg-12">
                            <div class="inputs col-lg-6">
                                <label for="contactUs-name">First name</label>
                                <input type="text" name="contactUs-name"  id="contactUs-name"  type="text"/>
                            </div>
                            <div class="inputs col-lg-6">
                                <label for="contactUs-family">Last name</label>
                                <input type="text" name="contactUs-family"  id="contactUs-family"/>
                            </div>
                            <div class="inputs col-lg-6">
                                <label for="contactUs-phone">whatsapp</label>
                                <input  id="contactUs-phone" name="contactUs-phone"  type="text"/>
                            </div>
                            <div class="inputs col-lg-6">
                                <label for="contactUs-Email">Email</label>
                                <input type="email" id="contactUs-Email" name="contactUs-Email"/>
                            </div>
                            <div class="inputs col-lg-12">
                                <label for="contactUs-Message">Description</label>
                                <textarea cols="30"  id="contactUs-Message" name="contactUs-Message" maxlength="3000" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="input-problem col-lg-12">
                            <div class="parent-btn-more">
                                <button type='button' onclick='submitContact()'  class="btn-more" href="javascript:">

                                    Submit

                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        {include file="include_files/honors.tpl"}
    </main>
{include file="include_files/footer-1.tpl"}
</body>
 {include file="include_files/footer_script-1.tpl"}
</link>
</html>