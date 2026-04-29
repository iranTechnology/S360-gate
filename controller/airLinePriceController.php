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
        $data['fare_class'] = $params['fare_class'];
        $data['trip_type'] = $params['trip_type'];
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
        $airportModel = $this->getModel('airportModel');
        $airlineIataModel = $this->getModel('airlineIataModel');
        foreach ($result as &$r){
            $origin_fa = $airportModel->get(['id','DepartureCode','DepartureCityFa'])->whereIn('DepartureCode',$r['origin'])->all()[0]['DepartureCityFa'];
            $destination_fa = $airportModel->get(['id','DepartureCode','DepartureCityFa'])->whereIn('DepartureCode',$r['destination'])->all()[0]['DepartureCityFa'];
            $airline = $airlineIataModel->get(['id','airline_name','airline_uniqe_iata'])->whereIn('id',$r['airline_iata_id'])->all()[0];

            $airline_uniqe_iata = $airline['airline_uniqe_iata'];
            $airline_name = $airline['airline_name'];
            $r['origin_fa'] = $origin_fa;
            $r['destination_fa'] = $destination_fa;
            $r['airline_name'] = $airline_name;
            $r['airline_uniqe_iata'] = $airline_uniqe_iata;
        }
        return $result;
    }

    public function getRoutePrices($origin, $destination)
    {
        $airlineCeilingPriceModel = $this->getModel('airlineCeilingPriceModel');
        $airlineIataModel = $this->getModel('airlineIataModel');

        $airlineCeilingPrice = $airlineCeilingPriceModel
            ->get(['*'])
            ->where('origin', $origin)
            ->where('destination', $destination)
            ->all();


        if (empty($airlineCeilingPrice)) {
            $reverseRoute = $airlineCeilingPriceModel
                ->get()
                ->where('origin', $destination)
                ->where('destination', $origin)
                ->all();

            if (!empty($reverseRoute)) {
                $firstItem = $reverseRoute[0] ?? null;
                if ($firstItem && ($firstItem['trip_type'] ?? '') === 'two_way') {
                    $airlineCeilingPrice = $reverseRoute;
                }
            }
        }

        if (empty($airlineCeilingPrice)) {
            $airlineCeilingPrice = $airlineCeilingPriceModel
                ->get(['*'])
                ->where('origin', 'ALL')
                ->where('destination', $destination)
                ->all();
        }

        if (empty($airlineCeilingPrice)) {
            $airlineCeilingPrice = $airlineCeilingPriceModel
                ->get(['*'])
                ->where('origin', $origin)
                ->where('destination', 'ALL')
                ->all();
        }

        if (empty($airlineCeilingPrice)) {
            $airlineCeilingPrice = $airlineCeilingPriceModel
                ->get(['*'])
                ->where('origin', 'ALL')
                ->where('destination', 'ALL')
                ->all();
        }

        $airlineIata = $airlineIataModel
            ->get(['id' , 'airline_uniqe_iata'])
            ->all();

        $map = [];
        foreach ($airlineIata as $item) {
            $map[$item['id']] = $item['airline_uniqe_iata'];
        }

        foreach ($airlineCeilingPrice as &$item) {
            $id = $item['airline_iata_id'];
            if (isset($map[$id])) {
                $item['airline_uniqe_iata'] = $map[$id];
            }
        }

        unset($item);

        return $airlineCeilingPrice;
    }
}

?>