<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/28/2016
 * Time: 1:53 PM
 */
namespace Back\Controller;
use Think\Controller;

class BrandController extends Controller{

    public function addAction(){
        //判断是否为POST数据提交
        if (IS_POST) {
          //数据处理
            $model = D('Brand');
            $result = $model->create();

            if (!$result) {
                $this->error('数据添加失败：'.$model->getError(),U('add'));
            }

            $result = $model->add();
            if (!$result) {
                $this->error('数据添加失败：'.$model->getError(),U('add'));
            }

            //成功重定向到list页
            $this->redirect('list',[],0);
        } else {
            //表单展示
            $this->display();
        }
    }

    /**
     * ajax的相关请求
     */
    public function ajaxAction(){
        $operate = I('request.operate', null, 'trim');

        if (is_null($operate)) {
            return ;
        }

        switch ($operate) {
            //验证品牌名称唯一的操作
            case 'checkBrandUnique':
                //获取填写的品牌名称
                $title = I('request.title','');
                $cond['title'] = $title;
                //判断是否传递了brand_id
                $
                //获取模型后,利用条件获取匹配的记录数
                $count = M('Brand')->where($cond)->count();
                //如果记录数>0,条件为真，说明存在记录，重复，验证未通过，响应false
                echo $count ? 'false' : 'true';
             break;

        }

    }

}