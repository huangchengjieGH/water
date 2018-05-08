<?phpnamespace app\lib\exception;use Exception;use think\exception\Handle;use think\Log;use think\Request;class ExceptionHandler extends Handle{    private $code;    private $msg;    private $errorCode;    public function render(Exception $e)    {        if ($e instanceof BaseException){            $this->msg = $e->msg;            $this->code = $e->code;            $this->errorCode = $e->errorCode;        }else{            // 如果是服务器未处理的异常，将http状态码设置为500，并记录日志            if (config('app_debug')){                return parent::render($e);            }            $this->code = 500;            $this->msg = 'sorry, we made a mistake .(^0^)';            $this->errorCode = 999;            // 记录日志            $this->recordErrorLog($e);        }        $request = Request::instance();//        $result = [////          'msg' => $this->msg,////          'error_code' => $this->errorCode,////          'reqeust_url' => $request->url()////        ];//        return json($result,$this->code);        return show($this->errorCode,$this->msg ,['reqeust_url' => $request->url()],$this->code);    }    /**     *   将异常写入日志     */    private function recordErrorLog(Exception $e){        Log::init([            'type'  =>  'file',            'path'  =>  APP_LOG,            'level' => ['error']        ]);        Log::record($e->getMessage(),'error');    }}