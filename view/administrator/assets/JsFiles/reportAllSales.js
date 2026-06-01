//this must be a global plugin for datatable api
jQuery.fn.dataTable.Api.register('sum()', function() {
  return this.flatten().reduce(function(a, b) {
    if (typeof a === 'string') {
      a = a.replace(/[^\d.-]/g, '') * 1
    }
    if (typeof b === 'string') {
      b = b.replace(/[^\d.-]/g, '') * 1
    }

    return a + b
  }, 0)
})
//end plugin code



// function reportContent()
// {
//     var $url  = amadeusPath + 'ajax';
//     var $data = JSON.stringify({
//         className: 'reportContentClient',
//         method: 'index',
//         start_date:$('#date_of').val(),
//         end_date:$('#to_date').val()
//     });
//
//     var $table =  $('#list-content-table')
//     var $thead = $table.find('thead')
//     var $tbody = $table.find('tbody')
//     var $tfoot = $table.find('tfoot')
//
//     var $temp = '';
//     $('body').append('<div class="mask"><span class="loader"></span></div>')
//
//     $tbody.empty()
//
//     $.post($url,$data,function(response)
//     {
//         console.log(response)
//
//         const dataArray = Object.values(response);
//         dataArray.sort((a, b) => b.CountSuccess - a.CountSuccess);
//         console.log(dataArray)
//
//         var counter = 1;
//         // متغیرهای جمع کل
//         var totalNews = 0;
//         var totalMag = 0;
//         var totalSpecialPages = 0;
//         var totalTourInternal = 0;
//         var totalTourForeigner = 0;
//         var totalSuccess = 0;
//
//         $.each(dataArray,function(index,value)
//         {
//             // جمع زدن مقادیر
//             totalNews += parseInt(value['CountNews']['count']) || 0;
//             totalMag += parseInt(value['CountMag']['count']) || 0;
//             totalSpecialPages += parseInt(value['CountSpecialPages']['count']) || 0;
//             totalTourInternal += parseInt(value['CountTourInternal']['count']) || 0;
//             totalTourForeigner += parseInt(value['CountTourForeigner']['count']) || 0;
//             totalSuccess += parseInt(value['CountSuccess']) || 0;
//
//             $temp += '<tr>' +
//                 '<td>'+counter+'</td>' +
//                 '<td>'+value['ClinetName']+'</td>' +
//                 '<td>'+value['CountNews']['count']+'</td>' +
//                 '<td>'+value['CountMag']['count']+'</td>' +
//                 '<td>'+value['CountSpecialPages']['count']+'</td>' +
//                 '<td>-</td>' +
//                 '<td>-</td>' +
//                 '<td>'+value['CountTourInternal']['count']+'</td>' +
//                 '<td>'+value['CountTourForeigner']['count']+'</td>' +
//                 '<td>'+ value['CountSuccess'] +'</td>' +
//                 '</tr>'
//
//             counter++;
//         })
//
//         // ساخت tfoot با جمع کل
//         var $tfootHtml = '<tfoot style="background-color: #f2f2f2; font-weight: bold;">' +
//             '<tr>' +
//             '<td colspan="2">جمع کل</td>' +
//             '<td>'+ totalNews +'</td>' +
//             '<td>'+ totalMag +'</td>' +
//             '<td>'+ totalSpecialPages +'</td>' +
//             '<td>-</td>' +
//             '<td>-</td>' +
//             '<td>'+ totalTourInternal +'</td>' +
//             '<td>'+ totalTourForeigner +'</td>' +
//             '<td>'+ totalSuccess +'</td>' +
//             '</tr>' +
//             '</tfoot>';
//
//         $('body').find('.mask').remove()
//         $tbody.append($temp);
//
//         // حذف tfoot قبلی و اضافه کردن tfoot جدید
//         $table.find('tfoot').remove();
//         $table.append($tfootHtml);
//     })
// }




