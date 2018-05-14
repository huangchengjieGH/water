<?php
namespace app\api\model;


use think\Model;

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
}