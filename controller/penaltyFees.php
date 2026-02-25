<?php
class penaltyFees extends clientAuth{
    public function __construct() {
        parent::__construct();
    }

    public function savePage()
    {
        // دریافت ورودی به‌صورت JSON
        $input = json_decode(file_get_contents('php://input'), true);
        $amount   = isset($input['amount']) ? (str_replace(',', '', $input['amount'])) : '0';

        if ($amount == '0') {
            functions::JsonError('مبلغ کارمزد جریمه الزامی است');
            return;
        }
        $date_time=dateTimeSetting::jdate("Y-m-d H:i:s", time());
        $data = [
            'amount'   => $amount,
            'date_time' => $date_time,
            'dell' => '0'
        ];
        $res = $this->getModel('penaltyFeesModel')->insertWithBind($data);
        if ($res)
            functions::JsonSuccess('ثبت با موفقیت انجام شد');
        else
            functions::JsonError('خطا در ثبت رکورد');
    }
    public function deletePenalty($params) {
        $isPagesPermissions= $this->getModel('penaltyFeesModel')->get()->where('id', $params['id'])->find();

        if ($isPagesPermissions) {
            $result = $this->getModel('penaltyFeesModel')->get()
                ->updateWithBind([
                    'dell' => '1'
                ], [
                    'id' => $params['id']
                ]);
            return functions::JsonSuccess($result, 'رکورد مورد نظر حذف شد');
        }
        return functions::JsonError($isPagesPermissions, 'خطا در حذف ', 200);
    }
    public function getPenalty()
    {
        $list = $this->getModel('penaltyFeesModel')
            ->get()
            ->where('dell', '1', '!=')
            ->orderBy('id','desc')
            ->all();
        return $list;
    }
    public function getPenaltyEnd()
    {
        $PenaltyEnd = $this->getModel('penaltyFeesModel')
            ->get('amount')
            ->where('dell', '1', '!=')
            ->orderBy('id','desc')
            ->limit(0,1)
            ->find();
        return $PenaltyEnd['amount'];
    }
}
