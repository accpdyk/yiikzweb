<h3><?php  echo $this->pageTitle;?> <span><a href="<?php echo isset($_SERVER['HTTP_REFERER'])?$_SERVER['HTTP_REFERER']:url('task/info') ?>">[返回]</a></span></h3>
<?php

$this->widget('zii.widgets.CDetailView', array(
        'data'=>$model,
        'attributes'=>array(
            'title',
            'content:html',
            'remark',
            'level',
            'starttime',
            'finished',
            'finishedtime',

        ),
    )
);

?>