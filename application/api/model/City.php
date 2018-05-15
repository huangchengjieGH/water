<?php

namespace app\api\model;
use think\Model;

class City extends Model{
    public  static  function getCityByproCode($proCode){
        $city = self::where('proCode','=',$proCode)
            ->select();
        return $city;
    }
}