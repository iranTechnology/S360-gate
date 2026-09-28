<?php

spl_autoload_register(function ($class) {
    $prefix = 'Box\\Spout\\';
    $base_dir = dirname(__DIR__) . '/library/Spout/';

    $len = strlen($prefix);
    if (strncmp($prefix, $class, $len) !== 0) {
        return;
    }

    $file = $base_dir . str_replace('\\', '/', substr($class, $len)) . '.php';
    if (file_exists($file)) {
        require $file;
    }
}, true, false);

use Box\Spout\Reader\Common\Creator\ReaderEntityFactory;
use Box\Spout\Writer\Common\Creator\WriterEntityFactory;

/**
 * درج گروهی مسافران کانتر از طریق فایل اکسل
 * هر ردیف فایل هم به لیست مسافران کانتر اضافه می‌شود و هم به عنوان کاربر اصلی در سیستم ثبت نام می‌شود.
 * ثبت از طریق همان متدهای فرم دستی (passengers::insert) و ثبت نام (members::memberInsert) انجام می‌شود
 * و قبل از اعمال، تمام ردیف‌ها بر اساس شرایط خطای همان متدها بررسی می‌شوند.
 */
class passengerImport extends clientAuth
{
    const MAX_ROWS = 500;
    const MAX_FILE_SIZE = 5242880; // 5MB
    const MIN_PASSWORD_LENGTH = 6;

    /**
     * ساختار ستون‌های فایل اکسل (ترتیب ستون‌ها مهم است)
     */
    private $columns = array(
        'name'            => array('title' => 'نام', 'required' => 'بله', 'hint' => 'نام فارسی', 'sample' => 'علی', 'sample_foreign' => 'جان'),
        'family'          => array('title' => 'نام خانوادگی', 'required' => 'بله', 'hint' => 'نام خانوادگی فارسی', 'sample' => 'محمدی', 'sample_foreign' => 'اسمیت'),
        'mobile'          => array('title' => 'موبایل (نام کاربری)', 'required' => 'بله', 'hint' => 'موبایل ۱۱ رقمی مثل 09121234567', 'sample' => '09121234567', 'sample_foreign' => '09351234567'),
        'password'        => array('title' => 'رمز عبور', 'required' => 'بله', 'hint' => 'حداقل ' . self::MIN_PASSWORD_LENGTH . ' کاراکتر', 'sample' => '123456', 'sample_foreign' => 'abc12345'),
        'credit'          => array('title' => 'اعتبار', 'required' => 'خیر', 'hint' => 'عدد صحیح مثبت، به عنوان افزایش اعتبار در کیف پول کاربر ثبت می‌شود. خالی یا صفر یعنی بدون اعتبار', 'sample' => '5000000', 'sample_foreign' => '2000000'),
        'email'           => array('title' => 'ایمیل', 'required' => 'خیر', 'hint' => 'ایمیل معتبر، در مشخصات کاربر ثبت می‌شود', 'sample' => 'ali@example.com', 'sample_foreign' => 'john@example.com'),
        'gender'          => array('title' => 'جنسیت', 'required' => 'خیر', 'hint' => 'مرد یا زن', 'sample' => 'مرد', 'sample_foreign' => 'مرد'),
        'nationality'     => array('title' => 'ملیت', 'required' => 'خیر', 'hint' => 'ایرانی یا خارجی. اگر خالی باشد، با وجود کد ملی ایرانی و با وجود فقط شماره پاسپورت خارجی در نظر گرفته می‌شود', 'sample' => 'ایرانی', 'sample_foreign' => 'خارجی'),
        'name_en'         => array('title' => 'نام لاتین', 'required' => 'خیر', 'hint' => 'فقط حروف انگلیسی', 'sample' => 'Ali', 'sample_foreign' => 'John'),
        'family_en'       => array('title' => 'نام خانوادگی لاتین', 'required' => 'خیر', 'hint' => 'فقط حروف انگلیسی', 'sample' => 'Mohammadi', 'sample_foreign' => 'Smith'),
        'national_code'   => array('title' => 'کد ملی', 'required' => 'خیر', 'hint' => '۱۰ رقم معتبر (ستون را Text تنظیم کنید تا صفرهای ابتدایی حذف نشوند)', 'sample' => '0012345679', 'sample_foreign' => ''),
        'birthday_fa'     => array('title' => 'تاریخ تولد شمسی', 'required' => 'خیر', 'hint' => 'به صورت 1370/05/12', 'sample' => '1370/05/12', 'sample_foreign' => ''),
        'birthday_en'     => array('title' => 'تاریخ تولد میلادی', 'required' => 'خیر', 'hint' => 'به صورت 1991-08-03', 'sample' => '1991-08-03', 'sample_foreign' => '1988-02-14'),
        'passport_number' => array('title' => 'شماره پاسپورت', 'required' => 'خیر', 'hint' => 'حروف و اعداد انگلیسی', 'sample' => 'K12345678', 'sample_foreign' => 'U12345678'),
        'passport_expire' => array('title' => 'تاریخ انقضای پاسپورت', 'required' => 'خیر', 'hint' => 'میلادی به صورت 2030-01-25 و بعد از امروز', 'sample' => '2030-01-25', 'sample_foreign' => '2031-06-30'),
        'passport_country'=> array('title' => 'کشور صادرکننده پاسپورت', 'required' => 'خیر', 'hint' => 'کد سه حرفی کشور، مثل TUR یا IRQ', 'sample' => 'IRN', 'sample_foreign' => 'TUR'),
    );

