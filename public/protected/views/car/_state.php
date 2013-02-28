<?php /* @var $this NoticeController*/?>
<div class="content">
    <h3><?php echo $this->pageTitle;?>
        <span><a href="<?php echo url('car/info') ?>">[返回]</a></span>
    </h3>
    <?php $form=$this->beginWidget('CActiveForm', array(
    'id'=>'Notice-form',
    'enableAjaxValidation'=>false,
    'enableClientValidation'=>true,
)); ?>
    <table class="tab">
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_code');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_code');?></td>
            <td> <?php  echo $form->error($model,'car_code');?> </td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_state');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_state');?></td>
            <td> <?php  echo $form->error($model,'car_state');?> </td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statestart');?>：</td>
            <td  width="30%">
                <?php
                $this->widget('zii.widgets.jui.CJuiDatePicker', array( 'name'=>'My_Car[car_statestart]',
                    'language'=>'zh_cn',
                    'value'=>$model->car_statestart,
                    'htmlOptions'=>array('readonly'=>true),
                ));
                ?>
            </td>
            <td> <?php  echo $form->error($model,'car_statestart');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_stateend');?>：</td>
            <td  width="30%">
                <?php
                $this->widget('zii.widgets.jui.CJuiDatePicker', array( 'name'=>'My_Car[car_stateend]',
                'language'=>'zh_cn',
                'value'=>$model->car_stateend,
                'htmlOptions'=>array('readonly'=>true),
                ));
                ?>
            </td>
            <td> <?php  echo $form->error($model,'car_stateend');?></td>
        </tr>

        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statesmalluser');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_statesmalluser');?></td>
            <td> <?php  echo $form->error($model,'car_statesmalluser');?></td>
        </tr>

        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statecompany');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_statecompany');?></td>
            <td> <?php  echo $form->error($model,'car_statecompany');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statebiguser');?>：</td>
            <td  width="30%"><?php  echo $form->textField($model,'car_statebiguser',array('value'=>user()->getName()));?></td>
            <td> <?php  echo $form->error($model,'car_statebiguser');?></td>
        </tr>

        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statecause');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_statecause');?></td>
            <td> <?php  echo $form->error($model,'car_statecause');?></td>
        </tr>



        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statedeparture');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_statedeparture');?></td>
            <td> <?php  echo $form->error($model,'car_statedeparture');?></td>
        </tr>

        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_statedestination');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_statedestination');?></td>
            <td> <?php  echo $form->error($model,'car_statedestination');?></td>
        </tr>

        <tr>
            <td colspan="2" align="center">   <?php echo CHtml::submitButton($model->isNewRecord ? '创建' : '保存'); ?></td>
        </tr>
    </table>

    <?php $this->endWidget(); ?>
</div><!-- form -->



