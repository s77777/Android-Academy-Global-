<?php

namespace app\Classes;

/*
 @main class
*/

class Page {

    protected   $args = array();
    protected   $view=APP_PATH_VIEWS;
    protected   $DataPagePath=APP_PATH_DATA;
    protected   $params;
    protected   $db;
    public      $DataPage=array();
    protected   $settings=array();
    public      $ViewTemplate=true;
    protected   $Class;
    protected   $action;
    protected   $secret='$21@a0';

    function __construct($db,$params=null)
    {
        $this->db=$db;
        $this->params=$params;
        $this->args=$this->getUri();
        if (!$this->is_session_started()) session_start();
        $this->isLogin();
    }

    function getContent()
    {
        $this->Class=__NAMESPACE__ . '\\' .$this->args['class'];
        $this->method=(($this->args['method']=='index')?'initialize':$this->args['method']);
        $Class = new $this->Class($this->db,$this->args['params']);
        if (in_array($this->method,get_class_methods($this->Class)))
        {
            $data = $Class->{$this->method}();
            if ($Class->GetViewTemplate()){
                $DataPage=$Class->getDataPage();
                $DataPage['Class']=substr($this->Class, strrpos($this->Class, '\\')+1);
                $DataPage['method']=$this->method;
                $DataPage['Main']=include($this->DataPagePath.'/Main.php');
                require_once $this->view.$this->args['class'].'/'.$this->method.'.tpl';
            } else {
                header('Content-Type:application/json');
                echo json_encode($data);
            }
        }
        else
        {
            $this->redirect('Index','error');
        }
    }

    function getParams()
    {
      return ($this->params?$this->params[0]:null);
    }

    protected function forward($uri)
    {
        $uriParts = explode('/', trim($uri, '/\\'));
        $params = array_slice($uriParts, 2);
        return array(
                    'class' => (empty($uriParts[0]))?'Index':$uriParts[0],
                    'method' => (!empty($uriParts[1]))?$uriParts[1]:'initialize',
                    'params' => (!empty($params))?$params:null,
                );
    }

    protected function getUri()
    {
        $route = $_GET['_url'];
        return $this->forward(str_replace('.','',$route));
    }

    function setDataPage($name,$value)
    {
        $this->DataPage[$name] = $value;
    }

    function initDataPage($data)
    {
         foreach ($data as $key => $value) {
            $this->setDataPage($key, $value);
        }
    }

    function redirect(string $class, string $method=null, string $params=null)
    {
        $params=$class.($method?'/'.$method.($params?'/'.$params:''):'');
        header('Location:'.SERVER_NAME.'/'.$params);
    }

    function getDataPage()
    {
      return $this->DataPage;
    }

    function SetViewDisable()
    {
        $this->ViewTemplate=false;
    }

    function GetViewTemplate()
    {
        return $this->ViewTemplate;
    }

    function getClassData($classname)
    {
        $classname=substr($classname, strrpos($classname, '\\')+1);
        return include($this->DataPagePath.$classname.'DataPage.php');
    }

    function getPostDataJson()
    {
        $str = file_get_contents('php://input');
        $data=json_decode($str,true);
        return $data;
    }

    function getPostData()
    {
        $_POST = array_map(function($value){
            if(is_string($value)){
                return addcslashes($value,"\0..\37!@\177..\377");
            }
            return $value;
        }, $_POST);
        return $_POST;
    }

    function validateData($data)
    {
        if (is_array($data)) {
            return array_map(function($value){
                    if(is_string($value)){
                        return addcslashes($value,"\0..\37!@\177..\377");
                    }
                }, $data);
        } else {
            if(is_string($data)){
                return addcslashes($value,"\0..\37!@\177..\377");
            } else {
                return $value;
            }
        }
    }

    private function isLogin()
    {
        $allowed_method=array('register','login','loginform','adduser','getEmailAjax');
        $allowed_class=array('Auth');
        if (in_array($this->args['class'],$allowed_class) &&
                (in_array($this->args['method'],$allowed_method)))
        {
            return true;
        } else if (empty($_SESSION['secret'])) {
            $this->args['class']='Auth';
            $this->args['method']='loginform';
        } else if ($_SESSION['secret']!=md5('$21@a0'.$_COOKIE['PHPSESSID'])) {
            $this->args['class']='Auth';
            $this->args['method']='loginform';
        }
        else {
            return true;
        }
    }

    function is_session_started()
    {
        return session_status() === PHP_SESSION_ACTIVE ? true : false;
    }

    function SessionStart() {
        $params = session_get_cookie_params();
        setcookie("PHPSESSID", session_id(), 0, $params["path"], $params["domain"], false, true );
    }

    function SessionDestroy()
    {
        session_destroy();
    }
}