function reportContent()
{
    var $url  = amadeusPath + 'ajax';
    var $data = JSON.stringify({
        className: 'reportContentClient',
        method: 'index',
        start_date:$('#date_of').val(),
        end_date:$('#to_date').val()
    });

    var $table = $('#list-content-table');
    var $thead = $table.find('thead');
    var $tbody = $table.find('tbody');
    var $tfoot = $table.find('tfoot');

    var $temp = '';
    $('body').append('<div class="mask"><span class="loader"></span></div>');

    $tbody.empty();
    $tfoot.remove();

    $.post($url, $data, function(response)
    {
        console.log(response);

        const dataArray = Object.values(response);

        // ذخیره داده‌ها در متغیر گلوبال برای استفاده در sort
        window.reportData = dataArray;
        window.currentSort = { column: 'CountSuccess', direction: 'desc' };

        // مرتب‌سازی اولیه بر اساس CountSuccess
        sortAndRenderTable();

        $('body').find('.mask').remove();

        // اضافه کردن event listener برای کلیک روی هدرها
        setupSortableHeaders();
    });
}

// تابع مرتب‌سازی و نمایش جدول
function sortAndRenderTable()
{
    var $tbody = $('#list-content-table tbody');
    var $tfoot = $('#list-content-table tfoot');

    $tbody.empty();
    $tfoot.remove();

    // کپی آرایه برای مرتب‌سازی
    var sortedData = [...window.reportData];

    // مرتب‌سازی بر اساس currentSort
    var sortCol = window.currentSort.column;
    var sortDir = window.currentSort.direction;

    sortedData.sort(function(a, b) {
        var valA, valB;

        // تعیین مقادیر بر اساس ستون
        switch(sortCol) {
            case 'ClinetName':
                valA = a['ClinetName'] || '';
                valB = b['ClinetName'] || '';
                return sortDir === 'asc' ?
                    valA.localeCompare(valB, 'fa') :
                    valB.localeCompare(valA, 'fa');

            case 'CountNews':
                valA = parseInt(a['CountNews']?.['count']) || 0;
                valB = parseInt(b['CountNews']?.['count']) || 0;
                break;

            case 'CountMag':
                valA = parseInt(a['CountMag']?.['count']) || 0;
                valB = parseInt(b['CountMag']?.['count']) || 0;
                break;

            case 'CountSpecialPages':
                valA = parseInt(a['CountSpecialPages']?.['count']) || 0;
                valB = parseInt(b['CountSpecialPages']?.['count']) || 0;
                break;

            case 'CountTourInternal':
                valA = parseInt(a['CountTourInternal']?.['count']) || 0;
                valB = parseInt(b['CountTourInternal']?.['count']) || 0;
                break;

            case 'CountTourForeigner':
                valA = parseInt(a['CountTourForeigner']?.['count']) || 0;
                valB = parseInt(b['CountTourForeigner']?.['count']) || 0;
                break;

            case 'CountSuccess':
            default:
                valA = parseInt(a['CountSuccess']) || 0;
                valB = parseInt(b['CountSuccess']) || 0;
                break;
        }

        return sortDir === 'asc' ? valA - valB : valB - valA;
    });

    // محاسبه جمع‌ها
    var totalNews = 0;
    var totalMag = 0;
    var totalSpecialPages = 0;
    var totalTourInternal = 0;
    var totalTourForeigner = 0;
    var totalSuccess = 0;

    var counter = 1;
    var $temp = '';

    $.each(sortedData, function(index, value)
    {
        totalNews += parseInt(value['CountNews']?.['count']) || 0;
        totalMag += parseInt(value['CountMag']?.['count']) || 0;
        totalSpecialPages += parseInt(value['CountSpecialPages']?.['count']) || 0;
        totalTourInternal += parseInt(value['CountTourInternal']?.['count']) || 0;
        totalTourForeigner += parseInt(value['CountTourForeigner']?.['count']) || 0;
        totalSuccess += parseInt(value['CountSuccess']) || 0;

        $temp += '<tr>' +
            '<td>'+ counter +'</td>' +
            '<td>'+ value['ClinetName'] +'</td>' +
            '<td>'+ (value['CountNews']?.['count'] || 0) +'</td>' +
            '<td>'+ (value['CountMag']?.['count'] || 0) +'</td>' +
            '<td>'+ (value['CountSpecialPages']?.['count'] || 0) +'</td>' +
            '<td>-</td>' +
            '<td>-</td>' +
            '<td>'+ (value['CountTourInternal']?.['count'] || 0) +'</td>' +
            '<td>'+ (value['CountTourForeigner']?.['count'] || 0) +'</td>' +
            '<td>'+ (value['CountSuccess'] || 0) +'</td>' +
            '</tr>';

        counter++;
    });

    $tbody.append($temp);

    // ساخت و اضافه کردن tfoot
    var $tfootHtml = '<tfoot style="background-color: #f2f2f2; font-weight: bold;">' +
        '<tr>' +
        '<td colspan="2">جمع کل</td>' +
        '<td>'+ totalNews +'</td>' +
        '<td>'+ totalMag +'</td>' +
        '<td>'+ totalSpecialPages +'</td>' +
        '<td>-</td>' +
        '<td>-</td>' +
        '<td>'+ totalTourInternal +'</td>' +
        '<td>'+ totalTourForeigner +'</td>' +
        '<td>'+ totalSuccess +'</td>' +
        '</tr>' +
        '</tfoot>';

    $('#list-content-table').append($tfootHtml);
}

