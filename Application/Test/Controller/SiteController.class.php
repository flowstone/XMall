<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/7/2016
 * Time: 10:10 AM
 */
namespace Test\Controller;
use Think\Controller;
class SiteController extends  Controller {

    //初始化动作
    public function _initialize(){
        echo '我是初始化<br>';
    }
    //前置动作
    public function _before_worldAction(){
        echo 'before','<br>';
    }
    public function worldAction(){
        echo 'Hello',I('get.name','Kang');
    }
    //后置动作
    public function _after_worldAction(){
      echo '<br>','after';
    }
    //空动作
    public function _empty(){
        echo '空动作';
    }
    //暂时没看懂
    public function ajaxShowAction(){

    }

    //I函数应用
    public function inputAction($name='helloYao'){
        //$name = I('get.name','HelloYao');
        //$name = I('get.name',' HelloYao', 'strtolower'); //没效果
        //$name = I('get.name', 'HelloYao');
        dump($name);
    }

    public function relationAction(){
        $model = D('MemberRelation');
        //$row = $model->relation(true)->find(7);
        $row = $model->relation('event')->find(14);
//        $resutl = $model->relation(true)->delete(11);
        dump($row);
    }
    //CRUD
    public function selectAction(){
        //table()
//        $model = M();
//        $model->table('member'); //没有前缀
//        $model->table('temp_name'); //其他前缀
//        $model->select();

        //group()
//        $model = M('Member');
//        $rows = $model->field('member_id pk, name as xingming')
//            ->group('is_newsletter')  //分组
//            ->having('count(*) > 1')  //分组后的条件表达式
//            ->order('member_id DESC')  //排序
//            ->limit(1, 2)  //
//            ->select();
//        dump($model->getLastSql());
//        dump($rows);



        //关联连接查询 join()
//        $model = M('Member');
//        $rows = $model
//            ->field('m.*,count(mll.member_login_log_id) login_count')
//            ->alias('m')   //别名
////            ->join('left jon __MEMBER_LOGIN_LOG__ mll ON m.member_id=mll.member_id')
//            ->join('left jon __MEMBER_LOGIN_LOG__ mll using(member_id)')
//            ->group('m.member_id')
//            ->select();
//        dump($model->getLastSql());
//        dump($rows);


    }

    //查询的字段  field()
    public function fieldAction(){
        $model = M('Member');
//        $model->field('member_id, name')->select();
        $rows = $model->field('member_id pk, name as xingming')->select();
//        dump($model->getLastSql());
        dump($rows);
    }

    //条件的写法
    public function whereAction(){
        /*字符串OR 数组*/
//        $model = M('Member');
////        $cond = 'is_newsletter = 0'; //字符串写法  会引起SQL注入问题
//        $cond = ['is_newsletter'=>0]; // 数组写法
//        $model->where($cond);
//        $rows = $model->select();
//        echo $model->getLastSql();
//        dump($rows);

        /*字符串 OR 数组   ----注入*/
//        $model = M('Member');
//        $user_data = "'1' or 1";
//        $cond = "is_newsletter = $user_data"; //字符串写法  会引起SQL注入问题
////        $cond = ['is_newsletter' => $user_data]; // 数组写法
//        $model->where($cond);
//        $rows = $model->select();
//        echo $model->getLastSql();
//        dump($rows);


        /*数组 关系、逻辑运算*/
//        $model = M('Member');
        //$cond = ['member_id' => 1]; //数组写法
//        $cond['member_id'] = ['EQ', 1]; //支持简写 ['member_id' => 1]
//        $cond['member_id'] = ['GT', 1];
//        $cond['member_id'] = ['EGT', 1];
//        $cond['member_id'] = ['LT', 1];
//        $cond['member_id'] = ['ELT', 1];
//        $cond['name'] = ['like', 'hello%'];
//        $cond['is_newsletter'] = ['IN', [0, 1, 2]];
//        $cond['is_newsletter'] = ['BETWEEN', [0, 2]];

        //多条件处理---------------
//        $cond['is_newsletter'] = ['BETWEEN', [0, 2]];
//        $cond['name'] = ['like', 'hello%'];
//        $cond['_logic'] = 'OR';

        //复杂逻辑支持
//        $cond2['telephone'] = ['like', '134%'];
//        $cond2['name'] = ['like', 'hello%'];
//        $cond2['_logic'] = 'OR';
//
//        $cond['is_newsletter'] = ['BETWEEN', [0, 2]];
//        $cond['_complex'] = $cond2;
//        $model->where($cond)->select();
//        echo $model->getLastSql();

        /*数组转换为对象语法*/
        $model = M('Member');
        $cond_object = new \stdClass;
        $cond_object->is_newsletter = 1;
        $model->where($cond_object)->select();
        echo $model->getLastSql();

    }

