
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<div style="width: 80%; margin: 0 auto; line-height: 30px;">
    <h3></h3>
    <p>备份数据库的文件:</p>
    <form method="post">
        <?php  echo CHtml::textField('backup','')?>
        <?php  echo CHtml::submitButton('备份数据库')?>
    </form>
    <P style="color: #ff0000;"><?php echo user()->getFlash('filepath'); ?></P>
</div>
    <script type="text/javascript">
         function write(){
             $('h3').html('<?php echo user()->getFlash('tableName')?>');

         }
     setInterval(write,500);

    </script>
