<?php


//        error_reporting(1);
//        error_reporting(E_ALL | E_STRICT);
//        @ini_set('display_errors', 1);
//        @ini_set('display_errors', 'on');

class partner_tb extends ModelBase
{
    protected $setting;

    protected $userPassCustomer;
    protected $agency;
    protected $specialPages;
    protected $galleryBanner;
    protected $userBookmarks;
    protected $table = 'clients_tb';
    protected $pk = 'id';

    public function __construct() {
        parent::__construct();
        $this->setting = new settingCore();
        $this->userPassCustomer = new userPassCustomers();
        $this->agency = new agency();
        $this->specialPages = new specialPages();
        $this->galleryBanner = new galleryBanner();
        $this->userBookmarks = new userBookmarks();
    }

    public function getAll()
    {

        $sql = "select partner.*,login.token from $this->table AS partner
                LEFT JOIN login_tb AS login On login.client_id = partner.id
               WHERE partner.id > 1 AND partner.archived_at IS NULL  ORDER BY 
                                                                         login.last_login desc
                                                                         /*partner.DbName desc,
                                                                         partner.$this->pk desc*/";


        $result = parent::select($sql);


        return $result;
    }
    public function getAllArchived()
    {

        $sql = "select partner.*,login.token from $this->table AS partner
                LEFT JOIN login_tb AS login On login.client_id = partner.id
               WHERE partner.id > 1 AND partner.archived_at IS NOT NULL  ORDER BY partner.$this->pk ASC";


        $result = parent::select($sql);


        return $result;
    }

        public function recurseCopy($src, $dst) {
            $dir = opendir($src);
            @mkdir($dst, 0755, true);

            while (false !== ($file = readdir($dir))) {
                if (($file != '.') && ($file != '..')) {
                    $srcFile = $src . '/' . $file;
                    $dstFile = $dst . '/' . $file;

                    if (is_dir($srcFile)) {
                        $this->recurseCopy($srcFile, $dstFile);
                    } else {
                        copy($srcFile, $dstFile);
                    }
                }
            }
            closedir($dir);
            return true;
        }

