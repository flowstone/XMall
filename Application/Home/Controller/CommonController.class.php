<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 11/5/2016
 * Time: 9:02 PM
 */

namespace Home\Controller;
use Think\Controller;

class CommonController extends Controller{

    public function _initialize(){
        //数据的获取
        //分类数据
        $m_category = D('Category');
        $category_list = $m_category->getNested(); //nested嵌套
        $this->assign('category_list', $category_list);

        //当前会员信息
        $this->assign('member',session('member'));
    }
}