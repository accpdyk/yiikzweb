<?php
/**
 ****************************
 * FileName:  WorkreportController.php.
 * User:  hongke
 * Date:  13-2-4
 * Time:  上午9:04
 * **************************
 */
class WorkreportController extends  Controller
{
    private $_model;

    public  function  actionInfo($type='self'){
        $model = $this->loadModel('search');
        if(isset($_GET['My_Workreport'])){
            $model->attributes = $_GET['My_Workreport'];

        }
        $this->setPageTitle('工作汇报列表');
        if(user()->checkAccess('admin'))
            $this->render('adminInfolist',array('data'=>$model->search(),'model'=>$model));
        else
            $this->render('infolist',array(
                'data'=>$model->search($type),
                'model'=>$model,
                'tab'=>($type=='all' || $type=='department')?'_tabview':'_tab')
            );

    }
    //要显示的tab
    public   function  showTab(){
       if((!isset($_GET['type']))|| $_GET['type']=='self') return 'tab1';
       if($_GET['type']=='department') return 'tab2';
       if($_GET['type']=='all') return 'tab3';
    }

    public  function actionView(){

         $model = $this->loadModel('depart');
         $this->setPageTitle('查看工作汇报');
         $this->render('view',array('model'=>$model));

    }

    public  function  actionDelete(){
        if($_GET['id']){
            $this->loadModel()->delete();
        }
    }

    public  function actionEdit(){
        $model = $this->loadModel();
        $status ='修改';
        if(isset($_POST['My_Workreport'])){
               $model->attributes = $_POST['My_Workreport'];
               if($model->validate()){
                   if($model->isNewRecord){
                       $model->time = date('Y-m-d H:i:s');
                       $status='添加';
                   }
                   $model->lastmodifydate =  date('Y-m-d H:i:s');
                   $model->save();
                   user()->setFlash('msg','保存成功');
                   $this->refresh();
               }

        }
        $this->setPageTitle($status.'工作汇报');
        $this->render('_form',array('model'=>$model));
    }



    public  function loadModel($condition=''){

        if($this->_model===null){
            if(isset($_GET['id'])){
                $this->_model = My_Workreport::model()->with('depart')->findByPk(trim($_GET['id']));
            }else{
                $this->_model = new My_Workreport($condition);
            }

            return $this->_model;
        }
    }


}
