<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hongke
 * Date: 12-11-21
 * Time: 下午7:52
 * To change this template use File | Settings | File Templates.
 */
class AController extends  CController
{
    public $menu=array();
    public $layout ='//layouts/adminMain';
    public $breadcrumbs=array();
    /**
     * @return array action filters
     */
    public function filters()
    {
        return array(
            'accessControl', //必须加上这个函数，要不然下面的rules就没法引用，也就不起作用了
        );
    }

    public  function accessRules(){
            return array(
                array(
                    'allow',
                    'expression'=>array($this,'checkLogin'),//相当于$this->checkLogin($user),这里的user就是Yii::app()->user
                ),
                array(
                    'deny',
                    'users'=>array('*'),
                )
            );
    }

    //判断管理员角色
    public  function  checkLogin($user){

       return ($this->loadUserModel($user->name)->admin ==1);
    }
    //查询用户名是否存在
    public  function loadUserModel($name){
        $model =Member::model()->find('name=:name',array(':name'=>$name));
        if($model===null){
            throw new CHttpException(404,'无权限访问此页面');
        }else{
            return $model;
        }
    }
}
