<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/7/2016
 * Time: 1:52 PM
 */
namespace Test\Controller;
use Think\Controller;

class MemberController extends Controller{
    public function registerAction(){
        $this->show('会员注册');
    }


}