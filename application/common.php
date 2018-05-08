<?php

// 应用公共文件

function curl_post($url, array $params = array())

{

    $data_string = json_encode($params);

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_HEADER, 0);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);

    curl_setopt($ch, CURLOPT_POST, 1);

    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);

    curl_setopt(

        $ch, CURLOPT_HTTPHEADER,

        array(

            'Content-Type: application/json'

        )

    );

    $data = curl_exec($ch);

    curl_close($ch);

    return ($data);

}



function curl_post_raw($url, $rawData)

{

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_HEADER, 0);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);

    curl_setopt($ch, CURLOPT_POST, 1);

    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    curl_setopt($ch, CURLOPT_POSTFIELDS, $rawData);

    curl_setopt(

        $ch, CURLOPT_HTTPHEADER,

        array(

            'Content-Type: text'

        )

    );

    $data = curl_exec($ch);

    curl_close($ch);

    return ($data);

}



/**

 * @param string $url get请求地址

 * @param int $httpCode 返回状态码

 * @return mixed

 */

function curl_get($url, &$httpCode = 0)

{

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);



    //不做证书校验,部署在linux环境下请改为true

    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);

    $file_contents = curl_exec($ch);

    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    curl_close($ch);

    return $file_contents;

}



function getRandChar($length)

{

    $str = null;

    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";

    $max = strlen($strPol) - 1;



    for ($i = 0;

         $i < $length;

         $i++) {

        $str .= $strPol[rand(0, $max)];

    }



    return $str;

}



function fromArrayToModel($m , $array)

{

    foreach ($array as $key => $value)

    {

        $m[$key] = $value;

    }

    return $m;

}



//获取范围

function GetRangeNews($lat,$lon,$raidus){

    //设置π变量

    $PI = 3.1415926535898;

    //计算纬度

    $degree = (24901 * 1609) / 360.0;

    $dpmLat = 1 / $degree;

    $radiusLat = $dpmLat * $raidus;

    $minLat = $lat - $radiusLat; //得到最小纬度

    $maxLat = $lat + $radiusLat; //得到最大纬度

    //计算经度

    $mpdLng = $degree * cos($lat * ($PI / 180));

    $dpmLng = 1 / $mpdLng;

    $radiusLng = $dpmLng * $raidus;

    $minLng = $lon - $radiusLng; //得到最小经度

    $maxLng = $lon + $radiusLng; //得到最大经度

    //计算范围

    $range = array(

        'minLat' => $minLat,

        'maxLat' => $maxLat,

        'minLon' => $minLng,

        'maxLon' => $maxLng

    );

    return $range;

}

//获取2点之间的距离

function GetDistanceNews($lat1, $lng1, $lat2, $lng2){

    //设置π变量

    $PI = 3.1415926535898;

    $EARTH_RADIUS = 6378.137;

    $radLat1 = $lat1 * ($PI / 180);

    $radLat2 = $lat2 * ($PI / 180);

    $a = $radLat1 - $radLat2;

    $b = ($lng1 * ($PI / 180)) - ($lng2 * ($PI / 180));

    $s = 2 * asin(sqrt(pow(sin($a/2),2) + cos($radLat1)*cos($radLat2)*pow(sin($b/2),2)));

    $s = $s * $EARTH_RADIUS;

    $s = round($s * 10000) / 10000;

    return $s;

}





/*

 * @param $url

 * @param int $type 0 get 1 post

 * @param array $data

 */

function doCurl($url,$type=0,$data=[]){

    $ch=curl_init();    // 初始化



    // 设置选项

    curl_setopt($ch,CURLOPT_URL,$url);

    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);

    curl_setopt($ch,CURLOPT_HEADER,0);



    if($type == 1){

        // post

        curl_setopt($ch,CURLOPT_POST,1);

        curl_setopt($ch,CURLOPT_POSTFIELDS,$data);

    }



    // 执行并获取内容

    $output=curl_exec($ch);



    // 释放curl 权柄

    curl_close($ch);

    return $output;

}
	/**
 *      通用化 API 接口数据输出
 * @param $status       业务状态码
 * @param $message    信息提示
 * @param array $data       数据
 * @param int $httpCode     http状态码
 * @return \think\response\Json
 */
function show($status,$message,$data=[],$httpCode=200){
    $datas = [
      'code'=>$status,
      'msg'=>$message,
      'data'=>$data
    ];
    return json($datas,$httpCode);
}

/**
 * $lat：用户维度
 * $lng：用户精度
 * $as_name：查询出来的SQL字段名称
 */
function get_distance_sql($lat,$lng,$as_name='distance')
{
    //define('PI',3.1415926535898);
   return sprintf('round(6378.137*sqrt( pow((PI()*(abs(`latitude`-%f))/180) * cos(PI()*(`latitude`+%f)/360),2) 
   + pow((PI()*abs(`longitude`-%f)/180),2)),4) as %s',$lat,$lat,$lng,$as_name);
}

/**
 * 获取两个经纬度之间的距离
 * @param  string $lat1 纬一
 * @param  String $lng1 经一
 * @param  String $lat2 纬二
 * @param  String $lng2 经二
 * @return float  返回两点之间的距离
 */
function calcDistance($lat1, $lng1, $lat2, $lng2) {
    /** 转换数据类型为 double */
    $lat1 = doubleval($lat1);
    $lng1 = doubleval($lng1);
    $lat2 = doubleval($lat2);
    $lng2 = doubleval($lng2);
    /** 以下算法是 Google 出来的，与大多数经纬度计算工具结果一致 */
    $theta = $lng1 - $lng2;
    $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
    $dist = acos($dist);
    $dist = rad2deg($dist);
    $miles = $dist * 60 * 1.1515;
    return ($miles * 1.609344);
}

/**
 * php代码
 *计算某个经纬度的周围某段距离的正方形的四个点
 *@param float $lng  经度
 *@param float $lat  纬度
 *@param float $distance  该点所在圆的半径，该圆与此正方形内切，默认值为5千米
 *@return array 正方形的四个点的经纬度坐标
 */

function squarePoint($lat, $lng,$distance = 5.0){
    $earth_radius = 6371;//地球半径
    $dlng =  2 * asin(sin($distance / (2 * $earth_radius)) / cos(deg2rad($lat)));
    $dlng = rad2deg($dlng);
    $dlat = $distance/$earth_radius;
    $dlat = rad2deg($dlat);
    return [
        'left-top'    =>['lat'=>$lat + $dlat, 'lng'=>$lng - $dlng],
        'right-top'   =>['lat'=>$lat + $dlat, 'lng'=>$lng + $dlng],
        'left-bottom' =>['lat'=>$lat - $dlat, 'lng'=>$lng - $dlng],
        'right-bottom'=>['lat'=>$lat - $dlat, 'lng'=>$lng + $dlng],
    ];
}