    public function __construct() {
        parent::__construct();
    }

    public function getColumns() {
        return $this->columns;
    }

    public function getMaxRows() {
        return self::MAX_ROWS;
    }

    /**
     * فقط بررسی فایل، بدون ثبت
     */
    public function checkExcel($params) {
        $counter = $this->findAccessibleCounter(isset($params['counter_id']) ? $params['counter_id'] : '');
        if (!$counter) {
            return $this->response(false, 'کانتر مورد نظر یافت نشد یا دسترسی به آن ندارید');
        }

        $validation = $this->validateFile($counter['id']);
        if (!empty($validation['errors'])) {
            return $this->response(false, 'فایل دارای خطا است. لطفا خطاهای زیر را در فایل اکسل برطرف کرده و فایل اصلاح شده را مجددا بارگذاری نمایید', array(
                'errors' => $validation['errors'],
            ));
        }

        return $this->response(true, 'فایل بدون خطا است. ' . count($validation['rows']) . ' ردیف آماده ثبت است. جدول زیر را بررسی کرده و برای ثبت نهایی دکمه تایید را بزنید', array(
            'count'   => count($validation['rows']),
            'preview' => $this->buildPreview($validation['rows']),
        ));
    }

    /**
     * بررسی مجدد فایل و در صورت نداشتن خطا، ثبت مسافران و ثبت نام کاربران
     */
    public function applyExcel($params) {
        $counter = $this->findAccessibleCounter(isset($params['counter_id']) ? $params['counter_id'] : '');
        if (!$counter) {
            return $this->response(false, 'کانتر مورد نظر یافت نشد یا دسترسی به آن ندارید');
        }

        // بررسی مجدد، چون ممکن است از زمان بررسی قبلی اطلاعاتی در سیستم تغییر کرده باشد
        $validation = $this->validateFile($counter['id']);
        if (!empty($validation['errors'])) {
            return $this->response(false, 'فایل دارای خطا است و هیچ اطلاعاتی ثبت نشد. لطفا خطاهای زیر را برطرف کرده و فایل اصلاح شده را مجددا بارگذاری نمایید', array(
                'errors' => $validation['errors'],
            ));
        }

        /** @var members $membersController */
        $membersController = Load::controller('members');
        /** @var Passengers $passengersController */
        $passengersController = Load::controller('passengers');
        /** @var memberCredit $memberCreditController */
        $memberCreditController = Load::controller('memberCredit');
        $membersModel = $this->getModel('membersModel');
        $walletAdmin = $this->getWalletAdminInfo();

        $registeredCount = 0;
        $passengerCount = 0;
        $creditCount = 0;
        $failures = array();

        foreach ($validation['rows'] as $row) {
            // ۱- ثبت نام کاربر
            $memberResult = json_decode($membersController->memberInsert($row['member']), true);
            $memberId = isset($memberResult['data']['id']) ? $memberResult['data']['id'] : 0;
            if (empty($memberResult['success']) || !$memberId) {
                $failures[] = $this->rowError($row['row'], $row['full_name'], array(
                    'ثبت نام کاربر انجام نشد و سایر مراحل این ردیف هم انجام نشد: ' . (isset($memberResult['message']) ? $memberResult['message'] : 'خطای نامشخص'),
                ));
                continue;
            }
            $registeredCount++;
            $rowFailures = array();

            // ۲- ثبت ایمیل در مشخصات کاربر
            if ($row['email'] !== '') {
                $emailResult = $membersModel->updateWithBind(array('email' => $row['email']), array('id' => $memberId));
                if ($emailResult === false) {
                    $rowFailures[] = 'کاربر ثبت نام شد اما ثبت ایمیل انجام نشد';
                }
            }

            // ۳- افزایش اعتبار کیف پول (همان روند فرم افزودن اعتبار usersWalletAdd)
            if ($row['credit'] > 0) {
                ob_start();
                $memberCreditController->insert_user_wallet(array(
                    'memberID'   => $memberId,
                    'credit'     => $row['credit'],
                    'becauseOf'  => 'increase',
                    'comment'    => 'اعتبار اولیه هنگام ثبت نام گروهی از طریق فایل اکسل مسافران',
                    'type_admin' => $walletAdmin['type_admin'],
                    'adminId'    => $walletAdmin['adminId'],
                    'typeAgency' => $walletAdmin['typeAgency'],
                ));
                $creditOutput = trim(ob_get_clean());
                if (strpos($creditOutput, 'success') === 0) {
                    $creditCount++;
                } else {
                    $rowFailures[] = 'کاربر ثبت نام شد اما ثبت اعتبار انجام نشد: ' . trim(preg_replace('/^error\s*:/', '', $creditOutput));
                }
            }

            // ۴- افزودن به لیست مسافران کانتر
            $passengerResult = $passengersController->insert($row['passenger'], true);
            if (isset($passengerResult['result_status']) && $passengerResult['result_status'] == 'success') {
                $passengerCount++;
            } else {
                $rowFailures[] = 'کاربر ثبت نام شد اما افزودن به لیست مسافران انجام نشد: ' . (isset($passengerResult['result_message']) ? $passengerResult['result_message'] : 'خطای نامشخص');
            }

            if (!empty($rowFailures)) {
                $failures[] = $this->rowError($row['row'], $row['full_name'], $rowFailures);
            }
        }

        $summary = $registeredCount . ' کاربر ثبت نام شدند، ' . $passengerCount . ' مسافر به لیست مسافران اضافه شد و برای ' . $creditCount . ' کاربر اعتبار ثبت شد';

        if (!empty($failures)) {
            return $this->response(false, $summary . '. اما ' . count($failures) . ' ردیف به طور کامل ثبت نشد', array(
                'errors'  => $failures,
                'count'   => $registeredCount,
                'applied' => true,
            ));
        }

        return $this->response(true, $summary, array(
            'count'   => $registeredCount,
            'applied' => true,
        ));
    }

