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
            array('name'=>'id','value'=>'$row+1'),
            'car_code','car_type','car_user','car_usermobile','car_state',
            array('name'=>'使用时间','value'=>'$data->car_statestart.\'--\'.$data->car_stateend'),
            array(
                'class'=>'CButtonColumn',
                'header'=>'操作',
                'headerHtmlOptions'=>array('width'=>'200px'),
                'template'=>'{update}{delete}{view}{set}',
                'buttons'=>array(
                    'update'=>array('label'=>'修改','url'=>'url(\'car/edit\',array(\'id\'=>$data->id))','imageUrl'=>false, 'options'=>array('style'=>"margin: 1em")),
                    'delete'=>array('label'=>"删除",'imageUrl'=>false,'options'=>array('style'=>"margin: 1em"),'visible'=>'user()->checkAccess(\'admin\')?true:false'),
                     'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
                     'set'=>array('label'=>"设置",'url'=>'url(\'car/state\',array(\'id\'=>$data->id))','options'=>array('style'=>'margin:1em'))
                )
            ),
        ),

    ))
    ?>
</div>


