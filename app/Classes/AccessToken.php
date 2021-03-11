<?php

namespace app\Classes;

class AccessToken extends Page {

     private $AccessTokenPageData;

    function initialize()
    {
        $this->AccessTokenPageData=$this->getClassData(get_class($this));
        $id=$this->getParams();
        if (empty($id)) $this->redirect('Auth','index');
        $this->initDataPage($this->AccessTokenPageData);
    }

    function authorization()
    {
        $this->SetViewDisable();
        $params=$this->getPostData();
        $res=RestApiVk::Authorization($params);
    }
}