    public function InsertAccessUserClient($clientId, $username)
    {
        $clientId = (int)$clientId;

        $sqlAuth = "
        SELECT ServiceId, SourceId, Password, ApiUrl, ApiKey, CreationDateInt , Username , IsActive
        FROM client_auth_tb
        WHERE ClientId = 166
    ";

        $authResults = parent::select($sqlAuth);

        if (empty($authResults)) {
            return false;
        }

        parent::setTable("client_auth_tb");

        $uniqueAuth = [];

        foreach ($authResults as $authResult) {
            $key = $authResult['ServiceId'] . '-' . $authResult['SourceId'];

            if (!isset($uniqueAuth[$key])) {
                $uniqueAuth[$key] = $authResult;
            }
        }

        foreach ($uniqueAuth as $authResult) {

            $check = parent::select("
            SELECT id
            FROM client_auth_tb
            WHERE ClientId = {$clientId}
              AND ServiceId = {$authResult['ServiceId']}
              AND SourceId = {$authResult['SourceId']}
        ");

            if (empty($check)) {
                $data = [
                    'ClientId' => $clientId,
                    'ServiceId' => $authResult['ServiceId'],
                    'SourceId' => $authResult['SourceId'],
                    'Username' => $authResult['SourceId'] == 4 ? $authResult['Username'] : $username,
                    'Password' => $authResult['Password'],
                    'ApiUrl' => $authResult['ApiUrl'],
                    'ApiKey' => $authResult['ApiKey'],
                    'isActive' => 'InActive',
                    'CreationDateInt' => $authResult['CreationDateInt'],
                ];

                parent::insertLocal($data);
            }
        }

        $dataInsertAgency = [
            'name' => $username,
            'Method' => 'InsertAgency',
        ];

        $dataInsertAgencySource = [
            'Method' => 'insertSourceAgency',
        ];

        $this->setting->insertAjency($dataInsertAgency);
        return true;
    }

    public function insertSourceAgency($agencyId , $name)
    {
        try {
            $agencyIdByName = $this->setting->listAgencyByName($name);
            $sources = $this->setting->getInfoAgencySource($agencyId);
            if (empty($sources)) {
                return false;
            }
            $url = $this->setting->apiAddress . "/baseFile/sourceUser/";

            foreach ($sources as $index => $sourceItem) {

                $dataToInsert = [
                    'Method' => 'insertSourceAgency' ,
                    'sourceId' => $sourceItem['SourceTbId'] ,
                    'agencyId' => $agencyIdByName['id'],
                    'userName' =>$sourceItem['userName'] ,
                    'password' => $sourceItem['password'] ,
                    'token' => $sourceItem['token'],
                    'isActiveInternal' => $sourceItem['isActiveInternal'],
                    'isActiveExternal' => $sourceItem['isActiveExternal'],
                    'webServiceType' => 'public',
                    'creationDate' => date('Y-m-d'),
                    'creationTime' => date('H:i:s'),
                    'creationDateInt' => time(),
                ];
                $jsonData = json_encode($dataToInsert);
                 functions::curlExecution($url, $jsonData, 'yes');



            }

        } catch (Exception $e) {
            error_log("Error in insertSourceAgency: " . $e->getMessage());
            return false;
        }
    }

    public function  insertUserPassCustomer($params)
    {
        $this->userPassCustomer->insertCustomer($params);
    }

    protected function createDatabaseForCustomer($dbName)
    {
        require('/home/commin_config/password.php');
        $conn = new mysqli("localhost", "safar360", $PasswordAllSystem, "safar360_gds");
        $password= $PasswordAllSystem;
        if ($conn->connect_errno) {
            return ['message' => 'خطا در اتصال دیتابیس', 'status' => 500];
        }

        $conn->query("CREATE DATABASE `$dbName` CHARACTER SET utf8 COLLATE utf8_general_ci");

        $cmd = "mysqldump -u safar360 -p'$password' safar360_sample | mysql -u safar360 -p'$password' $dbName";

        exec($cmd, $output, $returnStatus);

        if ($returnStatus === 0) {
            return ['message' => 'success : دیتابیس مشتری با موفقیت ایجاد شد','status'=>200];
        } else {
            return ['message' => 'error : خطا در ایجاد دیتابیس مشتری ', 'status' => 500];
        }
    }

    protected function insertAgency($data)
    {
        $dataInfo['name_fa'] = $data['AgencyName'];
        $dataInfo['name_en'] = $data['AgencyName'];
        $dataInfo['manager'] = $data['Manager'];
        $dataInfo['phone'] = $data['Phone'];
        $dataInfo['mobile'] = $data['Mobile'];
        $dataInfo['email'] = $data['Email'];
        $dataInfo['password'] = $data['password'] ?? '123456';
        $dataInfo['license'] = 'license';
        $dataInfo['newspaper'] = 'newspaper';
        $dataInfo['register_date'] = date('Y-m-d H:i:s');
        $dataInfo['ravis_code'] = '11';
        $dataInfo['del'] = 'no';
        $dataInfo['bank_data'] = json_encode([
            'bank_name' => 'ملی',
            'account_number' => '123456'
        ]);
        $dataInfo['address_en'] = !empty($data['AddressEn']) ? $data['AddressEn'] : 'address';
        $dataInfo['address_fa'] = $data['Address'];
        $dataInfo['city_iata'] = 'THR';
        $dataInfo['payment'] = 'cash';
        $dataInfo['type_payment'] = 'rial';
        $dataInfo['isColleague'] = '1';
        $dataInfo['time_limit_credit'] = time();
        $dataInfo['seat_charter_code'] = '';
        $dataInfo['logo'] = '';

        $result = $this->agency->insert_agency($dataInfo);

        // اصلاح مهم: بررسی خروجی
        if (is_string($result) && strpos($result, 'success') !== false) {
            return true;  // موفقیت
        }

        if (is_string($result) && strpos($result, 'error') !== false) {
            return false; // خطا
        }

        return !empty($result); // اگر مقدار داشت موفق
    }

    protected function insertSpecialPage($slug ){

        $slug_suffix = $slug === 'none' ?  '' : '-' . $slug;
        $specialPages = [
            [
                'title' => 'خرید بلیط هواپیما خارجی و داخلی ارزان ',
                'heading' => 'خرید بلیط هواپیما خارجی',
                'slug' => 'flight' . $slug_suffix,
                'description' => 'خرید بلیط هواپیما خارجی و داخلی با بهترین قیمت', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"خرید بلیط هواپیما خارجی و داخلی با بهترین قیمت"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Flight',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file'=> '{"src":"08565875108565-5708.jpg","alt":"flight"}',
                'main_file_alt' => 'بلیط هواپیما',
                'has_search_box' => true
            ],
            [
                'title' => 'رزرو هتل ارزان و لوکس ',
                'heading' => 'رزرو هتل خارجی و داخلی',
                'slug' => 'hotel'. $slug_suffix,
                'description' => 'رزرو هتل ارزان و لوکس در سراسر ایران و جهان', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"رزرو هتل ارزان و لوکس در سراسر ایران و جهان"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Hotel',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file'=> '{"src":"09502634709502-4243.jpg","alt":"hotel"}',
                'main_file_alt' => 'رزرو هتل',
                'has_search_box' => true
            ],
            [
                'title' => 'رزرو تور گردشگری',
                'heading' => 'تورهای داخلی و خارجی',
                'slug' => 'tour'.  $slug_suffix,
                'description' => 'رزرو تورهای گردشگری با بهترین قیمت', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"رزرو تورهای گردشگری با بهترین قیمت"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Tour',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file'=> '{"src":"19314157519314-1860.jpg","alt":"tour"}',
                'main_file_alt' => 'رزرو تور',
                'has_search_box' => true
            ],
            [
                'title' => 'ویزای مسافرتی',
                'heading' => 'دریافت ویزا',
                'slug' => 'visa'. $slug_suffix,
                'description' => 'دریافت ویزای توریستی و کاری', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"دریافت ویزای توریستی و کاری"}]',
                'content' => '<p dir="rtl">خدمات اخذ ویزا برای کشورهای مختلف با بهترین شرایط</p>',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Visa',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file'=>'{"src":"special_pages\/05407582505407-1060.jpg","alt":"visa"}',
                'main_file_alt' => 'ویزا',
                'has_search_box' => true
            ],
            [
                'title' => 'بیمه مسافرتی',
                'heading' => 'بیمه مسافرتی ارزان',
                'slug' => 'insurance'. $slug_suffix,
                'description' => 'خرید بیمه مسافرتی داخلی و خارجی', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"خرید بیمه مسافرتی داخلی و خارجی"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'main_file' => '{"src":"41504634841504-3590.jpg","alt":"Insurance"}',
                'page_type' => 'separate',
                'positions' => 'Insurance',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file_alt' => 'بیمه مسافرتی',
                'has_search_box' => true
            ],
            [
                'title' => 'اتوبوس',
                'heading' => 'بلیط اتوبوس',
                'slug' => 'bus'. $slug_suffix,
                'description' => 'خرید بلیط اتوبوس ارزان', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"خرید بلیط قطار و اتوبوس ارزان"}]',
                'content' => '<p dir="rtl">خرید اینترنتی بلیط قطار و اتوبوس با بهترین قیمت</p>',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Bus',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file' => '{"src":"54501752354501-255.jpg","alt":"bus"}',
                'main_file_alt' => 'بلیط اتوبوس',
                'has_search_box' => true
            ],
            [
                'title' => 'قطار',
                'heading' => 'رزرو قطار',
                'slug' => 'train'. $slug_suffix,
                'description' => 'خرید بلیط قطار', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"قطار"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Train',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file' => '{"src":"034484645train.jpg","alt":"train"}',
                'main_file_alt' => 'بلیط قطار',
                'has_search_box' => true
            ],
            [
                'title' => 'اجاره ماشین',
                'heading' => 'اجاره خودرو',
                'slug' => 'europcar'. $slug_suffix,
                'description' => 'اجاره ماشین در سراسر ایران', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"اجاره ماشین در سراسر ایران"}]',
                'content' => '<p dir="rtl">اجاره انواع خودرو با بهترین قیمت و شرایط</p>',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Europcar',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file' => '{"src":"2851082983.jpg","alt":"europcar"}',
                'main_file_alt' => 'اجاره ماشین',
                'has_search_box' => true
            ],
            [
                'title' => 'تفریحات',
                'heading' => 'تفریحات',
                'slug' => 'entertainment'. $slug_suffix,
                'description' => 'تفریحات گردشگری', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"تفریحات"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Entertainment',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file' => '{"src":"066353902tafrih.jpg","alt":"entertainment"}',
                'main_file_alt' => 'تفریحات',
                'has_search_box' => true
            ],
            [
                'title' => 'پکیج تور',
                'heading' => 'پکیج تور',
                'slug' => 'package'. $slug_suffix,
                'description' => 'پکیج های تور گردشگری', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"پکیج تور"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Package',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file' => '{"src":"456344477package.jpg","alt":"package"}',
                'main_file_alt' => 'پکیج تور',
                'has_search_box' => true
            ],
            [
                'title' => 'تشریفات فرودگاه',
                'heading' => 'تشریفات فرودگاه',
                'slug' => 'cip'. $slug_suffix,
                'description' => 'خدمات تشریفات فرودگاهی', // ⬅️ اضافه شود
                'meta_tags' => '[{"name":"","content":""},{"name":"description","content":"تشریفات فرودگاه"}]',
                'content' => '',
                'language' => 'fa',
                'attach_files' => NULL,
                'page_type' => 'separate',
                'positions' => 'Cip',
                'attach_type' => 'other_page',
                'AddedMeta' => [],
                'main_file' => '',
                'main_file_alt' => 'تشریفات فرودگاه',
                'has_search_box' => true
            ]

        ];

        $specialPagesModel = $this->specialPages;

        $allSuccess = true;

        foreach ($specialPages as $specialPage){
            $result = $specialPagesModel->addSpecialPage($specialPage);
            if (!isset($result['status']) || $result['status'] !== 'success') {
                $allSuccess = false;
            }
        }

        return $allSuccess;
    }

    protected function insertBanner($client_id,$demo){
        $id = '';
        switch ($demo){
            case 'attar':
                $id = '532';
                break;
            case 'jami':
                $id = '525';
                break;
            case 'ferdosi':
                $id = '423';
                break;
            case 'foroogh':
                $id = '530';
                break;
            case 'khayam':
                $id = '531';
                break;
            case 'mowlavi':
                $id = '528';
                break;
            case 'saadi':
                $id = '527';
                break;
            case 'shahriar':
                $id = '529';
                break;
            case 'sepehri':
                $id = '361';
                break;
            case 'hafez':
                $id = '166';
                break;
            default:
                return '';
        }

        $source = PIC_ROOT."/galleryBanner/$id";
        $destination = PIC_ROOT."/galleryBanner/$client_id";
        $resCopy = $this->recurseCopy($source,$destination);

        if($resCopy){
            $files = scandir($destination);
            $counter = 1;

            foreach($files as $file){
                if(preg_match('/\.(jpg|jpeg|png|gif|webp|bmp|svg|ico|tiff|jfif)$/i', $file)){
                    $bannerModel = $this->galleryBanner;
                    $data = [
                        'title' => 'بنر ' . $counter,
                        'description' => 'توضیحات بنر ' . $counter,
                        'language' => 'fa',
                        'pic' => $file,
                        'link' => ''
                    ];

                    $result = $bannerModel->insertGalleryBannerFromCopy($data);

                    if($result){
                        $counter++;
                    }
                }
            }

            return true;
        }

        return false;

    }

    protected function insertBookmarks($clientId ,$domain){

        $domain_fixd = 'https://'.$domain;

        $bookmarksData = [
            [
                'title' => 'سوابق خرید',
                'url' => $domain_fixd . '/gds/itadmin/ticket/mainTicketHistory',
                'sort_order' => '1',
            ],
            [
                'title' => 'سوابق کنسلی',
                'url' => $domain_fixd . '/gds/itadmin/ticket/userTicketCancellationHistory',
                'sort_order' => '2',
            ],
            [
                'title' => 'تراکنش ها',
                'url' => $domain_fixd . '/gds/itadmin/transactionUser',
                'sort_order' => '3',
            ],
            [
                'title' => 'تنظیمات تخفیف',
                'url' => $domain_fixd . '/gds/itadmin/servicesDiscount',
                'sort_order' => '4',
            ],
            [
                'title' => 'وبلاگ',
                'url' => $domain_fixd . '/gds/itadmin/articles/list?section=mag',
                'sort_order' => '5',
            ],
            [
                'title' => 'اخبار',
                'url' => $domain_fixd . '/gds/itadmin/articles/list?section=news',
                'sort_order' => '6',
            ],
            [
                'title' => 'درباره ما',
                'url' => $domain_fixd . '/gds/itadmin/aboutUs/main',
                'sort_order' => '7',
            ],
            [
                'title' => 'پروفایل',
                'url' => $domain_fixd . '/gds/itadmin/myProfile',
                'sort_order' => '8',
            ],
            [
                'title' => 'گالری بنر',
                'url' => $domain_fixd . '/gds/itadmin/galleryBanner/list',
                'sort_order' => '9',
            ],
            [
                'title' => 'سوالات متداول',
                'url' => $domain_fixd . '/gds/itadmin/faqs/list',
                'sort_order' => '10',
            ],
            [
                'title' => 'تغییرات قیمت پرواز',
                'url' => $domain_fixd . '/gds/itadmin/ticket/flightPriceChanges',
                'sort_order' => '11',
            ],
            [
                'title' => 'ثبت تور',
                'url' => $domain_fixd . '/gds/itadmin/reservation/addTour',
                'sort_order' => '12',
            ],

        ];

        $allSuccess = true;
        foreach ($bookmarksData as $bookmark){

            $result = $this->userBookmarks->addBookmark($bookmark['title'],$bookmark['url'],$clientId , $bookmark['sort_order']);
            if (!isset($result['status']) || $result['status'] !== 'success') {
                $allSuccess = false;
            }

        }

        return $allSuccess;

    }

    protected function insertColor($mainColor , $secondColor , $clientID){

        $dataInsert = [
           'ClientId' => $clientID,
           'ColorMainBg' => $mainColor,
           'ColorMainBgHover' => $secondColor,
           'ColorMainText' => '#ffffff',
           'ColorMainTextHover' => '#ffffff',
        ];

        if(!empty($mainColor) && !empty($secondColor) && !empty($clientID)){
            $res = $this->insertWithBind($dataInsert,'client_colors_tb');
            if($res){
                return true;
            }else{
                return false;
            }
        }

        return false;
    }

    protected function updateColor($mainColor , $secondColor , $clientID){

        $dataUpdate = [
         'ColorMainBg' => $mainColor,
           'ColorMainBgHover' => $secondColor,
        ];

        if(!empty($mainColor) && !empty($secondColor) && !empty($clientID)){
            $res = $this->updateWithBind($dataUpdate, "ClientId = '$clientID'", 'client_colors_tb');
            if($res){
                return true;
            }else{
                return false;
            }
        }

        return false;
    }

    protected function insertOrderSearchBox($clientId){

        $dataInsert = [
           [ 'client_id' => $clientId,
            'service_group_id' => '1', // flight
            'order_number' => '1'
           ],
            [ 'client_id' => $clientId,
                'service_group_id' => '2', // hotel
                'order_number' => '2'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '12', // exclusiveTour
                'order_number' => '3'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '9', // train
                'order_number' => '4'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '8', // bus
                'order_number' => '5'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '3', // insurance
                'order_number' => '6'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '7', // visa
                'order_number' => '7'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '10', // entertainment
                'order_number' => '8'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '4', // europcar
                'order_number' => '9'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '11', // package
                'order_number' => '10'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '13', // visa
                'order_number' => '11'
            ],
            [ 'client_id' => $clientId,
                'service_group_id' => '5', // gashtTransfer
                'order_number' => '12'
            ],
        ];

        if(!empty($clientId)){
            $allSuccess = true;
            foreach ($dataInsert as $item){
                $res = $this->insertWithBind($item,'search_service_order_tb');
                if(!$res){
                    $allSuccess = false;
                }
            }
        }

        return $allSuccess;

    }

    public function InsertClientModel($Info)
    {
        $mainDomainNew = $Info['Domain']; // مثال: iran.ir یا online.salam.ir
        preg_match('/(?:^[^.]+\.([^\.]+)\..+$)|(^([^\.]+)\.[^\.]+$)/', $mainDomainNew, $m);
        $dbNameNew = $m[1] ?: $m[3];

        $data['AgencyName'] = $Info['AgencyName'];
        $data['Domain'] = $Info['Domain'];
        $data['DbName'] = 'safar360_'.$dbNameNew;
//        $data['DbUser'] = 'safar360_OnRes';
        $data['DbUser'] = 'safar360';
//        $data['DbPass'] = 'Safar@360#';
        require('/home/commin_config/password.php');
        $data['DbPass'] = $PasswordAllSystem;
        $data['ThemeDir'] = $Info['ThemeDir'];
        $data['Email'] = $Info['Email'];
        $data['Manager'] = $Info['Manager'];
        $data['Mobile'] = $Info['Mobile'];
        $data['Phone'] = $Info['Phone'];
        $data['Address'] = $Info['Address'];
        $data['AddressEn'] = $Info['AddressEn'];
        $data['Title'] = $Info['Title'];
        $data['hash_id_whmcs'] = !empty($Info['id_whmcs']) ? md5($Info['id_whmcs']) : '';
        $data['Description'] = $Info['Description'];
        $data['UrlRuls'] = $Info['UrlRuls'];
        $data['MainDomain'] = $Info['MainDomain'];
        $data['default_language'] = $Info['default_language'];
        $data['diamondAccess'] = $Info['diamondAccess'];
        // $data['AllowSendSms'] = $Info['AllowSendSms'];
        // $data['UsernameSms'] = $Info['UsernameSms'];
        // $data['PasswordSms'] = $Info['PasswordSms'];
        $data['Type'] = '2';
//        $data['UserNameApi'] = $Info['UserNameApi'];
        $data['GoogleMapLatitude'] = $Info['GoogleMapLatitude'];
        $data['GoogleMapLongitude'] = $Info['GoogleMapLongitude'];
        $data['IsEnableClub'] = $Info['IsEnableClub'];
        $data['IsEnableTicketHTC'] = $Info['IsEnableTicketHTC'];
//        $data['UserIdApi'] = $Info['UserIdApi'];
        $data['ClubPreCardNo'] = $Info['ClubPreCardNo'];
//        $data['IsEnableTelOrder'] = $Info['IsEnableTelOrder'];
//        $data['IsEnableSmsOrder'] = $Info['IsEnableSmsOrder'];
        $data['AboutMe'] = $Info['AboutMe'];
        $data['DefaultDb'] = $Info['DefaultDb'];
        $data['PinAllowAccountant'] = $Info['PinAllowAccountant'];
        $data['AdditionalData'] = json_encode($Info['AdditionalData'], 256 | 64);
        $data['isIframe'] = $Info['isIframe'];
        $data['usedDemo'] = $Info['usedDemo'];



        //
        $data['new_login'] = 1;
        $data['ravis_code'] = !empty($Info['ravis_code']) ? $Info['ravis_code'] :'';
        $data['default_lang_admin'] = $Info['default_lang_admin'];

        $config = Load::Config('application');
        $success = $config->UploadFile("pic", "Logo", "");

        $explod_name_pic = explode(':', $success);

        if(!empty($_FILES['Stamp'])){
            $successStamp = $config->UploadFile("pic", "Stamp", "");
            $explod_name_Stamp = explode(':', $successStamp);
            if($explod_name_Stamp[0] == 'done'){
                $data['Stamp'] = $explod_name_Stamp[1];
            }
        }
        $explod_name_pic[0] = "done";
        if ($explod_name_pic[0] == "done") {

            $data['Logo'] = $explod_name_pic[1];
            $result = parent::insertLocal($data);
            $last_id = parent::getLastId();
            if ($result) {
                $domain = $Info['MainDomain']; // iran.ir
                $username = explode('.', $domain)[0];
                $d['client_id'] = $last_id;
                $d['password'] = functions::encryptPassword($Info['password']);
                $d['token'] = functions::encryptPassword($d['client_id']);
                $d['username'] = $Info['Email'];
                $d['is_enable'] = '1';

                parent::setTable("login_tb");
                parent::insertLocal($d);
                $this->InsertAccessUserClient($last_id , $username);
                $this->insertSourceAgency(52 ,  $username );
                $dataUserPass = [
                    'title' => $Info['AgencyName'],
                    'domain' => $Info['Domain'],
                    'user_name' => $Info['Email'],
                    'password' => $Info['password'],
                    'link' => 'http://' . $Info['Domain'],
                ];
                $this->insertUserPassCustomer($dataUserPass);
                $this->createDatabaseForCustomer('safar360_'.$dbNameNew);
                $this->agency->agencyModel()->getPDO()->query("USE `safar360_$dbNameNew`");
                $this->insertAgency($data);
                $this->insertSpecialPage($Info['usedDemo']);
                $this->insertBanner($last_id,$Info['usedDemo']);
                $this->insertBookmarks($last_id,$Info['Domain']);
                $this->insertColor($Info['mainColor'], $Info['secondColor'],$last_id);
                $this->insertOrderSearchBox($last_id);
                return "success : مشتری جدید با موفقیت ثبت شد";

            } else {
                return "error : خطا در ثبت مشتری";
            }
        } else {
            return "error : خطا در ثبت لوگوی مشتری";
        }
    }

    public function UpdateClientModel($Info)
    {
        $result = parent::load("select * from $this->table where $this->pk = '{$Info['client_id']}'");

        $id = $result['id'];

        if (!empty($result)) {
            $data['AgencyName'] = !empty($Info['AgencyName']) ? $Info['AgencyName'] :$result['AgencyName'];
            $data['Domain'] = !empty($Info['Domain']) ? $Info['Domain'] : $result['Domain'];
            $data['DbName'] = !empty($Info['DbName']) ? $Info['DbName'] : $result['DbName'];
            $data['ThemeDir'] = !empty($Info['ThemeDir']) ? $Info['ThemeDir'] : $result['ThemeDir'];
            $data['Email'] = !empty($Info['Email']) ? $Info['Email'] : $result['Email'];
            $data['Manager'] =!empty($Info['Manager']) ? $Info['Manager'] : $result['Manager'];
            $data['Mobile'] = !empty($Info['Mobile']) ? $Info['Mobile'] : $result['Mobile'];
            $data['Phone'] = !empty($Info['Phone']) ? $Info['Phone'] : $result['Phone'];
            $data['Address'] = !empty($Info['Address']) ? $Info['Address'] :$result['Address'];
            $data['AddressEn'] = !empty($Info['AddressEn']) ? $Info['AddressEn'] :$result['AddressEn'];
            $data['GoogleMapLatitude'] =!empty($Info['GoogleMapLatitude']) ? $Info['GoogleMapLatitude'] :$result['GoogleMapLatitude'];
            $data['GoogleMapLongitude'] = !empty($Info['GoogleMapLongitude']) ? $Info['GoogleMapLongitude'] :$result['GoogleMapLongitude'];
            $data['Title'] = !empty($Info['Title']) ? $Info['Title'] :$result['Title'];
            if(!empty($Info['id_whmcs'])) $data['hash_id_whmcs']=md5($Info['id_whmcs']);
            $data['Description'] = !empty($Info['Description']) ? $Info['Description'] :$result['Description'];
            $data['UrlRuls'] = !empty($Info['UrlRuls']) ? $Info['UrlRuls'] :$result['UrlRuls'];
            $data['MainDomain'] = !empty($Info['MainDomain']) ? $Info['MainDomain'] :$result['MainDomain'];
            // $data['AllowSendSms'] = !empty($Info['AllowSendSms']) ? $Info['AllowSendSms'] :$result['AllowSendSms'];
            // $data['UsernameSms'] = !empty($Info['UsernameSms']) ? $Info['UsernameSms'] : $result['UsernameSms'];
            // $data['PasswordSms'] = !empty($Info['PasswordSms']) ? $Info['PasswordSms'] : $result['PasswordSms'];
            $data['IsCurrency'] = !empty($Info['IsCurrency']) ? $Info['IsCurrency'] : $result['IsCurrency'];
            $data['diamondAccess'] = !empty($Info['diamondAccess']) ? $Info['diamondAccess'] :'0';
            $data['IsEnableClub'] = !empty($Info['IsEnableClub']) ? $Info['IsEnableClub'] :'0';
            $data['IsEnableTicketHTC'] = !empty($Info['IsEnableTicketHTC']) ? $Info['IsEnableTicketHTC'] :$result['IsEnableTicketHTC'];
            $data['ClubPreCardNo'] = !empty($Info['ClubPreCardNo']) ? $Info['ClubPreCardNo'] :$result['ClubPreCardNo'];
            /*$data['IsEnableTelOrder'] = !empty($Info['IsEnableTelOrder']) ? $Info['IsEnableTelOrder'] :$result['IsEnableTelOrder'];
            $data['IsEnableSmsOrder'] = !empty($Info['IsEnableSmsOrder']) ? $Info['IsEnableSmsOrder'] :$result['IsEnableSmsOrder'];*/
            $data['AboutMe'] = !empty($Info['AboutMe']) ? $Info['AboutMe'] :$result['AboutMe'];
            $data['PinAllowAccountant']  = !empty($Info['PinAllowAccountant']) ? $Info['PinAllowAccountant'] : $result['PinAllowAccountant'];
            $data['AdditionalData'] = json_encode($Info['AdditionalData'], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
            $data['new_login'] = !empty($Info['new_login']) ? $Info['new_login'] :'0';
            $data['isIframe'] = $Info['isIframe'];
            $data['default_lang_admin'] = $Info['default_lang_admin'];



            if(!empty($Info['DefaultDb']))
            {
                $defaultDb = ($Info['DefaultDb']=='yes') ? '1' :'0';
            }else{
                $defaultDb= $result['DefaultDb'];
            }

            $data['DefaultDb']  = $defaultDb;

            if (empty($_FILES['Logo'])) {

                $success = "done:" . $result['Logo'];
                $explod_name_pic = explode(':', $success);
            } else {
                $config = Load::Config('application');
                $success = $config->UploadFile("pic", "Logo", "");
                $explod_name_pic = explode(':', $success);

            }

            if (empty($_FILES['Favicon'])) {

                $success = "done:" . $result['Favicon'];
                $explod_name_pic_favicon = explode(':', $success);
            } else {
                $config = Load::Config('application');
                $success = $config->UploadFile("pic", "Favicon", "");
                $explod_name_pic_favicon = explode(':', $success);

            }


            if(!empty($_FILES['Stamp'])){
                $config = Load::Config('application');
                $successStamp = $config->UploadFile("pic", "Stamp", "");
                $explod_name_Stamp = explode(':', $successStamp);
                if($explod_name_Stamp[0] == 'done'){
                    $data['Stamp'] = $explod_name_Stamp[1];
                }
            }

            if ($explod_name_pic[0] == "done") {
                $data['Logo'] = $explod_name_pic[1];
                $data['Favicon'] = $explod_name_pic_favicon[1];


                $res_update = parent::update($data, "id='{$id}'");
                $res_update_color = $this->updateColor($Info['mainColor'] , $Info['secondColor'] , $Info['client_id']);
                if ($res_update || $res_update_color) {

                    echo 'success : اطلاعات  با موفقیت ویرایش شد';
                } else {
                    echo 'error : خطا در ویرایش اطلاعات ';
                }
            }else{
                echo "error : خطا در ویرایش  لوگو ";
            }
        } else {

            echo "error : اطلاعات مورد نظر وجود ندارد،با وب مستر خود تماس بگیرید";
        }
    }

    public function archive($Info)
    {
        $result = parent::load("select * from $this->table where $this->pk = '{$Info}'");

        $id = $result['id'];
        if(!empty($result)){
            $data['archived_at'] = date('Y-m-d H:i:s');
        }
        $res_update = parent::update($data, "id='{$id}'");
        if ($res_update) {

            return ['message'=>'success : مشتری با موفقیت آرشیو شد','status'=>200];
        } else {
            return ['message' => 'error : خطا در آرشیو مشتری ', 'status' => 500];
        }
    }

    public function unarchive($Info)
    {
        $result = parent::load("select * from $this->table where $this->pk = '{$Info}'");
        $Model = Load::library('ModelBase');
        $id = $result['id'];
        $sqlUpdate = " UPDATE clients_tb SET ";
        if(!empty($result)){
            $sqlUpdate .= " archived_at = NULL  ";

//            $update_data = array(
//                'archived_at'  => NULL,
//            );
        }

        $sqlUpdate .= " WHERE id = '{$id}' ";
        $res_update = $Model->updateByQuery($sqlUpdate);

        if ($res_update) {

            return ['message'=>'success : آرشیو مشتری با موفقیت لغو شد','status'=>200];
        } else {
            return ['message' => 'error : خطا در لغو آرشیو مشتری ', 'status' => 500];
        }
    }
    public function getClient($info) {

        $sql = "select partner.* from $this->table AS partner
            
                WHERE  partner.id > 1 AND 
                       partner.MainDomain = '{$info['domain']}' ORDER BY partner.$this->pk ASC";
        $result = parent::select($sql);


        return $result;
    }




}
