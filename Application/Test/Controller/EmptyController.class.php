<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/10/2016
 * Time: 10:53 PM
 */
namespace Test\Controller;
use Think\Controller;

//空控制器
class EmptyController extends Controller{
    public function helloAction(){
        echo 'HelloAction';
    }
}