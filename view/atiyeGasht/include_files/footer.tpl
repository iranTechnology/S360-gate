{load_presentation_object filename="aboutUs" assign="objAbout"}
{assign var="about"  value=$objAbout->getData()}
{if $smarty.session.layout neq 'pwa'}
{if $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotel && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintTicket && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservation && $smarty.const.GDS_SWITCH neq $smarty.const.ConstPrintHotelReservationAhuan}

<footer class="footer">
 <div class="but-top" id="scroll-top">
  <a href="javascript:" class="fa fa-angle-up"></a>
 </div>
 <div class="footer_main container">
  <ul class="m-0 p-0 d-flex">
   <li class="col-12 col-md-12 my-2 col-lg-4 d-flex flex-column justify-content-around call">
    <div class="nav-header">
     <a class="nav-brand" href="https://{$smarty.const.CLIENT_DOMAIN}">
      <img src="project_files/images/logo.png" alt="{$obj->Title_head()}">
      <div>
       <h2>آتیه گشت سبز</h2>
      </div>
     </a>
    </div>

    <span> <i class="far fa-map-marker"></i>
     آدرس : {$smarty.const.CLIENT_ADDRESS}
    </span>

    {assign var='additional_data' value=$smarty.const.ADDITIONAL_DATA|json_decode:true}
    {foreach $additional_data as $item}
       {if $item['type']=='tel'}
         <span> <i class="far fa-phone-alt"></i>
            {$item['title']} :
             <a href="tel:{$item['body']} ">{$item['body']}</a>
         </span>

      {/if}
    {/foreach}
    <span>
                     <i class="far fa-envelope"></i>
                    ایمیل :
                    <a href="mailto:{$smarty.const.CLIENT_EMAIL}">{$smarty.const.CLIENT_EMAIL}</a>
                </span>

   </li>
   <li class="col-12 col-md-6 my-2 col-lg-4 d-flex flex-column">
    <h6>دسترسی آسان</h6>
    <div class="asan">
     <a href="{$smarty.const.ROOT_ADDRESS}/resultTourLocal/all-all/all-all/all/all/0" class="asan_link">تور داخلی</a>
     <a href="javascript:;" class="asan_link">تور خارجی</a>
     <a href="{$smarty.const.ROOT_ADDRESS}/UserTracking" class="asan_link">پیگیری خرید</a>
     <a href="{$smarty.const.ROOT_ADDRESS}/rules" class="asan_link">قوانین و مقررات</a>
     <a href="{$smarty.const.ROOT_ADDRESS}/aboutUs" class="asan_link">درباره ما</a>
     <a href="{$smarty.const.ROOT_ADDRESS}/contactUs" class="asan_link">تماس با ما</a>
    </div>
   </li>
   <li class="col-9 col-sm-9 mx-auto col-md-6 my-2 col-lg-4 d-flex flex-column">
    <h6>مجوزها</h6>
 {*<form class="TrcBox w-100" action="/refrense/پیگیری-کد-رهگیری" method="get" name="FormCodeRahgiriPrj" id="FormCodeRahgiriPrj" style="width: 100%;">
     <div class="code" style="margin-top: 1rem;">
      <input id="txtsearch" aria-describedby="basic-addon1" type="text" name="CodeRahgiriTemp"
             onfocus=""
             onblur=""
             value="کد رهگیری خود را وارد کنید..." autocomplete="off">
      <button class="btn button-winona" type="submit">
       <i class="fas fa-check"></i>
      </button>
     </div>
    </form>
 *}
    <div class="namads">
     <a href="https://farasa.cao.ir/sysworkflow/fa/modern/3810212626028ab03488017019616799/6464336316028ab04e3c618028352200.php">
      <img src="project_files/images/certificate1.png" alt="Enamad1"></a>
     <a href="https://logo.samandehi.ir/Verify.aspx?id=33643&p=xlaoxlaogvkaaodsxlao">
      <img src="project_files/images/certificate2.png" alt="namad-1"></a>
     <a href="javascript:">
      <img src="project_files/images/certificate3.png" alt="namad-2"></a>
     <a href="http://www.aira.ir/">
      <img src="project_files/images/certificate4.png" alt="namad-3"></a>
     <a href="https://www.raja.ir/">
      <img src="project_files/images/raja.png" alt="namad-2"></a>
    </div>
   </li>
  </ul>
 </div>
 <div class="last_text col-12">
  <a class="last_a" href="https://www.iran-tech.com/" target="_blank">طراحی سایت گردشگری</a>
  <p class="last_p_text">: ایران تکنولوژی</p>
 </div>
</footer>

{/if}
{else}
 {include file="`$smarty.const.FRONT_CURRENT_CLIENT`pwaFooter.tpl"}
{/if}


