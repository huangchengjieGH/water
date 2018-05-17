<?php
/*
 * 获取令牌code验证器
 * Created by 浪子小卢
 * Date: 2018/3/24
 * Time: 5:32pm
 */
namespace app\api\validate;

class TokenGet extends BaseValidate
{
    protected $rule = [
        'code' => 'require|isNotEmpty'
//        'name' => 'require|isNotEmpty'
    ];
    
    protected $message=[
        'code' => '请用code换取令牌！'
//        'name' => '名字为空'
    ];
}
