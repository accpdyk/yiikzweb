<?php

$form = $this->beginWidget('CActiveForm',array(
    'id'=>'workreport',
    'action'=>url($this->route),
    'method'=>'get'
));
?>
<table>
    <tr>
        <td>发布人<?php  var_dump($model->tname);?></td>
        <td><?php echo  $form->textField($model,'tname');?></td>
        <td>标题</td>
        <td><?php   echo  $form->textField($model,'title')?></td>
        <td>所在部门</td>
        <td><?php  //echo $form->dropDownList($model,'department',$data);?></td>
        <td><?php echo CHtml::submitButton('搜索')?></td>
    </tr>
</table
<?php   $this->endWidget();?>