<?php
/**
 * FileName:  WelcomeController.php.
 * User:  hongke
 * Date:  13-1-24
 * Time:  下午5:02
 */
class WelcomeController extends  Controller
{
    private  $_data;

    public   function actionIndex(){
        $this->_data['menuList'] = $this->menuList();
        $this->render('body',$this->_data);
    }
    public  function  actionMain(){
        $uid = user()->getId();
        $this->_data['task'] = My_Taskmain::model()->countUnfinished($uid);
        $this->_data['mail'] = My_ReceiveMail::model()->countUnread($uid);
        $this->render('welcome',$this->_data);
    }

    /*
    * 设置页面导航菜单
    * 行政管理 ---mangage       公共信息 ---publicinfo
    * 交流中心 ---exchange      任务安排 ---task
    * 个人助理 ---personal      内部信箱 ---mailbox
    * 系统管理 ---system        数据管理 ---database
    * 工程管理 ---project       电子邮件 ---email
    *
    */
    public   function menuList(){
        $data = array(
            array(
                'itemname'=>'行政管理',
                'href'=>url('notice/info'),  //最先链接的网址
                '_for'=>'manage',
                'display'=>'block',
                'childs'=>array(
                    array('href'=>url('notice/info'),'name'=>'内部通知'),
                    array('href'=>url('workreport/info/type'),'name'=>'工作汇报'),
                    array('href'=>url('workplan/info'),'name'=>'工作计划'),
                  //  array('href'=>'','name'=>'管理规定'),

                )
            ),
           /* array(
                'itemname'=>'个人助理',
                'href'=>'',  //最先链接的网址
                '_for'=>'personal',
                'display'=>'none',
                'childs'=>array(
                    array('href'=>url('telbook/info'),'name'=>'公司通讯录'),
                    array('href'=>'','name'=>'日程安排'),
                    array('href'=>'','name'=>'考勤状态'),
                    array('href'=>'','name'=>'修改资料'),
                    array('href'=>'','name'=>'个人档案'),
                )
            ),*/
            array(
                'itemname'=>'内部信箱',
                'href'=>url('mail/send'),  //最先链接的网址
                '_for'=>'mailbox',
                'display'=>'none',
                'childs'=>array(
                    array('href'=>url('mail/send'),'name'=>'写邮件'),
                    array('href'=>url('mail/inbox'),'name'=>'收件箱'),
                    array('href'=>url('mail/outbox'),'name'=>'发件箱'),
                    array('href'=>url('mail/recycle'),'name'=>'回收站'),
                )
            ),
            array(
                'itemname'=>'系统管理',
                'href'=>url('user/info'),  //最先链接的网址
                '_for'=>'system',
                'display'=>'none',
                'childs'=>array(
                    array('href'=>url('user/info'),'name'=>'用户管理'),
                    array('href'=>url('db/index'),'name'=>'数据管理'),
                    array('href'=>url('car/info'),'name'=>'车辆管理'),
                    array('href'=>'','name'=>'系统设置'),
                )
            ),
        /*    array(
                'itemname'=>'数据管理',
                'href'=>'',  //最先链接的网址
                '_for'=>'database',
                'display'=>'none',
                'childs'=>array(
                    array('href'=>'','name'=>'数据备份'),
                    array('href'=>'','name'=>'数据恢复'),
                    array('href'=>'','name'=>'数据压缩'),
                    array('href'=>'','name'=>'删除汇报'),
                )
            ),
            array(
                'itemname'=>'电子邮件',
                'href'=>'',  //最先链接的网址
                '_for'=>'email',
                'display'=>'none',
                'childs'=>array(
                    array('href'=>'','name'=>'电子邮件'),
                )
            ),*/
            array(
                'itemname'=>'任务安排',
                'href'=>url('task/doing'),  //最先链接的网址
                '_for'=>'task',
                'display'=>'none',
                'childs'=>array(
                    array('href'=>url('task/doing'),'name'=>'待办任务'),
                    array('href'=>url('task/info'),'name'=>'任务查询'),
                    array('href'=>url('task/public'),'name'=>'发布任务'),
                )
            ),
        );
        return  $data;
    }

    //显示错误信息
    public  function actionError(){
        if($error=Yii::app()->errorHandler->error)
        {
            if(Yii::app()->request->isAjaxRequest)
                echo $error['message'];
            else
                $this->render('//error', $error);
        }
    }
}
