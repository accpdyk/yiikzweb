<?php /* @var $this WorkplanController */?>
<div class="content">
    <h3><?php echo $this->pageTitle;?>
        <span><a href="<?php echo url('workplan/info') ?>">[返回]</a></span>
    </h3>
    <?php $form=$this->beginWidget('CActiveForm', array(
    'id'=>'workplan-form',
    'enableAjaxValidation'=>false,
    'enableClientValidation'=>true,
)); ?>
    <table width="100%">
        <tr>
            <td class="td1" width="20%"><?php  echo $form->labelEx($model,'tname');?>：</td>
            <td  width="30%"> <?php  echo $form->textField($model,'tname',array('value'=>user()->getName()));?></td>
            <td>
                <?php  echo $form->error($model,'tname');?>
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
            <td  width="30%">
                <?php   echo CHtml::dropDownList('viewlist','',$this->getViewObjectList(),array('id'=>'viewlist'));?>
                <?php  echo CHtml::button('添加',array('onclick'=>'addview()'))?>
                <?php  //echo CHtml::textField('My_Workplan[view_object]','',array('id'=>'view_object','readonly'=>true)) ?>
                <?php  echo $form->textField($model,'view_object',array('id'=>'view_object','readonly'=>true));?>
                <?php  echo CHtml::button('清空',array('onclick'=>'clearview()'))?>
            </td>
            <td> <?php  echo $form->error($model,'view_object');?></td>
        </tr>
        <tr>
            <td class="td1" width="20%">工作计划:</td>
            <td colspan="2">
                <?php $this->renderPartial('//fckeditor',array('txtname'=>'My_Workplan[content]','content'=>$model->content));?>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">   <?php echo CHtml::submitButton($model->isNewRecord ? '创建' : '保存'); ?></td>
        </tr>
    </table>
    <?php $this->endWidget(); ?>
</div>
    <script type="text/javascript">
        function addview(){
          var val =  $('#viewlist :selected').text();
          var view_object = $('#view_object').val();
            if(val!='请选择'){
                if(view_object){
                    if(view_object.search(val) == -1){
                        view_object = val+','+view_object;
                        $('#view_object').attr('value',view_object);
                    }

                }else{
                    $('#view_object').attr('value',val);
                }
            }

        }
        function  clearview(){
          $('#view_object').attr('value','');
        }
    </script>