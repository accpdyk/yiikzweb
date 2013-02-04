<script type="text/javascript" src="<?php echo app()->baseUrl;?>/fckeditor/fckeditor.js"></script>
<script type="text/javascript">
    var sBasePath ='<?php echo app()->baseUrl;?>/fckeditor/' ;
    var oFCKeditor = new FCKeditor( '<?php echo $txtname?>' ) ;
    oFCKeditor.BasePath	= sBasePath ;
    oFCKeditor.Value	= '<?php echo isset($content)?$content:null?>' ;
    oFCKeditor.Height	= 600 ;
    oFCKeditor.Create() ;
    //-->

</script>


