<?php /* @var $this TelbookController */?>
<?php
$form = $this->beginWidget('CActiveForm',array(
    'id'=>'TelbookForm',
    'action'=>url($this->route),
    'method'=>'get'
));
?>
    <table>
        <tr>
        <td>名称</td>
        <td><?php echo  $form->textField($model,'telname');?></td>
        <td>电话</td>
        <td><?php   echo  $form->textField($model,'telphone')?></td>

        <td><?php  //echo $form->dropDownList($model,'department',$data);?></td>
        <td><?php echo CHtml::submitButton('搜索')?></td>
        <td>&nbsp;</td>
        <td><?php // echo  CHtml::link('添加工作计划',array('workplan/add'))?></td>
        </tr>
    </table
<?php   $this->endWidget();?>