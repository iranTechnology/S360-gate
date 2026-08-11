<?php
/**
 * Class ModelCore
 *
 * این کلاس برای اتصال به دیتابیس اصلی و جداول core استفاده می‌شود
 *
 * @property string $table
 * @property integer $pk
 * @property string $logName
 */
class ModelCore extends Model {

    private $_pdo_core;
    private $_is_core_connected = false;

    private $_core_db_config = [
        'host' => 'localhost',
        'dbname' => 'safar360_coreapi',
        'username' => 'safar360',
        'password' => 'GW@!pvGOZ$h9Mk[JdoU'
    ];

    function __construct() {
        // فراخوانی سازنده والد
        parent::__construct();

        // اتصال به دیتابیس core
        $this->connectToCoreDB();
    }

    /**
     * اتصال به دیتابیس core
     */
    private function connectToCoreDB() {
        try {

            $dsn = "mysql:host={$this->_core_db_config['host']};dbname={$this->_core_db_config['dbname']};charset=utf8";
            functions::insertLog('data: ' . json_encode($this->_core_db_config['dbname']) , 'shojaee');
            $this->_pdo_core = new PDO(
                $dsn,
                $this->_core_db_config['username'],
                $this->_core_db_config['password'],
                [
                    PDO::ATTR_PERSISTENT => DB_PERSISTENCY,
                    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
                ]
            );

            $this->_pdo_core->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->_pdo_core->exec("set session sql_mode = ''");

            $this->_is_core_connected = true;

            functions::insertLog("Connected to Core Database: " . $this->_core_db_config['dbname'], 'model_core_connection');

        } catch (PDOException $e) {
            $this->_is_core_connected = false;
            functions::insertLog("Core Database Connection Error: " . $e->getMessage(), 'model_core_error');
            trigger_error("Core DB Connection failed: " . $e->getMessage(), E_USER_WARNING);
        }
    }

    /**
     * اجرای کوئری روی دیتابیس core
     *
     * @param string $sql
     * @param string $fetchType
     * @return array
     */
    public function selectCore($sql = '', $fetchType = '') {
        if (!$this->_is_core_connected) {
            functions::insertLog("Core DB not connected", 'model_core_error');
            return [];
        }

        if ($fetchType != '' && $fetchType == 'num') {
            $fetchType = PDO::FETCH_NUM;
        } elseif ($fetchType != '' && $fetchType == 'col') {
            $fetchType = PDO::FETCH_COLUMN;
        } else {
            $fetchType = PDO::FETCH_ASSOC;
        }

        $this->_query = $sql;
        $prepared = $this->_pdo_core->prepare($this->_query);
        $prepared->execute();
        return $prepared->fetchAll($fetchType);
    }

