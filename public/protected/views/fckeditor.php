<?php
// Automatically calculates the editor base path based on the _samples directory.
// This is usefull only for these samples. A real application should use something like this:
// $oFCKeditor->BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.


    include_once("fckeditor/fckeditor_php5.php") ;

    $sBasePath = app()->baseUrl.'/fckeditor/' ;
     if(!isset($height)) $height = 600;
     if(!isset($ToolbarSet))$ToolbarSet ='Default';//工具栏
    $oFCKeditor = new FCKeditor($txtname) ;//textarea的name值

    $oFCKeditor->BasePath	= $sBasePath ;

    $oFCKeditor->Value		= $content ; //textarea的value值

    $oFCKeditor->Height     = $height;

    $oFCKeditor->ToolbarSet = $ToolbarSet;

    $oFCKeditor->Create() ;

?>




