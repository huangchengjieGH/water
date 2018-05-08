<?php
/**
 * Created by PhpStorm.
 * User: THINK
 * Date: 2018/4/17
 * Time: 17:52
 */

namespace app\api\model;


use think\Model;

class DepositOrder extends Model
{
    protected $autoWriteTimestamp = true;
    protected $createTime = 'o_builddate';

    // 根据 全局用户ID 和押金类型 查询是否交了押金,
    // 返回相应的订单数据
    public static function getByUserID($user_id,$type){
        $desopit = self::where('user_id',$user_id)
            ->where('type',$type)
            ->find();
        return $desopit;
    }
}