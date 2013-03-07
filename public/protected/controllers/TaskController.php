<?php
/**
 ****************************
 * FileName:  TaskController.php.
 * User:  hongke
 * Date:  13-3-5
 * Time:  下午2:07
 * **************************
 */
class TaskController  extends Controller
{
   private  $_model;
   public  function   actionInfo(){
     $this->render('infolist',array('model'=>$this->loadModel()));
   }
   public  function loadModel(){
      if($this->_model===null){
          if(isset($_GET['id']))
              $this->_model =  My_Tel::model()->findByPk($_GET['id']);
          else
              $this->_model =  new My_Tel();

      }
   }

}
