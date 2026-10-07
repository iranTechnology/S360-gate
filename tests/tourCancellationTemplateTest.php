<?php
if (PHP_SAPI !== 'cli') { http_response_code(403); exit; }
error_reporting(E_ERROR | E_PARSE);
require dirname(__DIR__) . '/library/smarty/Smarty.class.php';
$smarty=new Smarty();
$dir='/tmp/gds-cancel-smarty';if(!is_dir($dir))mkdir($dir);
$smarty->setCompileDir($dir);
function testLoadPresentation(){}
$smarty->registerPlugin('function','load_presentation_object', 'testLoadPresentation');
$template=$smarty->createTemplate(dirname(__DIR__) . '/view/administrator/ticket/userTicketCancellationHistory.tpl');
$template->compileTemplateSource();
echo "PASS: administrator cancellation history template compiles.\n";

class HistoryFixture {
 public $twoWeeksAgoJalali='1405-07-01';
 function listCancelLocal(){return [
 ['id'=>11,'TypeCancel'=>'tour','type_application'=>'reservation','RequestNumber'=>'999111','FactorNumber'=>'999111','Status'=>'RequestMember','MemberId'=>51,'tour_name'=>'TestTour','tour_cities'=>'Isfahan','DateRequestMemberInt'=>1],
 ['id'=>12,'TypeCancel'=>'tour','type_application'=>'reservation','RequestNumber'=>'999111','FactorNumber'=>'999111','Status'=>'ConfirmCancel','MemberId'=>51,'confirmTransferWallet'=>'none','backCredit'=>'','tour_name'=>'TestTour','tour_cities'=>'Isfahan','DateRequestMemberInt'=>1],
 ['id'=>13,'TypeCancel'=>'hotel','type_application'=>'reservation','RequestNumber'=>'999333','FactorNumber'=>'999333','Status'=>'RequestMember','MemberId'=>51,'DateRequestMemberInt'=>1]
 ];}
}
class FunctionsFixture {function TypeFlight(){return false;}function timeNow(){return '1405-07-13';}}
class DateFixture {function jdate(){return 'test';}}
foreach(['CLIENT_ID'=>1,'ROOT_ADDRESS_WITHOUT_LANG'=>'/gds','CLIENT_DOMAIN'=>'localhost','SERVER_HTTP'=>'http://','rootAddress'=>'/'] as $k=>$v){define($k,$v);}
$smarty->assign('objCancelUser',new HistoryFixture());$smarty->assign('objFunctions',new FunctionsFixture());$smarty->assign('objDate',new DateFixture());
$html=$smarty->fetch(dirname(__DIR__) . '/view/administrator/ticket/userTicketCancellationHistory.tpl');
if(strpos($html,"UserShowModalPercent('999111','11'")===false)throw new Exception('Missing tour approval action');
if(strpos($html,"UserShowModalPercent('999333','13'")===false)throw new Exception('Hotel approval changed');
if(strpos($html,"ModalConfirmAdminReturnUserWallet('999111', '12'")===false)throw new Exception('Missing tour wallet action');
if(strpos($html,"ModalConfirmAdminForReturnBank('999111', '12'")===false)throw new Exception('Missing tour bank action');
if(strpos($html,"ShowModalFailedCancel('999111', '11')")===false)throw new Exception('Missing tour reject action');
if(strpos($html,"showModalTicketClose('11'")!==false)throw new Exception('Tour still shows unrelated close action');
echo "PASS: tour/hotel approval actions, separate request IDs on same invoice, wallet/bank return actions.\n";
