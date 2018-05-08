<?phpnamespace app\api\controller\v1;use app\api\controller\BaseController;use app\api\model\RefundOrder;use app\api\model\Product;use app\api\model\ReportLog;use app\api\model\Shop as ShopModel;use app\api\model\Shoperinfo;use app\api\model\SetMoney;use app\api\model\User;use app\lib\exception\ParameterException;use think\Cache;use think\Db;use app\api\validate\ShopNew;use app\api\validate\ShopUpdate;use app\api\controller\WeiXinPay;use think\Exception;// 水电商家相关class Shop extends BaseController{    //将xml格式转换成数组    private function xmlToArray($xml)    {        //禁止引用外部xml实体        libxml_disable_entity_loader(true);        $xmlstring = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA);        $val = json_decode(json_encode($xmlstring), true);        return $val;    }    //支付加盟费 普通用户    public function payShopOrder()    {        // 获取用户信息        $User = $this->getUid();        // 是否为商家//        if($User->user_role==3){//            throw new ParameterException([//                'msg' => '您已经是商家啦，不用再加盟！'//            ]);//        }        //获取叫押金情况        $shopInfo = ShopModel::getByUserID($User->user_id);        if(!$shopInfo){            throw new ParameterException([                'msg' => '请先填写提交加盟信息！'            ]);        }        if ($shopInfo->is_pay==1) {            throw new ParameterException([                'msg' => '您已交过押金！'            ]);        }        //确定信息        $openid = $User['user_wxid'];        $body = '商家加盟';        //押金        $fre = Model('SetMoney')->find()->toArray();        $total_fee = floatval( $fre['shop_fre']*100);        //$total_fee = floatval( 0.01*100);        $out_trade_no = 'shop'.'_'.time().'_'.$User['user_id'];        //配置信息        $notify_url = config('setting.domain').'/api/v1/shop/payShopNotify';        $app_id = config('paySet.app_id');        $mch_id = config('paySet.mch_id');        $key = config('paySet.key');        //生成签名，返回给小程序        $pay = new WeiXinPay($app_id, $openid, $mch_id, $key, $out_trade_no, $body, $total_fee,$notify_url);        $return = $pay->pay();        return $return;    }    //加盟订单支付异步,回调地址    public function payShopNotify()    {        $postXml = file_get_contents("php://input");        if (empty($postXml)) {            return false;        }        //获取回调参数更新数据        $result = $this->xmlToArray($postXml);        Cache::set('zf',$result);        if ($result['return_code'] == 'FAIL') {            return false;        }        if ($result['result_code'] == 'FAIL') {            return false;        }        if($result["return_code"] != "SUCCESS" ){            return false;        }        //获取订单号        $outTradeNo = $result['out_trade_no'];        $array = explode('_',$outTradeNo);        //从订单号中提取user_id        $user_id = $array[2];        $shopInfo = ShopModel::getByUserID($user_id);        //判断更新数据库        if (!$shopInfo) {            return false;        }else{            if($shopInfo->is_pay==1){                return false;            }//            Db::table('sbw_user')->where(['user_id'=>$user_id])->update(['user_role'=>3]);            $shopInfo = new ShopModel();            $shopInfo->save(['is_pay' =>1],['user_id' =>$user_id]);            //插入支付记录            $dep_data['type'] = 3 ;            $dep_data['order_id'] = $outTradeNo;            $dep_data['user_id'] = $user_id;            $dep_data['o_builddate']=time();            $dep_data['price'] = floatval( $result['total_fee']*0.01);            (new RefundOrder())->save($dep_data);            //return $this->return_success();            return true;        }        return false;    }    // 获取检查的商家    public function getAllShop()    {        //获取用户信息        $data = $this->getUid();        $lat =input('post.lat',0);        $lng = input('post.lng',0);        $distance = config('setting.distance')*1.0;      // 距离 单位 1公里        $rep_log = new ReportLog();        $rep_data['latitude'] = $lat;        $rep_data['longitude'] = $lng;        $rep_data['createtime'] = time();        $geo_data = squarePoint($lat,$lng,$distance);        $left_bottom =  $geo_data['left-bottom'];        $right_top = $geo_data['right-top'];        $lat_min = $left_bottom['lat'];        $lat_max = $right_top['lat'];        $lng_min = $left_bottom['lng'];        $lng_max = $right_top['lng'];        $geo_data2 = squarePoint($lat,$lng,1000);        $left_bottom2 =  $geo_data2['left-bottom'];        $right_top2 = $geo_data2['right-top'];        $lat_min2 = $left_bottom2['lat'];        $lat_max2 = $right_top2['lat'];        $lng_min2 = $left_bottom2['lng'];        $lng_max2 = $right_top2['lng'];        $all_products = [];        $edition = [];        $reschange = [];        $sql = "SELECT * FROM sbw_shop WHERE is_check = 1 and latitude > {$lat_min} and latitude < {$lat_max} and longitude > {$lng_min} and longitude < {$lng_max}";        $sql2 = "SELECT shop_id,user_id,shop_name,shop_phone,shop_HQ,shop_address_detail,latitude,longitude,updatetime,shop_pic,is_check,star,service_fee,deliveryArea,registertime FROM sbw_shop WHERE is_check = 1 and latitude > {$lat_min2} and latitude < {$lat_max2} and longitude > {$lng_min2} and longitude < {$lng_max2} limit 100";        //查询用户的所在楼层        $is_ele = User::get($data->user_id)->getUserInfo->user_iselevator;        $u_floor = User::get($data->user_id)->getUserInfo->user_floor;        $fre = Model('SetMoney')->where(['id'=>1])->find();        try{            $res = Db::query($sql);            if (empty($res)){                // 将处理信息返回给平台                $same = $rep_log->findSame($lat,$lng);                if (!$same){                    $rep_log->save($rep_data);                }            }            $res = Db::query($sql2);            foreach ($res as $k =>$v){                $distance= GetDistanceNews($lat,$lng,$v['latitude'],$v['longitude']);                $res[$k]['distance'] = number_format($distance,3);                $res[$k]['shop_pic'] = config('setting.domain').$v['shop_pic'];                $res[$k]['all_fee'] = $res[$k]['service_fee'];                if(!$is_ele){                     if($u_floor>=$fre['floor_sub']){                        $res[$k]['all_fee'] += ($u_floor-$fre['floor_sub'])*(floatval($fre['floor_fre']));                      }                       }                $res[$k]['u_floor'] = $u_floor;                $res[$k]['floor_sub'] = $fre['floor_sub'];                 $edition[$k]['distance'] = $distance;            }            array_multisort($edition,SORT_ASC,$res);//            $res = $res[0];            $reschange[0]= $res[0];            $all_products = Product::getProductsByShopID($res[0]['shop_id']);        }catch (\Exception $e){//            return show(201,'附近暂无商家',['msg'=>$e->getMessage()]);        }        if (!$reschange){//            halt("helo2");            return show(201,'附近暂无商家');        }        return show(200,'获取成功',['shops'=>$reschange,'products'=>$all_products]);    }    // 获取商家信息    public function getMyShop()    {        // 获取用户信息        $User = $this->getUid ();        if(!$User){            return show(201,'用户不存在');        }		//halt($User);        if($User->user_role != 3){            return show(202,'当前您不是商家，请切换角色！');        }        $shop = ShopModel::getByUserID($User->user_id);        if(!$shop){            return show(203,'您没有服务点');        }        return show(200,'商家信息获取成功',['shop' => $shop]);    }    //加盟  商家    public function addShop()    {        //验证传入值        $validate = new ShopNew();        $validate->goCheck();        $post = $validate->getDataByRule(input('post.'));//        halt($post);        $address = $post['shop_HQ'].''.trim($post['shop_address_detail']);        $res = \Tmap::getLngLat($address);        if($res){            //经度            $post['longitude'] =$res['result']['location']['lng'];            //纬度            $post['latitude'] =$res['result']['location']['lat'];        }        // 获取用户信息        $User = $this->getUid();        // 验证商家        $shop = ShopModel::getByUserID($User->user_id);//      halt($shop);        $post['user_id'] = $User->user_id;        //押金        $fre = Model('SetMoney')->find()->toArray();        try{            if ($shop){                // 更新数据                (new ShopModel())->allowField(true)->save($post,['user_id' =>$User->user_id]);                return show(200,'处理成功，请交押金',['fre'=>$fre['shop_fre']]);            }            (new ShopModel($post))->allowField(true)->save();        }catch(\Exception $e){            return show(201,'处理失败，请重试或联系官方',['fre'=>$fre['shop_fre']]);        }        return show(200,'处理成功，请交押金',['fre'=>$fre['shop_fre']]);    }    // 获取 商家下的所有骑手信息	public function getShopers(){        $User = $this->getUid();        $User = User::get($User->user_id);        $shop = ShopModel::getByUserID($User->user_id);        if (!$shop){            throw new ParameterException([                'msg' => '暂时没有骑手信息'            ]);        }        $shop_id = $shop->shop_id;		$shopers = Shoperinfo::getAllByShopID($shop_id);		if(!$shopers){//            return show(201,'暂时没有骑手信息');			 throw new ParameterException([                 'msg' => '暂时没有骑手信息'			  ]);		}//        return show(200,'处理成功，请交押金',['shopers'=>$shopers]);		return $shopers;	}    // 附近商家 根据距离    public function getNearShops(){        //获取用户信息        $data = $this->getUid();        $lat =input('post.lat',0);        $lng = input('post.lng',0);        $distance = config('setting.distance')*1.0;      // 距离 单位 1公里        $rep_log = new ReportLog();        $rep_data['latitude'] = $lat;        $rep_data['longitude'] = $lng;        $rep_data['createtime'] = time();        $geo_data = squarePoint($lat,$lng,$distance);        $left_bottom =  $geo_data['left-bottom'];        $right_top = $geo_data['right-top'];        $lat_min = $left_bottom['lat'];        $lat_max = $right_top['lat'];        $lng_min = $left_bottom['lng'];        $lng_max = $right_top['lng'];        $edition = [];        $sql = "SELECT shop_id,user_id,shop_name,shop_phone,shop_HQ,shop_address_detail,latitude,longitude,updatetime,shop_pic,is_check,star,service_fee,deliveryArea,registertime FROM sbw_shop WHERE is_check = 1 and latitude > {$lat_min} and latitude < {$lat_max} and longitude > {$lng_min} and longitude < {$lng_max}";        //查询用户的所在楼层        $is_ele = User::get($data->user_id)->getUserInfo->user_iselevator;        $u_floor = User::get($data->user_id)->getUserInfo->user_floor;        $fre = Model('SetMoney')->where(['id'=>1])->find();        try{            $res = Db::query($sql);            if (empty($res)){                // 将处理信息返回给平台                $same = $rep_log->findSame($lat,$lng);                if (!$same){                    $rep_log->save($rep_data);                }                return show(201,'附近没有商家，期待你的加入');            }            foreach ($res as $k =>$v){                $distance= GetDistanceNews($lat,$lng,$v['latitude'],$v['longitude']);                $res[$k]['distance'] = number_format($distance,3);                $res[$k]['shop_pic'] = config('setting.domain').$v['shop_pic'];                 $res[$k]['all_fee'] = $res[$k]['service_fee'];                if(!$is_ele){                        if($u_floor>=$fre['floor_sub']){                        $res[$k]['all_fee'] += ($u_floor-$fre['floor_sub'])*(floatval($fre['floor_fre']));                     }                    }                $res[$k]['u_floor'] = $u_floor;                $res[$k]['floor_sub'] = $fre['floor_sub'];                  $edition[$k]['distance'] = $distance;            }            array_multisort($edition,SORT_ASC,$res);        }catch (\Exception $e){            return show(201,'附近暂无商家');        }        if (!$res){            return show(201,'附近暂无商家');        }        return show(200,'获取成功',['res'=>$res]);    }    // 附近商家的所属商品信息 根据商家ID    public function getNearShopProducts(){        $shop_id = input("post.shop_id");        $all_products = Product::getProductsByShopID($shop_id);        if (!$all_products){            return show(201,'暂无商品信息');        }        return show(200,'获取成功',['products'=>$all_products]);    }    //获取商家信息    public function getShopMessage()    {        // 获取用户信息        $User = $this->getUid();        // 获取商家信息        $shop = ShopModel::getByUserID($User->user_id);            if (!$shop){                return show(201,'暂无商家信息');            }        return show(200,'ok',['message'=>$shop]);    }    //修改商家信息    public function updateShopMessage()    {        // 获取用户信息        $User = $this->getUid();        //验证传入值        $validate = new ShopUpdate();        $validate->goCheck();        $post = $validate->getDataByRule(input('post.'));        // 获取商家信息        $shop = ShopModel::getByUserID($User->user_id);        if (!$shop){            return show(201,'暂无商家信息');        }        $address = $post['shop_HQ'].''.trim($post['shop_address_detail']);        $res =  \Tmap::getLngLat($address);        if($res){            //经度            $post['longitude'] =$res['result']['location']['lng'];            //纬度            $post['latitude'] =$res['result']['location']['lat'];        }        unset($post['token']);        try{            Db::table('sbw_shop')                ->where(['shop_id'=>$shop->shop_id])                ->update($post);        }catch(\Exception $e){            return show(201,"更新失败");        }        return show(200,'更新成功');    }}