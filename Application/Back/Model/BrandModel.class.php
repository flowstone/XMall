<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/28/2016
 * Time: 2:13 PM
 */

namespace Back\Model;
use Think\Model;

class BrandModel extends Model{
    //自动验证规则
    protected $_validate = [
        ['title', 'require', '品牌名称必须填写'],
        ['title', '', '品牌名称不能重复', self::EXISTS_VALIDATE, 'unique'],
        ['sort_number', 'number', '排序字段需要使用数字'],
    ];
    //自动完成规则
    protected $_auto = [
        ['created_at', 'time', self::MODEL_INSERT, 'function'],
        ['updated_at', 'time', self::MODEL_BOTH, 'function'],
    ];
}