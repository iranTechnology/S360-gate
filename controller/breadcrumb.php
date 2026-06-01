<?php

class breadcrumb extends clientAuth
{
    public $breadcrumb = array();

    public function __construct() {
        parent::__construct();
        $this->breadcrumb[] = [
            'title' => functions::Xmlinformation('Home'), 'url' => 'https://'  . CLIENT_MAIN_DOMAIN
        ];
    }
    public function push($title, $url=null) {

        $array['title'] = $title;
        if($url){
            $array['url'] = $url;
        }
        $this->breadcrumb[] = $array;
    }

    public function getPreviousPageInfo() {
        if(GDS_SWITCH == 'detailTour') {
            $this->push(functions::Xmlinformation('GoharTours'), ROOT_ADDRESS . '/resultTourLocal/all-all/all-all/all/all'  );
            $tour_id_same = TOUR_ID_SAME;
            if ($tour_id_same) {
                $result=$this->getController('reservationTour')->getInfoSearchedData($tour_id_same);
//                if(  $_SERVER['REMOTE_ADDR']=='93.118.161.174'  ) {
//                    var_dump('aaaa');
//                    var_dump($result);
//
//                    die;
//                }
                foreach ($result as $item) {
                    $this->push($item['heading'], $item['link']);
                }

            }
        }elseif (GDS_SWITCH == 'roomHotelLocal') {
            $todayDate = date('Y-m-d');
            $threeAfterToday = date('Y-m-d', strtotime($todayDate . ' +3 days'));
            $hotelId = HOTEL_ID;
            $cityId = $_POST['cityId'];
            $startDate = $_POST['startDate'] ? $_POST['startDate'] : functions::dateFormatSpecialJalali($todayDate, 'Y-m-d');
            $endDate = $_POST['endDate'] ? $_POST['endDate'] : functions::dateFormatSpecialJalali($threeAfterToday, 'Y-m-d');
            if (!empty($_POST['nights'])) {
                $nights = $_POST['nights'];
            }
            else {
                    $datetime1 = new DateTime($todayDate);
                    $datetime2 = new DateTime($threeAfterToday);
                    $interval = $datetime1->diff($datetime2);
                    $nights = $interval->days;
            }
            $rooms = $_POST['searchRooms'] ? $_POST['searchRooms'] : 'R:1-0-0';
            $result = $this->getController('reservationBasicInformation')->getInfoHotelData('reservation_hotel_tb' , 'id',  $hotelId) ;


            if ($result['country']==1) {
            if ($startDate)  {
                $this->push(functions::Xmlinformation('Hotels').' '.$result['city_title'], ROOT_ADDRESS . '/searchHotel&type=new&city='. $cityId .'&startDate='.$startDate .'&nights='.$nights .'&rooms='.$rooms  );
            }else {
                $this->push(functions::Xmlinformation('Hotels').' '.$result['city_title'], ROOT_ADDRESS . '/searchHotel&type=new&city='. $result['city'] );

                }
            }else{
                $this->push(functions::Xmlinformation('Hotels').' '.$result['city_title'], ROOT_ADDRESS . '/resultExternalHotel/'. $result['country_title_en'] .'/'. $result['city_title_en'] .'/'.$startDate .'/'.$endDate .'/'.$nights .'/'.$rooms   );
            }

        }
    }

}
