<?php
/**
 ****************************
 * FileName:  TelbookController.php.
 * User:  hongke
 * Date:  13-3-5
 * Time:  下午2:20
 * **************************
 */
class TelbookController  extends  Controller
{
    private  $_model;
    public  function   actionInfo(){
        $model = $this->loadModel();
        if(isset($_GET['My_Tel'])){
            $model->attributes =  $_GET['My_Tel'];
        }
        $this->setPageTitle('公司通讯录');
        $this->render('infolist',array('model'=>$model));
    }
    public  function loadModel(){
        if($this->_model===null){
            if(isset($_GET['id']))
                $this->_model =  My_Tel::model()->findByPk($_GET['id']);
            else
                $this->_model =  new My_Tel();

        }
        return $this->_model;
    }

}
