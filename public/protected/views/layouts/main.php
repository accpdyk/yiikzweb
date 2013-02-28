<!--This is IE DTD patch , Don't delete this line.-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>企业信息管理系统 KZcms_V1.1</title>
    <link href="<?php echo request()->baseUrl;?>/static/frame.css" rel="stylesheet" type="text/css">
</head>

<style type="text/css">
    .content{ width: 90%; margin: 0 auto;}
    .content h3{ padding: 2em;}
    .content h3 span a{ margin-left: 2em;}
    .content .td1{ text-align: right;}
    .footer{ height: 100px; border: solid; width: 100%;}
    .tab{ width: 90%; margin: 0 auto; line-height: 30px;}
</style>
<body>
<?php  echo $content;?>
<script type="text/javascript ">
    <?php
          if(user()->hasFlash('msg')){
              echo  'alert("'.user()->getFlash('msg').'")';
          }
    ?>
</script>
</body>
</html>