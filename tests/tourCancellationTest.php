<?php
// Run from CLI: all writes use session-only temporary tables.
if (PHP_SAPI !== 'cli') { http_response_code(403); exit; }
$_SERVER['HTTP_HOST']='localhost';
ob_start(); require dirname(__DIR__) . '/config/configBase.php'; ob_end_clean();
try {
$base=new PDO(PDO_DSN_BASE,DB_USERNAME_BASE,DB_PASSWORD_BASE,[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]);
$q=$base->prepare('SELECT C.* FROM clients_tb C LEFT JOIN client_auth_tb AUTH ON AUTH.ClientId=C.id WHERE C.Domain=? AND AUTH.IsActive=?');
$q->execute(['localhost','Active']); $client=$q->fetch(PDO::FETCH_ASSOC);
ob_start(); require dirname(__DIR__) . '/config/config.php'; ob_end_clean();
$db=new PDO(PDO_DSN,DB_USERNAME,DB_PASSWORD,[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->exec("SET SESSION sql_mode = ''");
// These session-only tables shadow production names; every write below is temporary.
foreach(['book_tour_local_tb','cancel_ticket_details_tb','cancel_ticket_tb','members_credit_tb','members_tb','agency_tb','credit_detail_tb'] as $table){
$definition=$db->query("SHOW CREATE TABLE $table")->fetch(PDO::FETCH_NUM)[1];
$db->exec(str_replace('CREATE TABLE', 'CREATE TEMPORARY TABLE', $definition));
}
$definition=$db->query('SHOW CREATE TABLE book_tour_local_tb')->fetch(PDO::FETCH_NUM)[1];
$reportDb = new PDO(PDO_DSN, DB_USERNAME, DB_PASSWORD, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
$reportDb->exec("SET SESSION sql_mode = ''");
$reportDb->exec(str_replace(['CREATE TABLE', '`book_tour_local_tb`'], ['CREATE TEMPORARY TABLE', '`report_tour_tb`'], $definition));
class dateTimeSetting { static function jdate($format, $time) { return '1405-07-14'; } }
$db->exec("INSERT INTO members_tb (id, fk_counter_type_id, fk_agency_id) VALUES (51,5,0),(52,2,71)");
$db->exec("INSERT INTO agency_tb (id) VALUES (71)");
class baseController {}
class Session {
 static $operator = true;
 static function adminIsLogin(){return self::$operator;}
 static function CheckAgencyPartnerLoginToAdmin(){return false;}
}
require dirname(__DIR__) . '/controller/tourCancellation.php';
$service=new tourCancellation($db,$reportDb);
function expect($condition,$message){if(!$condition)throw new RuntimeException($message);}
function ok($response){expect(stripos($response,'success :')===0,'Expected success: '.$response);}
function fail($response){expect(strpos($response,'error :')===0,'Expected rejection: '.$response);}
function requestData($ids,$factor='999111') {return ['FactorNumber'=>$factor,'passengerIds'=>$ids,'backCredit'=>'on','commentUser'=>'test'];}
$insert=$db->prepare("INSERT INTO book_tour_local_tb (id,factor_number,member_id,status,request_cancel,passenger_name,passenger_family,passenger_name_en,passenger_family_en,passenger_national_code,passportNumber,total_price,tour_total_price) VALUES (?, ?, ?, 'BookedSuccessfully','', ?, 'Test', '', '', '', '',100000,100000)");
foreach([[1,'999111',51,'A'],[2,'999111',51,'B'],[3,'999111',51,'C'],[4,'999222',52,'D']] as $row){$insert->execute($row);}
$reportInsert = $reportDb->prepare("INSERT INTO report_tour_tb (id,factor_number,member_id,status,request_cancel,passenger_name,passenger_family,passenger_name_en,passenger_family_en,passenger_national_code,passportNumber,total_price,tour_total_price) VALUES (?, ?, ?, 'BookedSuccessfully','', ?, 'Test', '', '', '', '',100000,100000)");
foreach([[101,'999111',51,'A'],[102,'999111',51,'B'],[103,'999111',51,'C'],[104,'999222',52,'D']] as $row){$reportInsert->execute($row);}
expect(count($service->availablePassengers('999111',51))===3,'Initial eligibility');
fail($service->request(requestData([]),51));
fail($service->request(requestData([4]),51));
fail($service->request(requestData([1]),52));
ok($service->request(requestData([1]),51));
$id=(int)$db->query('SELECT MAX(id) FROM cancel_ticket_details_tb')->fetchColumn();
expect(count($service->availablePassengers('999111',51))===2,'Pending passenger excluded');
fail($service->request(requestData([1]),51));
ok($service->request(requestData([2]),51));
$id2=(int)$db->query('SELECT MAX(id) FROM cancel_ticket_details_tb')->fetchColumn();
fail($service->refund(['ParamId'=>$id,'RequestNumber'=>'999111','ClientID'=>51,'priceBack'=>5000],'wallet'));
Session::$operator=false;fail($service->approve(['id'=>$id,'RequestNumber'=>'999111','PercentIndemnity'=>10]));Session::$operator=true;
fail($service->approve(['id'=>$id,'RequestNumber'=>'999111','PercentIndemnity'=>101]));
ok($service->approve(['id'=>$id,'RequestNumber'=>'999111','PercentIndemnity'=>10,'DescriptionAdmin'=>'test']));
expect($db->query('SELECT status FROM book_tour_local_tb WHERE id=1')->fetchColumn()==='Cancellation','Selected passenger cancelled');
expect($db->query('SELECT status FROM book_tour_local_tb WHERE id=2')->fetchColumn()==='BookedSuccessfully','Other passenger preserved');
$overview=$service->adminOverview('999111',51);
expect($overview['status']==='BookedSuccessfully','Admin partial cancellation preserves booked status');
expect(strpos($overview['html'],'کنسل شده: 1 از 3')!==false && strpos($overview['html'],'در دست بررسی: 1')!==false,'Admin sees counts of cancelled and pending passengers');
expect(strpos($overview['html'],'A Test')!==false && strpos($overview['html'],'B Test')!==false,'Admin sees individual passenger names');
expect($service->adminOverview('999111',52)['html']==='', 'Admin overview matches order owner');

$summary=$service->summary('999111',51);expect($summary['status']==='BookedSuccessfully'&&$summary['cancelled']==1,'Partial order remains active');
expect($reportDb->query('SELECT status FROM report_tour_tb WHERE id=101')->fetchColumn()==='Cancellation','Report passenger cancelled despite different ID');
expect($reportDb->query('SELECT status FROM report_tour_tb WHERE id=102')->fetchColumn()==='BookedSuccessfully','Other report passenger preserved');
fail($service->approve(['id'=>$id,'RequestNumber'=>'999111','PercentIndemnity'=>10]));
expect($service->isTourRequest($id),'Routing recognizes tour by request ID alone');
fail($service->refund(['ParamId'=>$id,'RequestNumber'=>'999222','ClientID'=>51,'priceBack'=>5000],'wallet'));
fail($service->refund(['ParamId'=>$id,'RequestNumber'=>'999111','ClientID'=>52,'priceBack'=>5000],'wallet'));
fail($service->refund(['ParamId'=>$id,'RequestNumber'=>'999111','ClientID'=>51,'priceBack'=>-1],'wallet'));
ok($service->refund(['ParamId'=>$id,'RequestNumber'=>'999111','ClientID'=>51,'priceBack'=>'5,000'],'wallet'));
expect($db->query('SELECT COUNT(*) FROM members_credit_tb')->fetchColumn()==1,'One wallet entry');
expect($db->query('SELECT amount FROM members_credit_tb')->fetchColumn()==5000,'Manual amount unchanged');
expect($db->query("SELECT PriceIndemnity FROM cancel_ticket_details_tb WHERE id=$id2")->fetchColumn()==0,'Sibling request amount unchanged');
fail($service->refund(['ParamId'=>$id,'RequestNumber'=>'999111','ClientID'=>51,'priceBack'=>5000],'wallet'));
fail($service->refund(['ParamId'=>$id,'RequestNumber'=>'999111','ClientID'=>51,'priceBack'=>5000],'bank'));
ok($service->reject(['id'=>$id2,'RequestNumber'=>'999111','DescriptionClient'=>'test']));
expect(count($service->availablePassengers('999111',51))===2,'Rejected passenger eligible again');
ok($service->request(requestData([2,3]),51));
$id3=(int)$db->query('SELECT MAX(id) FROM cancel_ticket_details_tb')->fetchColumn();
ok($service->approve(['id'=>$id3,'RequestNumber'=>'999111','PercentIndemnity'=>0]));
ok($service->refund(['ParamId'=>$id3,'RequestNumber'=>'999111','ClientID'=>51,'priceBack'=>10000],'bank'));
expect($db->query('SELECT COUNT(*) FROM members_credit_tb')->fetchColumn()==1,'Bank return does not credit wallet');
$summary=$service->summary('999111',51);expect($summary['status']==='Cancellation'&&$summary['cancelled']==3,'All passengers cancelled');
$overview=$service->adminOverview('999111',51);
expect($overview['status']==='Cancellation' && strpos($overview['html'],'کنسل شده: 3 از 3')!==false,'Admin whole order cancellation status');

// Missing report row must roll back both the request state and booking changes.
ok($service->request(requestData([4],'999222'),52));$id4=(int)$db->query('SELECT MAX(id) FROM cancel_ticket_details_tb')->fetchColumn();
$reportDb->exec('DELETE FROM report_tour_tb WHERE id=104');
fail($service->approve(['id'=>$id4,'RequestNumber'=>'999222','PercentIndemnity'=>0]));
expect($db->query('SELECT status FROM book_tour_local_tb WHERE id=4')->fetchColumn()==='BookedSuccessfully','Rollback preserved passenger');
expect($db->query("SELECT Status FROM cancel_ticket_details_tb WHERE id=$id4")->fetchColumn()==='RequestMember','Rollback preserved request');
// Exercise both existing tracking methods against the actual selected-passenger links.
define('CLIENT_ID',1);
require dirname(__DIR__) . '/controller/user.php';
class ReadOnlyAdminFixture {
 private $db;
 function __construct($db){$this->db=$db;}
 function ConectDbClient($sql,$clientId,$mode){$stmt=$this->db->query($sql);return $mode==='Select'?$stmt->fetch(PDO::FETCH_ASSOC):$stmt->fetchAll(PDO::FETCH_ASSOC);}
}
$user=(new ReflectionClass('user'))->newInstanceWithoutConstructor();$user->admin=new ReadOnlyAdminFixture($db);
$tracked=$user->ShowInfoModalTicketCancel('999111',$id);expect(count($tracked)===1&&$tracked[0]['passenger_name']==='A','Old tracking selects only requested passenger');
$tracked=$user->ShowInfoModalTicketCancel_new('999111',$id3);expect(count($tracked)===2,'New tracking selects requested passengers');
// Zero refund is valid when the cancellation penalty consumes the entire payment.
$reportInsert->execute([104,'999222',52,'D']);
ok($service->approve(['id'=>$id4,'RequestNumber'=>'999222','PercentIndemnity'=>100]));
ok($service->refund(['ParamId'=>$id4,'RequestNumber'=>'999222','ClientID'=>52,'priceBack'=>0],'bank'));
$insert->execute([5,'999444',53,'E']);$insert->execute([6,'999444',53,'F']);
$reportInsert->execute([105,'999444',53,'E']);
ok($service->request(requestData([5,6],'999444'),53));$id5=(int)$db->query('SELECT MAX(id) FROM cancel_ticket_details_tb')->fetchColumn();
fail($service->approve(['id'=>$id5,'RequestNumber'=>'999444','PercentIndemnity'=>0]));
expect($db->query('SELECT status FROM book_tour_local_tb WHERE id=5')->fetchColumn()==='BookedSuccessfully','Local partial update rolled back');
expect($reportDb->query('SELECT status FROM report_tour_tb WHERE id=105')->fetchColumn()==='BookedSuccessfully','Separate report partial update rolled back');
$db->exec("INSERT INTO cancel_ticket_details_tb (id, FactorNumber, RequestNumber, MemberId, TypeCancel, Status, confirmTransferWallet, PriceIndemnity) VALUES (9001,'999333','999333',52,'tour','ConfirmCancel','none',0),(9002,'999444','999444',51,'tour','ConfirmCancel','none',0)");
ok($service->refund(['ParamId'=>9001,'RequestNumber'=>'999333','ClientID'=>52,'priceBack'=>'7,000'],'wallet'));
expect($db->query('SELECT fk_agency_id FROM credit_detail_tb')->fetchColumn()==71,'Counter refund goes to parent agency');
expect($db->query('SELECT credit FROM credit_detail_tb')->fetchColumn()==7000,'Agency receives manual amount');
expect($db->query('SELECT COUNT(*) FROM members_credit_tb WHERE memberId=52')->fetchColumn()==0,'Counter has no wallet refund');
expect($db->query('SELECT confirmTransferWallet FROM cancel_ticket_details_tb WHERE id=9001')->fetchColumn()==='ReturnWalletCounter','Counter refund status');
fail($service->refund(['ParamId'=>9001,'RequestNumber'=>'999333','ClientID'=>52,'priceBack'=>7000],'wallet'));
ok($service->refund(['ParamId'=>9002,'RequestNumber'=>'999444','ClientID'=>51],'bank'));
expect($db->query('SELECT confirmTransferWallet FROM cancel_ticket_details_tb WHERE id=9002')->fetchColumn()==='ReturnBankCart','Bank confirmation needs no amount');
$db->exec("INSERT INTO cancel_ticket_details_tb (id, FactorNumber, RequestNumber, MemberId, TypeCancel, Status, confirmTransferWallet) VALUES (9003,'999555','999555',51,'tour','RequestMember','none'),(9004,'999555','999555',51,'tour','RequestMember','none')");
expect(strpos($service->requestNotices('999555',51),'در دست بررسی')!==false,'Pending request visible');
fail($service->reject(['id'=>9004,'RequestNumber'=>'999555','DescriptionClient'=>'   ']));
ok($service->reject(['id'=>9004,'RequestNumber'=>'999555','DescriptionClient'=>'<script>test</script> رد به علت سیاست تور']));
$notices=$service->requestNotices('999555',51);
expect(strpos($notices,'در دست بررسی')!==false && strpos($notices,'مشاهده علت')!==false,'Pending and rejected requests visible together');
expect(strpos($notices,'سیاست تور')!==false && strpos($notices,'<script>')===false && strpos($notices,'&lt;script&gt;')!==false,'Rejection reason safely displayed');
expect($service->requestNotices('999555',52)==='', 'Request notices restricted to owner');
echo "PASS: partial and whole cancellations, ownership, separate requests, rejected retries, report mapping, manual wallet/bank returns, duplicate refund prevention, rollback. Only temporary tables changed.\n";
} catch(Throwable $e) {echo 'TEST FAILED: '.$e->getMessage()."\n";exit(1);}
