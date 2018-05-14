<?php
namespace app\api\service;

use app\api\model\Order;
use think\Db;
class OrderService{
    public function changeOrderStastus($orderId,$status,$note)
    {

//        $order = Order::getPayOrder($orderId);
//
//
//        $order['order_status'] = $status;
//        $order['note'] = $note;

        model('Order')->startTrans();
//        $res = model('Order')->where(['orderId'=> $orderId])->update($order);
        $res = Db::table('sbw_order')->where('order_id', $orderId)->update(['order_status' => $status,'note' => $note]);
        if ($res > 0) {
            model('Order')->commit();
            return show(200, '更新数据成功', $orderId);
        } else {
            model('Order')->rollback();
            return show(201, '更新数据失败', $orderId);
        }
    }
}