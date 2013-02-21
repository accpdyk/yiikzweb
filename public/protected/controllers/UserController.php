<?php
/**
 ****************************
 * FileName:  UserController.php.
 * User:  hongke
 * Date:  13-1-29
 * Time:  上午9:24
 * **************************
 */
class UserController extends  Controller
{
    private  $_model;
    public  function actionInfo(){

        $model = new My_User('search');
        $model->unsetAttributes();
        if(isset($_GET['My_User'])){
            $model->attributes = $_GET['My_User'];
        }
        $this->render('infolist',array('model'=>$model));

    }
    public  function actionEdit(){
        $this->pageTitle = '添加新用户';
        $model = $this->loadModel();
        if(isset($_POST['My_User'])){
            $model->attributes = $_POST['My_User'];
            if($model->validate()){
                $model->uptime=date('Y-m-d H:i:s');
                $model->state = 1;
                $model->save();
                user()->setFlash('msg','添加成功');
                $this->refresh();
            }
        }
        $this->render('_form',array(
            'model'=>$model,
            'data'=>My_Department::model()->getDataList(),
            'job'=>My_Job::model()->getDataList()
        ));
    }
    public  function  actionView(){
        if(isset($_GET['id'])){
            $model = $this->loadModel();
            $this->pageTitle = '查看用户信息';
            $this->render('view',array('model'=>$model));
        }

    }

    public  function actionDelete(){
        if(isset($_GET['id'])){
            $this->loadModel()->delete();
            $this->redirect(array('info'));
        }

    }

    public  function loadModel(){
        if($this->_model===null){
            if(isset($_GET['id']))
                $this->_model = My_User::model()->findByPk(trim($_GET['id']));
            else
                $this->_model = New My_User();

        }
        return $this->_model;
    }
}
