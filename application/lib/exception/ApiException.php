<?php

namespace app\lib\exception;

use think\Exception;
use Throwable;

class ApiException extends Exception
{
    public $msg = '';   // 业务提示信息
    public $httpCode = 500;     // http 返回状态码
    public $code = 0;       // 业务提示码

    public function __construct($message = "", $httpCode = 0, $code = 0)
    {
        $this->msg = $message;
        $this->httpCode = $httpCode;
        $this->code = $code;
    }
}