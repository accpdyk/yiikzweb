<?php /* @var $this NoticeController*/?>
<div class="content">
    <h3><?php echo $this->pageTitle;?>
        <span><a href="<?php echo url('notice/info') ?>">[返回]</a></span>
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
                <?php // echo $form->hiddenField($model,'username',array('value'=>user()->getid()));?>
                <?php // echo $form->hiddenField($model,'partid',array('value'=>user()->getState('department')))?>
            </td>
        </tr>


        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'title');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'title');?></td>
            <td>
                <?php  echo $form->error($model,'title');?>
            </td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'view_object');?>：</td>
            <td  width="30%"> <?php   echo $form->dropDownList($model,'view_object',$this->getDepartmentList());?></td>
            <td> <?php  echo $form->error($model,'view_object');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%">通知内容:</td>
            <td colspan="2">
                <?php $this->renderPartial('//fckeditor',array('txtname'=>'My_Notice[ttext]','content'=>$model->ttext));?>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">   <?php echo CHtml::submitButton($model->isNewRecord ? '创建' : '保存'); ?></td>
        </tr>
    </table>




    <?php $this->endWidget(); ?>
</div><!-- form -->