<?php

use app\Classes;

class AdsCampaign extends Page {

    private $AdsCampaignDataPage;
    private $id;

    function initialize()
    {
        $this->AdsCampaignDataPage=$this->getClassData(get_class($this));
        $this->id=$this->getParams();
        if (empty($id)) $this->redirect('Auth','index');
        $this->AdsCampaignDataPage['data']=$this->getDataCampaign($this->id);
        $this->initDataPage($this->AdsCampaignDataPage);
    }

    function edit()
    {
        $this->initialize();
    }

    function getDataCampaign(int $id)
    {
        $sql='SELECT * FROM ads_campaign WHERE ads_room_id=?';
        $res=$this->db->GetRows($sql,[$id]);
        $res=array_map(function($value){
            if(is_string($value)){
                return stripslashes($value);
            }
            return $value;
        }, $res);
        return $res;
    }

}