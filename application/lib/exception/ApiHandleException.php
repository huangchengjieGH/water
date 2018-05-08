<?php

namespace app\lib\exception;


use Exception;
use think\exception\Handle;

class ApiHandleException extends Handle
{
    public $httpCode = 500;
    public $msg = '';
    public function render(Exception $e)
    {
        // 系统正在调试
//        if (config('app_debug'==true)){
//            return parent::render($e);
//        }

        if ($e instanceof ApiException){
            $this->httpCode = $e->httpCode;
            $this->msg = $e->msg;
        }else{
            $this->msg = $e->getMessage();
        }

        return show(0,$this->msg ,[],$this->httpCode);
    }

}