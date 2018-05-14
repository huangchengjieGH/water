<?php

namespace app\api\model;
use think\Model;
use think\Db;
class Relation extends Model{
    public static function CheckRelation($user_id){
        $count = self::where('customerId','=',$user_id)
            ->count();
        return $count;

    }

    public static function findUserRelation($user_id){
        $relation = self::where(['customerId'=>$user_id,'status'=>1])
            ->find();

        return $relation;

    }

    public static function directCustomer($user_id){
        $count = self::where('originId','=',$user_id)
            ->count();
        return $count;

        return $count;

    }
    public static function indirectCustomer($user_id){
//        $count = Db::query("select count(*) from sbw_relation  where originId in (select customerId from sbw_relation where originId = ？)",[$user_id]);
        $sql = "select count(*) as count from sbw_relation  where originId in (select customerId from sbw_relation where originId = {$user_id})";
        $count = Db::query($sql);

//        $count = Db::table('Relation')
//            ->where('originId','IN',function($query){
//                $query->table('Relation')->where('originId',$user_id)->field('customerId');
//            })
//            ->select();
        return $count;

    }
}