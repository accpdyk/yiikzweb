<?php /* @var $this UserController*/ ?>
<?php
 $this->renderPartial('_search',array('model'=>$model,'data'=>$this->getDepartmentList()));
 $this->widget('zii.widgets.grid.CGridView',array(
    'dataProvider'=>$model->search(),
    'columns'=>array(
    'username',
    'name',
     array('name'=>'partid','value'=>'$data->depart->type'),
     'phone',
    array(
    'class'=>'CButtonColumn',
    'header'=>'操作',
    'headerHtmlOptions'=>array('width'=>'200px'),
    'template'=>'{update}{delete}{view}{add}',
    'buttons'=>array(
    // 'delete'=>array('visible'=>'($data->tname==user()->getName())?true:false')
    'update'=>array('label'=>'修改','imageUrl'=>false, 'url'=>'url("user/edit",array("id"=>$data->id))','options'=>array('style'=>"margin: 1em")),
    'delete'=>array('label'=>"删除",'imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
    'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
    'add'=>array('label'=>'添加','imageUrl'=>false,'url'=>'url(\'user/edit\')','options'=>array('style'=>"margin: 1em"))
    )
    ),
    ),

))

    ?>