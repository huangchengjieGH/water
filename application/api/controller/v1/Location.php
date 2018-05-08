<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/10 0010
 * Time: 下午 11:50
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;

class Location extends BaseController
{
    public function getLngLat(){
        $address = input("post.address");
        $res = \Tmap::getLngLat($address);
        return $res;
    }
}