    //AR(Active Record)活动记录
    public function arAction(){
        $model = M('Member');
        //AR操作，通常始于find(primary key)
        $model->find(2); //模型对应 记录
        //属性对应 字段
       // echo $model->name;
        //更新
        //$model->name = 'HelloKitty';
        //$model->save();
        //删除
        $model->delete();

    }


    //增删改查
    public function modelAction(){
//        $model = M();
//        dump($model);

//        $model = M('Member');
//        dump($model);

//          $model = M('Member');
//          $data = [
//              'email' => 'php3@qq.com',
//              'name' => 'HelloPHP',
//              'password' => '1234',
//          ];
//        $result = $model->add($data);
//        dump($result);

//        $model = M('Member');
//          $data = [
//              ['email' => 'word@qq.com',
//              'name' => 'HelloPHP6',
//              'password' => '1234',],
//              ['email' => 'hello@qq.com',
//                  'name' => 'HelloPHP4',
//                  'password' => '1234',],
//              ['email' => 'tiny@qq.com',
//                  'name' => 'HelloPHP5',
//                  'password' => '1234',],
//          ];
//        $result = $model->addAll($data);
//        dump($result);

        //删除
//        $model = M('Member');
////        $result = $model->delete(1);
////        $result = $model->delete('2,3');
//        $result = $model->where(['password'=>'1234'])->delete();
//        dump($result);

        //查询
//        $model = M('Member');
//        //利用主键查询
////        $row = $model->find(1);
//        //利用条件查询
////        $row = $model->where(['member_id'=>1])->find();
//        $row = $model->where(['member_id'=>1])->select();
//        dump($row);

        //更新
//        $model = M('Member');
//        //数据中，包含主键
////        $data = [
////            'member_id' => '1',
////            'name' => 'HelloKang',
////        ];
////        $data = ['password'=>'1234'];
////        $result = $model->where(['is_newsletter'=>0])->save($data);
//        //递增
//        $result = $model->where(['is_newsletter'=>0])->setInc('member_id',3);
////        $result = $model->where(['is_newsletter'=>0])->setDec('member_id',3);
//        dump($model->getLastSql());
//        dump($result);


        //create
        $model = M('Member');
        $model->create();
        $model->save();
    }

    //模板使用
    public function  tplAction(){
        $this->assign('name','HelloYao');
        $this->assign('user',['name'=>'HelloYao','gender'=>'Male']);
        $student = new \stdClass;
        $student->name = 'HelloYao';
        $student->gender = 'Male';
        $this->assign('student',$student);

        $this->assign('now',time());

        $this->assign('score',mt_rand(45, 100));

        $this->assign(
          'user_list',
            [['name'=>'小李','age'=>45],
            ['name'=>'小白','age'=>55],
            ['name'=>'小张','age'=>35],
            ['name'=>'小明','age'=>25],]
        );
        $this->display();
    }

    public function helloAction(){
        dump($_GET);
        var_dump($_GET);
        trace('运行了hello动作','info');
        $this->assign('name',$_GET['name']);
        $this->display();
    }

    //G函数使用  内存使用
    public function gAction() {
        //记录开始
        G('begin');
        for ($i=0; $i<=10000; ++$i) {
            $rand = mt_rand(0, 1000);
        }
        //比较差异
        //echo G('begin','end');
        echo G('begin','end',6);
    }

    //U函数使用 生成URL
    public function urlAction(){
        //不带参数
        echo U('Member/register'),'<br>';
        //携带参数
        echo U('Member/register',['time'=>time()]),'<br>';
        //当前控制器下某个动作(非绑定模块的入口文件中)
        echo U('hello',['time'=>time()]),'<br>';

        echo U('register'),'<br>';
        echo U('/register'),'<br>';
    }

    //C函数使用  获取配置
    public function configAction(){
        echo C('DB_PWD');
    }
}