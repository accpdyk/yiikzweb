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
          <td>通知名称</td>
          <td><?php   echo  $form->textField($model,'title')?></td>
          <td><?php echo CHtml::submitButton('搜索')?></td>
          <td width="100">&nbsp;</td>
          <td><?php  echo CHtml::link('发布内部通知',url('notice/add'))?></td>
      </tr>
  </table
<?php  $this->endWidget();?>