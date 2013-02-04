<div class="content">
    <h3><?php  echo $this->pageTitle;?></h3>
    <style type="text/css">
        .operation{ text-decoration: none; margin: 1em;}
    </style>
    <?php /* @var $this NoticeController*/
    $this->renderPartial('_search',array('model'=>$model,'data'=>$this->getDepartmentList()));
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),
        'columns'=>array(
            'tname',
            array('name'=>'partid','value'=>'$data->depart->type'),//部门
            'title','time',
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{update}{delete}{view}{add}',
                'buttons'=>array(
                   // 'delete'=>array('visible'=>'($data->tname==user()->getName())?true:false')
                        'update'=>array('label'=>'修改','imageUrl'=>false, 'options'=>array('style'=>"margin: 1em")),
                        'delete'=>array('label'=>"删除",'imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                         'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                         'add'=>array('label'=>'添加','imageUrl'=>false,'url'=>'url(\'notice/add\')','options'=>array('style'=>"margin: 1em"))
                )
            ),
        ),

    ))
    ?>
</div>
