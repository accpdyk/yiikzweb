<?php /* @var $this MailController*/ ?>
<div class="content">
    <h3>收件箱</h3>
    <?php
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            array('name'=>'发件人','value'=>'$data->users->name'),
           
            'mail.title',
            'mail.content:html',
            'isread',
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