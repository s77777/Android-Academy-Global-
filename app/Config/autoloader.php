<?php

spl_autoload_register(function($classes){
    $classes = str_replace('\\', '/', $classes);
    $classes = str_replace('..', '', $classes);
    $filename = APP_PATH_CLASSES.$classes . '.php';
    $file = $filename;
    if (false == file_exists($file)) {
        header('Location:'.$_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME'].'/Index/error');
    }
    require ($file);
});