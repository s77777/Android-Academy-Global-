<?php
namespace app\Classes;
use \PDO;

class Db {

    private static $db;

    public function __construct($conf)
    {
        if (null === self::$db)
        {
            $conn = "mysql:host=" . $conf['host'] . ";dbname=" . $conf['dbname'];
            try
            {
               self::$db = new PDO($conn, $conf['username'], $conf['password'],array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES '.$conf['charset']));
               self::$db->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
            }
            catch (PDOException $e )
            {
                die ( $e->getMessage().$this->errMsg($e));
            }
        }
        return self::$db;
    }

    public function GetRows($sql,$data,$type=PDO::FETCH_ASSOC)
    {
        try
        {
            $res = self::$db->prepare($sql);
            $res->execute($data);
            $results = $res->fetchAll($type);
            $res->closeCursor();
            return $results;
        }
         catch ( Exception $e )
        {
                die ( $e->getMessage().'**GetRows');
        }
    }

    public function GetRow($sql,$data,$type=PDO::FETCH_ASSOC)
    {
        try
        {
            $res = self::$db->prepare($sql);
            $res->execute($data);
            $results = $res->fetch($type);
            $res->closeCursor();
            return $results;
        }
        catch ( Exception $e )
        {
                die ( $e->getMessage().'**GetOnceRow'.$this->errMsg($e));
        }

    }

    public function InsertUpdateData($sql,$data)
    {
        try
        {
            $res = self::$db->prepare($sql);
            $res->execute($data);
            $lastid=self::$db->lastInsertId();
            if($res && ($res->rowCount()>0)) return (object) array('count'=>$res->rowCount(),'lastid'=>$lastid); else return false;
        }
         catch ( Exception $e )
        {
            die ( $e->getMessage().'**Insert Update'.$this->errMsg($e));
        }

    }

    private function errMsg($e)
    {
        return '***Line:'."\n".$e->getLine()."\n File:".$e->getFile();
    }
}
