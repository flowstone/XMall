<?php
/**
 * Created by PhpStorm.
 * User: 尧
 * Date: 10/23/2016
 * Time: 10:54 AM
 * Description: 所有的后台的守护进程程序
 */

namespace Back\Controller;
use Think\Controller;

class DaemonController extends Controller{

    //会员邮件
    public function memberMailAction(){
        $redis = new \Redis;
        $redis->connect('127.0.0.1', '6379');
        $redis->auth('helloyao'); //如果认证开启了，也需要提供密码
        $m_member = M('Member');

        while (true) {
            $member_id = $redis->rpop('member_list');
            if (!$member_id) {
                continue;
            }

            //获取了会员ID，执行发送邮件的操作
            $row = $m_member->field('email, name')->find($member_id);

            $from = 'yaoxue2014@hotmail.com';
            $to = $row['email'];
            $subject = '双十一，不要错过';
            $body = <<<body
            亲爱的{$row['name']}:
           金秋双十一，赶快来买吧
body;
            $this->sendMail($to, $from, $subject, $body);
        }
    }

    //发送邮件
    public function sendMail($to, $from, $subject, $body){
        echo 'send Mail to', $to, ' success !',"\n";
        sleep(1);
        return true;
    }
}