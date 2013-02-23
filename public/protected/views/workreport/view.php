<div class="content">
    <h3><?php  echo $this->pageTitle;?> <span><a href="<?php echo url('workreport/info') ?>">[返回]</a></span></h3>
    <?php $this->widget('zii.widgets.CDetailView', array(
    'data'=>$model,
    'attributes'=>array(
        'tname',
        'title',
        'depart.type',//组合查询出的type
        'ttext:html',
        'time',
        'lastmodifydate'
    ),
)); ?>

</div>