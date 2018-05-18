<?php

namespace app\api\service;
use app\api\model\Relation;
use think\Db;
class RelationService{
    public function buildRelation($userId,$originId)
    {


        return show(201, '更新数据失败', "系统在维护中，请稍厚再注册，谢谢");
        $count = Relation::CheckRelation($userId);
        $relation = Relation::findUserRelation($userId);

        $save_data['originId'] = $originId;
        $save_data['customerId'] = $userId;
        $save_data['builddate'] = time();


        model('Relation')->startTrans();
        if (!$count){
          $res = model('Relation')->save($save_data);
        }else{
            if($relation -> ifproxy == 1){
                return show(201, '已经是经销商', $relation);
            }else{
                $res = model('Relation')->where(['customerId'=> $userId])->update($save_data);
            }
        }
        if ($res) {
            model('Relation')->commit();
            return show(200, '关系建立成功', $save_data);
        } else {
            model('Relation')->rollback();
            return show(201, '关系建立失败', $save_data);
        }
    }

    public function setProxy($userId)
    {
        model('Relation')->startTrans();
        $res = Db::table('sbw_relation')->where('customerId', $userId)->update(['ifproxy' => 1]);
        if ($res > 0) {
            model('Relation')->commit();
            return show(200, '更新数据成功', $userId);
        } else {
            model('Relation')->rollback();
            return show(201, '更新数据失败', $userId);
        }
    }

    public function directCustomer($userId)
    {
        $count = Relation::directCustomer($userId);
        return show(200, '直接客户', $count);
    }
    public function indirectCustomer($userId)
    {
        $count = Relation::indirectCustomer($userId);
        return show(200, '间接客户', $count);
    }


}