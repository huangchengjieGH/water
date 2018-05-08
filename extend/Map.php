<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/5/5 0005
 * Time: 下午 10:25
 */
class Map{
    /*
     * 根据地址赖获取经纬度
     * @param $address
     */
    public static function getLngLat($address){
//        http://api.map.baidu.com/geocoder/v2/?callback=renderOption&output=json&address=百度大厦&city=北京市&ak=您的ak
        if(!$address){
            return '';
        }
        $data=[
            'address'=>$address,
            'ak'=>config('map.ak'),
            'output'=>'json',
        ];
        $url=config('map.baidu_map_url').config('map.geocoder').'?'.http_build_query($data);
        // 1 file_get_contents($data)
        // 2 curl
        $result=doCurl($url,0,$data);
//        print_r($result);exit;
        if($result){
            return json_decode($result,true);
        }else{
            return [];
        }
//        return $result;
    }
    /*
     * 功能：根据经纬度或者地址获取百度地图
     * @param $center
     */
    public static function staticimage($center){
        if(!$center){
            return '';
        }
        $data=[
            'ak'=>config('map.ak'),
            'width'=>config('map.width'),
            'height'=>config('map.height'),
            'center'=>$center,
            'markers'=>$center,
        ];
        $url=config('map.baidu_map_url').config('map.staticimage').'?'.http_build_query($data);
        // 1 file_get_contents($data)
        // 2 curl
        $result=doCurl($url);

        return $result;
    }
}