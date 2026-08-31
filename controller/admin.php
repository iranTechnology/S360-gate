<?php

//if($_SERVER['REMOTE_ADDR'] == '93.118.161.174') {
    error_reporting(1);
    error_reporting(E_ALL | E_STRICT);
    @ini_set('display_errors', 1);
    @ini_set('display_errors', 'on');
//}

class Admin extends baseController
{

    public $message = '';  //message that show after login
    public $config;
    private $validTime = 5;
    private $expired = 'expired';
    private $used = 'used';
    private $unused = 'unused';
    private $verificationCodeModel;
    public function __construct() {


//        parent::__construct();
//        if ($_SERVER['REMOTE_ADDR'] == '84.241.4.20') {
//            var_dump(Session::getAgencyPartnerLoginToAdmin());
//            die();
//        }
        $this->verificationCodeModel = $this->getModel('verificationCodeModel');
    }

    public function loginAdmin($info_login)
    {
        $info_login = [
                'username'    => filter_var($info_login['username'],513),
                'password'    => filter_var($info_login['password'],513),
                'client_id'   => filter_var($info_login['client_id'],513),
                'type_manager'=> filter_var($info_login['type_manager'],513),
                'member'      => filter_var($info_login['member'],513),
            ];

        if (!empty($info_login['client_id']) || ($info_login['type_manager'] == 'main_manager')) {
            $info_login = $this->getModel('loginModel')->login($info_login);
            if (!empty($info_login)) {
                if ($info_login['is_enable'] == '1') {
                    if (empty($info_login['client_id'])) {
                        $this->getmodel('logLoginAdminModel')->insertDataLog();
                        //login_tb ==>gds
                        $this->getModel('loginModel')->updateLastLogin(CLIENT_ID);
                    }
                    Session::adminLoginDo();
                    setcookie('UserName',  $info_login['username'], time() + 3600 * 24 * 5);
                    setcookie('Password',  $info_login['password'], time() + 3600 * 24 * 5);


                    return functions::withSuccess(null,200,'شما با موفقیت وارد پنل مدیریت شدید');
                }
                return functions::withError(null,400,'حساب کاربری شما فعال نمی باشد');
            }
            return functions::withError(null,400,'نام کاربری یا رمز عبور صحیح نمی باشد');

        } elseif ($info_login['type_manager'] == 'sub_manager') {
            $result = $this->getController('members')->getMemberCounterByDataLogin($info_login);
            if (!empty($result)) {
                if ($result['active'] == 'off') {
                    return functions::withError(null,400,'حساب کاربری شما فعال نمی باشد');
                }else if ($result['accessAdmin'] != '1') {
                    return functions::withError(null, 400, 'شما اجازه دسترسی به پنل مدیریت را ندارید');
                }else{
                    Session::setInfoCounterAdmin($result['id']);
                    Session::setSubAgencyId($result['fk_agency_id']);
                    Session::AgencyPartnerLoginToAdmin();
                    return functions::withSuccess(null,200,'شما با موفقیت وارد پنل مدیریت شدید');
                }
            }
            return functions::withError(null,400,'نام کاربری یا رمز عبور صحیح نمی باشد');
        }
        return functions::withError(null,400,'لطفا نوع  کاربر مدیریت برای ورود را مشخص نمائید');
    }



    public function isLogin()
    {
        return Session::adminIsLogin();
    }

    public function getInfoCounterAdmin()
    {
        return Session::getInfoCounterAdmin();
    }

    public function IsLoginAgencyPartner()
    {
        return Session::CheckAgencyPartnerLoginToAdmin();
    }

    public function logoute()
    {

        Session::Logout();
        return 'true';
    }