    /**
     * دانلود فایل نمونه بر اساس ساختار ستون‌ها
     */
    public function downloadSample($params = array()) {
        if (!Session::adminIsLogin() && !Session::CheckAgencyPartnerLoginToAdmin()) {
            return $this->response(false, 'دسترسی ندارید');
        }

        $titles = array();
        $sample = array();
        $sampleForeign = array();
        foreach ($this->columns as $column) {
            $titles[] = $column['title'];
            $sample[] = $column['sample'];
            $sampleForeign[] = $column['sample_foreign'];
        }

        $writer = WriterEntityFactory::createXLSXWriter();
        $writer->openToBrowser('passenger-import-sample.xlsx');
        $writer->addRow(WriterEntityFactory::createRowFromArray($titles));
        $writer->addRow(WriterEntityFactory::createRowFromArray($sample));
        $writer->addRow(WriterEntityFactory::createRowFromArray($sampleForeign));
        $writer->close();
        exit;
    }

    #region validation

    /**
     * @return array ['errors' => [...], 'rows' => [...]]
     */
    private function validateFile($counterId) {
        $read = $this->readExcel();
        if (!empty($read['errors'])) {
            return array('errors' => $read['errors'], 'rows' => array());
        }

        $errors = array();
        $rows = array();
        $seenPassengers = array();
        $seenMobiles = array();
        $seenEmails = array();
        $countryCodes = $this->getCountryCodes();

        /** @var membersModel $membersModel */
        $membersModel = $this->getModel('membersModel');
        $passengersModel = $this->getModel('passengersModel');

        foreach ($read['rows'] as $rowNumber => $data) {
            $rowErrors = array();
            $result = $this->validateRow($data, $countryCodes, $rowErrors);
            $fullName = trim($data['name'] . ' ' . $data['family']);

            // بررسی تکراری بودن، مستقل از سایر خطاهای ردیف انجام می‌شود تا همه خطاها یکجا نمایش داده شوند
            if ($result['has_identity']) {
                $identityTitle = $result['is_foreign'] ? 'شماره پاسپورت' : 'کد ملی';

                // تکراری بودن مسافر داخل خود فایل
                $passengerKey = $result['is_foreign'] ? 'P:' . $result['passport_number'] : 'N:' . $result['national_code'];
                if (isset($seenPassengers[$passengerKey])) {
                    $rowErrors[] = $identityTitle . ' این مسافر با ردیف ' . $seenPassengers[$passengerKey] . ' فایل تکراری است';
                } else {
                    $seenPassengers[$passengerKey] = $rowNumber;
                }

                // تکراری بودن مسافر در لیست مسافران همین کانتر (همان شرط passengers_insert)
                $existPassenger = $passengersModel->get(array('id'))
                    ->where('fk_members_tb_id', $counterId)
                    ->where('del', 'no');
                if ($result['is_foreign']) {
                    $existPassenger->where('passportNumber', $result['passport_number']);
                } else {
                    $existPassenger->where('NationalCode', $result['national_code']);
                }
                if ($existPassenger->find()) {
                    $rowErrors[] = 'مسافری با این ' . $identityTitle . ' قبلا در لیست مسافران این کانتر ثبت شده است';
                }
            }

            if ($result['mobile_valid']) {
                // تکراری بودن موبایل داخل خود فایل
                if (isset($seenMobiles[$result['mobile']])) {
                    $rowErrors[] = 'موبایل «' . $result['mobile'] . '» با ردیف ' . $seenMobiles[$result['mobile']] . ' فایل تکراری است';
                } else {
                    $seenMobiles[$result['mobile']] = $rowNumber;
                }

                // تکراری بودن کاربر (همان شرط memberInsert)
                $existMember = $membersModel->getExistMemberByUserName(array('entry' => $result['mobile']));
                if ($existMember) {
                    if ($existMember['is_member'] == '1') {
                        $rowErrors[] = 'کاربری با موبایل «' . $result['mobile'] . '» قبلا در سیستم ثبت نام کرده است';
                    } elseif ($existMember['active'] != 'on') {
                        $rowErrors[] = 'موبایل «' . $result['mobile'] . '» متعلق به یک کاربر غیرفعال است';
                    }
                }
            }

            if ($result['email'] !== '' && $result['email_valid']) {
                // تکراری بودن ایمیل داخل خود فایل
                if (isset($seenEmails[$result['email']])) {
                    $rowErrors[] = 'ایمیل «' . $result['email'] . '» با ردیف ' . $seenEmails[$result['email']] . ' فایل تکراری است';
                } else {
                    $seenEmails[$result['email']] = $rowNumber;
                }

                // ایمیل نباید متعلق به کاربر دیگری باشد (به عنوان ایمیل یا نام کاربری)
                $emailOwner = $membersModel->get(array('id', 'user_name'))->where('email', $result['email'])->find();
                if (!$emailOwner) {
                    $emailOwner = $membersModel->getExistMemberByUserName(array('entry' => $result['email']));
                }
                if ($emailOwner && $emailOwner['user_name'] != $result['mobile']) {
                    $rowErrors[] = 'ایمیل «' . $result['email'] . '» قبلا برای کاربر دیگری در سیستم ثبت شده است';
                }
            }

            if (!empty($rowErrors)) {
                $errors[] = $this->rowError($rowNumber, $fullName, $rowErrors);
                continue;
            }

            $rows[] = array(
                'row'       => $rowNumber,
                'full_name' => $fullName,
                'preview'   => $result,
                'email'     => $result['email'],
                'credit'    => $result['credit'],
                'passenger' => array(
                    'passengerGender'          => $result['gender'],
                    'passengerNationality'     => $result['is_foreign'] ? '1' : '0',
                    'passengerName'            => $result['name'],
                    'passengerFamily'          => $result['family'],
                    'passengerNameEn'          => $result['name_en'],
                    'passengerFamilyEn'        => $result['family_en'],
                    'passengerNationalCode'    => $result['national_code'],
                    'passengerBirthday'        => $result['birthday_fa'],
                    'passengerBirthdayEn'      => $result['birthday_en'],
                    'passengerPassportNumber'  => $result['passport_number'],
                    'passengerPassportExpire'  => $result['passport_expire'],
                    'passengerPassportCountry' => $result['passport_country'],
                    'memberID'                 => $counterId,
                ),
                'member' => array(
                    'entry'       => $result['mobile'],
                    'password'    => $result['password'],
                    'name'        => $result['name'],
                    'family'      => $result['family'],
                    'reagentCode' => '',
                    'no_login'    => true, // جلوگیری از لاگین شدن ادمین با کاربر جدید و ارسال پیامک خوش آمد
                ),
            );
        }

        return array('errors' => $errors, 'rows' => $rows);
    }

