<?php

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\service\WithdrawService;

class Withdraw extends BaseController{

    public function Withdraw(){
        //获取用户信息
//        $data = $this->getUid();
//        $post = input('post.');
        $WithdrawService = new WithdrawService();
        $msg = $WithdrawService->getpublickey();
        return $msg;
    }
}

