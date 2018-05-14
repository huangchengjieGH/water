<?php

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\service\IncomeService;
class Distribution extends BaseController
{

    public function calculateIncome(){
        //获取用户信息
        $data = $this->getUid();
        $post = input('post.');
        $IncomeService = new IncomeService();
        $msg = $IncomeService->calculateIncome($data->user_id,$post['orderId']);
        return $msg;
    }

    public function distriIncome(){
        //获取用户信息
        $data = $this->getUid();
        $post = input('post.');
        $IncomeService = new IncomeService();
        $msg = $IncomeService->distriIncome($data->user_id,$post['orderId']);
        return $msg;
    }

    public function userIncome(){
        //获取用户信息
        $data = $this->getUid();
        $IncomeService = new IncomeService();
        $msg = $IncomeService->userIncome($data->user_id);
        return $msg;
    }

//    public function withdrawed(){
//        //获取用户信息
//        $data = $this->getUid();
//        $IncomeService = new IncomeService();
//        $msg = $IncomeService->withdrawed($data->user_id);
//        return $msg;
//    }
//
//    public function withdrawing(){
//        //获取用户信息
//        $data = $this->getUid();
//        $IncomeService = new IncomeService();
//        $msg = $IncomeService->withdrawing($data->user_id);
//        return $msg;
//    }
}