<?php
namespace Back\Controller;

use Think\Controller;
use Think\Page;

class ShippingController extends Controller
{
    /**
     * 添加动作
     */
    public function addAction()
    {
        // 判断是否为POST数据提交
        if (IS_POST) {
            // 数据处理
            // $model = M('Shipping');
            $model = D('Shipping');
            $result = $model->create();

            if (!$result) {
                $this->error('数据添加失败: ' . $model->getError(), U('add'));
            }

            $result = $model->add();
            if (!$result) {
                $this->error('数据添加失败:' . $modle->getError(), U('add'));
            }
            // 成功重定向到list页
            $this->redirect('list', [], 0);
        } else {
            // 表单展示
            $this->display();
        }
    }


    /**
     * 列表相关动作
     */
    public function listAction()
    {

        $model = M('Shipping');  

        // 分页, 搜索, 排序等
        // 搜索, 筛选, 过滤
        // 判断用户传输的搜索条件, 进行处理
        // $filter 表示用户输入的内容
        // $cond 表示用在模型中查询条件
        $cond = $filter = [];// 初始条件
        // 在生成代码的基础上, 自定义完成搜索条件
        // 
        // 分配筛选数据, 到模板, 为了展示搜索条件
        $this->assign('filter', $filter);

        // 排序
        $sort = $order = [];
        // 考虑用户所传递的排序方式和字段
        // 在生成代码的基础上,自定义默认的排序字段(假设,表中存在sort_number字段, 不存在需要修改)
        // $order['field'] = I('get.field', 'sort_number', 'trim');// 初始排序, 字段
        // $order['type'] = I('get.type', 'asc', 'trim');// 初始排序, 方式

        if (!empty($order)) {
            $sort = $order['field'] . ' ' . $order['type'];
        }
        $this->assign('order', $order);  
          
        $rows = $model->where($cond)->order($sort)->page("$page, $pagesize")->select();
        // $this->assign('rows', $rows);


        // 插件目录中的配送方式
        $shipping_path = COMMON_PATH . 'Shipping/';
        // 遍历所有的文件, 依次require即可
        $handle = opendir($shipping_path);
        $shipping_list = [];
        while($filename = readdir($handle)) {
            if (in_array($filename, ['.', '..'])) continue;

            // 全部的配送方式文件
            require $shipping_path . $filename;
            // 检测是实现了I_Shipping接口, 再记录
            $class_name = strchr($filename, '.', true);
            $if_arr = class_implements('Common\Shipping\\' . $class_name);
            if (in_array('Common\Interfaces\I_Shipping', $if_arr)) {
                // $shipping_list[] = $class_name;
                $full_class_name = 'Common\Shipping\\' . $class_name;
                $shipping_list[$class_name] = new $full_class_name;
            }
            // class_implements(class)
        }
        closedir($handle);
        // 全部的配送方式类
        // $this->assign('shipping_list', $shipping_list);
        // 
        // $rows数据表中记录, $shipping_list插件记录
        // 已经安装的插件
        // 同时清理, 安装过, 但是插件被删除的记录
        $list_rows = [];
        foreach($rows as $row) {
            // 得到每条记录
            // 该记录的有效性.
            if (isset($shipping_list[$row['key']])) {
                // 该插件记录有效
                // 记录下该插件, 已经安装的插件
                $row['installed'] = true;
                $list_rows[$row['key']] = $row;
            } else {
                // 记录无效, 删除无效的记录
                M('Shipping')->delete($row['shipping_id']);
            }
        }
        // 未安装的插件
        $list_shipping_list = [];
        foreach($shipping_list as $key=>$shipping) {
            if (! isset($list_rows[$key])) {
                // 未安装
                $list_shipping_list[$key] = $shipping;
            }
        }
        $this->assign('list_rows', $list_rows);
        $this->assign('list_shipping_list', $list_shipping_list);
        


        $this->display();
    }

    /**
     * 编辑
     */
    public function editAction()
    {

        if (IS_POST) {

            $model = D('Shipping');
            $result = $model->create();

            if (!$result) {
                $this->error('数据修改失败: ' . $model->getError(), U('edit'));
            }

            $result = $model->save();
            if (!$result) {
                $this->error('数据修改失败:' . $modle->getError(), U('edit'));
            }
            // 成功重定向到list页
            $this->redirect('list', [], 0);

        } else {

            // 获取当前编辑的内容
            $shipping_id = I('get.shipping_id', '', 'trim');
            $this->assign('row', M('Shipping')->find($shipping_id));

            // 展示模板
            $this->display();
        }
    }


    /**
     * 批处理
     */
    public function multiAction()
    {
        // 确定动作
        $operate = I('post.operate', 'delete', 'trim');
        // 确定ID列表
        $selected = I('post.selected', []);
        
        // 如果为空数组, 表示没有选择, 则立即跳转回列表页.
        if (empty($selected)) {
            $this->redirect('list', [], 0);
            return ;
        }

        switch ($operate) {
            case 'delete':
                // 使用in条件, 删除全部的品牌
                $cond = ['shipping_id' => ['in', $selected]];
                M('Shipping')->where($cond)->delete();
                $this->redirect('list', [], 0);
                break;
            default:
                # code...
                break;
        }
    }


    /**
     * ajax的相关请求
     */
    public function ajaxAction()
    {
        $operate = I('request.operate', null, 'trim');

        if (is_null($operate)) {
            return ;
        }

        switch ($operate) {
            // 验证品牌名称唯一的操作
            case 'checkBrandUnique':
                // 获取填写的品牌名称
                $title = I('request.title', '');
                $cond['title'] = $title;
                // 判断是否传递了brand_id
                $brand_id = I('request.brand_id', null);
                if (!is_null($brand_id)) {
                    // 存在, 则匹配与当前ID不相同的记录
                    $cond['brand_id'] = ['neq', $brand_id];
                }
                // 获取模型后, 利用条件获取匹配的记录数
                $count = M('Shipping')->where($cond)->count();
                // 如果记录数>0, 条件为真, 说明存在记录, 重复, 验证未通过, 响应false
                echo $count ? 'false' : 'true';
            break;
        }
    }

    public function installAction()
    {

        $key = I('get.key');
        // 利用key获取配送插件信息
        $full_class_name = 'Common\Shipping\\' . $key;
        $shipping = new $full_class_name;

        $data = [
            'key'   => $key,
            'title' => $shipping->title(),
            'is_default'    => 0,
            'enabled'   => 1,
            'sort_number'   => 0,
        ];

        if (M('Shipping')->create($data)) {
            M('Shipping')->add();
        }

        $this->redirect('list', [], 0);
    }
}