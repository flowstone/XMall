<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/11/2016
 * Time: 3:39 PM
 */
namespace Back\Controller;
use Think\Controller;
use Think\Page;

class MemberController extends Controller{
    public function listAction(){
        //利用模型获取数据
        $m_member = M('Member');
        $cond = [];
        //$offset = ($page -1 ) * pagesize;
        //$m_member->limit("$offset,$pagesize")->select();

        $page = I('get.p','1');
        $pagesize = 3;
        $rows = $m_member
            ->where($cond)
            ->page("$page,$pagesize") //自动计算offset,
            ->select();
        $this->assign('rows',$rows);

        //获取总记录数
        $count = $m_member->where($cond)->count();
        $t_page = new Page($count, $pagesize); //use Think\Page;
        // 配置格式
        $t_page->setConfig('next', '&gt;');
        $t_page->setConfig('last', '&gt;|');
        $t_page->setConfig('prev', '&lt;');
        $t_page->setConfig('first', '|&lt;');

        $t_page->setConfig('theme', '<div class="col-sm-6 text-left"><ul class="pagination">%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% </ul></div><div class="col-sm-6 text-right">%HEADER%</div>');
        $t_page->setConfig('header', '显示开始 %FIRST_ROW% 到 %LAST_ROW% 之 %TOTAL_ROW% （总 %TOTAL_PAGE% 页）');
        // 生成HTML代码
        $page_html = $t_page->show();
        $this->assign('page_html', $page_html);


        // 展示分页列表
        $this->display();
    }
}