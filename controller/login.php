<?php
/**
 * Created by PhpStorm.
 * User: AbbasPC
 * Date: 5/20/2018
 * Time: 9:13 AM
 */
class login extends clientAuth
{
    public  $loadModal ;

    public function __construct()
    {
        parent::__construct();
    }

    public function getBackGround()
    {
        $image_info =  $this->getController('bannerBackground')->getLastImageBackGround();

        return   SERVER_HTTP . CLIENT_DOMAIN . '/gds/pic/bannerBackground' . '/'.$image_info['pic'];
    }

    public function isCounter($memberId = null)
    {

        if ($memberId == null || empty($memberId)) {
            $CounterType = functions::getCounterTypeId($_SESSION['userId']);
        } else {
            $CounterType = functions::getCounterTypeId($memberId);
        }
                if ($CounterType == '1') {
                    $isCounter = true;
                } else {
                    $isCounter = false;
                }

                return json_encode($isCounter);
    }
}