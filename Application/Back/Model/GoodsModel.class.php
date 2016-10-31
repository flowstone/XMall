<?php

namespace Back\Model;

use Think\Model;


class GoodsModel extends Model
{

    protected $_auto = [
        ['created_at', 'time', self::MODEL_INSERT, 'function'],
        ['updated_at', 'time', self::MODEL_BOTH, 'function'],
    ];
}