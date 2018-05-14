<?php
namespace app\api\service;

use app\api\model\Income;
use app\api\model\Relation;
use app\api\model\Districommission;
class IncomeService{

    public function calculateIncome($userId,$orderId)
    {

        $levelOne = Relation::findUserRelation($userId);
        $levelTwo = Relation::findUserRelation($levelOne -> originId);

        $commissionOne = Districommission::findCommissionByLevel(Districommission::$levelOne);
        $commissionTwo = Districommission::findCommissionByLevel(Districommission::$levelTwo);

        if($levelOne != null){
            if($levelTwo != null){
                $dataList[] = array('orderId'=>$orderId,'enjoyId'=>$levelOne -> originId,'level'=> '1','income'=>$commissionOne->commission,'builddate'=>time());
                $dataList[] = array('orderId'=>$orderId,'enjoyId'=>$levelTwo -> originId,'level'=> '2','income'=>$commissionTwo->commission,'builddate'=>time());
            }else{
                $dataList[] = array('orderId'=>$orderId,'enjoyId'=>$levelOne -> originId,'level'=> '1','income'=>$commissionOne->commission,'builddate'=>time());
            }
            $insertOkInfo = db('Income')->insertAll($dataList);
        }else{
            return show(201, '没有上级经销商', $orderId);
        }

        if($insertOkInfo >0 ){
            return show(200, '订单收益分配成功', $orderId);
        }else{
            return show(200, '订单收益分配失败', $orderId);
        }

    }
    public function distriIncome($userId,$orderId)
    {

        $levelOne = Relation::findUserRelation($userId);
        $levelTwo = Relation::findUserRelation($levelOne -> originId);

        $commissionOne = Districommission::findCommissionByLevel(Districommission::$levelOne);
        $commissionTwo = Districommission::findCommissionByLevel(Districommission::$levelTwo);

        if($levelOne != null){
            if($levelTwo != null){
                $dataList[] = array('orderId'=>$orderId,'enjoyId'=>$levelOne -> originId,'level'=> '1','income'=>$commissionOne->income,'builddate'=>time());
                $dataList[] = array('orderId'=>$orderId,'enjoyId'=>$levelTwo -> originId,'level'=> '2','income'=>$commissionTwo->income,'builddate'=>time());
            }else{
                $dataList[] = array('orderId'=>$orderId,'enjoyId'=>$levelOne -> originId,'level'=> '1','income'=>$commissionOne->commission,'builddate'=>time());
            }
            $insertOkInfo = db('Income')->insertAll($dataList);
        }else{
            return show(201, '没有上级经销商', $userId);
        }

        if($insertOkInfo >0 ){
            return show(200, '订单收益分配成功', $orderId);
        }else{
            return show(200, '订单收益分配失败', $orderId);
        }

    }

    public function userIncome($userId)
    {

        $totalIncome = Income::totalIncome($userId);
        $withdrawed = Income::withdrawed($userId);
        $withdrawing = Income::withdrawing($userId);
        $income[] = array('totalIncome'=>$totalIncome,'withdrawed'=>$withdrawed,'withdrawing'=> $withdrawing);
        return show(200, '累计收益金额', $income);
    }

//    public function withdrawed($userId)
//    {
//
//        $withdrawed = Income::withdrawed($userId);
//
//        return show(200, '累计提现金额', $income);
//    }
//    public function withdrawing($userId)
//    {
//
//        $withdrawing = Income::withdrawing($userId);
//
//        return show(200, '可提现收益', $income);
//    }
}