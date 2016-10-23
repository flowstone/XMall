<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/21/2016
 * Time: 2:54 PM
 */

namespace Back\Controller;

use Think\Controller;

class CategoryController extends Controller{

    public function listAction(){
            $m_category = D('Category');
            $rows = $m_category->getTreeList();
            $this->assign('rows',$rows);

            $this->display();
    }
}