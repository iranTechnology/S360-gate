<?php

//error_reporting(1);
//error_reporting(E_ALL | E_STRICT);
//@ini_set('display_errors', 1);
//@ini_set('display_errors', 'on');
class airLinePriceController extends clientAuth
{
    protected $ModelBase;
    protected $Model;

    public function __construct()
    {
        parent::__construct();
        $this->ModelBase = load::library('ModelBase');
        $this->Model = load::library('Model');

    }
    function returnJson($success = true, $message = '', $data = null, $statusCode = 200) {
        http_response_code($statusCode);
        return json_encode([
            'success' => $success,
            'message' => $message,
            'code' => $statusCode,
            'data' => $data
        ], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    }

    public function add_ceilingPrice($params){
        $data = [];
        $data['airline_iata_id'] = $params['airlineIata'];
        $data['origin'] = $params['origin'];
        $data['destination'] = $params['destination'];
        $data['ceiling_price'] = (int) str_replace(',', '', $params['ceiling_price']);
        $this->Model->setTable('airline_ceiling_price');
        $result = $this->Model->insertWithBind($data);
        if($result){
            return $this->returnJson(true, "قیمت با موفقیت اضافه شد");
        }
        return  $this->returnJson(false, "عملیات با خطا مواجه شد",  null, 500);

    }
    public function update_ceilingPrice($params){
        $data = [];
        $id = $params['id'];
        $con = "id = $id" ;
        $data['ceiling_price'] = $params['ceiling_price'];
        $this->Model->setTable('airline_ceiling_price');
        $result = $this->Model->updateWithBind($data,$con);
        if($result){
            return $this->returnJson(true, "قیمت با موفقیت تغییر یافت");
        }
        return  $this->returnJson(false, "عملیات با خطا مواجه شد",  null, 500);
    }

    public function delete_ceilingPrice($params){
        $id = $params['id'];
        $this->Model->setTable('airline_ceiling_price');
        $con = "id = $id";
        $result = $this->Model->delete($con);
        if($result){
            return $this->returnJson(true, "قیمت با موفقیت حذف شد");
        }
        return  $this->returnJson(false, "عملیات با خطا مواجه شد",  null, 500);

    }
    public function getAllPrices(){

        $this->Model->setTable('airline_ceiling_price');
        $result = $this->Model->get()->all();
        return $result;
    }



}

?>