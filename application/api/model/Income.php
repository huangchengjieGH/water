<?php
namespace app\api\model;

use think\Model;
use think\Db;
class Income extends Model{
    public static function totalIncome($user_id){
        $totalIncome = self::where(['enjoyId'=>$user_id])
            ->sum('income');
        return $totalIncome;

    }

    public static function withdrawed($user_id){
        $income = self::where(['enjoyId'=>$user_id,'status'=> 0])
            ->sum('income');
        return $income;

    }

    public static function withdrawing($user_id){
        $income = self::where(['enjoyId'=>$user_id,'status'=> 1])
            ->sum('income');
        return $income;

    }
    public static function changeUserIncomeStatus($user_id){
//        $sql = "select count(*) as count from sbw_relation  where originId in (select customerId from sbw_income where enjoyId = {$user_id})";
//        $count = Db::query($sql);
        $count = Db::table('sbw_income')->where('enjoyId', $user_id)->update(['status' => 0]);
        return $count;

    }
}