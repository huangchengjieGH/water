<?phpnamespace app\lib\exception;class OrderException extends BaseException{    public $code = 200;    public $msg = '订单未找到';    public $errorCode = 1001;    //  10000 通用参数错误}