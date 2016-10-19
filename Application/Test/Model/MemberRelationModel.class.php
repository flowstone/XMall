<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/9/2016
 * Time: 10:59 PM
 */

namespace  Test\Model;
use Think\Model\RelationModel;
/*操作member表的关联模型*/

class MemberRelationModel extends RelationModel{
    //模型名和表名 如果不对应  则属性
    protected  $tableName = 'member';

    //定义关联
    protected $_link =[
        //关联名字，任意起的
        'loginLog' =>[
            //关联类型,站在当前模型的角度
            //self:HAS_MANY类常量，表示拥有多个类型
            'mapping_type' => self::HAS_MANY,
            //关联的模型名
            'class_name' => 'MemberLoginLog',
            //外键关联字段
            'foreign_key' => 'member_id',
        ],
        'event' => [
            'mapping_type' =>self::MANY_TO_MANY,
            //关联表名称
            'relation_table' => '__EVENT_MEMBER__',
            'class_name' => 'Event',
            'foreign_key' => 'member_id',
            'relation_foreign_key' => 'event_id',
        ]
    ];
}