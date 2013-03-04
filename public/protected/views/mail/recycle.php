<?php /* @var $this MailController*/ ?>
<div class="content">
    <h3>删除</h3>
    <?php
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search('y'),
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
                    'delete'=>array('label'=>'彻底删除','imageUrl'=>false,'options'=>array('style'=>'margin-left:2em'))
                )
            )
        )
    ))
    ?>
</div>