<div style="width: 80%; margin: 0 auto; height: 100px; margin-top: 100px;">
    <h2 style=" text-align: center;"> <?php
        echo Yii::app()->user->getFlash('state').'正在跳转。。。。。。';
        ?>
    </h2>
</div>
<script type="text/javascript">
    function skipUrl(){
        window.location.href='<?php echo isset($url)?$url:$_SERVER['HTTP_REFERER'];?>';
    }
    setTimeout('skipUrl()',500);
</script>