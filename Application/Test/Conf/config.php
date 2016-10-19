<?php
return array(
    //'配置项'=>'配置值'
    'DEFAULT_CONTROLLER' => 'Site',
    'DEFAULT_ACTION' => 'index',
    'SHOW_PAGE_TRACE' => true,

    'URL_MODEL' => 2, //隐藏所生成的入口文件
    'URL_ROUTER_ON' => true, //开启URL路由
    'URL_ROUTE_RULES' => array( //定义URL路由的规则
        'register' => 'Member/register',
    ),
    'LOAD_EXT_CONFIG' => 'db', //加载的扩展配置

);