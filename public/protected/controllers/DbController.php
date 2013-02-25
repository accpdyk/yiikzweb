<?php
/**
 ****************************
 * FileName:  DbController.php.
 * User:  hongke
 * Date:  13-2-25
 * Time:  下午3:45
 * **************************
 */
class DbController extends  Controller
{
    private  $_data;
    public  function actionIndex(){

       $db = new CMysqlSchema(app()->db);
       
       $this->render('index',$this->_data);
    }


}
