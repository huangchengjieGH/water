<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
define('APP_LOG', __DIR__ . '/../logs/');
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
// 需要根据 日志 查看SQL 时候启用
//\think\Log::init([
//   'type' => 'File',
//   'path' => LOG_PATH,
//   'level' => ['sql']
//]);