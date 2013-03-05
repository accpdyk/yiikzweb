<?php
/**
 ****************************
 * FileName:  MailController.php.
 * User:  hongke
 * Date:  13-3-1
 * Time:  上午10:14
 * **************************
 */
class MailController extends  Controller
{
    private  $_model;
    //发邮件
    public  function  actionSend(){

       $model = $this->loadModel();
       $userList = My_User::model()->getSelectList();
        if(isset($_POST['My_SendMail'])){
            $model->attributes = $_POST['My_SendMail'];
            if($model->validate()){
                $mUpload = CUploadedFile::getInstance($model,'filename');
                $fileAllPath =  dirname(app()->basePath).DIRECTORY_SEPARATOR.'uploads'.DIRECTORY_SEPARATOR.iconv("UTF-8","gb2312", $mUpload->name); //需要编码转换
                $mUpload->saveAs($fileAllPath);
                $model->time = date('Y-m-d H:i:s');
                $model->filename = $mUpload->getName();
                $model->addressor = user()->getId();
                $model->save();
                $receiveData = array(
                    'send_mail_id'=>$model->id,
                    'addressee'=>$model->addressee,
                    'iscopy'=>'n',
                    'addresser'=>user()->getId()
                );
                My_ReceiveMail::model()->afterSend($receiveData);
                $this->afterSend($model->copy,$receiveData);
                user()->setFlash('msg','发送成功');
                $this->refresh();
            }

        }
        $this->render('send',array('model'=>$model,'data'=>$userList));

    }

    //收件箱
    public  function actionInbox(){

       $model =  new My_ReceiveMail();
       $this->render('inbox',array('model'=>$model));

    }


    //已发送邮件
    public  function actionOutbox(){
        $model =  $this->loadModel();
        $this->render('outbox',array('model'=>$model));
    }


    //回收站
    public  function actionRecycle(){
      $this->render('recycle',array('model'=>$this->loadModel()));
    }


    //放入回收站
    public  function  actionDelete(){
        if(isset($_GET['id'])){
            if(stripos(app()->request->urlReferrer,'inbox'))
                 My_ReceiveMail::model()->putRecycle();
            else
                My_SendMail::model()->putRecycle();
        }

    }

    //查看详细
    public  function actionView(){
       $model = My_SendMail::model()->findByPk(trim($_GET['id']))->with('users');
       if(!is_null(app()->request->urlReferrer)){ //判断 HTTP_REFERER
           if(stripos(app()->request->urlReferrer,'inbox')){
            My_ReceiveMail::model()->hadRead(
                  array('isread'=>'y'),
                  array('and','send_mail_id=:id','addressee=:uid','isread=:no'),
                  array(':id'=>$_GET['id'],'uid'=>user()->getId(),':no'=>'n')
            );
           }
       }


       $this->render('_view',array('model'=>$model));
    }

    //对于抄送的，循环添加的接受邮件列表中
    protected  function  afterSend($copy,$receiveData){
        if(!is_null($copy)){
            $list = explode(',',$copy);
            foreach($list as $key){
                $receiveData['addressee'] = $key;
                $receiveData['iscopy'] ='y';
                My_ReceiveMail::model()->afterSend($receiveData);
            }
        }
    }

    protected  function loadModel($condition=''){

        if($this->_model ===null){

            if(isset($_GET['id'])):
                $this->_model = My_SendMail::model()->findByPk(trim($_GET['id']));
            else:
                $this->_model = new My_SendMail($condition);
            endif;

        }
        return $this->_model;
    }

}
