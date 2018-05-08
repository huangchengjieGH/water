<?php/* *退款 */namespace app\api\controller\v1;use app\api\controller\BaseController;use app\api\controller\WinXinRefund;use app\api\model\RefundOrder;use app\api\model\User;use app\api\model\Userinfo;use app\api\model\Shop;//use think\Cache;class Refund extends BaseController{    //申请    public function applyRefundFre()    {        //return Cache::get ('008a20739bd1c3193d7ab97e341378c0');        //获取用户信息        $User = $this->getUid ();        //获取当前用户        $UserInfo = User::get ($User->user_id)->getUserInfo;        if ($User->user_role == 1) {//普通用户            if ($UserInfo->is_business == 1) {//企业                $type = 2;            } else if ($UserInfo->is_business == 0) {//个人                $type = 1;            } else {//default                //halt("h2");                return show (901, '查找不到对应的订单');            }        } else if ($User->user_role == 3) {//水店            $type = 3;        } else {            //halt("h3");            return show (901, '查找不到对应的订单');        }        //获取对应押金订单        $RefundOrder = RefundOrder::getByUserID($User->user_id, $type);        //halt("h4");        if (!$RefundOrder) {            return show (901, '查找不到对应的订单');        }else if($RefundOrder->status==1){            return show (902, '您已提交过审核，无需再提交！');        }        $apply = new RefundOrder();        $apply->save(['status'=>1],['order_id'=>$RefundOrder['order_id']]);        return show (900,'提交申请成功');    }    //同意退押金此处为后台处理    public function refundFre($id)    {        //权限后台处理        //.........        $RefundOrder = RefundOrder::get($id);        if($RefundOrder){            if($RefundOrder->status != 1){                return show(901,'退款状态错误');            }            $totalFee   =  floatval($RefundOrder->price*100);            $refundFee  =  floatval($RefundOrder->price*100);            $outTradeNo =  $RefundOrder->order_id;            $Refund = new WinXinRefund($totalFee,$refundFee,$outTradeNo);            $return = $Refund->refund();            //return $return;            if($return['return_code'] && $return['return_code']){                //更新数据                if($RefundOrder->type == 1){                    $Userinfo = new Userinfo();                    $Userinfo ->save(['user_fre'=>0],['user_id' =>$RefundOrder->user_id]);                }else if($RefundOrder->type == 2){                    $Userinfo = new Userinfo();                    $Userinfo ->save(['business_fre'=>0],['user_id' =>$RefundOrder->user_id]);                }else{                    $Shop = new Shop();                    $Shop ->save(['is_pay'=>0],['user_id' =>$RefundOrder->user_id]);                }                //更新退款订单                $RefundOrder = new RefundOrder();                $RefundOrder ->save(['status'=>2],['order_id'=>$outTradeNo]);                return show(900,'退款完成');            }else{                return show(902,'微信退款失败');            }        }else{            return show(903,'平台退款失败');        }    }}