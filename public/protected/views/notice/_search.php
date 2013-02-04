<?php  /* @var $this NoticeController */?>
<?php
      $form= $this->beginWidget('CActiveForm',array(
          'id'=>"searchForm",
          'action'=>url($this->route),
          'method'=>'get'
      ))
?>
  <table>
      <tr>
          <td>发布人</td>
          <td><?php echo  $form->textField($model,'tname');?></td>
          <td>标题</td>
          <td><?php   echo  $form->textField($model,'title')?></td>
          <td>所在部门</td>
          <td><?php  echo $form->dropDownList($model,'partid',$data);?></td>
          <td><?php echo CHtml::submitButton('搜索')?></td>
      </tr>
  </table
<?php  $this->endWidget();?>