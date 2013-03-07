<div class="content">
    <h3><?php  echo $this->pageTitle;?></h3>
    <style type="text/css">
        .operation{ text-decoration: none; margin: 1em;}
    </style>
    <?php /* @var $this NoticeController*/
    $this->renderPartial('_search',array('model'=>$model,'data'=>$data));
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            array('name'=>'发布人','value'=>'$data->users->name'),'title','level','starttime',
            array('name'=>'是否完成','value'=>'($data->finished==\'n\')?\'【未完成】\':\'已完成\'','htmlOptions'=>array('style'=>'color:red')),
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{view}',
                'buttons'=>array(
                    'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                )
            ),
        ),

    ))
    ?>
</div>