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
          <td>车牌号</td>
          <td><?php echo  $form->textField($model,'car_code');?></td>
          <td>司机</td>
          <td><?php   echo  $form->textField($model,'car_user')?></td>
          <td><?php echo CHtml::submitButton('搜索')?></td>
          <td width="100">&nbsp;</td>
          <td><?php  //echo CHtml::link('发布内部通知',url('notice/add'))?></td>
      </tr>
  </table
<?php  $this->endWidget();?>