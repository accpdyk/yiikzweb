<?php /* @var $this MailController*/ ?>
<div class="content">
    <h3>已发送邮件</h3>
<?php
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            array('name'=>'addressee','value'=>'$data->users->name'),
            'title',
            'time',
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{view}',
                'buttons'=>array(
                    'view'=>array('label'=>'查看详细','imageUrl'=>false)
                )
            )
        )
    ))
?>
</div>