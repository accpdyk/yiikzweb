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
    public  function actionEdit(){

    }
    public  function actionDelete(){

    }
    public  function actionView(){

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