    /**
     * بررسی فرمت اطلاعات یک ردیف
     * فیلدهای مسافر اختیاری هستند اما اگر وارد شوند باید معتبر باشند
     */
    private function validateRow($data, $countryCodes, &$errors) {
        $result = array(
            'gender'           => '',
            'is_foreign'       => false,
            'name'             => $data['name'],
            'family'           => $data['family'],
            'name_en'          => $data['name_en'],
            'family_en'        => $data['family_en'],
            'national_code'    => '',
            'birthday_fa'      => '',
            'birthday_en'      => '',
            'passport_number'  => '',
            'passport_expire'  => '',
            'passport_country' => '',
            'has_identity'     => false,
        );

        // جنسیت
        if ($data['gender'] !== '') {
            $genderMap = array('مرد' => 'Male', 'male' => 'Male', 'زن' => 'Female', 'female' => 'Female');
            $genderKey = strtolower($data['gender']);
            if (isset($genderMap[$genderKey])) {
                $result['gender'] = $genderMap[$genderKey];
            } else {
                $errors[] = 'جنسیت «' . $data['gender'] . '» نامعتبر است (فقط مرد یا زن)';
            }
        }

        // ملیت
        $nationality = null;
        if ($data['nationality'] === 'ایرانی') {
            $nationality = 'iranian';
        } elseif ($data['nationality'] === 'خارجی') {
            $nationality = 'foreign';
        } elseif ($data['nationality'] !== '') {
            $errors[] = 'ملیت «' . $data['nationality'] . '» نامعتبر است (فقط ایرانی یا خارجی)';
        }

        // نام و نام خانوادگی فارسی (الزامی برای ثبت نام کاربر)
        foreach (array('name' => 'نام', 'family' => 'نام خانوادگی') as $key => $title) {
            if ($data[$key] === '') {
                $errors[] = $title . ' وارد نشده است';
            } elseif (preg_match('/[0-9]/', $data[$key])) {
                $errors[] = $title . ' نباید شامل عدد باشد';
            }
        }
        foreach (array('name_en' => 'نام لاتین', 'family_en' => 'نام خانوادگی لاتین') as $key => $title) {
            if ($data[$key] !== '' && !preg_match('/^[A-Za-z]+( [A-Za-z]+)*$/', $data[$key])) {
                $errors[] = $title . ' «' . $data[$key] . '» باید فقط شامل حروف انگلیسی باشد';
            }
        }

        // کد ملی
        $nationalCodeValid = false;
        if ($data['national_code'] !== '') {
            $nationalCode = $data['national_code'];
            if (ctype_digit($nationalCode) && strlen($nationalCode) < 10 && strlen($nationalCode) >= 8) {
                // اکسل صفرهای ابتدای عدد را حذف می‌کند
                $nationalCode = str_pad($nationalCode, 10, '0', STR_PAD_LEFT);
            }
            if (functions::checkNationalCode($nationalCode)) {
                $result['national_code'] = $nationalCode;
                $nationalCodeValid = true;
            } else {
                $errors[] = 'کد ملی «' . $data['national_code'] . '» معتبر نیست';
            }
        }

        // شماره پاسپورت
        $passportValid = false;
        if ($data['passport_number'] !== '') {
            $passportNumber = strtoupper($data['passport_number']);
            if (preg_match('/^[A-Z0-9]{5,20}$/', $passportNumber)) {
                $result['passport_number'] = $passportNumber;
                $passportValid = true;
            } else {
                $errors[] = 'شماره پاسپورت «' . $data['passport_number'] . '» نامعتبر است (فقط حروف و اعداد انگلیسی)';
            }
        }

        // تاریخ تولد شمسی
        if ($data['birthday_fa'] !== '') {
            $birthdayFa = $this->normalizeJalaliDate($data['birthday_fa']);
            if (!$birthdayFa) {
                $errors[] = 'تاریخ تولد شمسی «' . $data['birthday_fa'] . '» نامعتبر است (فرمت صحیح: 1370/05/12)';
            } elseif ($birthdayFa > dateTimeSetting::jdate('Y-m-d', time(), '', '', 'en')) {
                $errors[] = 'تاریخ تولد شمسی نمی تواند بعد از امروز باشد';
            } else {
                $result['birthday_fa'] = $birthdayFa;
            }
        }

        // تاریخ تولد میلادی
        if ($data['birthday_en'] !== '') {
            $birthdayEn = $this->normalizeGregorianDate($data['birthday_en']);
            if (!$birthdayEn) {
                $errors[] = 'تاریخ تولد میلادی «' . $data['birthday_en'] . '» نامعتبر است (فرمت صحیح: 1991-08-03)';
            } elseif ($birthdayEn > date('Y-m-d')) {
                $errors[] = 'تاریخ تولد میلادی نمی تواند بعد از امروز باشد';
            } else {
                $result['birthday_en'] = $birthdayEn;
            }
        }

        // اگر فقط یکی از تاریخ‌های تولد وارد شده باشد، دیگری از روی آن محاسبه می‌شود
        if ($result['birthday_fa'] !== '' && $result['birthday_en'] === '') {
            list($y, $m, $d) = explode('-', $result['birthday_fa']);
            $result['birthday_en'] = dateTimeSetting::jalali_to_gregorian($y, $m, $d, '-');
        } elseif ($result['birthday_en'] !== '' && $result['birthday_fa'] === '') {
            list($y, $m, $d) = explode('-', $result['birthday_en']);
            $result['birthday_fa'] = dateTimeSetting::gregorian_to_jalali($y, $m, $d, '-');
        }

        // تاریخ انقضای پاسپورت
        if ($data['passport_expire'] !== '') {
            $expire = $this->normalizeGregorianDate($data['passport_expire']);
            if (!$expire) {
                $errors[] = 'تاریخ انقضای پاسپورت «' . $data['passport_expire'] . '» نامعتبر است (فرمت صحیح: 2030-01-25)';
            } elseif ($expire <= date('Y-m-d')) {
                $errors[] = 'پاسپورت منقضی شده است (تاریخ انقضا: ' . $expire . ')';
            } else {
                $result['passport_expire'] = $expire;
            }
        }

        // کشور صادرکننده پاسپورت
        if ($data['passport_country'] !== '') {
            $country = strtoupper($data['passport_country']);
            if (isset($countryCodes[$country])) {
                $result['passport_country'] = $country;
            } else {
                $errors[] = 'کد کشور صادرکننده پاسپورت «' . $data['passport_country'] . '» نامعتبر است (کد سه حرفی مثل TUR)';
            }
        }

        // تعیین ملیت در صورت خالی بودن
        if ($nationality === null) {
            $nationality = ($data['national_code'] === '' && $data['passport_number'] !== '') ? 'foreign' : 'iranian';
        }
        $result['is_foreign'] = ($nationality === 'foreign');

        // بررسی تکراری بودن مسافر فقط با کد ملی (ایرانی) یا شماره پاسپورت (خارجی) ممکن است (شرط passengers_insert)
        $result['has_identity'] = $result['is_foreign'] ? $passportValid : $nationalCodeValid;

        // موبایل (نام کاربری)
        $mobile = $this->normalizeMobile($data['mobile']);
        $result['mobile'] = $mobile;
        $result['mobile_valid'] = false;
        if ($data['mobile'] === '') {
            $errors[] = 'موبایل (نام کاربری) وارد نشده است';
        } elseif (!preg_match('/^09[0-9]{9}$/', $mobile)) {
            $errors[] = 'موبایل «' . $data['mobile'] . '» نامعتبر است (باید ۱۱ رقم و به صورت 09121234567 باشد)';
        } else {
            $result['mobile_valid'] = true;
        }

        // ایمیل
        $email = strtolower(str_replace(' ', '', $data['email']));
        $result['email'] = $email;
        $result['email_valid'] = false;
        if ($email !== '') {
            if (!filter_var($email, FILTER_VALIDATE_EMAIL) || preg_match('/[\'"\\\\`]/', $email)) {
                $errors[] = 'ایمیل «' . $data['email'] . '» نامعتبر است';
            } else {
                $result['email_valid'] = true;
            }
        }

        // رمز عبور
        if ($data['password'] === '') {
            $errors[] = 'رمز عبور وارد نشده است';
        } elseif (mb_strlen($data['password']) < self::MIN_PASSWORD_LENGTH) {
            $errors[] = 'رمز عبور باید حداقل ' . self::MIN_PASSWORD_LENGTH . ' کاراکتر باشد';
        } elseif (preg_match('/\s/u', $data['password'])) {
            $errors[] = 'رمز عبور نباید شامل فاصله باشد';
        }
        $result['password'] = $data['password'];

        // اعتبار (فقط افزایش)
        $result['credit'] = 0;
        $credit = str_replace(array(',', '٬', ' '), '', $data['credit']);
        if ($credit !== '') {
            if (preg_match('/^-/', $credit)) {
                $errors[] = 'اعتبار «' . $data['credit'] . '» نمی تواند منفی باشد (فقط افزایش اعتبار مجاز است)';
            } elseif (!ctype_digit($credit)) {
                $errors[] = 'اعتبار «' . $data['credit'] . '» نامعتبر است (فقط عدد صحیح بدون اعشار)';
            } else {
                $result['credit'] = (int)$credit;
            }
        }

        return $result;
    }

