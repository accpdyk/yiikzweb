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
    //显示详细
    public  function actionView(){

        $model = $this->loadModel();
        $this->setPageTitle('查看详细');
        $this->render('_view',array('model'=>$model));

    }
    //查询任务
    public  function actionInfo(){
        $model = $this->loadModel();
        $model->finished = 'all';
        if(isset($_GET['My_Taskmain'])){
            $model->attributes = $_GET['My_Taskmain'];
        }
        $userlist = My_User::model()->getSelectList();
       $this->setPageTitle('任务查询');
       $this->render('infolist',array('model'=>$model,'data'=>$userlist));
    }
    //待办任务
    public  function actionDoing(){
      $model = $this->loadModel();
      $this->setPageTitle('待办任务');
      $model->finished = 'n';
      $this->render('doing',array('model'=>$model));

    }
    //更改任务状态
    public  function actionFinished(){
        if(isset($_GET['id'])){
            My_Taskmain::model()->updateFinished($_GET['id']);
            $this->redirect(app()->request->urlReferrer);
        }
    }
   //发布任务
    public  function  actionPublic(){
        $model = $this->loadModel();
        if(isset($_POST['My_Taskmain'])){
            $model->attributes = $_POST['My_Taskmain'];
            $model->tuid = user()->getId();
           // $model->starttime = date('Y-m-d H:i:s');
            $model->save();
            user()->setFlash('msg','发布成功');
            $this->refresh();
        }
        $this->setPageTitle('发布任务');
        $this->render('public',array('model'=>$model,
            'userdata'=>My_User::model()->getSelectList(),
            'leveldata'=>array('不限'=>'不限','一般'=>'一般','紧急'=>'紧急','非常紧急'=>'非常紧急')
        )
        );
    }
   public  function loadModel(){
      if($this->_model===null){
          if(isset($_GET['id']))
              $this->_model =  My_Taskmain::model()->findByPk($_GET['id']);
          else
              $this->_model =  new My_Taskmain();

      }
      return $this->_model;
   }

}
