<?php

if ($_SERVER['SERVER_NAME']=='test.local')
{
    error_reporting(E_ALL);ini_set('display_errors', TRUE);ini_set('display_startup_errors', TRUE);
}
else
{
    error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_PARSE);ini_set('display_errors', FALSE);ini_set('display_startup_errors', FALSE);
}

use app\Classes as csl;

try
{
    define('APP_PATH', realpath('..') . '/');
    define('APP_PATH_CONF', APP_PATH . 'app/Config/');
    define('APP_PATH_CLASSES', APP_PATH);
    define('APP_PATH_VIEWS', APP_PATH . 'app/Views/');
    define('APP_PATH_DATA', APP_PATH . 'app/DataPage/');
    define('APP_PATH_UPLOAD', APP_PATH . 'app/Upload/');
    define('SERVER_NAME', $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME']);
    require APP_PATH_CONF . 'autoloader.php';
    $config=require APP_PATH_CONF . 'config.php';
    $db=new csl\Db($config);
    $p = new csl\Page($db);
    $p->getContent();
}
catch (\Exception $e)
{
    error_log('Error - '.$e->getMessage()."\n".'Line: '.$e->getLine()."\n".'File: '.$e->getFile());
}
