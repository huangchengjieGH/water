<?php
/**
 * Created by PhpStorm.
 * User: THINK
 * Date: 2018/3/22
 * Time: 9:28
 */

namespace app\api\behavior;

/**
 *      js 跨域访问
 */
class CORS
{
    public function appInit(&$params){
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: token,Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: POST,GET');
        // 是否为OPTIONS请求
        if (request()->isOptions()){
            exit();
        }
    }
}