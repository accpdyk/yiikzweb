<?php
/*
 * 使用方法
 * $this->renderPartial('//fckeditor',array('txtname'=>'My_SendMail[content]','content'=>$model->content,'height'=>200,'ToolbarSet'=>'Basic'))
 */
    include_once("fckeditor/fckeditor_php5.php") ;

    $sBasePath = app()->baseUrl.'/fckeditor/' ;
     if(!isset($height)) $height = 600;//自定义高度
     if(!isset($ToolbarSet))$ToolbarSet ='Default';//工具栏  或者Basic
    $oFCKeditor = new FCKeditor($txtname) ;//textarea的name值

    $oFCKeditor->BasePath	= $sBasePath ;

    $oFCKeditor->Value		= $content ; //textarea的value值

    $oFCKeditor->Height     = $height;

    $oFCKeditor->ToolbarSet = $ToolbarSet;

    $oFCKeditor->Create() ;

?>




