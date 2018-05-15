<?php
namespace app\api\service;

use think\Db;

class WithdrawRequestService{
    private  $mch_id;//商户号
    private  $partner_trade_no;//商户企业付款单号
    private  $nonce_str;//32位随机数
    private  $sign;//签名
    private  $enc_bank_no;//银行卡号
    private  $enc_true_name;
    private  $bank_code;//银行编码
    private  $amount;//金额
    private  $desc;//备注

    function __construct($mch_id, $partner_trade_no, $nonce_str,$enc_bank_no,$enc_true_name,$bank_code,$amount,$desc){
        $this->mch_id= $mch_id;
        $this->partner_trade_no = $partner_trade_no;
        $this->nonce_str = $nonce_str;
        $this->enc_bank_no = $enc_bank_no;
        $this->enc_true_name = $enc_true_name;
        $this->bank_code = $bank_code;
        $this->amount = $amount;
        $this->desc = $desc;
    }

}