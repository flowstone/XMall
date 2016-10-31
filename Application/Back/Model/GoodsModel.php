<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/31/2016
 * Time: 8:42 PM
 */

namespace Back\Model;
use Think\Model;
class GoodsModel extends Model{
    protected $_auto = [
        ['created_at', 'time', self::MODEL_INSERT, 'function'],
        ['updated_at', 'time', self::MODEL_BOTH, 'function'],
    ];
}