    public function changePassword($info)
    {


//        $old_pass = functions::encryptPassword($info['old_pass']);
        Load::autoload('ModelBase');
        $ModelBase = new ModelBase();
        $customer_model = $this->getModel('userPassCustomersModel');

        $sql = "SELECT * FROM login_tb WHERE client_id='{$info['client_id']}'";
        $sql_client_tb =  "SELECT * FROM clients_tb WHERE id='{$info['client_id']}'";
        $client_tb = $ModelBase->load($sql_client_tb);
        $client = $ModelBase->load($sql);
        if (!empty($client)) {
//            $sqlCheckPass = "SELECT * FROM login_tb WHERE password='{$old_pass}'";
//            $clientCheckPass = $ModelBase->load($sqlCheckPass);
//            if (!empty($clientCheckPass)) {

                $data['password'] = functions::encryptPassword($info['new_pass']);
                $ModelBase->setTable('login_tb');
                $res = $ModelBase->update($data, "client_id='{$info['client_id']}'");

            $data1['password'] = $info['new_pass'];
            $update = $customer_model->updateWithBind($data1, ['user_name' => $client_tb['Email']]);


                if ($res) {
                    return 'success : رمز عبور شما با موفقیت تغییر یافت';
                } else {
                    return 'error : خطا در ثبت اطلاعات';
                }
//            } else {
//                return 'error: رمز عبور قدیم اشتباه است';
//            }
        } else {

            return 'error: خطا در شناسایی کاربر';
        }
    }

    public function modalLogLoginAdmin($id)
    {
        $sql = "SELECT * FROM log_login_admin_tb ORDER BY id DESC LIMIT 0,3  ";
        $adminRes = self::ConectDbClient($sql, $id, "SelectAll", "", "");
        return $adminRes;
    }
    public function myMethod(){//: string
        $backtrace = debug_backtrace();
        $callerInfo = $backtrace[1]; // Get the information of the caller (index 0 would be the current method itself)

        // Now you can access the calling file and line
        $callingFile = $callerInfo['file'];
        $callingLine = $callerInfo['line'];

        return "The method myMethod() is being called from: $callingFile (Line: $callingLine)";
    }
    public function ConectDbClient($SqlQuery = NULL, $ClientId, $Type, $DataQuery = NULL, $TableQuery = NULL, $Condition = NULL)
    {


        Load::autoload("ModelBase");
        $ModelBase = new ModelBase();

        $Sql = is_null($SqlQuery) ? '' : $SqlQuery;
        $Data = is_null($DataQuery) ? '' : $DataQuery;
        $Table = is_null($TableQuery) ? '' : $TableQuery;

        $ClientSql = "SELECT * FROM clients_tb WHERE id = '{$ClientId}'";

        $Client = $ModelBase->load($ClientSql);

        try {
            $this->config = new PDO(
                'mysql:host=' . SERVER_BASE_ADMIN . ';dbname=' . $Client['DbName'] . ';charset=utf8', $Client['DbUser'], $Client['DbPass']
            );

        } catch (PDOException $e) {
            return null;
        }






        $this->config->exec("set names utf8");
        $this->config->exec("set session sql_mode = ''");

        switch ($Type) {
            case 'Insert':
                return $this->InsertDbClient($Table, $Data, $this->config);
                break;
            case 'Update':
                return $this->UpdateDbClient($this->config, $Table, $Data, $Condition);
                break;
            case 'Delete':
                return $this->DeleteDbClient($this->config, $Table, $Condition);
                break;
            case 'Select':
                return $this->SelectDbClient($Sql, $this->config);
                break;
            case 'SelectAll':
                return $this->SelectDbClientAll($Sql, $this->config);
                break;
            case 'getLastId':
                return $this->getLastId($this->config);
                break;
        }
    }
    public function getClient($ClientId)
    {
        Load::autoload("ModelBase");
        $ModelBase = new ModelBase();

        $ClientSql = "SELECT * FROM clients_tb WHERE id = '{$ClientId}'";

        try {
            return $ModelBase->load($ClientSql);

        } catch (PDOException $e) {
            return null;
        }
    }