    private function normalizeJalaliDate($value) {
        if (!preg_match('/^(\d{4})[\/\-](\d{1,2})[\/\-](\d{1,2})$/', $value, $match)) {
            return false;
        }
        $year = (int)$match[1];
        $month = (int)$match[2];
        $day = (int)$match[3];
        $currentYear = (int)dateTimeSetting::jdate('Y', time(), '', '', 'en');

        if ($year < 1300 || $year > $currentYear || $month < 1 || $month > 12 || $day < 1) {
            return false;
        }
        if (($month <= 6 && $day > 31) || ($month > 6 && $day > 30)) {
            return false;
        }

        return sprintf('%04d-%02d-%02d', $year, $month, $day);
    }

    private function normalizeGregorianDate($value) {
        if (!preg_match('/^(\d{4})[\/\-](\d{1,2})[\/\-](\d{1,2})$/', $value, $match)) {
            return false;
        }
        if ((int)$match[1] < 1900 || !checkdate((int)$match[2], (int)$match[3], (int)$match[1])) {
            return false;
        }

        return sprintf('%04d-%02d-%02d', $match[1], $match[2], $match[3]);
    }

    private function normalizeMobile($value) {
        $value = str_replace(array(' ', '-'), '', $value);
        if (preg_match('/^(\+98|0098)(9[0-9]{9})$/', $value, $match)) {
            return '0' . $match[2];
        }
        // اکسل صفر ابتدای موبایل را حذف می‌کند
        if (preg_match('/^9[0-9]{9}$/', $value)) {
            return '0' . $value;
        }
        return $value;
    }

