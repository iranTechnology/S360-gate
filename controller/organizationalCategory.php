<?php


//        error_reporting(1);
//        error_reporting(E_ALL | E_STRICT);
//        @ini_set('display_errors', 1);
//        @ini_set('display_errors', 'on');


class organizationalCategory
{
    private $smsServices;

    #region cunstruct
    public function __construct()
    {
        $this->smsServices = Load::controller('smsServices');

    }
    #endregion

    #region ListAll: list of all organizations
    public function ListAll()
    {
        $Model = Load::library('Model');

        $query = "SELECT * FROM organization_categories_tb";
        return $Model->select($query);
    }

    public function ListAllClient()
    {
        $Model = Load::library('Model');

        $query = "SELECT * FROM organization_categories_tb WHERE status=1";
        return $Model->select($query);
    }

    public function ListOrganizationUsers($organization_id)
    {
        $Model = Load::library('Model');

        $query = "SELECT * FROM organization_users_tb WHERE organization_category_id='{$organization_id}'";
        return $Model->select($query);
    }
    #endregion

    #region getOrganizationByID: get one specified record of organization by id
    public function getOrganizationByID($param)
    {
        $Model = Load::library('Model');

        $param = filter_var($param, FILTER_VALIDATE_INT);

        $query = "SELECT * FROM organization_categories_tb WHERE id='{$param}'";
        return $Model->load($query);
    }
    #endregion

    #region organizationAdd: add an organization
    public function organizationCategoryAdd($param)
    {
        $Model = Load::library('Model');

        $data['title'] = filter_var($param['title'], FILTER_SANITIZE_STRING);
        $data['description'] = filter_var($param['description'], FILTER_SANITIZE_STRING);
        $data['job_guide'] = filter_var($param['job_guide'], FILTER_SANITIZE_STRING);
        $data['rules'] = $param['rules'];
        $data['client_id'] = CLIENT_ID;

        $Model->setTable('organization_categories_tb');
        $resultInsert = $Model->insertLocal($data);
        if ($resultInsert) {
            $output['result_status'] = 'success';
            $output['result_message'] = 'افزودن دسته بندی با موفقیت انجام شد';
        } else {
            $output['result_status'] = 'error';
            $output['result_message'] = 'خطا در فرایند افزودن دسته بندی';
        }

        return $output;
    }
    #endregion

    #region organizationEdit: edit an organization
    public function organizationCategoryEdit($param)
    {
        $param['id'] = filter_var($param['id'], FILTER_VALIDATE_INT);

        $Model = Load::library('Model');

        $sqlExist = "SELECT id AS existID FROM organization_categories_tb WHERE id = '{$param['id']}'";
        $resultSelect = $Model->load($sqlExist);

        if(!empty($resultSelect['existID'])) {

            $data['title'] = filter_var($param['title'], FILTER_SANITIZE_STRING);
            $data['description'] = filter_var($param['description'], FILTER_SANITIZE_STRING);
            $data['job_guide'] = filter_var($param['job_guide'], FILTER_SANITIZE_STRING);
            $data['rules'] = $param['rules'];
            $data['client_id'] = CLIENT_ID;


            $Condition = "id='{$param['id']}'";
            $Model->setTable('organization_categories_tb');
            $resultInsert = $Model->update($data, $Condition);

            if ($resultInsert) {
                $output['result_status'] = 'success';
                $output['result_message'] = 'ویرایش دسته بندی سازمانی با موفقیت انجام شد';
            } else {
                $output['result_status'] = 'error';
                $output['result_message'] = 'خطا در فرایند ویرایش دسته بندی سازمانی';
            }

        } else{
            $output['result_status'] = 'error';
            $output['result_message'] = 'خطا در ویرایش دسته بندی سازمانی، سطح سازمانی مورد نظر یافت نشد';
        }

        return $output;
    }
    #endregion
    public function organizationRegisterUser($param)
    {
        $Model = Load::library('Model');

        $data['first_name'] = filter_var($param['first_name'], FILTER_SANITIZE_STRING);
        $data['last_name'] = filter_var($param['last_name'], FILTER_SANITIZE_STRING);
        $data['mobile'] = filter_var($param['mobile'], FILTER_SANITIZE_STRING);
        $data['national_code'] = filter_var($param['national_code'], FILTER_SANITIZE_STRING);
        $data['birthday'] = filter_var($param['birthday'], FILTER_SANITIZE_STRING);
        $data['job_category'] = filter_var($param['job_category'], FILTER_SANITIZE_STRING);
        $data['organization_category_id'] = $param['organization_id'];
        $data['tracking_code'] = functions::generateFactorNumber();

        $Model->setTable('organization_users_tb');
        $resultInsert = $Model->insertLocal($data);
        if ($resultInsert) {

            $objSms = $this->smsServices->initService('0', CLIENT_ID);
            if($objSms) {
                $smsArray = array(
                    'smsMessage' => " درخواست ثبت نام شما با کد پیگیری {$data['tracking_code']} ثبت شد از همین طریق ادامه روند اطلاع رسانی خواهد شد " ,
                    'cellNumber' => $data['mobile'],
                    'receiverName' => $data['first_name'] . ' ' . $data['last_name'],
                );
                $this->smsServices->sendSMS($smsArray);


            }
            $output['result_status'] = 'success';
            $output['result_message'] = 'با موفقیت ثبت نام شدید';
        } else {
            $output['result_status'] = 'error';
            $output['result_message'] = 'خطا در فرایند ثبت نام';
        }

        return $output;
    }

