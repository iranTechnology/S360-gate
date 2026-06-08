{$check_general = true}

{if $check_general}
<section class="i_modular_about_us about">
<div class="container">
<div class="d-flex flex-wrap">
<div class="col-lg-5 col-md-12 col-sm-12 col-12 parent-about-col">
<div class="parent-about">
<h5 class="titr-top">آژانس مسافرتی موسسه نهضت تبلیغ</h5>
<div>
<h2>چرا موسسه نهضت تبلیغ ؟</h2>
<h3>مجری کاروان های گروهی و سفرهای انفرادی عتبات</h3>
</div>
<p class="__aboutUs_class__">{$htmlContent = $about['body']|strip_tags}{$htmlContent|truncate:300}</p>
<ul class="ul-about">
<li>
<i class="fa-solid fa-check"></i>
                                تجربه و سابقه کاری بالا
                            </li>
<li>
<i class="fa-solid fa-check"></i>
                                سریع‌تر و مطمئن‌تر به سفر بروید
                            </li>
<li>
<i class="fa-solid fa-check"></i>
                                پشتیبانی ۲۴ ساعته در تمامی مراحل سفر
                            </li>
</ul>
<div class="bg-btn-karvan">
<a class="__aboutUs_class_href__ btn-karvan" href="{$smarty.const.ROOT_ADDRESS}/aboutUs">
                            بیشتر بخوانید
                            <i class="fa-solid fa-arrow-left mr-3"></i>
</a>
</div>
</div>
</div>
<div class="col-lg-7 col-md-6 col-sm-12 col-12 parent-karevan-about-img">
<div class="about-img position-relative">
<div class="parent-img">
<img alt="about" src="project_files/images/5497750661271-6.jpg"/>
</div>
</div>
</div>
</div>
</div>
</section>
{/if}