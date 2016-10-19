<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/7/2016
 * Time: 8:21 PM
 */
namespace Home\Controller;
use  Think\Controller;
//use Think\Model;
use Think\Verify;

class MemberController extends  Controller {

    //注册动作
    public function registerAction(){
        if (IS_POST) {
            //获取表单提交的数据，插入到数据表中
            //$m_member = M('Member'); //获取Member表操作操作模型
            $m_member = D('Member'); //获取Member表操作操作模型

//            $rules =
//                [
                    //array(验证字段1,验证规则,错误提示,[验证条件,附加规则,验证时间]),
//                    ['email','require','邮箱必须',Model::EXISTS_VALIDATE,'',Model::MODEL_BOTH],
//                    ['email','require','邮箱必须'],
//                    ['email','email','邮箱规则必须正确'],
//                    ['email','','邮箱不能重复',Model::EXISTS_VALIDATE,'unique'],

//                    ['name','require','姓名必须'],
//                    ['name','4,32','姓名必须使用4-32个字符',Model::EXISTS_VALIDATE,'length'],
//                    ['name','','姓名不能重复',Model::EXISTS_VALIDATE,'unique'],

//                    ['password','require','密码必须'],
//                    ['password','6,32','密码长度要在6-32个字符间',Model::EXISTS_VALIDATE,'length'],
//                    ['password','/^[\w_!@#$%^&*()]+$/','密码仅由数字字母及_!@#$%^&*()符号组成',
//                        Model::EXISTS_VALIDATE,'regex'],
//                    ['password','checkPasswordStrong','密码必须要包含字母，数字，特殊符号中两种或两种一种上',
//                        Model::EXISTS_VALIDATE,'callback'],
//                    ['password','confirm','两次输入的密码一致',Model::EXISTS_VALIDATE,'confirm'],

//                    ['is_newsletter',[0,1],'订阅信息必须选择',Model::EXISTS_VALIDATE,'in'],
//
//                    ['agree','require','请阅读隐私政策',Model::MUST_VALIDATE,'',''],
//                    ['agree','1','请同意隐私政策',Model::EXISTS_VALIDATE,'equal',''],

//            ];

            //if (!$m_member->validate($rules)->create()) {
            if (!$m_member->create($_POST,'register')) {
                //数据创建失败，给出提示
                $this->error('注册失败,'.$m_member->getError(),U('/register'));
                //$this->error('注册失败, ' . implode('<br>', $m_member->getError()), U('/register'));
            }
            $m_member->add(); //存储 //save()
            $this->redirect('/center',[], 0);

        } else {
            //展示注册表单
            $this->display();
        }

    }

    //用户中心
    public function centerAction(){
        echo '用户中心';
    }

    //会员登陆
    public function loginAction(){
        if (IS_POST) {
            //校验验证码
            $t_verify = new Verify;
            if (! $t_verify->check(I('post.verify'))) {
                $this->error('请填写正确的验证码', U('/login'));
            }

            //获取用户输入的数据
            $email = I('post.email');
            $password = I('post.password');
            //校验
            $m_member = M('Member');
            //先使用邮箱地址或电话号码，查询用户
            $cond['email'] = $email;
            $cond['telephone'] = $email;
            $cond['_logic'] = 'OR'; //或者
            $row = $m_member->where($cond)->find(); //仅需要一条

            if (! $row) {
                //邮箱，号码，都没有匹配
                $this->error('登陆信息错误');
            }

            //再校验密码
            if ($row['password'] != md5($password)) {
                $this->error('登陆信息错误');
            }

            //校验通过
            //可以登陆
            //session中，存储登陆标志
            unset($row['password']);
            session('member',$row);

            //重定向到目标页
            $this->redirect('/center',[],0);

        } else {
            $this->display();
        }
    }

    public function verifyAction(){
        //实例化验证码类
        $t_verify = new Verify;
        //生成
        $t_verify->imageW = 140;
        $t_verify->imageH = 34;
        $t_verify->fontSize = 18;
        $t_verify->length = 4;
        $t_verify->entry();
    }

    //退出登陆
    public function logoutAction(){
        //删除session的登陆标志
        session('memeber', null); //删除登陆标志
        //session('[destory]'); //销毁session
        $this->redirect('/login', [], 0);
    }

}