    public function changeStatusOrganizationalCategory($param) {
        $Model = Load::library('Model');
        $param['id'] = filter_var($param['id'], FILTER_VALIDATE_INT);

        $sqlCode = "SELECT * FROM organization_categories_tb WHERE id = '{$param['id']}'";
        $rec = $Model->load($sqlCode);

        if ($rec['status'] == 1) {
            $data['status'] = 0;
        } else {
            $data['status'] = 1;
        }

        $Model->setTable('organization_categories_tb');
        $res = $Model->update($data, "id = '{$rec['id']}'");
        if ($res) {
            return [
                'result_status' => 'success',
                'result_message' => 'وضعیت با موفقیت تغییر یافت'
            ];
        } else {
            return [
                'result_status' => 'error',
                'result_message' => 'خطا در تغییر وضعیت'
            ];
        }
    }

    // تایید کاربر
    public function changeNameUpload($fileName) {
        $ext = explode(".", $fileName);
        $fileName = date("sB")."-" . rand(10, 10000);
        $ext = strtolower($ext[count($ext)-1]);
        $fileName = $fileName.".".$ext;
        return $fileName;
    }
    public function acceptOrganizationalUser($param)
    {
        $param['id'] = filter_var($param['user_id'], FILTER_VALIDATE_INT);

        $Model = Load::library('Model');

        // بررسی وجود کاربر
        $sqlExist = "SELECT * , id AS existID FROM organization_users_tb WHERE id = '{$param['id']}'";
        $resultSelect = $Model->load($sqlExist);

        if (empty($resultSelect['existID'])) {
            $output['result_status'] = 'error';
            $output['result_message'] = 'خطا در تایید کاربر، کاربر مورد نظر یافت نشد';
            return $output;
        }

        $filePath = null;

        if (isset($_FILES['upload_file']) && $_FILES['upload_file']['error'] == 0) {
            $config = Load::Config('application');
            $path = "userOrganization/";
            $config->pathFile($path);

            // تغییر نام فایل
            $_FILES['upload_file']['name'] = self::changeNameUpload($_FILES['upload_file']['name']);

            // آپلود فایل
            $upload_result = $config->UploadFile("pic", "upload_file", "5120000");

            $explode_name_pic = explode(':', $upload_result);
            if ($explode_name_pic[0] == 'done') {
                $filePath = $path . $explode_name_pic[1];
            } else {
                $output['result_status'] = 'error';
                $output['result_message'] = 'خطا در آپلود فایل';
                return $output;
            }
        }
        $trakingCode = $resultSelect['tracking_code'];
        $data['is_accept'] = 1;

        if ($filePath) {
            $data['file_path'] = $filePath;
        }

        $Condition = "id='{$param['id']}'";
        $Model->setTable('organization_users_tb');
        $resultUpdate = $Model->update($data, $Condition);

        if ($resultUpdate) {
            $objSms = $this->smsServices->initService('0', CLIENT_ID);
            if($objSms){
                $smsArray = array(
                    'smsMessage' => 'درخواست شما با کدپیگری ' . $trakingCode . ' مورد تایید قرار گرفت لطفا وارد سایت شده و از بخش کد رهگیری فایل معرفی خود را دریافت کنید',
                    'cellNumber' => $resultSelect['mobile'],
                    'receiverName' => $resultSelect['first_name'] . ' ' . $resultSelect['last_name'],
                );
               $this->smsServices->sendSMS($smsArray);
            }


            $output['result_status'] = 'success';
            $output['result_message'] = 'کاربر با موفقیت تایید شد';
            if ($filePath) {
                $output['result_message'] .= ' و فایل آپلود گردید';
            }
        } else {
            $output['result_status'] = 'error';
            $output['result_message'] = 'خطا در فرایند تایید کاربر';
        }

        return $output;
    }


