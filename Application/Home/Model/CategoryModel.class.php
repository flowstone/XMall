<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 11/5/2016
 * Time: 1:54 PM
 */
namespace Home\Model;
use Think\Model;

class CategoryModel extends Model{

    /**
     * 得到嵌套结构的分类数据
     * @param int $max 最大层级数
     * @return mixed
     */
    public function getNested($max = 3){
        //获取前台可以展示的全部分类
        $list = $this->where(['is_used'=>'1','is_nav'=>'1'])
            ->order('sort_number')->select();
        //递归形成需要的数据格式
        return $this->nested($list, 0, 0, $max);
    }

    /**
     * 递归分类数据
     * @param $list 需要递归的数据
     * @param $category_id  分类的id
     * @param int $deep
     * @param null $max 最大下拉菜单的层数
     * @return array 返回设定好的格式的数据，便于前台处理
     */
    public function nested($list, $category_id, $deep=0, $max=null){
        //存储是当前分类下的所有的后代分类
        $nested = [];
        foreach ($list as $row) {
            if ($category_id == $row['parent_id'] ) {
                //继续查找分类的子分类
                //判断当前是否超过了最大深度

                if ($deep < ($max-1)) {
                    //<2 执行后代的分类查找
                    $row['children'] = $this->nested($list, $row['category_id'],
                        $deep+1, $max);
                }
                //将当前的分类记录下拉
                $nested[] = $row;
            }
        }

        return $nested;
    }
}