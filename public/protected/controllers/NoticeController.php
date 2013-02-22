<?php
/**
 ****************************
 * FileName:  NoticeController.php.
 * User:  hongke
 * Date:  13-1-30
 * Time:  下午2:26
 * **************************
 */
class NoticeController extends  Controller
{
    private  $_model;
    public  function actionInfo(){
        $model= $this->loadModel('search');
        $model->unsetAttributes();//清空初始变量
        if(isset($_GET['My_Notice'])){
            $model->attributes = $_GET['My_Notice'];
        }
       $this->pageTitle='内部通知信息列表';

       $this->render('infolist',array('model'=>$model));
    }
    public  function actionAdd(){
       $model =  $this->loadModel();
       if(isset($_POST['My_Notice'])){
           $model->attributes = $_POST['My_Notice'];
          if($model->validate()){
              $model->time = date('Y-m-d H:i:s');
              $model->save();
              user()->setFlash('msg','添加成功');
              $this->refresh();
          }
       }
        $this->setPageTitle('添加内部通知');
        $this->render('_form',array('model'=>$model));
    }

    public  function actionDelete(){
        if(isset($_GET['id'])){
            $this->loadModel()->delete();
            $this->redirect(array('info'));
        }
    }
    public  function actionView(){
        if(isset($_GET['id'])){
            $model =$this->loadModel();// My_Notice::model()->with('depart')->findByPk($_GET['id']);
            $this->pageTitle='查看内部通知';
            $this->render('view',array('model'=>$model));
        }
    }
    public  function  actionUpdate(){
       $model = $this->loadModel();
       $this->pageTitle='修改内部通知';
        if(isset($_POST['My_Notice'])){
          $model->attributes = $_POST['My_Notice'];
           if($model->validate()){
             $model->save();
             $this->redirect(array('view','id'=>$model->id));
           }
        }
       $this->render('_form',array('model'=>$model));
    }
    public function loadModel($condition='')
    {
        if($this->_model===null)
        {
            if(isset($_GET['id']))
                $this->_model=My_Notice::model()->findbyPk(trim($_GET['id']));
            else
                $this->_model = new My_Notice($condition);
        }
        return $this->_model;
    }


}
