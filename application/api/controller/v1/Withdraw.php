<?php

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\service\WithdrawService;

class Withdraw extends BaseController{

    public function Withdraw(){
        //获取用户信息
//        $data = $this->getUid();
//        $bankNo,$trueName ,$code,$money
        $post = input('post.');
        $WithdrawService = new WithdrawService();

//        echo $post['bankNo'];
        echo $post['trueName'];
        echo $post['code'];
        echo $post['money'];
//        $msg = $WithdrawService->withdraw($post['bankNo'],$post['trueName'],$post['code'],$post['money']);
//        return $msg;
    }
}

