<?php /* @var $this UserController */?>
<h3><?php echo $this->pageTitle; ?></h3>
<?php
   $form=$this->beginWidget('CActiveForm',array(
       'id'=>'register',
       'enableClientValidation'=>true,
   ))
?>
<style type="text/css">
    table{ width: 60%; line-height: 36px;}
    .td1{ text-align: right;}
    h3{ text-indent: 2em;}
    .error{ border-color: red;}
</style>
<?php  //echo $form->errorSummary($model);?>
  <table>
      <tr>
          <td class="td1" width="20%"><?php  echo $form->labelEx($model,'username');?>：</td>
          <td  width="30%"> <?php  echo $form->textField($model,'username');?></td>
          <td> <?php  echo $form->error($model,'username');?></td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'pwd');?>：</td>
          <td> <?php  echo $form->passwordField($model,'pwd');?></td>
          <td><?php  echo $form->error($model,'pwd');?> </td>
      </tr>
      <tr>
          <td class="td1" width="20%"><?php  echo $form->labelEx($model,'name');?>：</td>
          <td  width="30%"> <?php  echo $form->textField($model,'name');?></td>
          <td> <?php  echo $form->error($model,'name');?></td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'partid');?>：</td>
          <td> <?php  echo $form->dropDownList($model,'partid',$data);?></td>
          <td> <?php  echo $form->error($model,'partid');?></td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'ilevel');?>：</td>
          <td> <?php  echo $form->dropDownList($model,'ilevel',$job);?></td>
          <td> <?php  echo $form->error($model,'ilevel');?></td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'email');?>：</td>
          <td> <?php  echo $form->textField($model,'email');?></td>
          <td>  <?php  echo $form->error($model,'email');?>  </td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'phone');?>：</td>
          <td>
              <?php  echo $form->textField($model,'phone');?>
              <?php  echo $form->error($model,'phone');?>
          </td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'question');?>：</td>
          <td><?php  echo $form->textField($model,'question');?></td>
          <td><?php  echo $form->error($model,'question');?> </td>
      </tr>
      <tr>
          <td class="td1"> <?php  echo $form->labelEx($model,'answer');?>：</td>
          <td><?php  echo $form->textField($model,'answer');?></td>
          <td><?php  echo $form->error($model,'answer');?> </td>
      </tr>
      <tr>
          <td colspan="2" style="text-align: center;">
              <?php  echo CHtml::submitButton('注册用户')?>
          </td>
      </tr>
  </table>
<?php  $this->endWidget();?>