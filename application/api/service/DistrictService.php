<?php
namespace app\api\service;
use app\api\model\City;
use app\api\model\Province;
use think\Db;

class DistrictService{

    public function getDistrict()
    {

        $province = Province::getProvince();
        foreach($province as $k=>$v) {
            $city = City::getCityByproCode($v->proCode);
//            $cityList = array($city);
            $areaList[] = array('province' => $v->province, 'proCode' => $v->proCode, 'cities' => $city);
        }

        return show(200, '获取数据成功', $areaList);
    }

}