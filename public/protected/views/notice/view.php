<div class="content">
    <h3><?php  echo $this->pageTitle;?> <span><a href="<?php echo url('notice/info') ?>">[返回]</a></span></h3>
    <?php $this->widget('zii.widgets.CDetailView', array(
    'data'=>$model,
    'attributes'=>array(
        'tname',
        'title',
        'ttext:html',
        'time'
    ),
)); ?>
</div>
