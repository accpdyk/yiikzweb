<?php /* @var $this WorkreportController*/?>
<div class="content">
    <h3><?php echo $this->pageTitle;?>
        <span><a href="<?php echo url('workreport/info') ?>">[返回]</a></span>
    </h3>
    <?php $form=$this->beginWidget('CActiveForm', array(
    'id'=>'Notice-form',
    'enableAjaxValidation'=>false,
    'enableClientValidation'=>true,
)); ?>
    <table width="100%">
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'tname');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'tname',array('value'=>user()->getName()));?></td>
            <td>
                <?php  echo $form->error($model,'tname');?>
                <?php  echo $form->hiddenField($model,'username',array('value'=>user()->getid()));?>
            </td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'title');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'title');?></td>
            <td> <?php  echo $form->error($model,'title');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'part');?>：</td>
            <td  width="30%"> <?php  echo $form->dropDownList($model,'part',$this->getDepartmentList());?></td>
            <td> <?php  echo $form->error($model,'part');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php echo $form->labelEx($model,'ttext'); ?>:</td>
            <td colspan="2">
                <?php $this->renderPartial('//fckeditor',array('txtname'=>'My_Workreport[ttext]','content'=>$model->ttext));?>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">   <?php echo CHtml::submitButton($model->isNewRecord ? '创建' : '保存'); ?></td>
        </tr>
    </table>
    <?php $this->endWidget(); ?>
</div><!-- form -->