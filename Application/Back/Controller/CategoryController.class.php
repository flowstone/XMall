<?php
<<<<<<< HEAD
=======
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/21/2016
 * Time: 2:54 PM
 */
>>>>>>> dev

namespace Back\Controller;

use Think\Controller;

<<<<<<< HEAD
class CategoryController extends Controller
{

    public function listAction()
    {
        $m_category = D('Category');

        $rows = $m_category->getTreeList();

        $this->assign('rows', $rows);
        $this->display();
=======
class CategoryController extends Controller{

    public function listAction(){
            $m_category = D('Category');
            $rows = $m_category->getTreeList();
            $this->assign('rows',$rows);

            $this->display();
>>>>>>> dev
    }
}