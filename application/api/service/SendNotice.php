<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/11 0011
 * Time: 下午 11:14
 */

namespace app\api\service;


class SendNotice
{
    public $templateid = 'Ki9xfsHmqIe_ebezhyYLBs0zHzsg9mQ8Bgq8yNHbkwU';
    // 单号，时间，金额
    public function send(){
        $data_arr = array(
            'keyword1' => array("value" =>'2012837847837'),
            'keyword1' => array("value" =>date("Y-m-d H:i:s")),
            'keyword1' => array("value" =>'2884元'),
            //这里根据你的模板对应的关键字建立数组，color 属性是可选项目，用来改变对应字段的颜色
        );
        $post_data = array(
            "touser" => $openid,
            //用户的 openID，可用过 wx.getUserInfo 获取
            "template_id" => $this->templateid,
            //小程序后台申请到的模板编号
            "page" => "/pages/check/result",
            //点击模板消息后跳转到的页面，可以传递参数
            "form_id" => $formid,
            //第一步里获取到的 formID
            "data" => $data_arr,
            "emphasis_keyword" => "keyword2.DATA"
            //需要强调的关键字，会加大居中显示
        );

        $token = new AccessToken();
        $m_token = $token->get();
        $url = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=".$m_token;
//这里替换为你的 appID 和 appSecret
        $data = json_encode($post_data, true);
//将数组编码为 JSON

        $return = send_post($url, $data);
        echo '返回值：' . $return;

    }


    function send_post($url, $post_data)
    {
        $options = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'Content-type:application/json',
                //header 需要设置为 JSON
                'content' => $post_data,
                'timeout' => 60
                //超时时间
            )
        );

        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        return $result;
    }
}




