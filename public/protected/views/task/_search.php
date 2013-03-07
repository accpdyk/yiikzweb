<?php
$form= $this->beginWidget('CActiveForm',array(
    'id'=>"searchForm",
    'action'=>url($this->route),
    'method'=>'get'
))
?>
  <table>
      <tr>
          <td>发布人：</td>
          <td><?php echo  $form->DropDownList($model,'tuid',$data);?></td>
          <td>标题：</td>
          <td><?php echo  $form->textField($model,'title');?></td>
          <td>是否完成</td>
          <td><?php echo  $form->DropDownList($model,'finished',array('all'=>'全部','n'=>'未完成','y'=>'已完成'));?></td>
          <td><?php echo CHtml::submitButton('搜索')?></td>
      </tr>
  </table
<?php  $this->endWidget();?>