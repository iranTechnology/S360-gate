<?php

class exclusiveTourBaseModel extends ModelBase {
    protected $table = 'report_exclusive_tour_tb';
    protected $pk = 'id';


    public function getOneByReq($req)
    {
        return parent::select("select * from $this->table where request_number='$req' LIMIT 1");
    }
    public function getOneByFactorNumber($req)
    {
        return parent::select("select * from $this->table where factor_number='$req' LIMIT 1");
    }
}