    /**
     * بارگذاری یک رکورد از دیتابیس core
     *
     * @param string $sql
     * @return mixed
     */
    public function loadCore($sql = '') {
        if (!$this->_is_core_connected) {
            functions::insertLog("Core DB not connected", 'model_core_error');
            return false;
        }

        $this->_query = $sql;
        $prepared = $this->_pdo_core->prepare($this->_query);
        $prepared->execute();
        return $prepared->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * درج داده در دیتابیس core
     *
     * @param array $data
     * @param string $table
     * @return bool|string
     */
    public function insertCore($data = [], $table = '') {
        if (!$this->_is_core_connected) {
            functions::insertLog("Core DB not connected", 'model_core_error');
            return false;
        }

        if (empty($table)) {
            $table = $this->table;
        }

        $cols = array_keys($data);
        $vals = array_values($data);
        $imp1 = implode(",", $cols);
        $imp2 = implode(",", $vals);

        $this->_query = "INSERT INTO " . $table . " ( " . $imp1 . " ) VALUES ( " . $imp2 . " ) ";

        try {
            $return = $this->_pdo_core->exec($this->_query);
            functions::insertLog("Core Insert: " . $this->_query, 'model_core_insert');
            return (boolean) $return;
        } catch (PDOException $e) {
            functions::insertLog("Core Insert Error: " . $e->getMessage(), 'model_core_error');
            trigger_error($e->getMessage(), E_USER_ERROR);
            return false;
        }
    }

    /**
     * به‌روزرسانی داده در دیتابیس core
     *
     * @param array $data
     * @param string $condition
     * @param string $table
     * @return bool
     */
    public function updateCore($data = [], $condition = '', $table = '') {
        if (!$this->_is_core_connected) {
            functions::insertLog("Core DB not connected", 'model_core_error');
            return false;
        }

        if (empty($table)) {
            $table = $this->table;
        }

        $s = "";
        foreach ($data as $col => $val) {
            if ($s != "") {
                $s .= ",";
            }
            $s .= ("`" . $col . "`" . " = '" . $val . "'");
        }

        $this->_query = 'UPDATE ' . $table . ' SET ' . $s . ($condition != '' ? ' WHERE ' . $condition : '');

        try {
            $sql = $this->_pdo_core->prepare($this->_query);
            $return = $sql->execute();
            functions::insertLog("Core Update: " . $this->_query, 'model_core_update');
            return $return;
        } catch (PDOException $e) {
            functions::insertLog("Core Update Error: " . $e->getMessage(), 'model_core_error');
            trigger_error($e->getMessage(), E_USER_ERROR);
            return false;
        }
    }

    /**
     * حذف از دیتابیس core
     *
     * @param string $condition
     * @param string $table
     * @return bool
     */
    public function deleteCore($condition = '', $table = '') {
        if (!$this->_is_core_connected) {
            functions::insertLog("Core DB not connected", 'model_core_error');
            return false;
        }

        if (empty($table)) {
            $table = $this->table;
        }

        $this->_query = "DELETE FROM " . $table . " WHERE " . $condition;

        try {
            $delete = $this->_pdo_core->exec($this->_query);
            functions::insertLog("Core Delete: " . $this->_query, 'model_core_delete');
            return (boolean) $delete;
        } catch (PDOException $e) {
            functions::insertLog("Core Delete Error: " . $e->getMessage(), 'model_core_error');
            trigger_error($e->getMessage(), E_USER_ERROR);
            return false;
        }
    }

    /**
     * اجرای کوئری خام روی دیتابیس core
     *
     * @param string $query
     * @return bool
     */
    public function execCore($query = '') {
        if (!$this->_is_core_connected) {
            functions::insertLog("Core DB not connected", 'model_core_error');
            return false;
        }

        try {
            $return = $this->_pdo_core->exec($query);
            functions::insertLog("Core Exec: " . $query, 'model_core_exec');
            return (boolean) $return;
        } catch (PDOException $e) {
            functions::insertLog("Core Exec Error: " . $e->getMessage(), 'model_core_error');
            trigger_error($e->getMessage(), E_USER_ERROR);
            return false;
        }
    }

    /**
     * دریافت آخرین ID درج شده در دیتابیس core
     *
     * @return string
     */
    public function getCoreLastId() {
        if (!$this->_is_core_connected) {
            return false;
        }
        return $this->_pdo_core->lastInsertId();
    }

    /**
     * بررسی وجود فیلد در جدول دیتابیس core
     *
     * @param string $field
     * @param string $table
     * @return bool
     */
    public function existFieldCore($field, $table = '') {
        if (!$this->_is_core_connected) {
            return false;
        }

        if (empty($table)) {
            $table = $this->table;
        }

        $this->_query = "SHOW COLUMNS FROM `{$table}` WHERE FIELD='{$field}'";
        $prepared = $this->_pdo_core->prepare($this->_query);
        $prepared->execute();
        $data = $prepared->fetch(PDO::FETCH_ASSOC);

        return (boolean) $data;
    }

    /**
     * شروع تراکنش در دیتابیس core
     */
    public function beginCoreTransaction() {
        if ($this->_is_core_connected) {
            return $this->_pdo_core->beginTransaction();
        }
        return false;
    }

    /**
     * کامیت تراکنش در دیتابیس core
     */
    public function commitCoreTransaction() {
        if ($this->_is_core_connected) {
            return $this->_pdo_core->commit();
        }
        return false;
    }

    /**
     * رول‌بک تراکنش در دیتابیس core
     */
    public function rollbackCoreTransaction() {
        if ($this->_is_core_connected) {
            return $this->_pdo_core->rollBack();
        }
        return false;
    }

    /**
     * دریافت شیء PDO دیتابیس core
     */
    public function getCorePDO() {
        return $this->_pdo_core;
    }

    /**
     * بررسی وضعیت اتصال به دیتابیس core
     */
    public function isCoreConnected() {
        return $this->_is_core_connected;
    }

    /**
     * تنظیم پیکربندی دیتابیس core
     */
    public function setCoreConfig($host, $dbname, $username, $password) {
        $this->_core_db_config = [
            'host' => $host,
            'dbname' => $dbname,
            'username' => $username,
            'password' => $password
        ];
        // reconnect with new config
        $this->connectToCoreDB();
        return $this;
    }
}