<?php

namespace app\api\model;


use think\Model;

class Districommission extends Model{
    public static $levelOne = 1;
    public static $levelTwo = 2;
    public static function findCommissionByLevel($level){
        $commission = self::where(['level'=>$level])
            ->find();
        return $commission;
    }

}