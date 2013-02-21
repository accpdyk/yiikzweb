<?php
/**
 ****************************
 * FileName:  _tabview.php.
 * User:  hongke
 * Date:  13-2-21
 * Time:  上午11:34
 * **************************
 */
$this->widget('zii.widgets.grid.CGridView',array(
    'dataProvider'=>$data,
    'columns'=>array(
        'tname',
        array('name'=>'department','value'=>'$data->depart->type'),
        'title',
        'time',
        'lastmodifydate',
        array(
            'class'=>'CButtonColumn',
            'header'=>'操作',
            'headerHtmlOptions'=>array('width'=>"200px"),
            'template'=>'{view}',
            'buttons'=>array(
                'view'=>array('label'=>'查看','imageUrl'=>false,'options'=>array('style'=>"margin: 1em")),
            )
        )
    )
));