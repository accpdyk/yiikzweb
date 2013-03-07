<div class="content">
    <h3><?php  echo $this->pageTitle;?></h3>
    <style type="text/css">
        .operation{ text-decoration: none; margin: 1em;}
    </style>
    <?php /* @var $this NoticeController*/
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            array('name'=>'发布人','value'=>'$data->users->name'),'title','level','starttime',
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{view}{edit}',
                'buttons'=>array(
                    'view'=>array('label'=>'查看详细','imageUrl'=>false,'options'=>array('style'=>"margin: 1em",)),
                    'edit'=>array(
                        'label'=>'修改状态',
                        'imageUrl'=>false,
                        'url'=>'url(\'task/finished\',array(\'id\'=>$data->tid))',
                        'options'=>array('style'=>"margin: 1em",'onclick'=>'return confirm(\'确定已完成？\')')
                    )
                )
            ),

        ),
        'emptyText'=>'您的所有任务均已完成！！'


    ))
    ?>
</div>
