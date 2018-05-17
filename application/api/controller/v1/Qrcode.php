<?php


namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\service\QrcodeService;
use app\api\service\RelationService;

class Qrcode extends BaseController
{
    public function qrcode(){
        //获取用户信息
        $data = $this->getUid();
        $QrcodeService = new QrcodeService();
        $msg = $QrcodeService->qrcode($data->user_id);
        return $msg;
    }
    public function generateQrcode(){
        //获取用户信息
        $data = $this->getUidByget();
        $QrcodeService = new QrcodeService();
        $msg = $QrcodeService->generateQrcode($data->user_id);
        return $msg;
    }
    public function buildRelation(){
        //获取用户信息
        $data = $this->getUid();
        $post = input('post.');
        $RelationService = new RelationService();
        $msg = $RelationService->buildRelation($data->user_id,$post['originId']);
        return $msg;
    }
    public function directCustomer(){
        //获取用户信息
        $data = $this->getUid();
        $RelationService = new RelationService();
        $msg = $RelationService->directCustomer($data->user_id);
        return $msg;
    }
    public function indirectCustomer(){
        //获取用户信息
        $data = $this->getUid();
        $RelationService = new RelationService();
        $msg = $RelationService->indirectCustomer($data->user_id);
        return $msg;
    }

    public function findqrcode(){
        //获取用户信息
        $data = $this->getUid();
        $QrcodeService = new QrcodeService();
        $msg = $QrcodeService->findqrcode($data->user_id);
        return $msg;
    }

    public function setProxy(){
        //获取用户信息
        $data = $this->getUid();
        $RelationService = new RelationService();
        $msg = $RelationService->setProxy($data->user_id);
        return $msg;
    }

}