// تنظیم هدرهای قابل کلیک
function setupSortableHeaders()
{
    // اضافه کردن کلاس و آیکون به هدرها
    var sortableColumns = [
        { index: 2, name: 'CountNews' },
        { index: 3, name: 'CountMag' },
        { index: 4, name: 'CountSpecialPages' },
        { index: 7, name: 'CountTourInternal' },
        { index: 8, name: 'CountTourForeigner' },
        { index: 9, name: 'CountSuccess' },
        { index: 1, name: 'ClinetName' }
    ];

    var $headers = $('#list-content-table thead th');

    $headers.css('cursor', 'default');

    sortableColumns.forEach(function(col) {
        $headers.eq(col.index).css('cursor', 'pointer')
            .addClass('sortable-header')
            .attr('data-sort', col.name)
            .off('click')
            .on('click', function() {
                var sortColumn = $(this).attr('data-sort');

                // تغییر جهت مرتب‌سازی
                if (window.currentSort.column === sortColumn) {
                    window.currentSort.direction =
                        window.currentSort.direction === 'asc' ? 'desc' : 'asc';
                } else {
                    window.currentSort.column = sortColumn;
                    window.currentSort.direction = 'desc'; // پیش‌فرض نزولی
                }

                // بروزرسانی آیکون‌ها
                updateSortIcons();

                // مرتب‌سازی و نمایش
                sortAndRenderTable();
            });
    });

    updateSortIcons();
}

// بروزرسانی آیکون‌های sort
function updateSortIcons()
{
    $('#list-content-table thead th.sortable-header').each(function() {
        var $th = $(this);
        var sortCol = $th.attr('data-sort');

        // حذف آیکون قبلی
        $th.find('.sort-icon').remove();

        if (sortCol === window.currentSort.column) {
            var icon = window.currentSort.direction === 'asc' ? ' ▲' : ' ▼';
            $th.append('<span class="sort-icon">' + icon + '</span>');
        } else {
            $th.append('<span class="sort-icon" style="color: #ccc;"> ⇅</span>');
        }
    });
}
$('body').on('click','#clinet_content',function(e)
{
  reportContent()
});

$('body').on('click','#transactions',function(e){

  $('body').append('<div class="mask"><span class="loader"></span></div>')

  var $url  = amadeusPath + 'ajax';
  var $data = JSON.stringify({
    className: 'transactions',
    method: 'index'
  });

  $.post($url,$data,function(response){

    console.log(response)
    $('body').find('.mask').remove()
  })

});







