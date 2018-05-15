<?php

namespace app\api\model;
use think\Model;

class Province extends Model{
    public  static  function getProvince(){
        $province = self::where('status','=',1)
            ->select();
        return $province;
    }
}