    public function InsertDbClient($Table, $Data, $Config)
    {
        if (isset($Data['ClientId'])) {
            unset($Data['ClientId']);
        }
        $this->_query = "INSERT INTO $Table (" . implode(',', array_keys($Data)) . ") VALUES ('" . implode("', '", array_values($Data)) . "' )";

        error_log('try in insertfunction adminController model: ' . date('Y/m/d H:i:s') . ' query: ' . $this->_query . " \n", 3, LOGS_DIR . 'log_update.txt');
        //        echo $this->_query;
//        die();

        try {
            $return = $Config->exec($this->_query);
            if ($return == 1) {
                return true;
            } else {
                return false;
            }
        } catch (PDOException $e) {
            // Close the database handler and trigger an error
            $Config = NULL;
            trigger_error($e->getMessage(), E_USER_ERROR);
        }
    }

    public function UpdateDbClient($Config, $Tabel, $Data, $Condition)
    {
        $s = "";
        foreach ($Data as $col => $val) {
            if ($s != "")
                $s .= ",";
            $s .= ("`" . $col . "`" . " = '" . $val . "'");
        }

        $this->_query = " UPDATE " . $Tabel . " SET " . $s . " WHERE " . $Condition;

        $sql = $Config->prepare($this->_query);
        error_log('try in UpdateFunction adminController model: ' . date('Y/m/d H:i:s') . ' query: ' . $this->_query . " \n", 3, LOGS_DIR . 'log_update.txt');

//        echo '<br>' . $this->_query . '<br>';
//                        die();
//        die();
//        	print_r($this->_pdo->errorInfo());

        try {
            if ($sql) {
                $return = $sql->execute();
            }
            if ($return == 1) {
                return true;
            } else {
                return false;
            }
        } catch (PDOException $e) {
            // Close the database handler and trigger an error
            $Config = NULL;
            trigger_error($e->getMessage(), E_USER_ERROR);
        }
    }

    public function DeleteDbClient($Config, $Tabel, $Condition)
    {
        $this->_query = "DELETE FROM {$Tabel} WHERE {$Condition}";
        //	echo $this->_query;
        return $Config->exec($this->_query);
    }

    public function SelectDbClient($sql, $config)
    {



        $this->_query = $sql;
        $prepared = $config->prepare($this->_query);
        $prepared->execute();
        $data = $prepared->fetch(PDO::FETCH_ASSOC);
        return $data;
    }

    public function SelectDbClientAll($sql, $config)
    {
            $this->_query = $sql;
            $prepared = $config->prepare($this->_query);
            $prepared->execute();
            return  $prepared->fetchAll(PDO::FETCH_ASSOC);


    }


    /***********************************************/

    public function getLastId($Config)
    {
 
        return $Config->lastInsertId();
    }

    public function lastLoginClient($id)
    {
        $sql = "SELECT * FROM log_login_admin_tb ORDER BY id DESC   ";
        $adminRes = self::ConectDbClient($sql, $id, "Select", "", "");
        return $adminRes;
    }

    #region access
    public function Access()
    {

        if (defined('ADMIN_MODULE_FOLDER')) {

            Load::autoload('clientAuth');
            $clientAuth = new clientAuth();
            $access = true;
            switch (ADMIN_MODULE_FOLDER) {
                case 'ticket':
                    if (!$clientAuth->adminAccess('TicketApi')) {
                        $access = false;
                    }
                    break;

                case 'hotel':
                    if (!$clientAuth->adminAccess('HotelApi')) {
                        $access = false;
                    }
                    break;

                case 'reservation':
                    if (!$clientAuth->adminAccess('TicketReserve') && !$clientAuth->adminAccess('HotelReserve')) {
                        $access = false;
                    }
                    break;

                case 'insurance':
                    if (!$clientAuth->adminAccess('InsuranceApi')) {
                        $access = false;
                    }
                    break;

                case 'at':
                    if (!$clientAuth->adminAccess('At')) {
                        $access = false;
                    }
                    break;

            }
        } else {
            $access = true;
        }


        if ($access) {
            return true;
        } else {
            return false;
        }
    }
    #endregion


    #region LinkAdminMenu