function reportSales(response)
{
    console.log('12. reportSales شروع شد');
    console.log('13. ورودی reportSales:', typeof response, response);
    if ($('#list-sales-table').length === 0) {
        console.error('14. جدول list-sales-table پیدا نشد!');
        return;
    }
    console.log('15. جدول پیدا شد');
  $("#list-sales-table").find('thead').empty()

  var $temp = '';
  var $temp1 = "<tr><th>ردیف</th><th>نام آژانس</th><th>بلیط د</th><th>بلیط خ</th><th>تور د</th><th>تور خ</th><th>هتل د</th><th>هتل خ</th><th>قطار</th><th>اتوبوس</th><th>ویزا</th><th>بیمه</th><th>خرید - موفق</th></tr>";
  let $response = JSON.parse(response);
  let $SumOfColumn = $response[0];
  $.each($SumOfColumn,function(index,value)
    {
      $temp1 += '<tr class="all-reports">' +
        '<th colspan="1">جمع کل قراردادها نه افراد</th>' +
        '<th>' + value['FlightInternalGBF'] + '</th>' +
        '<th>' + value['FlightForeignerGBF'] + '</th>' +
        '<th>' + value['TourInternalGBF'] + '</th>' +
        '<th>' + value['TourForeignerGBF'] + '</th>' +
        '<th>' + value['HotelInternalGBF'] + '</th>' +
        '<th>' + value['HotelForeignerGBF'] + '</th>' +
        '<th>' + value['TrainGBF'] + '</th>' +
        '<th>' + value['Bus'] + '</th>' +
        '<th>' + value['VisaGBF']+'</th>' +
        '<th>' + value['InsuranceGBF'] + '</th>' +
        '<th>' + value['successPayment'] + '</th>'
      '</tr>';
    }
  );

  $response.shift();

  let mergedResponse = $response.map(item => ({
    ...item.Information,
    ...item.Count
  }));

  mergedResponse.sort((a, b) => b.TotalSuccess - a.TotalSuccess);




  $.each(mergedResponse,function(index,value)
    {


      let $Text1= value['FlightInternal'] +" / "+value['FlightInternalGBF'];
      let $Text2= value['FlightForeigner']+" / "+value['FlightForeignerGBF'];
      let $Text3= value['TourInternal']+" / "+value['TourInternalGBF'];
      let $Text4= value['TourForeigner']+" / "+value['TourForeignerGBF'];
      let $Text5= value['HotelInternal']+" / "+value['HotelInternalGBF'];
      let $Text6= value['HotelForeigner']+" / "+value['HotelForeignerGBF'];
      let $Text7= value['Train']+" / "+value['TrainGBF'];
      let $Text8 = value['Bus'];
      let $Text9= value['Visa']+" / "+value['VisaGBF'];
      let $Text10 = value['Insurance']+" / "+value['InsuranceGBF'];
      let $Text11 = value['TotalSuccess'];

      if ( (value['FlightInternalGBF'] === null) || (value['FlightInternal'] === null)) $Text1 = "0 / 0"
      if ( (value['FlightForeigner'] === null) || (value['FlightForeigner'] === null)) $Text2 = "0 / 0"
      if ( (value['TourInternal'] === null) || (value['TourInternalGBF'] === null)) $Text3 = "0 / 0"
      if ( (value['TourForeigner'] === null) || (value['TourForeignerGBF'] === null)) $Text4 = "0 / 0"
      if ( (value['HotelInternal'] === null) || (value['HotelInternalGBF'] === null)) $Text5 = "0 / 0"
      if ( (value['HotelForeigner'] === null) || (value['HotelForeignerGBF'] === null)) $Text6 = "0 / 0"
      if ( (value['Train'] === null) || (value['TrainGBF'] === null)) $Text7 = "0 / 0"
      if ( (value['Bus'] === null) ) $Text8 = "0"
      if ( (value['Visa'] === null) || (value['VisaGBF'] === null)) $Text9 = "0 / 0"
      if ( (value['Insurance'] === null) || (value['InsuranceGBF'] === null)) $Text10 = "0 / 0"
      if ( (value['TotalSuccess'] === null) ) $Text11 = "0"



      $temp += '<tr>' +
        '<td>'+ index +'</td>' +
        '<td>'+value['NameAgency'] + ' ' + value['Manager'] +'</td>' +
        '<td>'+ $Text1 +'</td>' +
        '<td>'+ $Text2 +'</td>' +
        '<td>'+ $Text3 +'</td>' +
        '<td>'+ $Text4 +'</td>' +
        '<td>'+ $Text5 +'</td>' +
        '<td>'+ $Text6 +'</td>' +
        '<td>'+ $Text7 +'</td>' +
        '<td>'+ $Text8 +'</td>' +
        '<td>'+ $Text9 +'</td>' +
        '<td>'+ $Text10 +'</td>' +
        '<td>'+ $Text11 +'</td>' +
        '</tr>';
    }


  )

  $('#list-sales-table thead').append($temp1)
  $('#list-sales-table tbody').html($temp)

  $('#loading-indicator').hide()
}



