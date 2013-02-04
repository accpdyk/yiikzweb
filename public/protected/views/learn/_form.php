<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'learn-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'reply_id'); ?>
		<?php echo $form->textField($model,'reply_id'); ?>
		<?php echo $form->error($model,'reply_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'type'); ?>
		<?php echo $form->textField($model,'type',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'type'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'title'); ?>
		<?php echo $form->textField($model,'title',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'content'); ?>
		<?php echo $form->textArea($model,'content',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'content'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'time'); ?>
		<?php echo $form->textField($model,'time',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'time'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'note_content'); ?>
		<?php echo $form->textArea($model,'note_content',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'note_content'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'writer_name'); ?>
		<?php echo $form->textField($model,'writer_name',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'writer_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'writer_part'); ?>
		<?php echo $form->textField($model,'writer_part',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'writer_part'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'grade'); ?>
		<?php echo $form->textField($model,'grade'); ?>
		<?php echo $form->error($model,'grade'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sendalso'); ?>
		<?php echo $form->textField($model,'sendalso',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'sendalso'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'usersendalso'); ?>
		<?php echo $form->textField($model,'usersendalso',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'usersendalso'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->