<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/9/2016
 * Time: 11:22 PM
 */
namespace Home\Model;
use Think\Model;

class MemberModel extends Model{
    //开启批量验证
    protected  $pathValidata = true;

    protected $_validate = [
//        array(验证字段1,验证规则,错误提示,[验证条件,附加规则,验证时间]),
        ['email','require','邮箱必须',Model::EXISTS_VALIDATE,'',Model::MODEL_BOTH],
        ['email','require','邮箱必须'],
        ['email','email','邮箱规则必须正确'],
        ['email','','邮箱不能重复',Model::EXISTS_VALIDATE,'unique'],

        ['name','require','姓名必须'],
        ['name','4,32','姓名必须使用4-32个字符',Model::EXISTS_VALIDATE,'length'],
        ['name','','姓名不能重复',Model::EXISTS_VALIDATE,'unique'],

        ['password','require','密码必须'],
        ['password','6,32','密码长度要在6-32个字符间',Model::EXISTS_VALIDATE,'length'],
        ['password','/^[\w_!@#$%^&*()]+$/','密码仅由数字字母及_!@#$%^&*()符号组成',
            Model::EXISTS_VALIDATE,'regex'],
        ['password','checkPasswordStrong','密码必须要包含字母，数字，特殊符号中两种或两种一种上',
            Model::EXISTS_VALIDATE,'callback'],
        ['password','confirm','两次输入的密码一致',Model::EXISTS_VALIDATE,'confirm'],

        ['is_newsletter',[0,1],'订阅信息必须选择',Model::EXISTS_VALIDATE,'in'],

        ['agree','require','请阅读隐私政策',Model::MUST_VALIDATE,'','register'],
        ['agree','1','请同意隐私政策',Model::EXISTS_VALIDATE,'equal','register'],
    ];
        protected $_auto = [
          ['password', 'md5', Model::MODEL_BOTH, 'function'] ,
        ];

    //验证密码强度的自定义方法规则
    public function checkPasswordStrong($password) {
        $strong = 0;
        if (preg_match('/\d/',$password)) {
            ++ $strong;
        }
        if (preg_match('/[a-z]/i',$password)) {
            ++ $strong;
        }
        if (preg_match('/[!@#$%^&*()_]/',$password)) {
            ++ $strong;
        }
        if ($strong >= 2) {
            return true; //通过
        } else {
            return false; //未通过
        }
    }
}