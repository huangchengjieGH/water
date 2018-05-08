<?php
/**
 * Created by PhpStorm.
 * User: THINK
 * Date: 2018/3/20
 * Time: 10:48
 */

namespace app\api\service;

use think\Exception;

class AccessToken
{
    private $tokenUrl;
    const TOKEN_CACHED_KEY = 'access';
    const TOKEN_EXPIRE_IN = 7000;

    function __construct()
    {
        $url = config('wx.access_token_url');
        //  把百分号（%）符号替换成一个作为参数进行传递的变量
        $url = sprintf($url,config('wx.app_id'),config('wx.app_secret'));
        $this->tokenUrl = $url;
    }

    // 建议用户规模小时每次直接去微信服务器获取最新的token
    // 但微信access_token接口是有限制的 2000次/天
    public function get(){
        $token = $this->getFromCache();
        if (!$token){
            return $this->getFromServer();
        }else{
            return $token;
        }
    }

    // 从缓存中获取 token
    private function getFromCache(){
        $token = cache(self::TOKEN_CACHED_KEY);
        if(!$token){
            return null;
        }
        return $token['access_token'];
    }

    // 从服务器获取 token
    private function getFromServer(){
        $token = curl_get($this->tokenUrl);
        $token = json_decode($token,true);
        if (!$token){
            throw new Exception('获取 AccessToken异常');
        }
        if (!empty($token['errcode'])){
            throw new Exception($token['errmsg']);
        }
        $this->saveToCache($token);
        return $token['access_token'];
    }
    private function saveToCache($token){
        cache(self::TOKEN_CACHED_KEY,$token,self::TOKEN_EXPIRE_IN);
    }
}
// 微信返回的 access_token 的数据结构
//array(2) {
//    ["access_token"] => string(156) "7_NZ28_66SSvekLoUKttCMUErg3JZKJgvELn35TOSlsIPBKRySv9wp6PUbj5HsD6j5wwG1vih5PKgmgJQPSTwucH3cOx_2pmfTIUTAsaURHK5PFwji-544QTOqf6uU_jETK8xbin5_12KInU-cZEFeAJACHI"
//    ["expires_in"] => int(7200)
//}