    public function LinkAdminMenu()
    {
       $title='title';
       if (LANG_PANEL_ADMIN=='en') {
           $title='titleEn';
       }
       else if (LANG_PANEL_ADMIN=='ar') {
           $title='titleAr';
       }

        $result=$this->getModel('menuAdminModel')
            ->get(['id','url','accessCustomer',$title.' as title','parentId','classIcon']);
        if (LANG_PANEL_ADMIN!='fa') {
            $result->where('other_lang','Yes');
        }
        return $result->all();
    }
    #endregion


    #region accessMenuCounter
    public function accessMenuCounter($idMenu, $idMember)
    {
        $result = $this->getModel('accessMenuCounterModel')
            ->get(['isAccess'])
            ->where('IdMember',$idMember)
            ->where('idMenu',$idMenu)
            ->find();
        //WHERE IdMember='{$idMember}' AND idMenu ='{$idMenu}'
        return ($result['isAccess'] == '1' && !empty($result));
    }
    public function ListAllAccessMenuCounter($idMember)
    {
        $rows = $this->getModel('accessMenuCounterModel')
        ->get(['idMenu','isAccess'])
        ->where('IdMember',$idMember)
        ->all();

        $access = [];
        foreach ($rows as $row) {
            $access[$row['idMenu']] = $row['isAccess'];
        }

        return $access;
    }
    #endregion
    #region listLevel3Admin
    public function listLevel3Admin()
    {
        return $this->getModel('menuAdminModel')
            ->get()
            ->where('accessCustomer','1')
            ->openParentheses()
            ->where('parentId','0','<>')
            ->where('url','#','<>')
            ->closeParentheses()
            ->openParentheses('OR')
            ->Where('parentId','#')
            ->where('url','#','<>')
            ->closeParentheses()
            ->all();
    }
    #endregion

    #region listLevel2Admin
    public function listLevel2Admin()
    {
        return $this->getModel('menuAdminModel')->get()->
            where('parentId','','<>')->
            openParentheses()->
            where('url','#')->
            orWhere('url','')->
            closeParentheses()->
            all();
    }
    #endregion

    #region listLevel1Admin
    public function listLevel1Admin()
    {
        return $this->getModel('menuAdminModel')->get()->
        where('parentId','')->
        all();
    }
    #endregion
    public function ListAllMenuForManagers()
    {
        $ResultMenu= $this->getModel('menuAdminModel')
            ->get(['id','title','parentId','url','other_lang'])
            ->where('accessCustomer','1')
            ->all();

        $menus = [];
        // سطح ۱: سر دسته اصلی
        foreach ($ResultMenu as $menu) {
            if ($menu['parentId'] == 0) {
                $menus[$menu['id']] = [
                    'id' => $menu['id'],
                    'title' => $menu['title'],
                    'url' => $menu['url'],
                    'other_lang' => $menu['other_lang'],
                    'children' => []
                ];
            }
        }

        // سطح ۲: زیر مجموعه‌ها
        foreach ($ResultMenu as $menu) {
            if ($menu['parentId'] != 0 && isset($menus[$menu['parentId']])) {
                $menus[$menu['parentId']]['children'][$menu['id']] = [
                    'id' => $menu['id'],
                    'title' => $menu['title'],
                    'url' => $menu['url'],
                    'other_lang' => $menu['other_lang'],
                    'children' => []
                ];
            }
        }

        // سطح ۳: زیر زیرمجموعه‌ها
        foreach ($ResultMenu as $menu) {
            foreach ($menus as &$parent) {
                if (isset($parent['children'][$menu['parentId']])) {
                    $parent['children'][$menu['parentId']]['children'][] = [
                        'id' => $menu['id'],
                        'title' => $menu['title'],
                        'url' => $menu['url'],
                        'other_lang' => $menu['other_lang']
                    ];
                }
            }
        }

        return $menus;
    }
    #region addMenuAdmin
    public function ListAllMenuForCounters($id_departments,$id_agency)
    {
        // list All Menu
        $ResultAllMenu= $this->getModel('menuAdminModel')
            ->get(['id','title','parentId','url'])
            ->where('accessCustomer','1')
            ->all();

        // first Manager
        $FirstManagerInDepart= $this->getModel('membersModel')
            ->get(['id'])
            ->where('is_member','2')
            ->where('id_departments',$id_departments)
            ->where('fk_agency_id',$id_agency)
            ->where('active','on')
            ->where('del','no')
            ->find();

        // list Menu In Manager
        $ResultMenuInManager= $this->getModel('accessMenuCounterModel')
            ->get(['idMenu'])
            ->where('idMember',$FirstManagerInDepart['id'])
            ->where('isAccess','1')
            ->all();

        // لیست آی‌دی منوهایی که مدیر دسترسی دارد
        $allowedMenuIds = array_column($ResultMenuInManager, 'idMenu');

        // تابع بازگشتی برای ساخت درخت منو
        $buildTree = function($parentId) use (&$buildTree, $ResultAllMenu, $allowedMenuIds) {
            $branch = [];
            foreach ($ResultAllMenu as $menu) {
                if ($menu['parentId'] == $parentId && in_array($menu['id'], $allowedMenuIds)) {
                    $branch[] = [
                        'id' => $menu['id'],
                        'title' => $menu['title'],
                        'url' => $menu['url'],
                        'children' => $buildTree($menu['id'])
                    ];
                }
            }
            return $branch;
        };

        // شروع از منوهای سطح اول
        $menus = $buildTree(0);

        return $menus;
    }

