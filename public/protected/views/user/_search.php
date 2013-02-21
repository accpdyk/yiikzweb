<?php
$form= $this->beginWidget('CActiveForm',array(
    'id'=>"searchForm",
    'action'=>url($this->route),
    'method'=>'get'
))
?>
  <table>
      <tr>
          <td>用户名</td>
          <td><?php echo  $form->textField($model,'username');?></td>
          <td>所在部门</td>
          <td><?php  echo $form->dropDownList($model,'partid',$data);?></td>
          <td><?php echo CHtml::submitButton('搜索')?></td>
      </tr>
  </table
<?php  $this->endWidget();?>