    public function rejectOrganizationalUser($param) {
        $Model = Load::library('Model');
        $param['id'] = filter_var($param['id'], FILTER_VALIDATE_INT);
        // بررسی وجود کاربر
        $sqlExist = "SELECT * FROM organization_users_tb WHERE id = '{$param['id']}'";
        $resultSelect = $Model->load($sqlExist);

        if (empty($resultSelect['id'])) {
            $output['result_status'] = 'error';
            $output['result_message'] = 'کاربر مورد نظر یافت نشد';
            return $output;
        }

        $data['is_accept'] = 2;

        $Condition = "id='{$param['id']}'";
        $Model->setTable('organization_users_tb');
        $resultUpdate = $Model->update($data, $Condition);

        if ($resultUpdate) {
            $objSms = $this->smsServices->initService('0', CLIENT_ID);

            if($objSms){
                $smsArray = array(
                    'smsMessage' => 'درخواست شما مورد تایید قرار نگرفت',
                    'cellNumber' => $resultSelect['mobile'],
                    'receiverName' => $resultSelect['first_name'] . ' ' . $resultSelect['last_name'],
                );
                $this->smsServices->sendSMS($smsArray);
            }
            $output['result_status'] = 'success';
            $output['result_message'] = 'کاربر با موفقیت رد شد';
        } else {
            $output['result_status'] = 'error';
            $output['result_message'] = 'خطا در فرایند رد کاربر';
        }

        return $output;
    }
    #region organizationDelete: delete a specified record
    public function organizationDelete($id)
    {
        $Model = Load::library('Model');
        $id = filter_var($id, FILTER_VALIDATE_INT);

        $query = "SELECT COUNT(id) AS usedCount FROM discount_codes_tb WHERE organizationID = '{$id}'";
        $result = $Model->load($query);

        if($result['usedCount'] == 0){

            $data['isDell'] = 'yes';
            $data['lastEditInt'] = time();
            $condition = "id = '{$id}'";

            $Model->setTable('organizational_level_tb');
            $Model->update($data, $condition);

            return 'success: حذف سطح سازمانی با موفقیت انجام شد';
        } else{
            return 'error: خطا در حذف سطح سازمانی، سطح سازمانی مورد نظر  در کد تخفیفی استفاده شده است';
        }

    }

    public function TrackingInfo($param)
    {

        $Model = Load::library('Model');
        $trackingCode = filter_input(INPUT_POST, 'request_service_number', FILTER_SANITIZE_STRING);

            $sql = "SELECT 
    ou.*, 
    oc.id as category_id,
    oc.title as category_title, 
    oc.description as category_description, 
    oc.job_guide,
    oc.rules,
    oc.status as category_status,
    oc.client_id as category_client_id
FROM organization_users_tb ou
LEFT JOIN organization_categories_tb oc ON ou.organization_category_id = oc.id
WHERE ou.tracking_code = '$trackingCode'";


        $res = $Model->load($sql);

        if ($res['is_accept'] == 0) {
            $status = 'درحال پیگیری';
        } else if ($res['is_accept'] == 1) {
            $status = 'تایید شده';
        } else if ($res['is_accept'] == 2) {
            $status = 'رد شده';
        }
        $link = ROOT_ADDRESS_WITHOUT_LANG . '/pic/'.$res['file_path'];
        if ($res['is_accept'] == 1) {

            $op = "  <a href='${link}' class='btn btn-info fa fa-download margin-10'  download title='" . functions::Xmlinformation("ViewPDFTickets") . "'></a>";
        }else{
            $op = "  <a href='#' class='btn btn-info fa fa-download margin-10 disabled'  target='_blank' title='" . functions::Xmlinformation("ViewPDFTickets") . "'></a>";
        }
        $result = "" ;
        if (!empty($res)) {

            $result = '
                 <div class="main-Content-bottom-table-Title Dash-ContentL-B-Title">
                        <i class="icon-table"></i><h3>' . $res['category_title'] . '</h3>
                    </div>
                    
            <table class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>' . functions::Xmlinformation("FirstName") . ' ' . functions::Xmlinformation("LastName") . '<br/>' . '</th>
                        <th>' . functions::Xmlinformation("MobilePhone") . '</th>
                        <th>' . functions::Xmlinformation("NationalCode")  . '</th>
                        <th>' . functions::Xmlinformation("DateOfBirth") . '<br/>' . '</th>
                        <th>' . functions::Xmlinformation("JobCategory") . '<br/>' . '</th>
                        <th>' . functions::Xmlinformation("Status") . '</th>
                        <th>' . functions::Xmlinformation("Action") . '</th>
                    </tr>
                </thead>
                <tbody>
            ';
            //   echo $result;
            $fullName  = $res['first_name'] . ' ' .  $res['last_name'];
            $mobile = $res['mobile'];
            $nationalCode = $res['national_code'];
            $birthday = $res['birthday'];
            $jobCategory = $res['job_category'];
            $result .= '<td>' . $fullName  . '</td><td>' . $mobile . '<br/>' .'</td><td>' . $nationalCode . '</td><td>' . $birthday . '</td><td>' . $jobCategory . '</td><td>' . $status . '</td><td>' . $op . '</td>';
            $result .= '</table>';

        }

        return $result;

    }
    #endregion
}