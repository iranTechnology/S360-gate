<div class="i_modular_searchBox searchBoxContent" id="Bus-parent">
 <div class="__box__ position-relative" id="Bus">
  <div class="col-md-12 col-12">
   <div class="row">
    <form class="d_contents" data-action="://s360online.iran-tech.com/" id="gds_local_bus" method="post" name="gds_local_bus" target="_blank">
     {include file="./sections/Bus/origin_selection.tpl"}
     {include file="./sections/Bus/destination_selection.tpl"}
     {include file="./sections/Bus/date_bus.tpl"}

     <div class="col-lg-6 col-md-6 col-sm-6 col-12 btn_s col_search p-sm-3 p-1 d-flex align-items-center">
      <button
              type="button"
              class="btn theme-btn seub-btn b-0"
              onclick="searchBus()" >
       <span>جستجو</span>
      </button>
     </div>
    </form>
   </div>
  </div>
 </div>
</div>
<style>
 /* اصلاح z-index برای نمایش dropdown */
 .select2-container--open {
  z-index: 9999 !important;
 }
 .select2-container--default .select2-selection--single .select2-selection__rendered {
  color: #fff !important;

 }
</style>