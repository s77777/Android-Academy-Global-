<?php

namespace app\Classes;

class AdsRoom extends Page {
    
    private $AdsRoomDataPage;
    private $id;
    function initialize()
    {
        $this->AdsRoomDataPage=$this->getClassData(get_class($this));
        $this->id=$this->getParams();
        if (empty($this->id)) $this->redirect('Auth','index');
        $this->AdsCampaignDataPage['data']=$this->getDataRoom($this->id);
        $this->initDataPage($this->AdsRoomDataPage);
    }

    function edit() {
        $this->initialize();
    }

    function getDataRoom(int $id)
    {
        $sql='SELECT * FROM ads_rooms WHERE id=?';
        $res=$this->db->GetRow($sql,[$id]);
        $res=array_map(function($value){
            if(is_string($value)){
                return stripslashes($value);
            }
            return $value;
        }, $res);
        return $res;
    }
}