    private function getCountryCodes() {
        $codes = array();
        foreach ((array)functions::CountryCodes() as $country) {
            $codes[strtoupper($country['code'])] = true;
        }
        // functions::CountryCodes ایران را برنمی‌گرداند، اما کشور پاسپورت مسافر ایرانی IRN است
        $codes['IRN'] = true;
        return $codes;
    }

    #endregion

    #region excel

    /**
     * @return array ['errors' => [...], 'rows' => [excelRowNumber => [columnKey => value]]]
     */
    private function readExcel() {
        if (empty($_FILES['excel_file']) || is_array($_FILES['excel_file']['name'])) {
            return $this->generalError('هیچ فایلی ارسال نشده است. لطفا یک فایل اکسل انتخاب نمایید');
        }

        $file = $_FILES['excel_file'];
        if ($file['error'] !== UPLOAD_ERR_OK) {
            return $this->generalError('آپلود فایل با خطا مواجه شد، لطفا مجددا تلاش نمایید');
        }
        if (strtolower(pathinfo($file['name'], PATHINFO_EXTENSION)) !== 'xlsx') {
            return $this->generalError('فرمت فایل مجاز نیست. فقط فایل اکسل با پسوند xlsx قابل قبول است');
        }
        if ($file['size'] > self::MAX_FILE_SIZE) {
            return $this->generalError('حجم فایل نباید بیشتر از ۵ مگابایت باشد');
        }

        $keys = array_keys($this->columns);
        $columnsCount = count($keys);
        $rows = array();
        $errors = array();

        try {
            $reader = ReaderEntityFactory::createXLSXReader();
            $reader->open($file['tmp_name']);
        } catch (\Exception $e) {
            return $this->generalError('فایل اکسل قابل خواندن نیست. لطفا از سالم بودن فایل و ذخیره آن با فرمت xlsx اطمینان حاصل نمایید');
        }

        try {
            foreach ($reader->getSheetIterator() as $sheet) {
                $rowNumber = 0;
                foreach ($sheet->getRowIterator() as $row) {
                    $rowNumber++;

                    $values = array();
                    foreach ($row->getCells() as $cell) {
                        $values[] = $this->cellToString($cell->getValue());
                    }
                    // حذف ستون‌های خالی انتهای ردیف
                    while (!empty($values) && end($values) === '') {
                        array_pop($values);
                    }

                    if ($rowNumber === 1) {
                        $headerErrors = $this->checkHeader($values);
                        if (!empty($headerErrors)) {
                            $errors = $headerErrors;
                            break 2;
                        }
                        continue;
                    }

                    // ردیف کاملا خالی نادیده گرفته می‌شود
                    if (empty($values)) {
                        continue;
                    }

                    if (count($values) > $columnsCount) {
                        $errors[] = $this->rowError($rowNumber, '', array('این ردیف بیشتر از ' . $columnsCount . ' ستون دارد. اطلاعات اضافه را از ستون های بعد از «' . $this->columns[end($keys)]['title'] . '» حذف نمایید'));
                        continue;
                    }

                    $rows[$rowNumber] = array_combine($keys, array_pad($values, $columnsCount, ''));

                    if (count($rows) > self::MAX_ROWS) {
                        $errors = array($this->rowError(0, '', array('حداکثر ' . self::MAX_ROWS . ' مسافر در هر فایل مجاز است. لطفا فایل را به چند فایل کوچکتر تقسیم نمایید')));
                        break 2;
                    }
                }
                // فقط اولین شیت خوانده می‌شود
                break;
            }
        } catch (\Exception $e) {
            $errors = array($this->rowError(0, '', array('خطا در خواندن محتوای فایل اکسل. لطفا فایل را بررسی نمایید')));
        }
        $reader->close();

        if (empty($errors) && empty($rows)) {
            return $this->generalError('فایل اکسل هیچ ردیف اطلاعاتی ندارد. اطلاعات مسافران باید از ردیف دوم (بعد از ردیف عنوان ستون ها) وارد شود');
        }

        return array('errors' => $errors, 'rows' => $rows);
    }

