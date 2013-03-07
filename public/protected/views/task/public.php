<?php /* @var $this UserController */?>
<div class="content"><h3><?php echo $this->pageTitle; ?></h3></div>

<?php

$form=$this->beginWidget('CActiveForm',array(
    'id'=>'task_form',
    'enableClientValidation'=>true,
))
?>

<table class="tab">

    <tr>
        <td align='right'><?php  echo $form->labelEx($model,'title');?>：</td>
        <td> <?php  echo $form->textField($model,'title');?></td>
        <td> <?php  echo $form->error($model,'title');?></td>
    </tr>

    <tr>
        <td align='right'>指定用户：</td>
        <td> <?php  echo $form->DropDownList($model,'uid',$userdata);?></td>
        <td> <?php  echo $form->error($model,'uid');?></td>
    </tr>

    <tr>
        <td  align='right' width="20%"><?php  echo $form->labelEx($model,'level');?>：</td>
        <td> <?php  echo $form->DropDownList($model,'level',$leveldata);?></td>
        <td> <?php  echo $form->error($model,'level');?></td>
    </tr>

    <tr>
        <td  align='right'> <?php  echo $form->labelEx($model,'content');?>：</td>
        <td> <?php  $this->renderPartial('//fckeditor',array('txtname'=>'My_Taskmain[content]','content'=>$model->content,'height'=>300))?></td>
        <td><?php  echo $form->error($model,'content');?> </td>
    </tr>

    <tr>
        <td  align='right'> <?php  echo $form->labelEx($model,'remark');?>：</td>
        <td><?php echo $form->textArea($model,'remark',array('style'=>'width:600px'))?></td>
        <td> <?php  echo $form->error($model,'remark');?></td>
    </tr>

    <tr>
        <td colspan="2" style="text-align: center;">
            <?php  echo CHtml::submitButton('添加')?>
        </td>
    </tr>

</table>
<?php  $this->endWidget();?>