<?php
// Automatically calculates the editor base path based on the _samples directory.
// This is usefull only for these samples. A real application should use something like this:
// $oFCKeditor->BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.


    include("fckeditor/fckeditor_php5.php") ;

    $sBasePath = 'http://www.oa.com.rock/fckeditor/' ;

    $oFCKeditor = new FCKeditor($txtname) ;//textarea的name值

    $oFCKeditor->BasePath	= $sBasePath ;

    $oFCKeditor->Value		= $content ; //textarea的value值

    $oFCKeditor->Height     = 600;

    $oFCKeditor->Create() ;

?>




