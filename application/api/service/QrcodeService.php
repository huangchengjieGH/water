<?php

namespace app\api\service;

use app\api\model\Qrcode;
class QrcodeService{
    public function qrcode($userId)
    {
        /*生成二维码*/
        //获取用户信息
        $count = Qrcode::CheckUserQrcode($userId);
//        $count = model('qrcode')->where(['ownerID'=>$userId])->count();
        if (!$count){
            vendor("phpqrcode.phpqrcode");
        $data = 'http://cilong.wjjcypt.cn/qrcode?userId='.$userId;
        $level = 'L';// 纠错级别：L、M、Q、H
        $size = 4;// 点的大小：1到10,用于手机端4就可以了
        $QRcode = new \QRcode();
        ob_start();
        $QRcode->png($data, false, $level, $size, 2);
        $imageString = base64_encode(ob_get_contents());
        ob_end_clean();
        $save_data['ownerID'] = $userId;
        $save_data['url'] = "data:image/jpg;base64," . $imageString;
        $save_data['builddate'] = time();

        model('Qrcode')->startTrans();
        $res = model('Qrcode')->save($save_data);
        if ($res) {
            model('Qrcode')->commit();
            return show(200, '生成二维码成功', $save_data);
        } else {
            model('Qrcode')->rollback();
            return show(201, '生成二维码失败', $save_data);
        }
    }else {
            $data = Qrcode::findUserQrcode($userId);
            return show(202, '已经是经销商', $data);
        }

    }

    public function generateQrcode($userId)
    {
        /*生成二维码*/
        //获取用户信息
        $count = Qrcode::CheckUserQrcode($userId);
//        $userId = 113;
//        $count = 0;
        if (!$count){
            vendor("phpqrcode.phpqrcode");
            $data = 'http://cilong.wjjcypt.cn/qrcode?userId='.$userId;
            $level = 'L';// 纠错级别：L、M、Q、H
            $size = 4;// 点的大小：1到10,用于手机端4就可以了
            $QRcode = new \QRcode();
            ob_start();
            $QRcode->png($data, false, $level, $size, 2);
            $imageString = base64_encode(ob_get_contents());
            ob_end_clean();

//            return show(202, '已经是经销商', $test);

            $save_data['ownerID'] = $userId;
            $save_data['url'] = "data:image/jpg;base64," . $imageString;
            $save_data['builddate'] = time();

            model('Qrcode')->startTrans();
            $res = model('Qrcode')->save($save_data);
            if ($res) {
                model('Qrcode')->commit();
                $QRcode::png($data, false, $level, $size);
//                return show(200, '生成二维码成功', $save_data);
            } else {
                model('Qrcode')->rollback();
                return show(201, '生成二维码失败', $save_data);
            }
        }else {
            $data = Qrcode::findUserQrcode($userId);
            echo $data->url;
        }

    }

    public  function findqrcode($userId){
        $code = Qrcode::findUserQrcode($userId);
        if($code != null){
            return show(200, '已经是经销商', $code);
        }else{
            return show(201, '不是经销商', $code);
        }
    }
}