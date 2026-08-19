{load_presentation_object filename="specialPages" assign="objSpecialPages"}

{assign var="searchServices" value=['flight'=>'specialFlightPic','InternalFlight'=>'specialInternalFlightPic','ExternalFlight'=>'specialExternalFlightPic','hotel'=> 'specialHotelPic','train' => 'specialTrainPic',
'bus' =>'specialBusPic', 'tour' =>'specialTourPic', 'Insurance' =>'specialInsurancePic', 'visa' =>'specialVisaPic', 'gasht' =>'specialGashtPic',
'entertainment' =>'specialEntertainmentPic', 'Europcar' =>'specialEuropcarPic',
'mainPage' =>'MainPagePic']}



{assign var="searchServicesText" value=[
'internalFlight'=> [
'title'=>'رزرو بلیط پرواز داخلی',
'caption'=>'برای خرید آنلاین بلیط پروازهای داخلی، فقط کافیست مبدا، مقصد و تاریخ سفرت را انتخاب کنی.'
],
'externalFlight'=> [
'title'=>'رزرو بلیط پرواز خارجی',
'caption'=>'به‌راحتی بلیط پروازهای خارجی خود را آنلاین رزرو کن و تجربه‌ای متفاوت از سفر داشته باش.'
],
'hotel'=> [
'title'=>'رزرو هتل',
'caption'=>'بهترین هتل‌ها را با قیمت مناسب و تخفیف‌های ویژه رزرو کن و از اقامتی راحت و لذت‌بخش بهره‌مند شو.'
],
'insurance'=> [
'title'=>'بیمه مسافرتی',
'caption'=>'با خرید بیمه مسافرتی، با خیال آسوده به هر نقطه از دنیا سفر کن.'
],
'tour' => [
'title'=>'تورهای داخلی و خارجی',
'caption'=>'تورهای متنوع با خدمات عالی و قیمت مناسب، برای سفری به‌یادماندنی و پر از تجربه‌های تازه.'
],
'gashtTransfer' => [
'title'=>'گشت و ترانسفر',
'caption'=>'با گشت‌ها و ترانسفرهای ویژه، سفرت را آسان‌تر و لذت‌بخش‌تر کن.'
],
'entertainment' => [
'title'=>'تفریحات و سرگرمی‌ها',
'caption'=>'لحظاتی شاد و به‌یادماندنی را با مجموعه‌ای از بهترین تفریحات تجربه کن.'
],
'europcar' => [
'title'=>'اجاره خودرو',
'caption'=>'خودرو دلخواهت را با شرایط آسان و قیمت مناسب اجاره کن و آزادانه سفر کن.'
],
'train' => [
'title'=>'رزرو بلیط قطار',
'caption'=>'بلیط قطار را سریع و آسان تهیه کن و از سفری راحت، ایمن و اقتصادی لذت ببر.'
],
'visa' => [
'title'=>'خدمات ویزا',
'caption'=>'برای دریافت ویزا در سریع‌ترین زمان و با راهنمایی کامل اقدام کن.'
]
]}


{foreach $searchServices as $key => $val}
    {assign var="homePage" value=$objSpecialPages->unSlugPage($key)}
    {if $homePage}
        {assign var=$val value=$homePage.files.main_file.src}
    {/if}
    {assign var="homePage" value=""}
{/foreach}

<style>
    .banner-safiran {
    {if $page.files.main_file.src && $smarty.const.GDS_SWITCH eq 'page'}
        background-image: url("{$page.files.main_file.src}");
    {else}
        background-image: url("{$specialInternalFlightPic}");
    {/if}
    }
</style>

<script>
    {literal}
    $(document).ready(function() {
       // تنظیم متن و عنوان پیش‌فرض برای بنر
        {/literal}
        {if $page.files.main_file.src && $smarty.const.GDS_SWITCH eq 'page'}
        {else}
       $('#title-banner').text('{$searchServicesText.internalFlight.title}');
       $('#caption-banner').text('{$searchServicesText.internalFlight.caption}');
        {/if}
        {literal}
    });
    {/literal}
</script>

{*{$specialHotelPic|var_dump}*}
{*{$specialEuropcarPic|var_dump}*}
<script>
    {literal}
    if($(window).width() > 576){
        {/literal}

        {if $specialInternalFlightPic}
        {literal}
       $('.Flight_internal-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialInternalFlightPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.internalFlight.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.internalFlight.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialExternalFlightPic}
        {literal}
       $('.Flight_external-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialExternalFlightPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.externalFlight.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.externalFlight.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialHotelPic}
        {literal}
       $('.Hotel-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialHotelPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.hotel.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.hotel.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialTrainPic}
        {literal}
       $('.Train-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialTrainPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.train.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.train.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialBusPic}
        {literal}
       $('.Bus-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialBusPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.bus.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.bus.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialTourPic}
        {literal}
       $('.Tour-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialTourPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.tour.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.tour.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialInsurancePic}
        {literal}
       $('.Insurance-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialInsurancePic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.insurance.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.insurance.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialVisaPic}
        {literal}
       $('.Visa-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialVisaPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.visa.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.visa.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialGashtPic}
        {literal}
       $('.GashtTransfer-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialGashtPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.gashtTransfer.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.gashtTransfer.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialEntertainmentPic}
        {literal}
       $('.Entertainment-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialEntertainmentPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.entertainment.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.entertainment.caption}{literal}');
       });
        {/literal}
        {/if}
        {if $specialEuropcarPic}
        {literal}
       $('.Europcar-tab-pic').click(function () {
          // تغییر عکس
          $('.banner-safiran').css('background-image' , 'url("{/literal}{$specialEuropcarPic}{literal}")');
          // تغییر عنوان
          $('#title-banner').text('{/literal}{$searchServicesText.europcar.title}{literal}');
          // تغییر متن
          $('#caption-banner').text('{/literal}{$searchServicesText.europcar.caption}{literal}');
       });
        {/literal}
        {/if}
        {literal}

    }
</script>
{/literal}