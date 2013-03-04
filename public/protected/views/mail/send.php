<?php  /* @var $this MailController */?>
<div class="content">
    <h3>发送邮件</h3>
</div>
<?php
    $form = $this->beginWidget('CActiveForm',array(
         'id'=>'mailForm',
         'enableClientValidation'=>true,
         'enableAjaxValidation'=>false,
         'htmlOptions'=>array(
             'enctype'=>'multipart/form-data'
         )
     ));
?>
<table class="tab">
    <tr>
        <td  align='right'><?php echo $form->labelEx($model,'addressee');?>:</td>
        <td><?php echo $form->dropDownList($model,'addressee',$data); ?></td>
        <td><?php echo $form->error($model,'addressee'); ?></td>
   </tr>
    <tr>
        <td  align='right'><?php echo $form->labelEx($model,'copy');?>:</td>
        <td >
            <?php   echo CHtml::dropDownList('copylist','',$data,array('id'=>'copylist'));?>
            <?php  echo CHtml::button('添加',array('onclick'=>'addview()'))?>
            <?php  //echo CHtml::textField('My_Workplan[view_object]','',array('id'=>'view_object','readonly'=>true)) ?>
            <?php  echo $form->textField($model,'copy',array('id'=>'copy','readonly'=>true));?>
            <?php  echo CHtml::button('清空',array('onclick'=>'clearview()'))?>
        </td>
        <td><?php echo $form->error($model,'copy'); ?></td>

    </tr>
    <tr>
        <td  align='right'><?php echo $form->labelEx($model,'title');?>:</td>
        <td><?php echo $form->textField($model,'title'); ?></td>
        <td><?php echo $form->error($model,'title'); ?></td>
    </tr>

    <tr>
        <td  align='right'><?php echo  $form->labelEx($model,'content');?>:</td>
        <td><?php $this->renderPartial('//fckeditor',array('txtname'=>'My_SendMail[content]','content'=>$model->content,'height'=>200,'ToolbarSet'=>'Basic')) ?></td>
        <td><?php echo $form->error($model,'content'); ?></td>
    </tr>
    <tr>
        <td align='right'>上传附件:</td>
        <td><?php echo   $form->FileField($model,'filename')?></td>
        <td><?php echo $form->error($model,'filename'); ?></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td rowspan="2"><?php  echo CHtml::submitButton('发送',array('style'=>'width:100px;height:30px'))?></td>
    </tr>
</table>
<?php  $this->endWidget();?>
<script type="text/javascript">
    function addview(){
        var val =  $('#copylist :selected').val();
        var view_object = $('#copy').val();
        if(val!='请选择'){
            if(view_object){
                if(view_object.search(val) == -1){
                    view_object = val+','+view_object;
                    $('#copy').attr('value',view_object);
                }

            }else{
                $('#copy').attr('value',val);
            }
        }

    }
    function  clearview(){
        $('#copy').attr('value','');
    }
</script>


