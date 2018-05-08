<?phpnamespace app\api\validate;use app\lib\exception\ApiException;use app\lib\exception\ParameterException;use think\Request;use think\Validate;// 验证类的基类class BaseValidate extends Validate{    /*     * 检测参数是否符合验证类的规则     * 基类定义了很多自定义验证方法     * 自定义验证方法(用于直接调用)     * @throws ParameterException     * @return true     */    public function goCheck()    {        //必须设置contetn-type:application/json        $request = Request::instance();        $params = $request->param();        $params['token'] = $request->post('token');        if (!$this->check($params)) {            $exception = new ParameterException(                [                    //$this->error有一个问题，并不是一定返回数组，需要判断                    'code'=>200,                    'msg' => is_array($this->error) ? implode(                        ';', $this->error) : $this->error,                ]);            throw $exception;        }        return true;    }    /**     * @param array $arrays 通常传入request.post变量数组     * @return array 按照规则key过滤后的变量数组     * @throws ParameterException     */    public function getDataByRule($arrays)    {        if (array_key_exists('user_id', $arrays) | array_key_exists('uid', $arrays)) {            // 不允许包含user_id或者uid，防止恶意覆盖user_id外键            throw new ParameterException([                'msg' => '参数中包含有非法的参数名user_id或者uid'            ]);        }        $newArray = [];        foreach ($this->rule as $key => $value) {            $newArray[$key] = $arrays[$key];        }        return $newArray;    }    protected function isPositiveInteger($value, $rule='', $data='', $field='')    {        if (is_numeric($value) && is_int($value + 0) && ($value + 0) > 0) {            return true;        }        return $field . '必须是正整数';    }    protected function isNotEmpty($value, $rule='', $data='', $field='')    {        if (empty($value)) {            return $field . '不允许为空';        } else {            return true;        }    }    //手机号的验证规则    protected function isMobile($value)    {        $rule = '^1(3|4|5|7|8)[0-9]\d{8}$^';        $result = preg_match($rule, $value);        if ($result) {            return true;        } else {            return false;        }    }    }