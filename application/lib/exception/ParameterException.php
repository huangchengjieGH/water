<?php/** * Created by PhpStorm. * User: THINK * Date: 2018/3/26 * Time: 15:45 */namespace app\lib\exception;class ParameterException extends BaseException{    public $msg = 'the parameter mistake';    public $errorCode = 1001;    //  10000 通用参数错误    public $httpCode = 200;}