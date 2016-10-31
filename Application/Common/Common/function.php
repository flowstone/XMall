<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/31/2016
 * Time: 10:25 AM
 */
/**
 * @param $key
 * @param null $default
 */
function getConfig($key, $default = NULL){
    //初始缓存配置
    S(['type'=>'File']);
    if (!$value = S('setting_'. $key)) {
        $value = M('Setting')->where(['key'=>$key])->getField('value');
        S('setting_'.$key, $value);
    }
    return is_null($value) ? $default : $value;
}