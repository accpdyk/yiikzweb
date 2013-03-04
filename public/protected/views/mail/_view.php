<div class="content">
    <h3>查看详细信息 <span><a href="<?php echo $_SERVER['HTTP_REFERER']; ?>">[返回]</a></span></h3>
    <?php
   $this->widget('zii.widgets.CDetailView', array(
    'data'=>$model,
    'attributes'=>array(
        array('name'=>'收件人','value'=>$model->users->name),
        'title',
        'content:html',//组合查询出的type
        'time',
    ),
)); ?>


</div>