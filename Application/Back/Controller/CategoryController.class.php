<?php

namespace Back\Controller;

use Think\Controller;

class CategoryController extends Controller
{

    public function listAction()
    {
        $m_category = D('Category');

        $rows = $m_category->getTreeList();

        $this->assign('rows', $rows);
        $this->display();
    }
}