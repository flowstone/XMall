<?php

namespace Back\Controller;

use Think\Controller;
use Home\Cart\Cart;

class ProcessController extends Controller
{
    /**
     * 处理订单
     * @return [type] [description]
     */
    public function orderAction()
    {

        $redis = new \Redis;
        $redis->connect('127.0.0.1', '6379');

        while(true)
        {
            if (! $order_str = $redis->rpop('order_list')) {
                continue;
            }
            $order = unserialize($order_str);
            // var_dump($order);
            $m_goods = M('Goods');
            $m_goods_product = M('GoodsProduct');
            // 校验, 校验库存;
            $flag = true;
            foreach($order['goods_list'] AS $key=>$goods) {
                // 在数据库层面检验库存
                if ($goods['goods_product_id'] == '0') {
                    // goods表确定库存
                    $quantity = $m_goods->where(['goods_id'=>$goods['goods_id']])->getField('quantity');
                } else {
                    $quantity = $m_goods_product->where(['goods_product_id'=>$goods['goods_product_id']])->getField('product_quantity');
                }
                // 库存是否小于购买数量
                if ($quantity < $goods['buy_quantity']) {
                    $flag = false;// 订单不能生成
                    break;
                }
            }

            // 可以下单
            $data = $order;
            // var_dump($order);
            $data['shipping_id'] = $order['shipping_method'];
            $data['payment_id'] = $order['payment_method'];
            $data['order_time'] = time();
            $data['payment_status'] = '未支付';
            $data['shipping_status'] = '未发货';
            // 商品总价
            // 获取商品信息
            $m_goods = D('Home/Goods');
            foreach($order['goods_list'] AS $key=>$goods) 
            {
                $price = $m_goods->getPrice($goods['goods_id'], $goods['goods_product_id']);
                $total_price += $price * $goods['buy_quantity'];
            }

            $data['goods_total'] = $total_price;
            // $data['shipping_id']=$order['shipping_id']
            // 货运费
            // var_dump($data);die;
            $shipping_key = M('Shipping')->where(['shipping_id'=>$data['shipping_id']])->getField('key');
            $shipping_class = 'Common\Shipping\\'.$shipping_key;
            $shipping = new $shipping_class;
            $data['shipping_total'] = $shipping->price();
            // 计算总价
            $data['total'] = $data['shipping_total'] + $data['goods_total'];
                
            // 判断订单的生成状态
            if ($flag) {
                // 成功
                $data['order_status'] = '确定';
                // 记录当前的订单的生成结果
                $redis->hSet('order', $order['order_sn'], 'yes');
                echo $order['order_sn'], " Success", "\n";

            } else {
                // 失败
                $data['order_status'] = '未确定';
                $redis->hSet('order', $order['order_sn'], 'no');
                echo $order['order_sn'], ' Error', "\n";
            }
            // 生成订单表数据:
            if(M('Order')->create($data)) {
                $order_id = M('Order')->add();
            }

            // 生成订单商品表数据
            // 遍历所购的全部商品, 整理可以插入到order_goods表中的数据
            
            foreach($order['goods_list'] as $goods) {
                $price = $m_goods->getPrice($goods['goods_id'], $goods['goods_product_id']);

                $goods['order_id'] = $order_id;
                $goods['buy_price'] = $price;
                $data_list[] = $goods;
            }
            // 插入order_goods表:
            // dump($data_list);
            M('OrderGoods')->addAll($data_list);
        }

    }
}