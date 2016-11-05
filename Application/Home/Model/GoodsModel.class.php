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
}