    public function addMenuAdmin($params)
    {
        $ModelBase = Load::library('ModelBase');
        $ModelBase->setTable('menu_admin_tb');

        $data['url'] = $params['url'];
        $data['title'] = $params['title'];
        $data['titleEn'] = $params['title_en'];
        $data['accessCustomer'] = $params['accessCustomer'];
        $data['classIcon'] = $params['classIcon'];
        $data['parentId'] = (!empty($params['subMenu'])) ? $params['subMenu'] : $params['mainMenu'];
        $data['other_lang'] = $params['other_lang'];
        $result = $ModelBase->insertLocal($data);

        if ($result) {
            return 'Success: ثبت منو با موفقبت انجام شد';
        } else {
            return 'Error: خطا در ثبت منو';
        }

    }
    #endregion

#region accessMenuCounter
    public function StatusMenuCounter($idMenu, $idMember, $isAccess)
    {
        $Model = Load::library('Model');
        $Model->setTable('access_menu_counter_tb');
        $data = [
            'isAccess' => $isAccess,
            'IdMember' => $idMember,
            'idMenu'   => $idMenu
        ];
        // بررسی وجود رکورد
        $resultMenu= $this->getModel('accessMenuCounterModel')
            ->get(['id'])
            ->where('IdMember', $idMember)
            ->where('idMenu',$idMenu)
            ->find();
        if ($resultMenu['id']>0) {
            // رکورد موجود است → آپدیت
            $condition = "IdMember='{$idMember}' AND idMenu='{$idMenu}'";
            $resUpdate = $Model->update($data, $condition);

            if ($resUpdate) {
                return 'Success:تغییر دسترسی با موفقیت انجام شد';
            }

            return 'Error:خطا در تغییر دسترسی';
        } else {
            // رکورد موجود نیست → درج
            $resInsert = $Model->insertLocal($data);
            if ($resInsert) {
                return 'Success:تغییر دسترسی با موفقیت انجام شد';
            }
            return 'Error:خطا در تغییر دسترسی';
        }
    }

    #endregion

    #region addMenuAdmin
    public function newMasterRate($params)
    {
        $Model = Load::library('Model');
        $Model->setTable('master_rate_tb');

        $data['item_id'] = $params['record_id'];
        $data['section'] = $params['table_name'];
        $data['value'] = $params['value'];

        $result = $Model->insertLocal($data);

        if ($result) {
            return $this->getMasterRate($data);
        }

        return 'Error: خطا در ثبت newMasterRate';

    }
    #endregion

