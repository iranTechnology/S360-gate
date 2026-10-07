<?php
/**
 * Created by PhpStorm.
 * User: Developer10
 * Date: 12/8/2021
 * Time: 11:25 AM
 */

class reportHotelModel extends ModelBase {
	protected $table = 'report_hotel_tb';
	protected $pk = 'id';

    public function getOneByReq($req)
    {
        return parent::select("select * from $this->table where request_number='$req' LIMIT 1");
    }

}