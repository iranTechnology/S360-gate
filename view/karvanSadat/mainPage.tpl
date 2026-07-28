<!DOCTYPE html>

<html dir="rtl" lang="fa">
{include file="include_files/header.tpl"}
<body>
{literal}
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P6HK85KJ"
                      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
{/literal}
{if $smarty.session.layout neq 'pwa' }{include file="include_files/menu.tpl"}{/if}
<main>
    {include file="include_files/search-box.tpl"}
    {include file="include_files/hotels-webservice.tpl"}
    {include file="include_files/tours.tpl"}
    {include file="include_files/box-first.tpl"}
    {include file="include_files/news.tpl"}
    {include file="include_files/video.tpl"}
    {include file="include_files/box-two.tpl"}
    {include file="include_files/faq.tpl"}
    {include file="include_files/about-us.tpl"}
    {include file="include_files/comment.tpl"}
    {include file="include_files/blog.tpl"}
</main>
{include file="include_files/footer.tpl"}
{literal}

<script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Hotel",
      "name": "هتل رویال کربلا",
      "description": "رزرو هتل رویال کربلا با قیمت مناسب، نزدیک حرم. مشاهده امکانات، تصاویر اتاق‌ها و فاصله تا حرم در سایت {$smarty.const.CLIENT_NAME}.",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "خیابان قزوینی",
    "addressLocality": "کربلا",
    "addressCountry": "IQ",
    "postalCode": "56001"
  },
  "url": "https://karevansadat.com/hotel/royal-karbala",
  "image": [
    "https://karevansadat.com/hotel/royal-karbala/gallery-36.jpg",
    "https://karevansadat.com/hotel/royal-karbala/gallery-56.jpg",
    "https://karevansadat.com/hotel/royal-karbala/gallery-57.jpg"
  ],
  "starRating": {
    "@type": "Rating",
    "ratingValue": "5",
    "bestRating": "5"
  },
  "amenityFeature": [
    {"@type": "LocationFeatureSpecification","name": "لابی بزرگ و مجلل","value": true},
    {"@type": "LocationFeatureSpecification","name": "رستوران بزرگ","value": true},
    {"@type": "LocationFeatureSpecification","name": "کافی شاپ بام مشرف به بین الحرمین","value": true},
    {"@type": "LocationFeatureSpecification","name": "استخر","value": true},
    {"@type": "LocationFeatureSpecification","name": "گیم نت","value": true},
    {"@type": "LocationFeatureSpecification","name": "اتاق بازی کودکان","value": true}
    ],
    "checkinTime": "14:00:00",
    "checkoutTime": "11:00:00",
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": "32.61407763662781",
      "longitude": "44.02662288989773"
    },
    "provider": {
      "@id": "https://karevansadat.com/#organization"
  }
}
</script>
{/literal}

<script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "VideoObject",
      "name": "معرفی هتل رویال کربلا",
      "description": "رزرو هتل رویال کربلا با قیمت مناسب، نزدیک حرم. مشاهده امکانات، تصاویر اتاق‌ها و فاصله تا حرم در سایت {$smarty.const.CLIENT_NAME}.",
  "thumbnailUrl": "https://karevansadat.com/hotel/royal-karbala/thumb.jpg",
  "uploadDate": "2025-01-01T00:00:00+03:30",
  "duration": "PT1M28S",
  "embedUrl": "https://www.aparat.com/video/video/embed/videohash/ugxvn56/vt/frame",
  "publisher": {
    "@id": "https://karevansadat.com/#organization"
  }
}
</script>

</body>

{include file="include_files/footer_script.tpl"}
</html>