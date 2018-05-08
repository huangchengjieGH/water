<?php
/*
 * 根据token获取用户信息
 * Created by 浪子小卢
 * 2018/3/24 星期六
 */
namespace app\api\service;

use app\api\model\User;
//use think\Exception;
use app\lib\exception\UserException;
use think\Cache;


class CheckUser extends Token
{
    protected $token;
    protected $cacheMessage=[];
    //获取token检查缓存
    //判断登录状态
    function __construct($token)
    {
        if(!self::verifyToken($token)){

            exit(json_encode(['errcode'=>100001,'errmsg'=>'缓存不存在']));

        }else{

            $identities = Cache::get($token);
            $identities = json_decode($identities, true);
            if(!is_array($identities)){
                exit(json_encode(['errcode'=>100002,'errmsg'=>'缓存错误']));
            }
            $this->cacheMessage = $identities;
        }

    }

    //输出用户的状态
    public function checkUid()
    {
        $user = User::getByOpenID($this->cacheMessage['openid']);

        if(!$user){
            throw new UserException();
        }else{
            return $user;
        }

    }
}
