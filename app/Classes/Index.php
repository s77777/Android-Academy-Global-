<?php

namespace app\Classes;

class Index extends Page {

    private $IndexPageData;

    function initialize()
    {
        $this->IndexPageData=$this->getClassData(get_class($this));
        $id=$this->getParams();
        if (empty($id)) $id=$_SESSION['id'];
        $this->IndexPageData['data']= $this->getDataUser($id);
        $this->IndexPageData['ads_rooms']= $this->getListAdsRooms($id);
        $this->initDataPage($this->IndexPageData);
    }

    function getDataUser(int $id)
    {
        $sql='SELECT users.* FROM users WHERE id=?';
        $res=$this->db->GetRow($sql,[$id]);
        $res=array_map(function($value){
            if(is_string($value)){
                return stripslashes($value);
            }
            return $value;
        }, $res);
        if (!$res['access_token']) $this->redirect('AccessToken','index',$id);
        return $res;
    }

    function getListAdsRooms(int $id)
    {
        $sql='SELECT * FROM ads_rooms WHERE userid=?';
        $res=$this->db->GetRows($sql,[$id]);
        $res=array_map(function($value){
            if(is_string($value)){
                return stripslashes($value);
            }
            return $value;
        }, $res);
        return $res;
    }
    
    function updateDataUser()
    {
        $this->SetViewDisable();
        if ($_SESSION['secret']==md5($this->secret.$_COOKIE['PHPSESSID'])) {
            $data=$this->getPostData();
            $set=[];
            foreach ($data as $key=>$val) {
                $set[]=$key.'=:'.$key;
            }
            $sql='UPDATE users SET '.implode(',',$set).' WHERE id=:id';
            $this->db->InsertUpdateData($sql,$data);
            $this->redirect('Index','index',$data['id']);
        } else {
            $this->redirect('Auth','loginform',$data['id']);
        }

    }

    function error()
    {
        $this->initialize();
    }
}
