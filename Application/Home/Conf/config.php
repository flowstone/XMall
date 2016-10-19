<?php
return array(
	//'配置项'=>'配置值'

    'URL_ROUTER_ON'         =>  true,
    'URL_ROUTE_RULES'       =>  [
        'register' => 'Member/register',
        'center' => 'Member/center', //用户中心
        'login' => 'Member/login', //登陆
        'verify' => 'Member/verify', //验证码
        'logout' => 'Member/logout', //退出
    ],
    'LOAD_EXT_CONFIG'  => 'db',
    'SHOW_PAGE_TRACE'  => true,
    'TMPL_ACTION_ERROR'     =>  'Common/jump_error', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'   =>  'Common/jump_success', // 默认成功跳转对应的模板文件
);