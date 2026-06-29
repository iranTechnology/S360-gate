<?php


//        error_reporting(1);
//        error_reporting(E_ALL | E_STRICT);
//        @ini_set('display_errors', 1);
//        @ini_set('display_errors', 'on');


class organizationalCategory
{
    #region cunstruct
    public function __construct()
    {

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
        $data['organization_category_id'] = $param['organization_id'];

        $Model->setTable('organization_users_tb');
        $resultInsert = $Model->insertLocal($data);

        if ($resultInsert) {
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

        if ($rec['status'] == 0) {
            $data['status'] = 1;
        } else {
            $data['status'] = 0;
        }

        $Model->setTable('organization_categories_tb');
        $res = $Model->update($data, "id = '{$rec['id']}'");

        if ($res) {
            return 'success : وضعیت با موفقیت تغییر یافت';
        } else {
            return 'error : خطا در تغییر وضعیت ';
        }
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
    #endregion
}