$(document).ready(function() {
    var OutAjax = '';

    function CallAjax() {
        // نمایش لودینگ
        // showLoading();
        // $('body').append('<div class="mask"><span class="loader"></span></div>')
        $('#list-sales-table thead').empty();
        $('#list-sales-table tbody').empty();

        let ajax_request = {
            url: amadeusPath + 'ajax',
            type: 'POST',
            dataType: 'text',
            data: JSON.stringify({
                className: 'reportAllSales',
                method: 'retrieveInformation',
                start_date: $('#date_of').val(),
                end_date: $('#to_date').val()
            }),
            success: function(response) {

                reportSales(response);
                // مخفی کردن لودینگ بعد از موفقیت
                reportContent()
                // hideLoading();
                // location.reload();
                // $('body').find('.mask').remove()
            },
            error: function(xhr, status, error) {
                console.log('Error: ' + error);
                console.log('Response: ' + xhr.responseText);
                // مخفی کردن لودینگ در صورت خطا
                hideLoading();
                // $('body').find('.mask').remove()
            }
        };
        $.ajax(ajax_request);
    }

    function showLoading() {
        if ($('#loading-overlay').length === 0) {
            $('body').append(`
            <div id="loading-overlay" style="
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
                z-index: 9999;
                display: flex;
                align-items: center;
                justify-content: center;
            ">
                <div style="
                    background: white;
                    padding: 20px;
                    border-radius: 10px;
                    text-align: center;
                ">
                    <div class="spinner"></div>
                    <p style="margin-top: 10px;">در حال بارگذاری...</p>
                </div>
            </div>
        `);

            $('<style>')
                .prop('type', 'text/css')
                .html(`
                .spinner {
                    width: 50px;
                    height: 50px;
                    border: 4px solid #f3f3f3;
                    border-top: 4px solid #3498db;
                    border-radius: 50%;
                    animation: spin 1s linear infinite;
                    margin: 0 auto;
                }
                
                @keyframes spin {
                    0% { transform: rotate(0deg); }
                    100% { transform: rotate(360deg); }
                }
            `)
                .appendTo('head');
        } else {
            $('#loading-overlay').show();
        }
    }
    function hideLoading() {
        $('#loading-overlay').hide();
    }
	CallAjax()
	/*
  var sales_table = $('#list-sales-table');
  var sales_form = $('#form-sales');


  sales_table.DataTable({
    processing: true,
    serverSide: true,
    searchDelay: 250,
    ajax: ajax_request,
    columnDefs: [
        {
          render: function(data, type, row, meta) {
            return meta.row + 1
          },
          targets: 0,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">نام آژانس</span>'
          },
          targets: 1,
        },
        {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">شماره تماس</span>'
          },
          targets: 2,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">بلیط</span>'
          },
          targets: 3,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">بلیط</span>'
          },
          targets: 4,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">تور</span>'
          },
          targets: 5,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">تور</span>'
          },
          targets: 6,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">هتل</span>'
          },
          targets: 7,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">هتل</span>'
          },
          targets: 8,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">قطار</span>'
          },
          targets: 9,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">اتوبوس</span>'
          },
          targets: 10,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">ویزا</span>'
          },
          targets: 11,
        },
    {
          render: function(data, type, row) {
            //let total = row['total_count']
            return '<span class="column-value">بیمه</span>'
          },
          targets: 12,
        },
      ],
      columns: [
        {data: 'id', title: 'ردیف', sortable: false, searchable: false, visible: true},
    {data: 'NameAgency', title: 'نام آژانس', sortable: true, searchable: true, visible: true},
    {data: 'Mobile', title: 'شماره تماس', sortable: true, searchable: true, visible: true},
        {data: 'FlightInternal', title: 'بلیط داخلی', sortable: true, searchable: true, visible: true},
    {data: 'FlightForeigner', title: 'بلیط خارجی', sortable: true, searchable: true, visible: true},
    {data: 'TourInternal', title: 'تور داخلی', sortable: true, searchable: true, visible: true},
    {data: 'TourForeigner', title: 'تور خارجی', sortable: true, searchable: true, visible: true},
        {data: 'HotelInternal', title: 'هتل داخلی', sortable: true, searchable: true, visible: true},
        {data: 'HotelForeigner', title: 'هتل خارجی', sortable: true, searchable: true, visible: true},
        {data: 'Train', title: 'قطار', sortable: true, searchable: true, visible: true},
        {data: 'Bus', title: 'اتوبوس', sortable: true, searchable: true, visible: true},
        {data: 'Visa', title: 'ویزا', sortable: true, searchable: true, visible: true},
        {data: 'Insurance', title: 'بیمه', sortable: true, searchable: true, visible: true},
      ],
      drawCallback: function() {
        let api = this.api(),
          sum_3 = api.column(2, {page: 'current'}).data().sum(),
          sum_4 = api.column(3, {page: 'current'}).data().sum(),
          sum_5 = api.column(4, {page: 'current'}).data().sum(),
          sum_6 = api.column(5, {page: 'current'}).data().sum(),
          sum_7 = api.column(6, {page: 'current'}).data().sum(),
          sum_8 = api.column(7, {page: 'current'}).data().sum(),
      sum_9 = api.column(8, {page: 'current'}).data().sum()
      sum_10 = api.column(9, {page: 'current'}).data().sum()
      sum_11 = api.column(10, {page: 'current'}).data().sum()
      sum_12 = api.column(11, {page: 'current'}).data().sum()
      sum_13 = api.column(12, {page: 'current'}).data().sum()
        let t_footer = $(api.table().footer())
        t_footer.find('th:nth-child(2)').html('جمع کل')
        t_footer.find('th:nth-child(3)').html(nFormatter(sum_3))
        t_footer.find('th:nth-child(4)').html(nFormatter(sum_4))
        t_footer.find('th:nth-child(5)').html(nFormatter(sum_5))
        t_footer.find('th:nth-child(6)').html(nFormatter(sum_6))
        t_footer.find('th:nth-child(7)').html(nFormatter(sum_7))
        t_footer.find('th:nth-child(8)').html(nFormatter(sum_8))
    t_footer.find('th:nth-child(9)').html(nFormatter(sum_9))
    t_footer.find('th:nth-child(10)').html(nFormatter(sum_10))
    t_footer.find('th:nth-child(11)').html(nFormatter(sum_11))
    t_footer.find('th:nth-child(12)').html(nFormatter(sum_12))
    t_footer.find('th:nth-child(13)').html(nFormatter(sum_13))
      },
    })
  })
*/

	$('#button-sales').click(function(e) {
		e.preventDefault(); // جلوگیری از ارسال فرم یا رفتار پیش‌فرض دیگر
		// نمایش علامت لودینگ
		$('#loading-indicator').show();
		// خالی کردن محتوای جدول
		$('#sales_table tbody').empty();
		//$.ajax(ajax_request);
		CallAjax();
	});


})//end document