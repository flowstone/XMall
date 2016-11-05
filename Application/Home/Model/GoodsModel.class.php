<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 11/5/2016
 * Time: 8:21 PM
 */
namespace Home\Model;
use Think\Model;

class GoodsModel extends Model{

    public function getPromote(){
        //确定推荐商品的条件
        //随机推荐
        $max_goods_id = $this->max('goods_id');
        $promote_number = getConfig('promote_goods_number', 4);
        //获得随机的商品ID
        for($i=1,$n=$promote_number*3; $i<=$n; ++$i) { //备容错
            $rand_id[] = mt_rand(1, $max_goods_id);
        }

        //利用随机的ID，获取商品
        $list = $this->where(['is_deleted'=>0, 'status'=>1, 'goods_id'=>['in',$rand_id]])
            ->limit($promote_number)->select();
        return $list;
    }


    /**
     * 获得该商品的导航数据
     * @param $goods_id
     * @return array
     */
    public function getBreadcrumb($goods_id){
        //获取当前分类ID
        $category_id  = $this->where(['goods_id'=>$goods_id])
            ->getField('category_id');
        //查找当前分类及其祖先分类
        $parents  = $this->getParents($category_id);
        //反转数组,先展示顶级，在展示末级
        return array_reverse($parents);

    }

    public function getParents($category_id){
        static $parents = [];

        $m_category = M('Category');
        //先获取当前分类信息，确定是否为顶级分类
        $category = $m_category->find($category_id);
        //存储当前的父级分类
        $parents[] = $category;
        if ($category['parent_id'] != '0') {
            //不是顶级分类，递归查找
            $this->getParents($category['parent_id']);
        }
        return $parents;
    }
}