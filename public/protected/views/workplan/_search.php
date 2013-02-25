<?php

$form = $this->beginWidget('CActiveForm',array(
    'id'=>'workreport',
    'action'=>url($this->route),
    'method'=>'get'
));
?>
<table>
    <tr>
        <td>发布人</td>
        <td><?php echo  $form->textField($model,'tname');?></td>
        <td>标题</td>
        <td><?php   echo  $form->textField($model,'title')?></td>

        <td><?php  //echo $form->dropDownList($model,'department',$data);?></td>
        <td><?php echo CHtml::submitButton('搜索')?></td>
        <td>&nbsp;</td>
        <td><?php  echo  CHtml::link('添加工作计划',array('workplan/add'))?></td>
    </tr>
</table
<?php   $this->endWidget();?>