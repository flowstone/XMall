<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 11/5/2016
 * Time: 1:47 PM
 */
namespace Home\Controller;
//use Think\Controller;

class ShopController extends CommonController{
    /**
     *
     */
    public function indexAction(){

        //数据的获取
//        $m_category = D('Category');
//        $category_list = $m_category->getNested(); //nested嵌套
//        $this->assign('category_list', $category_list);

        //当前会员信息
        //$this->assign('member', session('member'));
        //推荐商品数据
        $m_goods = D('Goods');
        $this->assign('promote_goods_list', $m_goods->getPromote());
        //最新商品数据
        $this->assign('new_goods_list', $m_goods->getNew());
        //特价商品数据
        $this->assign('offers_goods_list', $m_goods->getOffers());
        //展示首页模板
        $this->display();
    }

    public function goodsAction(){
        $goods_id = I('get.goods_id', 0, 'trim');
        if ($goods_id == 0) {
            $this->redirect('/index', [], 0);
        }
        $m_goods = D('goods');

        //获取商品信息
        $goods = $m_goods->find($goods_id);
        $this->assign('goods', $goods);

        //面包屑信息
        $breadcrumb = $m_goods->getBreadcrumb($goods_id);
        $this->assign('breadcrumb', $breadcrumb);

        $this->assign('image_list', M('GoodsImage')->where(['goods_id'=>$goods_id])->select());
        $this->display();
    }
}