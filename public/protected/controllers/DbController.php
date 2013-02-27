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
    private   $_string;

    public  function accessRules(){
        return array(
            array(
                'allow',
                'roles'=>array('admin'),//只有管理员角色才能访问
            ),
            array(
                'deny',
                'users'=>array('*'),
                'message'=>'无权限访问',
            )
        );
   }
    public  function actionIndex(){
       if(isset($_POST['backup'])){
           $fpath =dirname(Yii::app()->basePath).DIRECTORY_SEPARATOR.'backup';
           $datapath = $fpath.DIRECTORY_SEPARATOR.trim($_POST['backup']);
           if(!file_exists($datapath)) mkdir($datapath,0777);
           $this->writeFile($datapath.DIRECTORY_SEPARATOR.date('YmdHis').'_tableStructure.sql',$this->getTableStructure());
           $this->writeFile($datapath.DIRECTORY_SEPARATOR.date('YmdHis').'_data.sql',$this->getTableValues());
           user()->setFlash('msg','备份成功');
           user()->setFlash('filepath','文件备份目录：'.$datapath);
       }
       $this->render('index');
    }
    //数据库所有表结构备份
    public  function getTableStructure(){
        $string = '';
             foreach($this->getTableArray() as $tab):
                $arr = Yii::app()->db->createCommand('show CREATE TABLE '.$tab)->queryAll();;
                $string .= "/*Table structure for {$tab} `adrot` */ \n\n\r";
                $string .= 'DROP TABLE IF EXISTS `'.$tab.'`;';
                $string .= "\n\n\r";
                $string .= $arr[0]['Create Table'];
                $string .= "\n\n\r";
             endforeach;
        return $string;

    }
   //数据库所有表的内容备份
    public  function getTableValues(){
        $str = '';
            foreach($this->getTableArray() as $tab):
                $arr = Yii::app()->db->createCommand()->select()->from($tab)->queryAll();
                if(count($arr)){
                    foreach($arr as $row){
                        $str .= 'INSERT INTO `'.$tab.'` values(';
                        $str .= implode(',',array_map(array($this,'addSign'),array_values($row)));
                        $str .=")\n\r";
                    }
                }
                $str .="\n\r";
            endforeach;
          return $str;
    }
    //给数组里面的值添加  ‘
    public   function addSign($str){
        return '\''.$str.'\'';

    }
    //所有表数组
    public  function  getTableArray(){
        $db =  new CMysqlSchema(Yii::app()->db);
        return $db->tableNames;
    }
    //写入文件
    public  function writeFile($file,$content){
        $handle = fopen($file,'w+');
        fwrite($handle,$content);
        fclose($handle);
    }
}