    #region addMenuAdmin
    public function getMasterRate($params)
    {
        $Model = Load::library('Model');


        $data['record_id'] = $params['record_id'];
        $data['table_name'] = $params['table_name'];
        $SqlMenu = "SELECT * FROM master_rate_tb WHERE 
                                   section='{$data['table_name']}'
                                   AND item_id='{$data['record_id']}'
                                   ";

        $result = $Model->select($SqlMenu);

        $value=0;
        if(!empty($result)){
            foreach($result as $item){
                $value+=$item['value'];
            }
        }
        $count=count($result);
        $average=$value/$count;
        if ($result) {
            return json_encode([
                'allValue'=>$value,
                'average'=>round($average),
                'count'=>$count,
            ],true);
        }

        return json_encode([
            'allValue'=>0,
            'average'=>0,
            'count'=>0,
        ],true);

    }
    #endregion

    private function store($entry, $code) {

        $verificationCodeModel = $this->getModel('verificationCodeModel');
        $abbasi = $verificationCodeModel->insertWithBind([
            'entry' => $entry,
            'code' => $code,
            'status' => $this->unused
        ]);

        return $abbasi;
    }
    public function changeStatus($validate_id, $status) {
        return $this->verificationCodeModel->updateWithBind([
            'status' => $status
        ], [
            'id' => $validate_id
        ]);
    }
    public function sendAdminLoginOtp($params) {
        // محدودیت تعداد درخواست در IP
        $ip = $_SERVER['REMOTE_ADDR'];
        if (isset($_SESSION['otp_send_count'][$ip]) && $_SESSION['otp_send_count'][$ip] > 3) {
            return functions::withError(null, 400, 'تعداد درخواست‌های شما بیش از حد مجاز است. لطفاً 5 دقیقه دیگر تلاش کنید');
        }

        $username = filter_var($params['username'] ?? '', 513);
        $type_manager = filter_var($params['type_manager'] ?? '', 513);

        $admin = $this->getAdminByUsername($username, $type_manager);

        if (!$admin) {
            return functions::withError(null, 400, 'کاربری با این مشخصات یافت نشد');
        }

        $mobile = $admin['mobile'] ?? $admin['Mobile'] ?? '';

        if (empty($mobile)) {
            return functions::withError(null, 400, 'برای این کاربر شماره موبایل ثبت نشده است');
        }

        // تولید کد
        $code = rand(1000, 9999);

        // ذخیره در دیتابیس و حذف کدهای قبلی
        $storeResult = $this->store($mobile, $code);

        if (!$storeResult) {
            return functions::withError(null, 400, 'خطا در ذخیره کد تایید');
        }

        $_SESSION['admin_otp'] = [
            'code' => $code,
            'username' => $username,
            'type_manager' => $type_manager,
            'mobile' => $mobile,
            'expire_at' => time() + 120,
            'created_at' => time()
        ];

        // شمارش درخواست
        $_SESSION['otp_send_count'][$ip] = ($_SESSION['otp_send_count'][$ip] ?? 0) + 1;
        $_SESSION['otp_send_time'][$ip] = time();

        // ارسال پیامک
        $smsController = $this->getController('smsServices');
        $objSms = $smsController->initService('1');

        if ($objSms) {
            $smsArray = [
                'smsMessage' => "کد ورود شما به پنل مدیریت: {$code}\nاین کد تا 2 دقیقه اعتبار دارد.",
                'cellNumber' => $mobile
            ];

//             $res= $smsController->sendSMS($smsArray);
            $smsMessage= ['verification_code_forgot_admin'=>$code];
            $verification_code_pattern  =   $smsController->getPattern('verification_code');
            $res= $smsController->smsByPattern('bcotpctu7g73qby', array($mobile), $smsMessage);

        }

        return functions::withSuccess([
            'expire_at' => 120
        ], 200, 'کد تایید به شماره موبایل شما ارسال شد');
    }


