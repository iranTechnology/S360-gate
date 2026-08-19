{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}

<section class="i_modular_about_us about-ghods container">
 <div>
  <div class="parent-about">
   <div class="about-text position-relative">
    <h3 class="nastaliq">
     آشنایی با کاج مهر
    </h3>
    <h2>
     جاذبه‌های توریستی در سراسر جهان با راهنمای گردشگری ما به همراه تجاربی بی‌نظیر و جذاب
    </h2>
    <p class="__aboutUs_class__">
     {$htmlContent = $about['body']|strip_tags}{$htmlContent|truncate:300}
    </p>
{*    <ul class="ul-about">*}
{*     <li>*}
{*      <i class="fa-solid fa-location-dot">*}
{*      </i>*}
{*      <span class="__address_class__">*}
{*       آدرس :  {$smarty.const.CLIENT_ADDRESS}*}
{*      </span>*}
{*     </li>*}
{*     <li>*}
{*      <i class="fa-solid fa-phone">*}
{*      </i>*}
{*      <span class="__phone_class__" href="tel:{$smarty.const.CLIENT_PHONE}">*}
{*       {$smarty.const.CLIENT_PHONE}*}
{*      </span>*}
{*     </li>*}
{*     <li>*}
{*      <i class="fa-solid fa-mobile">*}
{*      </i>*}
{*      <span class="__mobile_class__" href="tel:{$smarty.const.CLIENT_MOBILE}">*}
{*       {$smarty.const.CLIENT_MOBILE}*}
{*      </span>*}
{*     </li>*}
{*     <li>*}
{*      <i class="fa-solid fa-envelope">*}
{*      </i>*}
{*      <span class="__email_class__" href="mailto:{$smarty.const.CLIENT_EMAIL}">*}
{*       {$smarty.const.CLIENT_EMAIL}*}
{*      </span>*}
{*     </li>*}
{*    </ul>*}
    <a class="__aboutUs_class_href__ btn-more-about" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
     مشاهده بیشتر
    </a>
   </div>
  </div>
 </div>
</section>
