<?php
/**
 * Created by PhpStorm.
 * User: THINK
 * Date: 2018/3/16
 * Time: 14:29
 */

namespace app\api\model;

use think\Model;

class Shoperinfo extends Model
{
    // 根据用户ID获取骑手信息
    public static function getByUserID($user_id){
        $shoper = self::where('user_id','=',$user_id)
            ->find();
        return $shoper;
    }

    public static function getAllByShopID($shop_id){

        $shopers = self::where('shop_id','=',$shop_id)

            ->select();

        return $shopers;
    }
}