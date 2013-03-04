<?php /* @var $this MailController*/ ?>
<div class="content">
    <h3>收件箱</h3>
    <?php
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            array('name'=>'发件人','value'=>'$data->users->name'),
            'mail.title',
            array('name'=>'是否阅读','value'=>'($data->isread==\'y\')?\'已阅读\':\'未阅读\''),
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{view}',
                'buttons'=>array(
                    'view'=>array('label'=>'阅读邮件','imageUrl'=>false,'url'=>'url(\'mail/view\',array(\'id\'=>$data->send_mail_id))','click')
                )
            )
        ),
       'htmlOptions'=>array('style'=>'width:600px;margin:0 auto')
    ))
    ?>
</div>