<?php
/**
 ****************************
 * FileName:  CarController.php.
 * User:  hongke
 * Date:  13-2-28
 * Time:  上午8:52
 * **************************
 */
class CarController extends  Controller
{
    private  $_model;
    //信息列表
    public  function actionInfo(){
       $model = $this->loadModel();
       $this->setPageTitle('车辆信息查看');
      if(isset($_GET['My_Car'])){
          $model->attributes = $_GET['My_Car'];
      }
      $this->render('infolist',array('model'=>$model));
    }
    //删除
    public  function actionDelete(){
        if(isset($_GET['id'])){
            $this->loadModel()->delete();
            $this->redirect(array('info'));
        }

    }
    //删除所选
    public  function actionDelSelect(){
        if(isset($_GET['aid'])){
            $idArr = explode(',',$_GET['aid']);
            $this->loadModel()->delSelect($idArr);
        }
    }
    //查看详细信息
    public  function actionView(){
        if(isset($_GET['id'])){
            $model =$this->loadModel();
            $this->pageTitle='查看内部通知';
            $this->render('view',array('model'=>$model));
        }
    }
    //修改和添加
    public  function actionEdit(){
        $model = $this->loadModel();
        if(isset($_POST['My_Car'])){
            $model->attributes = $_POST['My_Car'];
            if($model->validate()){
                if($model->isNewRecord):
                    $model->time = date('Y-m-d H:i:s');
                    $msg = '添加成功';
                else:
                    $msg = '修改成功';
                endif;
               $model->save();
               user()->setFlash('msg',$msg);
               $this->refresh();
            }
        }
         $this->setPageTitle('车辆管理');
        $this->render('_form',array('model'=>$model));


    }
   //弹出框，设置车辆状态
    public  function actionState(){
        if(isset($_GET['id'])){
            $model = $this->loadModel();
            if(isset($_POST['My_Car'])){

                $model->attributes = $_POST['My_Car'];
                $model->save();
                user()->setFlash('msg','设置成功');
            }
            $this->setPageTitle('设置车辆状态');
            $this->render('_state',array('model'=>$model));
        }

    }
    protected   function loadModel($condition=''){
        if($this->_model===null){
           if(isset($_GET['id'])):
               $this->_model = My_Car::model()->findByPk(trim($_GET['id']));
           else:
               $this->_model = new My_Car($condition);
           endif;
           return $this->_model;
        }
    }

}
