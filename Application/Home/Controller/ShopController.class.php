<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 11/5/2016
 * Time: 1:47 PM
 */
namespace Home\Controller;
use Think\Controller;

class ShopController extends Controller{
    public function indexAction(){

        //数据的获取
        $m_category = D('Category');
        $category_list = $m_category->getNested(); //nested嵌套
        $this->assign('category_list', $category_list);

        //dump($category_list);
        //die;
        //展示首页模板
        $this->display();
    }
}