    public function loginAdminWithOtp($params) {
        if (Session::adminIsLogin()) {
            return functions::withError(null, 400, 'شما قبلاً وارد سیستم شده‌اید');
        }

        $otp_code = filter_var($params['otp_code'] ?? '', 513);
        $username = filter_var($params['username'] ?? '', 513);
        $type_manager = filter_var($params['type_manager'] ?? '', 513);
        $client_id = filter_var($params['client_id'] ?? '', 513);
        $member = filter_var($params['member'] ?? 0, 513);

        // اعتبارسنجی کد
        if (empty($otp_code) || strlen($otp_code) != 4) {
            return functions::withError(null, 400, 'کد وارد شده معتبر نیست');
        }

        if (isset($_SESSION['otp_attempts']) && $_SESSION['otp_attempts'] >= 5) {
            return functions::withError(null, 400, 'تعداد تلاش‌های شما بیش از حد مجاز است');
        }

        // بررسی وجود کد در سشن
        if (!isset($_SESSION['admin_otp'])) {
            return functions::withError(null, 400, 'درخواست نامعتبر، لطفا مجددا تلاش کنید');
        }

        $otp_data = $_SESSION['admin_otp'];

        // بررسی انقضای کد
        if (time() > $otp_data['expire_at']) {
            unset($_SESSION['admin_otp']);
            return functions::withError(null, 400, 'کد تایید منقضی شده است، لطفا مجددا تلاش کنید');
        }

        // بررسی صحت کد
        if ($otp_data['code'] != $otp_code) {
            return functions::withError(null, 400, 'کد وارد شده نادرست است');
        }

        // بررسی تطابق نام کاربری
        if ($otp_data['username'] != $username) {
            return functions::withError(null, 400, 'اطلاعات کاربری نامعتبر است');
        }

        $validateRecord = $this->verificationCodeModel->get()
            ->where('entry', $otp_data['mobile'])
            ->where('code', $otp_data['code'])
            ->where('status', $this->unused)
            ->find();
        
        if (!$validateRecord) {
            return functions::withError(null, 400, 'کد نامعتبر یا قبلاً استفاده شده است');
        }

        if ($type_manager == 'main_manager') {

            $this->changeStatus($validateRecord['id'], $this->used);
            Session::adminLoginDo();
            setcookie('UserName', $username, time() + 3600 * 24 * 5, '/');
            setcookie('Password', '', time() - 3600, '/');

            unset($_SESSION['admin_otp']);

            return functions::withSuccess(null, 200, 'شما با موفقیت وارد پنل مدیریت شدید');

        }
        return functions::withError(null, 400, 'لطفا نوع کاربر مدیریت برای ورود را مشخص نمائید');
    }



    public function getAdminByUsername($username, $type_manager) {
        $Model = Load::library('ModelBase');

        $email = CLIENT_MAIN_DOMAIN;
        $query = "SELECT id, Email as username, Mobile as mobile 
              FROM clients_tb 
              WHERE MainDomain= '".$email. "' OR Domain= '".$email. "'
              LIMIT 1";

        $res = $Model->select($query);

        if ($res && !empty($res)) {
            if (isset($res['id'])) {
                return $res;
            }
            if (is_array($res) && isset($res[0])) {
                return $res[0];
            }
            return $res;
        }

        return null;
    }
    public function StatusMenuOtherLang($idMenu,$isAccess)
    {
        $other_lang='No';
        if($isAccess=='1')$other_lang='Yes';
        $data = [
            'other_lang' => $other_lang
        ];
        // بررسی وجود رکورد
        $resultMenu= $this->getModel('menuAdminModel')
            ->get(['id'])
            ->where('id',$idMenu)
            ->find();
        if ($resultMenu['id']>0) {
            // رکورد موجود است → آپدیت
            $resUpdate = $this->getModel('menuAdminModel')
                ->updateWithBind($data, [
                    'id' => $idMenu
                ]);
            if ($resUpdate) {
                return 'Success:وضعیت زیان دیگر با موفقیت انجام شد';
            }

            return 'Error:خطا در تغییر وضعیت';
        } else {
            return 'Error:خطا در تغییر وضعیت';
        }
    }

    public function setLangPanelAdmin($lang)
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $_SESSION['lang_panel_admin'] = $lang;
        exit();
    }

}


?>
