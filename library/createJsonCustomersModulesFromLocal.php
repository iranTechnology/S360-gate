<?php
header('Content-Type: application/json; charset=utf-8');
$jsonFile = __DIR__ . '/../customersModules.json';

$raw = file_get_contents('php://input');
$customer = json_decode($raw, true);

if (!$customer || empty($customer['customer_hash_id'])) {
    exit(json_encode(['status'=>'error','msg'=>'داده معتبر نیست']));
}

$hashId = $customer['customer_hash_id'];

// استفاده از آرایه متناظر (Associative) برای دسترسی سریع بدون حلقه
$list = file_exists($jsonFile) ? json_decode(file_get_contents($jsonFile), true) : [];
if (!is_array($list)) $list = [];

// به جای foreach، مستقیماً با ID جایگزین کن (بسیار سریع‌تر)
$list[$hashId] = $customer;

// ذخیره فقط مقادیر (برای اینکه در JSON به صورت لیست عددی بماند)
file_put_contents(
    $jsonFile,
    json_encode(array_values($list), JSON_UNESCAPED_UNICODE)
);

echo json_encode(['status' => 'success', 'hash' => $hashId]);
