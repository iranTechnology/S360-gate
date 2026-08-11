{load_presentation_object filename="hotelList" assign="objHotel"}
{assign var="EghamatHotels" value=$objHotel->listHotelEghamat(100, 0)}

<div class="container-fluid">
    <div class="row bg-title">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <ol class="breadcrumb FloatRight">
                <li><a href="{$smarty.const.ROOT_ADDRESS_WITHOUT_LANG}/itadmin/admin">خانه</a></li>
                <li class="active">لیست هتل‌های اسنپ تریپ</li>
            </ol>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <!--<h4 class="page-title FloatLeft">Dashboard 3</h4>-->
        </div>
    </div>

    <!-- جدول هتل‌های اسنپ تریپ -->
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box">
                <h3 class="box-title m-b-0">
                    لیست هتل‌های اقامت 24
                    <span class="text-muted" id="hotelCount">({$EghamatHotels|count} هتل)</span>
                </h3>
                <p class="text-muted m-b-30">نمایش هتل‌های موجود در سرویس اقامت 24</p>

                <div class="table-responsive">
                    <table id="hotelTable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>ردیف</th>
                            <th>هتل آیدی</th>
                            <th>نام هتل</th>
                            <th>شهر</th>
                        </tr>
                        </thead>
                        <tbody>
                        {assign var="hotelNumber" value="0"}
                        {foreach key=key item=hotel from=$EghamatHotels}
                            {$hotelNumber=$hotelNumber+1}
                            <tr>
                                <td class="align-middle">{$hotelNumber}</td>
                                <td class="align-middle">{$hotel.hotel_id|default:'-'}</td>
                                <td class="align-middle">{$hotel.name|default:'-'}</td>
                                <td class="align-middle">
                                    {if $hotel.city_name_fa}
                                        {$hotel.city_name_fa}
                                    {elseif $hotel.city_name}
                                        {$hotel.city_name}
                                    {else}
                                        -
                                    {/if}
                                </td>

                            </tr>
                            {foreachelse}
                            <tr>
                                <td colspan="10" class="text-center text-muted">
                                    <i class="fa fa-hotel fa-2x"></i><br>
                                    هیچ هتلی یافت نشد
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .label {
        padding: 5px 10px;
        border-radius: 3px;
        font-size: 12px;
    }
    .label-success {
        background-color: #5cb85c;
        color: #fff;
    }
    .label-danger {
        background-color: #d9534f;
        color: #fff;
    }
    .table > tbody > tr > td {
        vertical-align: middle;
    }
    .fa-star {
        color: #f0ad4e;
    }
    .btn-sm {
        padding: 2px 8px;
        margin: 0 2px;
    }
</style>

