<?phpnamespace app\api\validate;// 新增商家验证class ShopUpdate extends BaseValidate{    protected $rule = [        'token'=>'require|isNotEmpty',        'shop_name' => 'require|isNotEmpty',        'shop_phone' => 'require|isMobile',        'shop_HQ' => 'require|isNotEmpty',        'shop_address_detail' => 'require|isNotEmpty',    ];    protected $message=[        'token'=>'token为空',        'shop_name' => '商铺名为空',        'shop_phone' => '手机号格式错误',        'shop_HQ' => '地址为空',        'shop_address_detail' => '详细地址为空',    ];}