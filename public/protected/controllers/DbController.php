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

    public  function actionIndex(){
       if(isset($_POST['backup'])){
           $fpath =dirname(Yii::app()->basePath);
           $datapath = $fpath.'/'.trim($_POST['backup']);
              if(file_exists($datapath)) {
                  $handle = fopen($datapath.'/TableStructure.sql','w+');
                  fwrite($handle,$this->getTableValues());
                  fclose($handle);
              }else{
                  echo 'none'.$datapath;exit;
              }

       }
       $this->render('index');
    }
    //数据库所有表结构备份
    public  function getTableStructure(){
        $string = '';
        foreach($this->getTableArray() as $tab){
            $arr = Yii::app()->db->createCommand('show CREATE TABLE '.$tab)->queryAll();;
            $string .= "/*Table structure for {$tab} `adrot` */ \n\n\r";
            $string .= 'DROP TABLE IF EXISTS `'.$tab.'`;';
            $string .= "\n\n\r";
            $string .= $arr[0]['Create Table'];
            $string .= "\n\n\r";
        }
        return $string;

    }
   //数据库所有表的内容备份
    public  function getTableValues(){
        $str = '';
        foreach($this->getTableArray() as $tab){
            $arr = Yii::app()->db->createCommand()->select()->from($tab)->queryAll();
            if(count($arr)){
                foreach($arr as $row){
                    $str .= 'INSERT INTO `'.$tab.'` values(';
                    $str .= implode(',',array_map(array($this,'addSign'),array_values($row)));
                    $str .=")<br/>";
                }
            }
            $str .="<br/>";
        }
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
}
