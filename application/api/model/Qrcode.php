<?php

namespace app\api\model;
use think\Model;
class Qrcode extends Model{
    public static function CheckUserQrcode($user_id){
        $count = self::where(['ownerID'=>$user_id,'status'=>1])
            ->count();
        return $count;

    }

    public static function findUserQrcode($user_id){
        $code = self::where(['ownerID'=>$user_id,'status'=>1])
            ->find();

        return $code;

    }
}