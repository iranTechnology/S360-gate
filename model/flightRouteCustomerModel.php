<?php


class flightRouteCustomerModel extends Model {
	protected $table = 'flight_route_tb';
	protected $pk = 'id';

    public function getFlightRoutInternal( $params ) {
        $result = $this->get( [
            'Departure_Code',
            'Departure_City',
            'Departure_City AS Departure_CityFa',
            'Departure_CityEn',
            'priorityDeparture'
        ])->where('local_portal', '0');

        $values = [];

        if (isset($params['value']) && $params['value']) {
            // پشتیبانی از آرایه یا رشته جدا شده با کاما
            $values = is_array($params['value'])
                ? $params['value']
                : explode(',', $params['value']);

            $result = $result->openParentheses();

            foreach ($values as $val) {
                $val = trim($val);
                if (empty($val)) continue;

                $converted = functions::switchAlphabet($val);

                $result = $result->like('Departure_City', $val);
                $result = $result->like('Departure_City', $converted);
                $result = $result->like('Departure_CityEn', $val);
                $result = $result->like('Departure_CityEn', $converted);
                $result = $result->like('Departure_Code', $val);
                $result = $result->like('Departure_Code', $converted);
            }

            $result = $result->closeParentheses();
        }

        if (isset($params['is_group']) && $params['is_group']) {
            $result = $result->groupBy('Departure_code')
                ->orderBy('priorityDeparture=0,priorityDeparture', 'ASC');
        }

        if (isset($params['limit']) && $params['limit']) {
            $result = $result->limit(0, $params['limit']);
        }

        $cities = $result->all();

        // اگر value ارسال شده باشد، ترتیب را دقیقاً بر اساس ترتیب آرایه value حفظ کن
        if (!empty($values)) {
            $ordered = [];
            $cities_by_key = [];

            // ایندکس کردن بر اساس نام فارسی، انگلیسی و کد
            foreach ($cities as $city) {
                $cities_by_key[mb_strtolower(trim($city['Departure_City']))]   = $city;
                $cities_by_key[mb_strtolower(trim($city['Departure_CityEn']))] = $city;
                $cities_by_key[mb_strtolower(trim($city['Departure_Code']))]   = $city;
            }

            foreach ($values as $val) {
                $key = mb_strtolower(trim($val));
                if (isset($cities_by_key[$key])) {
                    $ordered[] = $cities_by_key[$key];
                    // جلوگیری از اضافه شدن تکراری
                    unset($cities_by_key[$key]);
                }
            }

            return $ordered;
        }

        return $cities;
    }


    /**
     * @throws Exception
     */
    public function getLocalStations($params = null)
    {
        $result = $this->get([
            'Departure_Code as value',
            'Departure_City as title',
            'Departure_CityEn as title_en',
        ])->where('local_portal', '0');
        if ($params['value']) {
            $result = $result->openParentheses();
            $result = $result->like('Departure_City', $params['value']);
            $result = $result->like('Departure_CityEn', $params['value']);
            $result = $result->like('Departure_code', $params['value']);
            $result = $result->closeParentheses();
        }

        $result = $result->groupBy('Departure_code');

        $result = $result->orderBy('priorityDeparture=0,priorityDeparture', 'ASC');

        if ($params['limit']) {
            $result = $result->limit(0, $params['limit']);
        }
        return $result->all();
    }




}