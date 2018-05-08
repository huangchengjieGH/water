<?php
/**
 * Created by PhpStorm.
 * User: THINK
 * Date: 2018/3/16
 * Time: 14:29
 */

namespace app\api\model;

use think\Model;

class ShopProductAccess extends Model
{
    // 根据用户ID获取骑手信息
    public static function getProduct($product_id){
        $product_id = self::where('product_id','=',$product_id)
            ->find();
        return $product_id;
    }

}