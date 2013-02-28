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
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_type');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_type');?></td>
            <td> <?php  echo $form->error($model,'car_type');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_buyprice');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_buyprice');?></td>
            <td> <?php  echo $form->error($model,'car_buyprice');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_buytime');?>：</td>
            <td  width="30%">
            <?php
               $this->widget('zii.widgets.jui.CJuiDatePicker', array( 'name'=>'My_Car[car_buytime]','language'=>'zh_cn','value'=>$model->car_buytime,'htmlOptions'=>array('readonly'=>true)));
            ?>
            </td>
            <td> <?php  echo $form->error($model,'car_buytime');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_company');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_company');?></td>
            <td> <?php  echo $form->error($model,'car_company');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_user');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_user');?></td>
            <td> <?php  echo $form->error($model,'car_user');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_usermobile');?>：</td>
            <td  width="30%"><?php  echo $form->textField($model,'car_usermobile');?></td>
            <td> <?php  echo $form->error($model,'car_usermobile');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'car_usertel');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'car_usertel');?></td>
            <td> <?php  echo $form->error($model,'car_usertel');?></td>
        </tr>

        <tr>
            <td class="td1" width="20%">运营费用:</td>
            <td colspan="2">
                <?php     $this->renderPartial('//fckeditor',array('txtname'=>'My_Car[car_money]','content'=>$model->car_money,'height'=>200));?>
            </td>
        </tr>
        <tr>
            <td class="td1" width="20%">修理记录:</td>
            <td colspan="2">
                <?php $this->renderPartial('//fckeditor',array('txtname'=>'My_Car[car_fixlog]','content'=>$model->car_fixlog,'height'=>200));?>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">   <?php echo CHtml::submitButton($model->isNewRecord ? '创建' : '保存'); ?></td>
        </tr>
    </table>

    <?php $this->endWidget(); ?>
</div><!-- form -->

