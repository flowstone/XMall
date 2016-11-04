<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 11/4/2016
 * Time: 8:20 PM
 */

namespace Back\Model;
use Think\Model\RelationModel;

class GoodsProductModel extends RelationModel{
    protected $_link = [
        'option' => [
            'mapping_type' => self::HAS_MANY,
            'class_name' => 'ProductOption',
            'foreign_key' => 'goods_product_id',
        ],
    ];
}
