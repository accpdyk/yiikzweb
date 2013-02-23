<?php
/**
 ****************************
 * FileName:  WorkplanController.php.
 * User:  hongke
 * Date:  13-2-22
 * Time:  下午5:16
 * **************************
 */
class WorkplanController extends  Controller
{
    private  $_model;
    public  function actionInfo(){
        $model = $this->loadModel('search');
        if(isset($_GET['My_Workplan'])){
            $model->attributes = $_GET['My_Workplan'];
        }
        $this->setPageTitle('工作计划列表');

        $this->render('infolist',array('model'=>$model));
    }
    public  function actionAdd(){
        $model = $this->loadModel();
        if(isset($_POST['My_Workplan'])){
          $model->attributes = $_POST['My_Workplan'];
            if($model->validate()){
                if($model->isNewRecord){
                    $model->time = date('Y-m-d H:i:s');
                    $model->departmentid = user()->getState('department');
                    $msg='添加成功';
                }else{
                    $msg = '修改成功';
                }
                $model->save();
                user()->setFlash('msg',$msg);
                $this->refresh();
            }

        }
        $this->setPageTitle('工作计划');
        $this->render('_form',array('model'=>$model));
    }
    public  function actionDelete(){
        if(isset($_GET['id'])){
            $this->loadModel()->delete();
        }
    }
    public  function actionView(){

     $this->setPageTitle('查看详细工作计划');
     $this->render('view',array('model'=>$this->loadModel()));
    }

    protected function loadModel($condition=''){
        if($this->_model===null){
            if(isset($_GET['id']))
                $this->_model = My_Workplan::model()->findByPk($_GET['id']);
            else
                $this->_model = new My_Workplan($condition);

            return $this->_model;
        }
    }


}
