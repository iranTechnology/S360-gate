<?php
/**
 * Class hotelList
 *
 * مدیریت لیست هتل‌ها از منابع مختلف
 *
 * source_id = 13 => اقامت (Eghamat)
 * source_id = 40 => اسنپ تریپ (SnapTrip)
 */
class hotelList {

    private $modelCore;

    function __construct() {
        // بارگذاری ModelCore برای اتصال به دیتابیس Core
        Load::autoload("ModelCore");
        $this->modelCore = Load::library('ModelCore');
    }

    /**
     * لیست هتل‌های اسنپ تریپ (source_id = 40)
     */
    public function listHotelSnapTrip($limit = 100, $offset = 0) {
        try {
            $query = "
    SELECT 
        hs.*,
        hl.id as hotel_local_id,
        hl.city_id,
        hl.type,
        hl.name,
        hl.name_en,
        hl.star_code,
        hl.address,
        hl.address_en,
        hl.phone,
        sc.id as city_id,
        sc.name as city_name,
        sc.name_en as city_name_en,
        sc.state_title as state_name
    FROM hotel_source_tb hs
    LEFT JOIN hotels_local_tb hl 
        ON hs.hotel_id = hl.id
    LEFT JOIN snapptrip_cities sc
        ON hl.city_id = sc.id
    WHERE hs.source_id = 40
        AND hs.is_internal = 1
    ORDER BY hl.name ASC
";

            // استفاده از ModelCore برای اجرای کوئری
            $results = $this->modelCore->selectCore($query);

            functions::insertLog('SnapTrip Hotels Count: ' . count($results), '000shojaee');

            return $results;

        } catch (Exception $e) {
            functions::insertLog('listHotelSnapTrip Error: ' . $e->getMessage(), '000shojaee_error');
            return [];
        }
    }

    /**
     * لیست هتل‌های اقامت (source_id = 13)
     */
    public function listHotelEghamat($limit = 100, $offset = 0) {
        try {
            $query = "
    SELECT 
        hs.*,
        hl.id as hotel_local_id,
        hl.city_id,
        hl.type,
        hl.name_fa,
        hl.name_en,
        hl.star_code,
        hl.address,
        hl.address_en,
        hl.longitude,
        hl.latitude,
        hl.phone,
        hl.fax,
        hl.check_time_in,
        hl.check_time_out,
        hl.cancel_conditions,
        hl.capacities,
        hl.description,
        hl.facilities,
        hl.created_at,
        hl.updated_at,
        -- اطلاعات شهر از جدول domestic_cities_tb
        dc.id as city_id,
        dc.name as city_name,
        dc.name_fa as city_name_fa,
        dc.province_id
    FROM hotel_source_tb hs
    LEFT JOIN hotels_local_tb hl 
        ON hs.hotel_id = hl.id
    LEFT JOIN domestic_cities_tb dc
        ON hl.city_id = dc.id
    WHERE hs.source_id = 13
        AND hs.is_internal = 1
    ORDER BY hl.name ASC

";

            // استفاده از ModelCore برای اجرای کوئری
            $results = $this->modelCore->selectCore($query);

            return $results;

        } catch (Exception $e) {
            functions::insertLog('listHotelEghamat Error: ' . $e->getMessage(), '000shojaee_error');
            return [];
        }
    }

    /**
     * دریافت یک هتل خاص با ID
     */
    public function getHotelById($hotelId, $sourceId = null) {
        try {
            $where = "hs.hotel_id = {$hotelId}";

            if ($sourceId) {
                $where .= " AND hs.source_id = {$sourceId}";
            }

            $query = "
                SELECT 
                    hs.*,
                    hl.id as hotel_local_id,
                    hl.city_id,
                    hl.type,
                    hl.name,
                    hl.name_en,
                    hl.star_code,
                    hl.address,
                    hl.address_en,
                    hl.longitude,
                    hl.latitude,
                    hl.phone,
                    hl.fax,
                    hl.check_time_in,
                    hl.check_time_out,
                    hl.cancel_conditions,
                    hl.capacities,
                    hl.description,
                    hl.facilities,
                    hl.created_at,
                    hl.updated_at
                FROM hotel_source_tb hs
                LEFT JOIN hotels_local_tb hl 
                    ON hs.hotel_id = hl.id
                WHERE {$where}
                LIMIT 1
            ";

            $results = $this->modelCore->selectCore($query);

            return !empty($results) ? $results[0] : null;

        } catch (Exception $e) {
            functions::insertLog('getHotelById Error: ' . $e->getMessage(), '000shojaee_error');
            return null;
        }
    }
}