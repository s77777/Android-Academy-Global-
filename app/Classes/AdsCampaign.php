<?php

namespace app\Classes;

class AdsCampaign extends Page {

    private $AdsCampaignDataPage;
    private $id;

    function initialize()
    {
        $this->AdsCampaignDataPage=$this->getClassData(get_class($this));
        $this->id=$this->getParams();
        if (empty($this->id)) $this->redirect('Auth','index');
        $this->AdsCampaignDataPage['data']=$this->getDataCampaign($this->id);
        $this->initDataPage($this->AdsCampaignDataPage);
    }

    function edit()
    {
        $this->initialize();
    }

    function getDataCampaign(int $id)
    {
        $sql='SELECT ac.*,ar.ads_room_name FROM ads_campaign ac '.
             'INNER  JOIN ads_rooms ar ON ar.id=ac.ads_room_id '.
             'WHERE ac.ads_room_id=?';
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