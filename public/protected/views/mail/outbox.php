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
                'template'=>'{view}{delete}',
                'buttons'=>array(
                    'view'=>array('label'=>'查看详细','imageUrl'=>false),
                    'delete'=>array('label'=>'删除邮件','imageUrl'=>false,'options'=>array('style'=>'margin-left:2em'))
                )
            )
        )
    ))
?>
</div>