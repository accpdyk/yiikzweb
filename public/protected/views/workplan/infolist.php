<div class="content">
    <h3><?php  echo $this->pageTitle;?></h3>
    <style type="text/css">
        .operation{ text-decoration: none; margin: 1em;}
    </style>
    <?php /* @var $this NoticeController*/


    $this->renderPartial('_search',array('model'=>$model));
    $this->widget('zii.widgets.grid.CGridView',array(
        'dataProvider'=>$model->search(),

        'columns'=>array(
            // array('name'=>'partid','value'=>'$data->depart->type'),//部门
            array('name'=>'id','value'=>'$row+1'),
            'title','tname','time',
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{update}{delete}{view}',//只有管理员有删除权限，发布人员具有编辑权限
                'buttons'=>array(
                    //'delete'=>array('visible'=>'($data->tname==user()->getName())?true:false')
                    'update'=>array('label'=>'修改','visible'=>'($data->tname==user()->getName())?true:false','imageUrl'=>false,'url'=>'url(\'workplan/add\',array(\'id\'=>$data->id))', 'options'=>array('style'=>"margin: 1em")),
                    'delete'=>array('label'=>"删除",'visible'=>'user()->checkAccess(\'admin\')?true:false','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                    'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                )
            ),
        ),

    ))
    ?>
</div>