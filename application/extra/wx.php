<?phpreturn [    // +-------------------------------    // 微信小程序相关配置    // +-------------------------------    // 小程序 app_id    'app_id' => 'wx9f326c11be6fc272',    // 小程序 app_secret    'app_secret' => '265acd5307db690c1eaaf3631f863b62',    // 微信使用code换取用户openid及session_key的url地址    'login_url' => "https://api.weixin.qq.com/sns/jscode2session?" .        "appid=%s&secret=%s&js_code=%s&grant_type=authorization_code",    // 微信获取access_token的url地址    'access_token_url' => "https://api.weixin.qq.com/cgi-bin/token?" .        "grant_type=client_credential&appid=%s&secret=%s",];