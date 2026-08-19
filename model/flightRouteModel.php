<?php


class flightRouteModel extends ModelBase
{
    protected $table = 'flight_route_tb';
    protected $pk = 'id';

    /**
     * @param null $params
     * @return array
     * @throws Exception
     */
    public function getFlightRoutInternal($params = null)
    {
        $result = $this->get([
            'Departure_Code',
            'Departure_City',
            'Departure_City as Departure_CityFa',
            'Departure_CityEn',
            'priorityDeparture'
        ])->where('local_portal', '0');

        $values = [];
        if (isset($params['value']) && $params['value']) {

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

        $result = $result->groupBy('Departure_Code')
            ->orderBy('priorityDeparture=0,priorityDeparture', 'ASC');

        if (isset($params['limit']) && $params['limit']) {
            $result = $result->limit(0, $params['limit']);
        }

        $cities = $result->all();

        // اگر value ارسال شده، ترتیب را بر اساس ترتیب آرایه value حفظ کن
        if (!empty($values)) {
            $ordered = [];
            $cities_by_name = [];

            // ایندکس کردن شهرها بر اساس نام فارسی، انگلیسی و کد
            foreach ($cities as $city) {
                $cities_by_name[mb_strtolower(trim($city['Departure_City']))] = $city;
                $cities_by_name[mb_strtolower(trim($city['Departure_CityEn']))] = $city;
                $cities_by_name[mb_strtolower(trim($city['Departure_Code']))] = $city;
            }

            foreach ($values as $val) {
                $val = mb_strtolower(trim($val));
                if (isset($cities_by_name[$val])) {
                    $ordered[] = $cities_by_name[$val];
                    // جلوگیری از تکراری شدن
                    unset($cities_by_name[$val]);
                }
            }

            // اگر شهری پیدا نشد، بقیه را اضافه کن (اختیاری)
            // $ordered = array_merge($ordered, array_values($cities_by_name));

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

        if ($params['limit']) {
            $result = $result->limit(0, $params['limit']);
        }
        return $result->all();
    }


}