<?php
/**
 ****************************
 * FileName:  LoginController.php.
 * User:  hongke
 * Date:  13-1-30
 * Time:  下午1:47
 * **************************
 */
class LoginController extends  CController
{
    public  function actionIndex(){
        $model= new My_Form('form');
        if(isset($_POST['My_Form'])){
            $model->attributes = $_POST['My_Form'];
            if($model->validate() &&  $model->login()){
                $this->redirect(url('welcome/index'));
            }
        }
        $this->renderPartial('//login',array('model'=>$model));
    }

    //用户注销
    public  function actionOut(){
        user()->logout();
        $this->redirect(url('login/index'));
    }
    //用户注册
    public  function actionRegister(){
        $model= new My_User();
        if(isset($_POST['My_User'])){
            $model->attributes = $_POST['My_User'];
            if($model->validate()){
                $model->uptime=date('Y-m-d H:i:s');
                $model->save();
                Yii::app()->user->setFlash('state','注册成功！等待管理员审核');
                $this->render('../skip',array('url'=>'/'));exit;

            }
        }
        $department= My_Department::model()->getDataList();
        $job       = My_Job::model()->getDataList();
        $this->pageTitle='用户注册';
        $this->render('//user/add',array('model'=>$model,'data'=>$department,'job'=>$job));
    }
}