    private function checkHeader($values) {
        $expected = array();
        foreach ($this->columns as $column) {
            $expected[] = $column['title'];
        }

        $problems = array();
        if (count($values) !== count($expected)) {
            $problems[] = 'تعداد ستون های ردیف عنوان ' . count($values) . ' است اما باید دقیقا ' . count($expected) . ' ستون باشد';
        }
        foreach ($expected as $index => $title) {
            $actual = isset($values[$index]) ? $values[$index] : '';
            if ($this->normalizeTitle($actual) !== $this->normalizeTitle($title)) {
                $problems[] = 'ستون ' . ($index + 1) . ' باید «' . $title . '» باشد' . ($actual !== '' ? ' اما «' . $actual . '» است' : ' اما خالی است');
            }
        }

        if (empty($problems)) {
            return array();
        }
        array_unshift($problems, 'ساختار ستون های فایل با قالب مورد انتظار مطابقت ندارد. لطفا از فایل نمونه استفاده نمایید');
        return array($this->rowError(1, 'ردیف عنوان ستون ها', $problems));
    }

    private function normalizeTitle($title) {
        $title = str_replace(array('ي', 'ك', "\xE2\x80\x8C"), array('ی', 'ک', ' '), $title);
        return preg_replace('/\s+/u', ' ', trim($title));
    }

