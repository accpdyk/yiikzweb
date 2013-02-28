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
    public  function accessRules(){
        return array(
           array(
              'allow',
              'actions'=>array('info','add','view'),
              'users'=>array('@')
           ),
           array(
               'allow',
               'actions'=>array('update'),
               'expression'=>array($this,'authChk'),
           ),
            array(
                'deny',
                'users'=>array('*'),
                'message'=>'无权限访问',
            )
        );
    }
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
       $model = $this->_model;//由于authChk中，此函数已经将model（含有$_GET[id]）实例化,没有必要再应用$this->loadModel(),要不然返回的将是空值
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
            if(isset($_GET['id'])):
                $this->_model=My_Notice::model()->findbyPk(trim($_GET['id']));
            else:
                $this->_model = new My_Notice($condition);
            endif;
           return $this->_model;
        }

    }
    //CAccessRule的权限判断，只允许发布文档的用户修改文档
    public  function authChk($user,$rule){
       //如果用户名和此文章用户名相同，则可以更改
          if(user()->getName()==$this->loadModel()->tname)
               return true;
          else
               return false;

    }


}
