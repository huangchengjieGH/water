<?php/* * 根据code请求微信接口 * Created by 浪子小卢 * 2018/3/24 星期六 */namespace app\api\service;use app\api\model\User;use app\api\model\Userinfo;use app\lib\enum\ScopeEnum;use think\Exception;/* * 微信登录 * 担心频繁被恶意调用 *（限制ip） *（限制访问频率） */class UserToken extends Token{    protected $code;        protected $name;    protected $wxLoginUrl;    protected $wxAppID;    protected $wxAppSecret;   	/**	 * 初始化该类	 * 拼接请求url	 */    function __construct($code,$name)    {        $this->name =  $name;                $this->code = $code;        $this->wxAppID = config('wx.app_id');        $this->wxAppSecret = config('wx.app_secret');        $this->wxLoginUrl = sprintf(            config('wx.login_url'), $this->wxAppID, $this->wxAppSecret, $this->code);    } 		/**	 * 登陆	 * 思路1：每次调用登录接口都去微信刷新一次session_key，生成新的Token，不删除久的Token	 * 思路2：检查Token有没有过期，没有过期则直接返回当前Token	 * 思路3：重新去微信刷新session_key并删除当前Token，返回新的Token	 */    public function get()    {        $result = curl_get($this->wxLoginUrl);        $wxResult = json_decode($result, true);//        halt($wxResult);        if (empty($wxResult)) {            //请求失败            throw new Exception('获取session_key及openID时异常，微信内部错误');        }        else {            //请求成功            $loginFail = array_key_exists('errcode', $wxResult);			if ($loginFail) {//微信返回error                $this->processLoginError($wxResult);            }            else {//微信返回true                return $this->grantToken($wxResult);            }        }    }    /**	 *微信异常处理    */	private function processLoginError($wxResult)    {        exit(json_encode([            'errorCode' => $wxResult['errcode'],            'msg' => $wxResult['errmsg']            ]));    }    /**	 *获取微信信息成功(颁发令牌或刷新令牌)     *调用登陆就颁发新令牌	 */    private function grantToken($wxResult)    {        //获取微信openid 判断用户是否存在        $openid = $wxResult['openid'];        $user = User::getByOpenID($openid);        if(!$user){//不存在(创建用户)            $uid = $this->newUser($openid);			$this->newUserinfo($uid);        }else {    //存在(获取用户id)            $uid = $user->user_id;        }        //生成令牌,将令牌写入缓存，颁布令牌		$cachedValue = $this->prepareCachedValue($wxResult,$uid);        $token = $this->saveToCache($cachedValue);        return $token;    }		/**	 *写入缓存	 */    private function saveToCache($wxResult)    {        $key = self::generateToken();        $value = json_encode($wxResult);        //$expire_in = 0;//config('setting.token_expire_in');        $result = cache($key, $value, 0);        if (!$result){            exit(json_encode([                'errorCode' => 10005,                'msg' => '服务器缓存异常'            ]));        }        return $key;    }    /**	 *生成令牌	 */    private function prepareCachedValue($wxResult, $uid)    {        $cachedValue = $wxResult;        $cachedValue['uid'] = $uid;        $cachedValue['scope'] = ScopeEnum::User;        return $cachedValue;    }    //创建新用户    private function newUser($openid)    {        $user = User::create(            [                'user_wxid' =>$openid,                'user_name' =>$this->name            ]);        return $user->user_id;    }	 // 创建新的普通用户    private function newUserinfo($user_id)    {        $user = Userinfo::create(            [                'user_id' =>$user_id            ]);    }}