    private function cellToString($value) {
        if ($value instanceof \DateTimeInterface) {
            return $value->format('Y-m-d');
        }
        if (is_bool($value)) {
            return $value ? '1' : '0';
        }
        if (is_float($value) && floor($value) == $value) {
            $value = sprintf('%.0f', $value);
        }

        $value = functions::convertNumberOFPersianToLatin((string)$value);
        // حذف کاراکترهای نامرئی جهت متن
        $value = preg_replace('/[\x{200E}\x{200F}\x{202A}-\x{202E}\x{FEFF}]/u', '', $value);
        return trim(preg_replace('/[ \t\r\n]+/u', ' ', $value));
    }

    #endregion

    #region helpers

    /**
     * کانتر باید وجود داشته باشد و در صورت ورود همکار، زیرمجموعه همان همکار باشد
     */
    private function findAccessibleCounter($counterId) {
        $isAdmin = Session::adminIsLogin();
        if (!$isAdmin && !Session::CheckAgencyPartnerLoginToAdmin()) {
            return false;
        }
        if (!ctype_digit((string)$counterId)) {
            return false;
        }

        $counter = $this->getModel('membersModel')->get(array('id', 'fk_agency_id'))
            ->where('id', $counterId)
            ->where('del', 'no')
            ->find();
        if (!$counter) {
            return false;
        }
        if (!$isAdmin && $counter['fk_agency_id'] != Session::getAgencyId()) {
            return false;
        }

        return $counter;
    }

    private function buildPreview($rows) {
        $preview = array();
        foreach ($rows as $row) {
            $data = $row['preview'];
            $preview[] = array(
                'row'         => $row['row'],
                'name'        => $data['name'] . ' ' . $data['family'],
                'name_en'     => trim($data['name_en'] . ' ' . $data['family_en']),
                'nationality' => $data['is_foreign'] ? 'خارجی' : 'ایرانی',
                'code'        => $data['is_foreign'] ? $data['passport_number'] : $data['national_code'],
                'birthday'    => $data['is_foreign'] ? $data['birthday_en'] : str_replace('-', '/', $data['birthday_fa']),
                'mobile'      => $data['mobile'],
                'email'       => $data['email'],
                'credit'      => $data['credit'] > 0 ? number_format($data['credit']) : '',
            );
        }
        return $preview;
    }

    /**
     * اطلاعات ثبت کننده اعتبار، مشابه فیلدهای مخفی فرم usersWalletAdd
     */
    private function getWalletAdminInfo() {
        Session::init();
        if (defined('TYPE_ADMIN') && TYPE_ADMIN == '1') {
            return array('type_admin' => '1', 'adminId' => 'iranTech', 'typeAgency' => 'iranTech');
        }
        if (isset($_SESSION['AgencyPartner']) && $_SESSION['AgencyPartner'] == 'AgencyHasLogin') {
            return array('type_admin' => '2', 'adminId' => $_SESSION['memberIdCounterInAdmin'], 'typeAgency' => 'AgencyPartner');
        }
        return array('type_admin' => '2', 'adminId' => CLIENT_ID, 'typeAgency' => 'agency');
    }

    private function rowError($rowNumber, $name, $messages) {
        return array('row' => $rowNumber, 'name' => $name, 'messages' => $messages);
    }

    private function generalError($message) {
        return array('errors' => array($this->rowError(0, '', array($message))), 'rows' => array());
    }

    private function response($success, $message, $data = array()) {
        return functions::toJson(array(
            'success' => $success,
            'message' => $message,
            'data'    => $data,
        ));
    }

    #endregion
}
